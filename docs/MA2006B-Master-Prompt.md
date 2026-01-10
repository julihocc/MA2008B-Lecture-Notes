# Master Prompt: Lecture Notes Repository Structure Replication

You are an expert technical writer and software architect specializing in Typst-based documentation systems. Your task is to set up a new repository for lecture notes that strictly follows the architectural patterns and styling conventions of the reference `MA2006B-Lecture-Notes` repository.

## 1. Directory Structure

You must create the following directory hierarchy. The root of the documentation project is `lecture_notes/`.

```
repo_root/
├── docs/                   # Contains raw syllabus/course info files (e.g., .txt, .md)
├── lecture_notes/          # Main Typst project root
│   ├── main.typ            # Entry point file
│   ├── utils.typ           # Custom definitions (theorems, proofs, etc.)
│   └── sections/           # Modular content directory
│       ├── 01_topic_name/  # Directory for Module 1
│       │   ├── 01_main.typ # Entry point for Module 1
│       │   ├── 1.1_subtopic.typ
│       │   └── ...
│       ├── 02_topic_name/  # Directory for Module 2
│       │   ├── 02_main.typ # Entry point for Module 2
│       │   └── ...
│       └── ...
```

## 2. File Templates

### `lecture_notes/utils.typ`

Create this file exactly as follows to ensure consistent styling for mathematical blocks:

```typst
#import "@preview/ctheorems:1.1.3": *

// Initialize the counters and rules. This function must be called in a show rule in main.typ
// #show: thmrules

// Definitions
#let definition = thmbox("definition", "Definition", fill: luma(245), stroke: luma(80) + 1pt, base: "heading")

// Theorems
#let theorem = thmbox("theorem", "Theorem", fill: luma(240), stroke: luma(0) + 1pt, base: "heading")

// Propositions
#let proposition = thmbox("proposition", "Proposition", fill: luma(250), stroke: luma(100) + 1pt, base: "heading")

// Corollaries
#let corollary = thmbox("corollary", "Corollary", fill: luma(250), stroke: luma(120) + 1pt, base: "heading")

// Examples
#let example = thmplain("example", "Example", base: "heading").with(numbering: "1.1")

// Exercises
#let exercise = thmbox("exercise", "Exercise", fill: luma(250), stroke: luma(150) + 1pt, base: "heading")

// Proofs
#let proof = thmproof("proof", "Proof")

// Solutions
#let solution = thmbox("solution", "Solution", fill: luma(240), inset: 8pt, radius: 4pt).with(numbering: none)
```

### `lecture_notes/main.typ`

Use this template for the main entry point. Update the Title, Course ID, and School info as needed.

```typst
#set page(
  paper: "us-letter",
  margin: 1in,
)
#set text(
  font: "New Computer Modern",
  size: 12pt,
)
#set heading(numbering: "1.1")

#align(center)[
  #text(1.5em, weight: "bold")[COURSE_ID - Course Title Here]

  #text(1.2em)[Lecture Notes]
  \ \
  Institution Name
  \
  #datetime.today().display()
]

#import "utils.typ": *
#show: thmrules

#outline(indent: auto)
#pagebreak()

// Include modules here. Order matters.
#include "sections/01_topic_slug/01_main.typ"
#include "sections/02_topic_slug/02_main.typ"
// ... add more modules
```

## 3. Naming Conventions & Content Guidelines

### Module Directories and Files

1. **Directory Name**: `sections/XX_topic_slug/` where `XX` is the 2-digit module number (e.g., `01`, `02`) and `topic_slug` is a snake_case version of the topic name.
2. **Module Entry File**: `sections/XX_topic_slug/XX_main.typ`.
    - Must start with a Level 1 heading: `= Module Title`.
    - Must include a brief introduction/summary text.
    - Must `#include` all subtopic files in order (e.g., `#include "1.1_subtopic.typ"`).
3. **Subtopic Files**: `sections/XX_topic_slug/Y.Z_subtopic_slug.typ`.
    - `Y` corresponds to the Module number.
    - `Z` corresponds to the subtopic order.
    - `subtopic_slug` is snake_case.
    - Should start with a Level 2 heading: `== Subtopic Title`.
    - Use the custom functions from `utils.typ` for content: `#definition[...]`, `#theorem[...]`, `#proof[...]`.

## 4. Execution Steps

When given a syllabus or list of topics:

1. **Analyze** the input to determine the modules and their subtopics.
2. **Generate** the directory structure under `lecture_notes/sections/`.
3. **Create** the `00_main.typ` file for each module.
4. **Create** individual `.typ` files for each subtopic using the naming convention.
5. **Populate** `lecture_notes/main.typ` to include all the new module entry files.
