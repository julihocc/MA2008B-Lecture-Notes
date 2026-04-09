---
name: typst-expression-render-qa
description: 'Validate and repair Typst math syntax when expressions do not render correctly. Use when writer-generated equations compile poorly, math tokens are misparsed, or chapter expressions show rendering artifacts.'
argument-hint: 'Target scope: file path, chapter, or full book'
user-invocable: true
disable-model-invocation: false
---

# Typst Expression Render QA

## What This Skill Produces
- Typst math expressions that parse and render correctly in the requested scope.
- Minimal edits focused on syntax/render issues only.
- A short report of fixes made and remaining ambiguities.

## When to Use
- Writer-generated Typst equations fail to render.
- Math expressions compile with parser errors.
- Symbols/functions are interpreted as unknown variables.
- Formula formatting is syntactically valid but visually incorrect.

## Input Scope
1. If user gives a file path, process that file first.
2. If user gives a chapter, process the chapter `main.typ`.
3. Otherwise process full book by compiling:
- `typst compile --root . lecture_notes/lecture_notes.typ`

## Procedure
1. Reproduce the problem.
- Compile the target scope.
- Capture all diagnostics with file and line.

2. Identify expression-level failure type.
- `*/` token collisions from derivative notation (for example `dG^*/dR`).
- Function-call argument separator mismatch in math (for example `Phi(G; R)` when comma form is required).
- Multi-letter variable misparse (for example `dG` treated as unknown variable).
- Operator spacing causing parse ambiguity.

3. Apply minimal render-safe edits.
- Rewrite fragile derivatives to explicit spaced form, e.g. `d G^* / d R`.
- Rewrite ambiguous argument separators to Typst-safe form where needed.
- Preserve mathematical meaning and nearby notation style.
- Avoid non-essential rewrites.

4. Recompile immediately.
- Re-run compile after each fix batch.
- Continue until render-blocking errors are gone.

5. Ask-first branch for mathematical ambiguity.
- If syntax can be fixed in multiple mathematically different ways, stop and ask user before changing meaning.

6. Final validation.
- For file/chapter-level repair, run one full-book compile check:
- `typst compile --root . lecture_notes/lecture_notes.typ`

## Decision Rules
- Prioritize parser/render fixes over style edits.
- Do not invent new formulas to silence errors.
- Keep edits localized to lines implicated by diagnostics.
- If errors propagate across files, fix shared root patterns first.

## Quality Criteria
- Requested scope compiles cleanly.
- Expressions render as intended (no parser token artifacts).
- No unrelated content changes.
- Summary includes exact file paths and rationale for each pattern fix.

## Completion Checklist
- Compile run completed for requested scope.
- All blocking expression-render errors resolved or explicitly escalated.
- Full-book validation compile completed.
- User receives concise fix summary and any unresolved ambiguity questions.

## Repository Notes
- Book entrypoint: `lecture_notes/lecture_notes.typ`.
- Compile from repo root using `--root .`.
- Chapter sources are under `lecture_notes/chapters/**/main.typ`.
