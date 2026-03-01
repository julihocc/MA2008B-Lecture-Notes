# Copilot Instructions for MA2008B-Lecture-Notes

## Project purpose and boundaries
- This repository is a Typst-based lecture-notes manuscript, not an application codebase.
- Treat `lecture_notes/` as the production source; use `docs/` only for syllabus/context.
- The real entrypoint is `lecture_notes/lecture_notes.typ` (not `main.typ`).

## Architecture and content flow
- `lecture_notes/lecture_notes.typ` defines document-level formatting, cover/outline, then includes modules in strict order (`01` through `10`).
- Module boundary pattern:
  - `lecture_notes/sections/XX_topic/XX_main.typ` starts with `= Module Title`, short intro paragraph, then ordered `#include` lines.
  - Subtopics are `X.Y_slug.typ` and commonly follow `==` title + `=== Mathematical Review` + `=== Solved Problems` + `=== Supplementary Problems`.
- Example chain: `lecture_notes/lecture_notes.typ` -> `lecture_notes/sections/04_optimization/04_main.typ` -> `lecture_notes/sections/04_optimization/4.1_time_invariant_solution.typ`.

## Required Typst patterns in this repo
- Import shared macros in section files with `#import "../../utils.typ": *`.
- Reuse existing blocks from `lecture_notes/utils.typ`: `#definition`, `#theorem`, `#proposition`, `#corollary`, `#example`, `#solved_problem`, `#supplementary`, `#proof`, `#solution`.
- Keep heading depth and naming exactly aligned with existing files (`XX_main.typ`, `X.Y_slug.typ`; headings `=`, `==`, `===`).
- Preserve include order in both `lecture_notes/lecture_notes.typ` and each `XX_main.typ`; ordering defines final PDF structure.
- Match local math notation style from neighboring files (e.g., `mat(...)`, `cal(L){...}`, `integral_0^t`, `e^(A t)`).

## Tooling and developer workflow
- Primary authoring workflow is VS Code + TinyMist.
- Workspace settings in `.vscode/settings.json` enforce:
  - `tinymist.exportPdf: "onSave"` (PDF export on save)
  - `tinymist.formatterMode: "typstfmt"`
- If using CLI, compile from repo root against `lecture_notes/lecture_notes.typ`.
- Python companion workflow is manual (not auto-generated): mirror Typst section paths in `python_scripts/sections/...` with identical filename stem.
- Existing mirror example:
  - Typst: `lecture_notes/sections/04_optimization/4.1_time_invariant_solution.typ`
  - Python: `python_scripts/sections/04_optimization/4.1_compute_state_transition_matrix_laplace.py`

## Dependencies and integration points
- Typst package dependency: `@preview/ctheorems:1.1.3` (imported in `lecture_notes/utils.typ`).
- Python project dependency is `sympy` (see `pyproject.toml`), used by companion computational scripts.
- PDF artifacts are tracked with Git LFS (`.gitattributes` has `*.pdf filter=lfs ...`), so avoid unnecessary regenerated PDF churn unless explicitly requested.

## Editing guidance for AI agents
- Prefer targeted edits to the specific section file requested by the user.
- When adding a new subtopic, update the corresponding `XX_main.typ` include list in the correct numeric order.
- Do not rename existing section directories/files unless explicitly requested; cross-file include paths are tightly coupled.
- Keep bilingual/academic tone and control-systems terminology aligned with existing sections.
- Use `docs/MA2008B-Analítico.md` for syllabus alignment, but implement content changes in `lecture_notes/` files.
- Do not modify `.bak` files (e.g., `6.6_canonical_forms.bak`) unless explicitly asked; treat `.typ` files as source of truth.