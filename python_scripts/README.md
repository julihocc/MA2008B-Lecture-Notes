# Python Scripts Mirror

This directory is a manual mirror of `lecture_notes/sections/`, where each subtopic can have a computational companion script.

## Layout

Use this structure:

```text
python_scripts/
  main.py
  sections/
    XX_topic_slug/
      XX_main.py
      X.Y_subtopic_slug.py
```

Example mapping:

- `lecture_notes/sections/04_optimization/4.1_time_invariant_solution.typ`
- `python_scripts/sections/04_optimization/4.1_time_invariant_solution.py`

## Manual workflow

When you add or edit lecture-note content:

1. Create/update the matching Python file under `python_scripts/sections/...`.
2. Keep script names identical to the `.typ` stem (only extension changes to `.py`).
3. Organize functions by note sections, e.g.:
   - `run_examples()`
   - `run_solved_problems()`
   - `run_supplementary_problems()`

No automatic generation is used.

## Discover and run scripts

List available scripts:

```bash
python python_scripts/main.py list
```

Run one script:

```bash
python python_scripts/main.py run sections/04_optimization/4.1_time_invariant_solution.py
```
