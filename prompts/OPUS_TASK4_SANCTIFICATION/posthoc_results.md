# POST-HOC results (not preregistered)

beta = 0.2, sigma = 0.4, seed 2828, 1000 trajectories.

## A. Survival at +1 with no Grace after t = 0 (fraction never yet fallen)

| mu | kappa_max | t=10 | 25 | 50 | 100 | 200 | 400 | 600 |
|---|---|---|---|---|---|---|---|---|
| 0.0 | 1.0 | 0.505 | 0.147 | 0.017 | 0.000 | 0.000 | 0.000 | 0.000 |
| 0.05 | 2.0 | 0.604 | 0.398 | 0.270 | 0.156 | 0.060 | 0.011 | 0.003 |
| 0.05 | 5.0 | 0.823 | 0.817 | 0.817 | 0.817 | 0.816 | 0.816 | 0.816 |
| 0.2 | 5.0 | 0.965 | 0.965 | 0.965 | 0.965 | 0.964 | 0.964 | 0.964 |

## B. Grace g = 0.4 for t < 100, then withdrawn; maturity on (lam = 0.05)

Falls counted only after withdrawal, among those at +1 at withdrawal.

| mu | kappa_max | at +1 at withdrawal | fell within 500 after | late-half time at +1 | mean kappa+ at end |
|---|---|---|---|---|---|
| 0.0 | 1.0 | 0.975 | 1.000 | 0.009 | 1.00 |
| 0.05 | 2.0 | 0.997 | 0.989 | 0.139 | 1.07 |
| 0.05 | 5.0 | 1.000 | 0.002 | 1.000 | 5.00 |
