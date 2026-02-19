# Copilot Instructions for MA2008B-Lecture-Notes

## Project purpose and boundaries
- This repository is a Typst-based lecture-notes manuscript, not an application codebase.
- Treat `lecture_notes/` as the production source; `docs/` contains course context/reference material.
- Main document flow is hierarchical: `lecture_notes/main.typ` -> `sections/XX_topic/XX_main.typ` -> `X.Y_subtopic.typ`.

## Architecture and content flow
- `lecture_notes/main.typ` defines document-level formatting and includes all module entry files in order.
- Each module entry file (example: `lecture_notes/sections/04_optimization/04_main.typ`) starts with `= Module Title`, short intro text, then ordered `#include` lines for subtopics.
- Subtopic files usually follow this internal pattern: `==` heading, `=== Mathematical Review`, `=== Solved Problems`, `=== Supplementary Problems`.
- Shared theorem/problem macros live in `lecture_notes/utils.typ`; all section files import them via `#import "../../utils.typ": *`.

## Required Typst patterns in this repo
- Use existing custom blocks instead of inventing new ones: `#definition`, `#theorem`, `#example`, `#solved_problem`, `#solution`, `#supplementary`.
- Keep heading depth consistent with current files (`=`, `==`, `===`) and preserve current naming convention (`XX_main.typ`, `X.Y_slug.typ`).
- Preserve include order in both `lecture_notes/main.typ` and each `XX_main.typ`; ordering is part of final document structure.
- Keep math notation style consistent with nearby files (e.g., `mat(...)`, `integral_0^t`, `e^(A t)` style used across section files).

## Tooling and developer workflow
- Primary authoring workflow is VS Code + TinyMist.
- Workspace settings in `.vscode/settings.json` enforce:
  - `tinymist.exportPdf: "onSave"` (PDF export on save)
  - `tinymist.formatterMode: "typstfmt"`
- If using CLI locally, compile from repo root with Typst against `lecture_notes/main.typ`.

## Dependencies and integration points
- Typst package dependency: `@preview/ctheorems:1.1.3` (imported in `lecture_notes/utils.typ`).
- PDF artifacts are tracked with Git LFS (`.gitattributes` has `*.pdf filter=lfs ...`), so avoid unnecessary regenerated PDF churn unless requested.

## Editing guidance for AI agents
- Prefer targeted edits to the specific section file requested by the user.
- When adding a new subtopic, update the corresponding `XX_main.typ` include list in the correct numeric order.
- Do not rename existing section directories/files unless explicitly requested; cross-file include paths are tightly coupled.
- Keep bilingual/academic tone and control-systems terminology aligned with existing sections.
- Use `docs/MA2008B-Analítico.md` for syllabus alignment, but implement content changes in `lecture_notes/` files.