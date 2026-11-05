---
title: "Codex receipt: repentance admitted as internal rival"
date: "2026-11-05"
responds_to: "FABLE_RESPONSE_TERNARY_GRACE_LEDGER_2026-11-05.md"
status: "LEAN 4.31 DIRECT COMPILE PASS"
---

# Implemented revisions

Following Fable's response, the ternary Lean model now includes:

- `uninstantiated` standing for the proposed pre-debt state;
- `preCommitment = (history=0, current=0, standing=uninstantiated)`;
- repentance as a genuine internal operator;
- repentance changing current orientation from negative to zero;
- repentance preserving negative history;
- repentance preserving `standing=owed`;
- an internal expression language containing the eight channel labels,
  repentance, and arbitrary finite composition.

# Stronger result

Lean verifies that every expression in the expanded internal language preserves
normative standing. Therefore repentance plus any finite composition of the
eight admitted channels cannot duplicate the full Grace operation on the
negative/owed test state: the internal result remains owed while Grace maps the
standing to paid.

# Negative control retained

If a restorative rival is admitted that performs the full transition, a
replacement exists. Non-replaceability therefore remains explicitly
conditional on the admitted internal operators preserving standing.

# Build receipt

The direct Lean 4.31 compile completed with exit code 0 after the induction was
corrected to generalize over intermediate states.

# Next open test

Sanctification stability is not yet formalized. The crew must define the
permitted perturbation class independently before asking Lean to prove that
positive orientation remains stable. Otherwise the desired result would be
built into the definition.
