"""POST-HOC (not preregistered): finer look at maturity, and Grace withdrawn late.

Added after reading results.md, because the S4 hazard bins (100 units) were too
coarse and S4 raised a question the preregistration did not ask: once maturity
has built up, can ongoing Grace be withdrawn? Same model, same seed.

Run:  python posthoc_maturity.py   (writes posthoc_results.md)
"""
import sys
from pathlib import Path

import numpy as np

from sanctification_model import DT, N, SEED, drift

HERE = Path(__file__).parent


def run(beta, sigma, T, mu, kmax, g_until=0.0, g=0.0, lam=0.05, kappa0=1.0):
    """Return fall times (first c < 0 after g_until), alive-at-withdrawal mask, late +1 occupancy."""
    rng = np.random.default_rng(SEED)
    steps = int(T / DT)
    c = np.ones(N)
    kp = np.full(N, kappa0)
    first = np.full(N, np.inf)
    alive = None
    late = np.zeros(N)
    half = steps // 2
    for s in range(steps):
        t = s * DT
        gg = g if t < g_until else 0.0
        if alive is None and t >= g_until:
            alive = c > 1 / 3
        c = c + drift(c, kp, kappa0, beta, gg) * DT + sigma * np.sqrt(DT) * rng.standard_normal(N)
        np.clip(c, -1.5, 1.5, out=c)
        plus = c > 1 / 3
        kp = kp + np.where(plus, mu * (kmax - kp), -lam * (kp - kappa0)) * DT
        if t >= g_until:
            newly = (c < 0) & np.isinf(first)
            first[newly] = t
        if s >= half:
            late += plus
    return first, alive, late / (steps - half), kp


def main():
    beta, sigma = 0.2, 0.4
    L = ["# POST-HOC results (not preregistered)", "",
         f"beta = {beta}, sigma = {sigma}, seed {SEED}, {N} trajectories.", "",
         "## A. Survival at +1 with no Grace after t = 0 (fraction never yet fallen)", "",
         "| mu | kappa_max | t=10 | 25 | 50 | 100 | 200 | 400 | 600 |", "|---|---|---|---|---|---|---|---|---|"]
    edges = [10, 25, 50, 100, 200, 400, 600]
    for mu, kmax in [(0.0, 1.0), (0.05, 2.0), (0.05, 5.0), (0.2, 5.0)]:
        f, _, _, _ = run(beta, sigma, 600, mu, kmax)
        L.append(f"| {mu} | {kmax} | " + " | ".join(f"{(f >= e).mean():.3f}" for e in edges) + " |")

    L += ["", "## B. Grace g = 0.4 for t < 100, then withdrawn; maturity on (lam = 0.05)", "",
          "Falls counted only after withdrawal, among those at +1 at withdrawal.", "",
          "| mu | kappa_max | at +1 at withdrawal | fell within 500 after | late-half time at +1 | mean kappa+ at end |",
          "|---|---|---|---|---|---|"]
    for mu, kmax in [(0.0, 1.0), (0.05, 2.0), (0.05, 5.0)]:
        f, alive, late, kp = run(beta, sigma, 600, mu, kmax, g_until=100, g=0.4)
        fell = np.isfinite(f[alive]).mean() if alive.any() else float("nan")
        L.append(f"| {mu} | {kmax} | {alive.mean():.3f} | {fell:.3f} | {late.mean():.3f} | {kp.mean():.2f} |")

    (HERE / "posthoc_results.md").write_text("\n".join(L) + "\n", encoding="utf-8")
    sys.stdout.reconfigure(encoding="utf-8")
    print("\n".join(L))


if __name__ == "__main__":
    main()
