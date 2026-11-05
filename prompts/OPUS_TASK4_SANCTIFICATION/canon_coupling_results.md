# Addendum results: canon coupling (preregistered in 01_...ADDENDUM)

beta 0.2, sigma 0.4, Grace 0.4 for t < 100 then 0, T 600, mu 0.05, kappa_max 5.0, lambda 0.05, seed 2828, 1000 runs.

| Variant | at +1 at withdrawal | kappa+ at withdrawal | fell after | median time to fall | late time at +1 | kappa+ at end |
|---|---|---|---|---|---|---|
| control: no maturity, no noise cut | 0.975 | 1.00 | 1.000 | 9.6 | 0.009 | 1.00 |
| 2a growth ∝ g, no decay at +1 | 1.000 | 4.97 | 0.002 | 57.3 | 1.000 | 4.97 |
| 2b growth ∝ g, decays when g = 0 | 1.000 | 4.97 | 1.000 | 51.8 | 0.009 | 1.00 |
| 2c Grace halves noise only | 1.000 | 1.00 | 1.000 | 9.7 | 0.009 | 1.00 |
| 2d 2b + 2c | 1.000 | 4.97 | 1.000 | 51.8 | 0.009 | 1.00 |
