"""Task 4: sanctification as a stability problem (Claude Opus 5.5, 2026-11-05).

Post-salvation state: history = -1, standing = paid, current starts at +1.
Continuous orientation c with

    dc = [kappa(c - c^3) - beta + g(t)] dt + sigma dW

Read c back as -1 / 0 / +1 by thirds. See 00_PREREGISTRATION.md for the
premises and predictions; nothing here was tuned after the first run.

Run:  python sanctification_model.py   (writes results.md and results.json)
"""
import json
import sys
from pathlib import Path

import numpy as np

SEED = 2828
DT = 0.01
N = 1000
HERE = Path(__file__).parent
BETA_CRIT = 2 / (3 * np.sqrt(3))  # peak of (c - c^3) on c > 0, times kappa=1


def drift(c, kappa_pos, kappa_neg, beta, g):
    k = np.where(c > 0, kappa_pos, kappa_neg)
    return k * (c - c**3) - beta + g


def simulate(beta, sigma, T, g_fn=None, kappa0=1.0, mu=0.0, kappa_max=1.0,
             lam=0.0, n=N, seed=SEED):
    """Return first-passage times below 0 (inf if never) and +1 occupancy."""
    rng = np.random.default_rng(seed)
    steps = int(T / DT)
    c = np.ones(n)
    kp = np.full(n, kappa0)
    first = np.full(n, np.inf)
    at_plus = np.zeros(n)
    late_plus = np.zeros(n)
    half = steps // 2
    sq = np.sqrt(DT)
    for s in range(steps):
        t = s * DT
        g = g_fn(t) if g_fn else 0.0
        c = c + drift(c, kp, kappa0, beta, g) * DT + sigma * sq * rng.standard_normal(n)
        np.clip(c, -1.5, 1.5, out=c)
        plus = c > 1 / 3
        if mu > 0 or lam > 0:
            kp = kp + np.where(plus, mu * (kappa_max - kp), -lam * (kp - kappa0)) * DT
        at_plus += plus
        if s >= half:
            late_plus += plus
        newly = (c < 0) & np.isinf(first)
        first[newly] = t
    return first, at_plus / steps, late_plus / (steps - half)


def deterministic_threshold(kappa=1.0):
    """Bisection on beta: largest tilt at which c(0)=1 stays near +1 (sigma=0)."""
    lo, hi = 0.0, 1.0
    for _ in range(40):
        mid = (lo + hi) / 2
        c = 1.0
        for _ in range(int(400 / DT)):
            c += (kappa * (c - c**3) - mid) * DT
        lo, hi = (mid, hi) if c > 0 else (lo, mid)
    return (lo + hi) / 2


def barrier(beta, kappa=1.0):
    """Height of the barrier out of the +1 well, V(c) = -k(c^2/2 - c^4/4) + beta c."""
    roots = np.roots([-kappa, 0, kappa, -beta])  # kappa(c - c^3) - beta = 0
    real = np.sort(roots[np.abs(roots.imag) < 1e-9].real)
    if len(real) < 3:
        return 0.0
    saddle, well = real[1], real[2]
    V = lambda c: -kappa * (c**2 / 2 - c**4 / 4) + beta * c
    return V(saddle) - V(well)


def summarize(first, occ, late, T):
    esc = np.isfinite(first)
    return {
        "escaped_frac": float(esc.mean()),
        "mfpt_censored": float(np.where(esc, first, T).mean()),
        "occ_plus": float(occ.mean()),
        "late_occ_plus": float(late.mean()),
    }


def hazard_by_time(first, T, bins=6):
    edges = np.linspace(0, T, bins + 1)
    out = []
    for a, b in zip(edges[:-1], edges[1:]):
        at_risk = (first >= a).sum()
        events = ((first >= a) & (first < b)).sum()
        out.append({"t0": float(a), "t1": float(b), "at_risk": int(at_risk),
                    "hazard_per_unit_time": float(events / at_risk / (b - a)) if at_risk else None})
    return out


