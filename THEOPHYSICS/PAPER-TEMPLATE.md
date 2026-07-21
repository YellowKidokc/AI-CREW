# PAPER TEMPLATE — Theophysics Research Initiative
# Copy this file for each new paper. Fill in every field. Leave nothing blank.
# Ollama nightly pass: check all papers against this template, fill gaps, tag correctly.

tags: #paper #template

---

## METADATA

- **Title:**
- **One-Liner:** _(One sentence that contains the entire argument. If you can't say it in one sentence, you don't understand it yet.)_
- **Authors:**
- **Date:**
- **Status:** DRAFT | REVIEW | READY-FOR-ZENODO | PUBLISHED
- **Confidence:** T1 | T2 | T3 | T4 | T5
- **DOI:** _(assigned after Zenodo upload)_
- **Zenodo URL:** _(after upload)_
## SOURCE TRACKING

- **Origin conversation:** _(date, which AI, link or filename of saved conversation)_
- **Origin insight by:** _(who said the key thing — David, Claude, Kimi, Jim, etc.)_
- **Key quote:** _(the exact moment the insight landed)_
- **Related papers:** _(list other papers that connect to this one)_
- **Related Laws:** _(which of the 10 Laws does this touch)_
- **Related Standing Problems:** _(SP-01, SP-02, etc. from STANDING-PROBLEMS.md)_
- **Related Outrageous Claims:** _(OC-01, OC-02, etc. from OUTRAGEOUS-CLAIMS.md)_

## FILE LOCATIONS

- **Source conversation (raw):** _(path to saved conversation markdown)_
- **Lossless condensation:** _(path to Ollama-condensed version)_
- **Word doc:** _(path to formatted .docx)_
- **PDF:** _(path to final .pdf)_
- **Zenodo upload file:** _(which file was actually uploaded)_

## CONTENT CHECKLIST (Ollama nightly pass checks these)

- [ ] Title present
- [ ] One-liner present and accurate
- [ ] Authors listed
- [ ] Abstract written
- [ ] Keywords listed
- [ ] PACS codes assigned (if physics paper)
- [ ] All sections have content (no empty sections)
- [ ] References are real and cited correctly
- [ ] Machine-verified results noted (if applicable)
- [ ] Open problems stated honestly
- [ ] Acknowledgments include all contributors
- [ ] Correspondence email correct
## PAPER STRUCTURE (standard sections)

1. **Abstract**
2. **Introduction** — state the problem simply
3. **Core Argument** — the insight, the derivation
4. **Formalism** — the math, the equations
5. **Machine-Verified Results** — Lean 4 status (if applicable)
6. **Implications** — what this means for the field
7. **Relation to Existing Work** — honest engagement with literature
8. **Open Problems** — what we DON'T know, stated clearly
9. **Conclusion**
10. **Acknowledgments**
11. **References**

## QUALITY GATES (must pass before Status → READY-FOR-ZENODO)

- [ ] /PROBE — does the argument hold?
- [ ] /EAST — strongest objection stated and addressed?
- [ ] /CHAIN — weakest link identified?
- [ ] Boundaries respected (03-BOUNDARIES.md)?
- [ ] One-liner test — can a non-expert understand the core claim?
- [ ] Honest about what it does NOT prove?
- [ ] No theology in physics-facing version (keep separate breakthrough doc)?

## OLLAMA NIGHTLY INSTRUCTIONS

When processing a raw conversation into a paper:
1. Extract the core insight and one-liner FIRST
2. Fill in METADATA section completely
3. Fill in SOURCE TRACKING — link back to the original conversation file
4. Run the CONTENT CHECKLIST — mark what's present, flag what's missing
5. Create the lossless condensation (full argument, no filler, no performance)
6. Save lossless version to Z:\papers\lossless\[YYYY-MM]\
7. Tag the original conversation file with #paper-source #[paper-name]
8. If a paper is mature enough for REVIEW status, flag it for David

---

*Every paper gets this treatment. No exceptions. The 48th paper gets the same rigor as the first.*
