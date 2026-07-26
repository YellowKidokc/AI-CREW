# JOB-01 HTML Aggregation Report

Date: 2026-07-26
Agent: Codex

## Output Location

- Staging root: `E:\Site\_staging\JOB-01-html-aggregation-20260726`
- Staged copies: `E:\Site\_staging\JOB-01-html-aggregation-20260726\copies`
- Clean inventory: `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\html-inventory-clean.csv`
- Raw path scan: `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\html-paths.txt`
- Candidate list: `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\html-candidate-paths.txt`
- Root summary: `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\root-summary.csv`
- Duplicate hash summary: `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\duplicate-hash-summary.csv`
- Not inventoried candidates: `E:\Site\_staging\JOB-01-html-aggregation-20260726\inventory\candidate-paths-not-in-clean-inventory.txt`
- Copy helper: `scripts\copy-job01-html.ps1`

## Scan Scope

Raw scan covered the D-drive site repos, H/Desktop, E/NAS site folders, recycle locations, and the recovered old handoff path:

- `D:\GitHub\faiththruphysics-site-live`
- `D:\GitHub\faiththruphysics-site-v2`
- `D:\GitHub\faiththruphysics-site-data`
- `D:\GitHub\faiththruphysics-site`
- `D:\GitHub\genesis-to-quantum`
- `\\192.168.2.50\h_hp\Desktop`
- `E:\Faith Through Physics`
- `E:\Faith Through Physics MD`
- `E:\Faith Through Physics SITE Audio`
- `E:\Faith thru Physics`
- `E:\HTML`
- `E:\Site`
- `E:\Audio`
- `E:\Video`
- `E:\Images`
- `E:\#recycle`
- `D:\$RECYCLE.BIN`
- `\\192.168.2.50\h_hp\Desktop\$RECYCLE.BIN`
- `\\192.168.2.50\h_hp\Desktop\Folders\Master HTML`

## Results

- Raw HTML/HTM paths found: 258,495
- Faith/theophysics candidate paths selected for staging: 47,574
- Unique source rows in clean inventory: 47,259
- Staged copied files on disk: 46,706
- Staged copy size: 2,769.34 MB
- Candidate paths not represented in clean inventory: 315
- Duplicate SHA-256 groups: 8,526
- Duplicate source rows inside those groups: 38,146
- Highest duplicate count for one hash: 127

## Clean Inventory By Root

| Root ID | Files | Size MB |
|---|---:|---:|
| `D_GitHub_faiththruphysics-site-data` | 31,114 | 1,230.39 |
| `H_Desktop` | 6,679 | 721.30 |
| `H_Desktop_Folders_Master_HTML` | 5,865 | 651.64 |
| `E_Faith_Through_Physics` | 1,172 | 33.75 |
| `D_GitHub_faiththruphysics-site-live` | 905 | 42.75 |
| `D_GitHub_faiththruphysics-site-v2` | 779 | 42.20 |
| `D_GitHub_genesis-to-quantum` | 701 | 36.41 |
| `E_recycle` | 28 | 1.17 |
| `H_Desktop_RecycleBin` | 16 | 0.41 |

## Notes For JOB-02/JOB-03

- Use `html-inventory-clean.csv`, not `html-inventory.csv`; the raw inventory contains duplicate rows from the timed-out first copy pass plus resume.
- `duplicate-hash-summary.csv` is the fastest starting point for dedup. Many source paths are identical content copied across repos/folders.
- Some overlong source paths were staged under `__long_path_flat`; the inventory keeps their original `SourcePath` and `RelativePath`.
- `candidate-paths-not-in-clean-inventory.txt` should be reviewed before declaring final canonical coverage. Most misses were missing/transient sources or path-length/write-lock issues.
- Originals were not deleted or moved.