def main():
    R = {}

    # S1 deterministic threshold (H1)
    R["S1_threshold"] = {"analytic": BETA_CRIT, "simulated": deterministic_threshold()}

    # S2 noise grid, one-time Grace (H2, H5)
    T2 = 300
    grid = []
    for beta in [0.0, 0.1, 0.2, 0.3]:
        for sigma in [0.0, 0.2, 0.3, 0.4, 0.5]:
            f, o, l = simulate(beta, sigma, T2)
            row = {"beta": beta, "sigma": sigma, "barrier": barrier(beta)}
            row.update(summarize(f, o, l, T2))
            grid.append(row)
    R["S2_grid"] = grid

    # Kramers check: ln(MFPT) vs barrier/sigma^2 where nearly all escaped
    pts = [(r["barrier"] / r["sigma"]**2, np.log(r["mfpt_censored"]))
           for r in grid if r["sigma"] > 0 and r["escaped_frac"] > 0.95 and r["barrier"] > 0]
    if len(pts) >= 3:
        x, y = np.array(pts).T
        slope = float(np.polyfit(x, y, 1)[0])
    else:
        slope = None
    R["S2_kramers_slope"] = {"fitted": slope, "theory": 2.0, "n_points": len(pts)}

    # S3 ongoing Grace (H3)
    beta3, sigma3, T3 = 0.2, 0.4, 300
    s3 = []
    for g in [0.0, 0.1, 0.2, 0.3, 0.4]:
        f, o, l = simulate(beta3, sigma3, T3, g_fn=lambda t, g=g: g)
        row = {"g_constant": g}
        row.update(summarize(f, o, l, T3))
        s3.append(row)
    for duty in [0.25, 0.5, 0.75]:
        fn = lambda t, d=duty: 0.4 if (t % 20) < 20 * d else 0.0
        f, o, l = simulate(beta3, sigma3, T3, g_fn=fn)
        row = {"g_intermittent": 0.4, "duty": duty, "mean_g": 0.4 * duty}
        row.update(summarize(f, o, l, T3))
        s3.append(row)
    R["S3_grace"] = s3

    # S4 maturity (H4): hazard of first fall vs time, g = 0
    beta4, sigma4, T4 = 0.2, 0.4, 600
    s4 = []
    for mu, kmax in [(0.0, 1.0), (0.01, 2.0), (0.05, 2.0), (0.05, 5.0)]:
        f, o, l = simulate(beta4, sigma4, T4, mu=mu, kappa_max=kmax, lam=0.05)
        s4.append({"mu": mu, "kappa_max": kmax, **summarize(f, o, l, T4),
                   "hazard": hazard_by_time(f, T4)})
    R["S4_maturity"] = s4

    (HERE / "results.json").write_text(json.dumps(R, indent=2), encoding="utf-8")

    L = ["# Task 4 results (auto-generated by sanctification_model.py)", "",
         f"Seed {SEED}, dt {DT}, {N} trajectories per cell.", "",
         "## S1 deterministic threshold (H1)", "",
         f"- analytic beta_crit = {BETA_CRIT:.4f} kappa",
         f"- simulated beta_crit = {R['S1_threshold']['simulated']:.4f} kappa", "",
         "## S2 one-time Grace, no ongoing input (H2, H5); T = 300", "",
         "| beta | sigma | barrier | fell (frac) | mean time to fall (censored) | time at +1 | late-half time at +1 |",
         "|---|---|---|---|---|---|---|"]
    for r in grid:
        L.append(f"| {r['beta']} | {r['sigma']} | {r['barrier']:.3f} | {r['escaped_frac']:.3f} | "
                 f"{r['mfpt_censored']:.1f} | {r['occ_plus']:.3f} | {r['late_occ_plus']:.3f} |")
    k = R["S2_kramers_slope"]
    L += ["", f"Kramers check: slope of ln(MFPT) vs barrier/sigma^2 = "
          f"{k['fitted'] if k['fitted'] is None else round(k['fitted'], 2)} (theory 2.0, {k['n_points']} points)", "",
          f"## S3 ongoing Grace (H3); beta = {beta3}, sigma = {sigma3}, T = {T3}", "",
          "| Grace | fell (frac) | time at +1 | late-half time at +1 |", "|---|---|---|---|"]
    for r in s3:
        lab = (f"constant g = {r['g_constant']}" if "g_constant" in r
               else f"g = 0.4, {int(r['duty']*100)}% of the time (mean {r['mean_g']:.2f})")
        L.append(f"| {lab} | {r['escaped_frac']:.3f} | {r['occ_plus']:.3f} | {r['late_occ_plus']:.3f} |")
    L += ["", f"## S4 maturity (H4); beta = {beta4}, sigma = {sigma4}, g = 0, T = {T4}", "",
          "Hazard = rate of first fall per unit time among those still at +1.", ""]
    for r in s4:
        hz = ", ".join("—" if h["hazard_per_unit_time"] is None else f"{h['hazard_per_unit_time']:.4f}"
                       for h in r["hazard"])
        L.append(f"- mu = {r['mu']}, kappa_max = {r['kappa_max']}: fell {r['escaped_frac']:.3f}; "
                 f"hazard by 100-unit bin: {hz}")
    (HERE / "results.md").write_text("\n".join(L) + "\n", encoding="utf-8")
    sys.stdout.reconfigure(encoding="utf-8")
    print("\n".join(L))


if __name__ == "__main__":
    main()
