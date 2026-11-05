"""Addendum run: maturity and noise coupled to Grace, per GRACE_REFERENCE_DOCS.

See 01_PREREGISTRATION_ADDENDUM_CANON_COUPLING.md. Same model and seed as
sanctification_model.py.

Run:  python canon_coupling.py   (writes canon_coupling_results.md)
"""
import sys
from pathlib import Path

import numpy as np

from sanctification_model import DT, N, SEED, drift

HERE = Path(__file__).parent
BETA, SIGMA, T, G, G_UNTIL = 0.2, 0.4, 600, 0.4, 100
MU, KMAX, LAM, K0 = 0.05, 5.0, 0.05, 1.0


def run(grow, decay_without_g, noise_cut):
    rng = np.random.default_rng(SEED)
    steps = int(T / DT)
    c = np.ones(N)
    kp = np.full(N, K0)
    first = np.full(N, np.inf)
    alive = None
    late = np.zeros(N)
    half = steps // 2
    k_at_withdrawal = None
    for s in range(steps):
        t = s * DT
        g = G if t < G_UNTIL else 0.0
        if alive is None and t >= G_UNTIL:
            alive = c > 1 / 3
            k_at_withdrawal = float(kp.mean())
        sigma = SIGMA * (1 - 0.5 * g / G) if noise_cut else SIGMA
        c = c + drift(c, kp, K0, BETA, g) * DT + sigma * np.sqrt(DT) * rng.standard_normal(N)
        np.clip(c, -1.5, 1.5, out=c)
        plus = c > 1 / 3
        if grow:
            dk = np.where(plus, MU * (g / G) * (KMAX - kp), -LAM * (kp - K0))
            if decay_without_g and g == 0:
                dk = -LAM * (kp - K0)
            kp = kp + dk * DT
        if t >= G_UNTIL:
            first[(c < 0) & np.isinf(first)] = t
        if s >= half:
            late += plus
    f = first[alive] - G_UNTIL
    fell = np.isfinite(f)
    median = float(np.median(f[fell])) if fell.any() else float("nan")
    return {"alive": float(alive.mean()), "fell": float(fell.mean()), "median_fall": median,
            "late": float((late / (steps - half)).mean()), "k_w": k_at_withdrawal,
            "k_end": float(kp.mean())}


def main():
    rows = [("control: no maturity, no noise cut", False, False, False),
            ("2a growth ∝ g, no decay at +1", True, False, False),
            ("2b growth ∝ g, decays when g = 0", True, True, False),
            ("2c Grace halves noise only", False, False, True),
            ("2d 2b + 2c", True, True, True)]
    L = ["# Addendum results: canon coupling (preregistered in 01_...ADDENDUM)", "",
         f"beta {BETA}, sigma {SIGMA}, Grace {G} for t < {G_UNTIL} then 0, T {T}, "
         f"mu {MU}, kappa_max {KMAX}, lambda {LAM}, seed {SEED}, {N} runs.", "",
         "| Variant | at +1 at withdrawal | kappa+ at withdrawal | fell after | median time to fall | late time at +1 | kappa+ at end |",
         "|---|---|---|---|---|---|---|"]
    for name, grow, dec, nc in rows:
        r = run(grow, dec, nc)
        L.append(f"| {name} | {r['alive']:.3f} | {r['k_w']:.2f} | {r['fell']:.3f} | "
                 f"{r['median_fall']:.1f} | {r['late']:.3f} | {r['k_end']:.2f} |")
    (HERE / "canon_coupling_results.md").write_text("\n".join(L) + "\n", encoding="utf-8")
    sys.stdout.reconfigure(encoding="utf-8")
    print("\n".join(L))


if __name__ == "__main__":
    main()
