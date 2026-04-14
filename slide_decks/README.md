# MA2008B Slide Decks

Professional presentation slides for MA2008B lecture notes, using a Berkeley Beamer-inspired theme.

## Folder Structure

```
slide_decks/
├── README.md                          # This file
├── _theme.typ                         # Reusable Berkeley-inspired theme
├── _template.typ                      # Template for new slide decks
├── chapter_07_stability_theory.typ    # Chapter 7: Stability Theory
└── [future chapters]
```

## Theme Features

The `_theme.typ` module provides:

- **Colors**: Navy blue primary (#1F4788), gold accents (#D99E1A), professional grays
- **Typography**: Clean sans-serif defaults with configurable sizing
- **Layouts**:
  - `title_slide()` — Full-screen opening with title, subtitle, author, date
  - `slide()` — Standard content slides with header, footer, page numbering
  - `definition()` — Boxed definitions with navy border
  - `theorem()` — Boxed theorems with source attribution
  - `highlight()` — Gold-accented highlight boxes

## Creating a New Slide Deck

1. **Copy the template:**
   ```bash
   cp _template.typ chapter_##_topic.typ
   ```

2. **Customize the template:**
   - Replace `main_title` and `subtitle`
   - Update author and date fields
   - Add content slides using `#theme.slide()`

3. **Compile to PDF:**
   ```bash
   typst compile --root .. slide_decks/chapter_##_topic.typ
   ```

## Example Usage

```typst
#import "_theme.typ" as theme
#import "../utils.typ": *

#theme.slide_setup()

// Title slide
#theme.title_slide(
  "Chapter Title",
  "Subtitle",
  "MA2008B",
  "2026"
)

// Content slide
#theme.slide("Slide Title", [
  Content goes here.
  
  == Subsection
  - Bullet point 1
  - Bullet point 2
], footer: "Chapter 7 — Topic Name")

// With definition box
#theme.slide("Definition Slide", [
  #theme.definition("Key Term", [
    Mathematical definition or explanation here.
  ])
])

// With theorem box
#theme.slide("Theorem Slide", [
  #theme.theorem("Main Result", [
    Statement and proof outline.
  ])
])
```

## Best Practices

- **Concise content**: Bullet points, not full paragraphs
- **Consistent footer**: Use format "Chapter # — Topic"
- **Math notation**: Use inline (`$...$`) or display (`$ ... $`) math; avoid `$$...$$` in Typst
- **Colors**: Leverage theme colors via `theme.colors` if needed
- **Reusability**: Define common patterns in `_theme.typ` for all decks to use

## Compilation Notes

- Root directory must be the repository root for imports to work (`--root ..`)
- Fonts used: Calibri (sans), Courier New (monospace) — adjust in `_theme.typ` if needed
- Page size: 16:9 widescreen (1920×1080 equiv)

## Future Enhancements

- Animation/transition support (when Typst supports it)
- Theme variants (light/dark mode, color patterns)
- Automated slide numbering and TOC generation
- Export  options (PPTX via Pandoc)
