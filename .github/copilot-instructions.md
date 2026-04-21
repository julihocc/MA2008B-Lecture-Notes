# Copilot Instructions for MA2008B-Lecture-Notes

## Purpose and source of truth
- This repository is a Typst manuscript for lecture notes, not an app/service codebase.
- Make content edits in `lecture_notes/`; use `docs/MA2008B-Analitico.md` only to align syllabus scope.
- Main document entrypoint is `lecture_notes/ma2008b_lecture_notes.typ`.
- If docs and source files disagree, treat `lecture_notes/chapters/` and `lecture_notes/ma2008b_lecture_notes.typ` as source of truth.

## Architecture and content flow
- `lecture_notes/ma2008b_lecture_notes.typ` sets page/text/theorem rendering, then includes modules in fixed order.
- Each module follows: `lecture_notes/chapters/XX_topic/XX_topic.typ` so the file stem matches the numbered folder name.
- Subtopic files are `X.Y_slug.typ`, typically structured as:
  - `== <Topic>`
  - `=== Mathematical Review`
  - `=== Solved Problems`
  - `=== Supplementary Problems`
- Example pattern: `lecture_notes/chapters/08_bifurcation_theory/08_bifurcation_theory.typ`.
- Keep include ordering untouched unless the user asks to reorder (order defines final PDF sequence).

## Typst conventions used in this repo
- Import shared theorem helpers from root `utils.typ` using `#import "../../../utils.typ": *` in section files.
- Reuse existing blocks from `utils.typ`: `#definition`, `#theorem`, `#proposition`, `#corollary`, `#example`, `#solved_problem`, `#supplementary`, `#proof`, `#solution`.
- Match existing notation/style in nearby files (e.g., `mat(...)`, `dot(x)`, `G(s) = C(s I - A)^(-1)B + D`).
- Preserve filename and heading depth conventions (`XX_topic.typ`, `X.Y_slug.typ`, with `=`, `==`, `===`).

## Developer workflow
- Primary authoring workflow is VS Code + TinyMist.
- Workspace settings (`.vscode/settings.json`) enforce:
  - `tinymist.exportPdf: "onSave"`
  - `tinymist.formatterMode: "typstfmt"`
- CLI compile (if needed): `typst compile lecture_notes/ma2008b_lecture_notes.typ` from repo root.
- If `utils.typ` is imported from `lecture_notes/ma2008b_lecture_notes.typ`, compile with root set to repository root: `typst compile --root . lecture_notes/ma2008b_lecture_notes.typ`.

## Python companion scripts
- `python_scripts/` is a manual mirror of `lecture_notes/sections/` (see `python_scripts/README.md`).
- Keep mirrored relative paths and same file stem when creating companions (only extension changes to `.py`).
- Current workspace has no `python_scripts/main.py`; avoid instructions that rely on a script runner unless it is added.
- Root `main.py` is currently a stub and is not a project runner for mirror discovery/execution.

## Dependencies and integration points
- Typst theorem package is `@preview/ctheorems:1.1.3` (imported in root `utils.typ`).
- Python dependencies are declared in `pyproject.toml` (`sympy`, `numpy`, `matplotlib`, `control`, Jupyter stack).
- `.pdf` and `.ipynb` files are tracked with Git LFS (`.gitattributes`); avoid unnecessary binary churn unless requested.

## Editing guardrails
- Prefer surgical edits to requested section files; do not rename folders/files without explicit request.
- Keep an English academic tone and control-systems terminology consistent with surrounding notes.
- Treat `.typ` files as source of truth; do not edit `.bak` files unless explicitly requested.
- Section 4 in source files is currently organized as `4.1` to `4.3`; if syllabus docs list older Section 4 topics, follow the current source files unless asked to realign.
- Section 4 policy (starting at `4.1`): represent worked illustrations as `#solved_problem` + `#solution` blocks; avoid `#example` blocks in new or revised Section 4 content.
- Quiz policy: in `quizzes/` files, write math in plain text / ASCII math (e.g., `x' = A x`, `e^(At)`, `||A||_inf`); avoid LaTeX delimiters like `$...$` and LaTeX commands.
