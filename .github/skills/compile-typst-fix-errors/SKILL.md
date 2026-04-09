---
name: compile-typst-fix-errors
description: 'Compile Typst lecture notes, diagnose build failures, and apply minimal source fixes until compilation succeeds. Use for lecture_notes/ build breaks, Typst syntax errors, include path issues, and theorem/block formatting mistakes.'
argument-hint: 'Scope to check, e.g. full book, one chapter, or a specific Typst file'
user-invocable: true
disable-model-invocation: false
---

# Compile Typst and Fix Errors

## What This Skill Produces
- A successful Typst compile for the requested scope.
- Minimal, targeted fixes in source files.
- A short final report: what failed, what changed, and validation status.

## When to Use
- The user asks to compile lecture notes.
- Typst build fails after content edits.
- There are syntax/layout errors in chapter files.
- Includes or root-path issues break the book build.

## Scope Selection
1. If user provides a file path, compile that file first.
2. If user says chapter only, compile the chapter main file.
3. Otherwise compile the full book entrypoint:
   - `typst compile --root . lecture_notes/lecture_notes.typ`

## Procedure
1. Identify compile target.
- Default target is full-book `lecture_notes/lecture_notes.typ`.
- If targeted fix requested, compile the requested file first, then optionally full book.

2. Run compile and capture diagnostics.
- Use Typst CLI compile command for the selected target.
- Record file path, line number, and message for each error.

3. Classify failure type.
- Syntax/math token issues: unmatched delimiters, malformed equations, invalid symbols.
- Structure issues: broken `#definition/#theorem/#solved_problem/#solution/#supplementary` blocks.
- Include/path issues: missing or incorrect `#import` / `#include` paths.
- Consistency issues: notation mismatch causing malformed expressions.

4. Apply minimal fixes.
- Change only the smallest necessary lines.
- Preserve heading levels and chapter order.
- Preserve existing macro usage from `utils.typ`.
- Do not refactor unrelated content.

5. Recompile.
- Re-run compile after each fix batch.
- If new errors appear, repeat classify -> patch -> recompile.
- Stop when compile is clean, or after 3 unsuccessful fix cycles on the same error cluster.

6. Final validation.
- Confirm no compile errors remain for requested scope.
- If scope was chapter-level and user likely expects full integration, run full-book compile once.

## Decision Rules
- If a fix requires assumptions about mathematical intent, stop and ask the user before applying the change.
- If references/citations are missing but do not block compile, do not block delivery; report as non-blocking note.
- If both chapter and full-book builds fail, prioritize fixing root causes shared by both.

## Default Policies
- After any chapter-level fix, run one full-book validation compile by default:
   - `typst compile --root . lecture_notes/lecture_notes.typ`
- For mathematically ambiguous expressions, ask-first policy is mandatory (no best-effort silent rewrites).

## Quality Criteria
- Build succeeds for the requested target.
- No unrelated edits.
- Existing style and notation preserved.
- Report includes exact files touched and why.

## Completion Checklist
- Compile command executed for target scope.
- All blocking errors resolved or explicitly escalated.
- Validation compile passes.
- User gets concise summary and next-step options.

## Repository-Specific Notes
- Primary source is under `lecture_notes/`.
- Entrypoint is `lecture_notes/lecture_notes.typ`.
- For root imports, use `typst compile --root . lecture_notes/lecture_notes.typ` from repository root.
- Prefer surgical edits in chapter files over broad rewrites.
