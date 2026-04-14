// Template for Creating Slide Decks
// Copy this file to 'chapter_##_topic.typ' and customize

#import "_theme.typ" as theme
#import "../../utils.typ": *

#theme.slide_setup()

// === TITLE SLIDE ===
#theme.title_slide(
  main_title: "Chapter Title Here",
  subtitle: "Subtitle or Topic",
  author: "MA2008B",
  date: "Term/Year",
)

// === SECTION SLIDE (optional) ===
#theme.section_slide(
  section_num: "7.1",
  title: "Section Title Here",
)

// === CONTENT SLIDE EXAMPLE ===
#theme.slide("Slide Title", [
  This is a content slide. Use the `slide()` function for all content slides.
  
  == Subsection
  
  You can use Typst markup normally. The theme handles styling.
  
  - This is a bullet point
  - With nice formatting
  - Automatically applied
], footer_text: "Chapter 7 — Stability Theory")

// === SLIDE WITH DEFINITION ===
#theme.slide("Definition Example", [
  #theme.definition("Equilibrium Point", [
    A point $x^* in RR^n$ is an equilibrium of $x' = f(x)$ if $f(x^*) = 0$.
  ])
  
  This means trajectories starting at $x^*$ stay there forever.
], footer_text: "Chapter 7")

// === SLIDE WITH THEOREM ===
#theme.slide("Theorem Example", [
  #theme.theorem("Lyapunov Direct Method (Local Stability)", [
    If there exists $V in C^1$ near $x^*$ with:
    - $V(x^*) = 0$
    - $V(x) > 0$ for $x != x^*$
    - $dot(V)(x) < 0$ for $x != x^*$
    
    then $x^*$ is locally asymptotically stable.
  ])
], footer_text: "Chapter 7")

// === SLIDE WITH HIGHLIGHT ===
#theme.slide("Key Insight", [
  #theme.highlight([
    *Remember:* The Lyapunov function acts like an energy. If energy always decreases, the system must converge to equilibrium.
  ])
  
  This intuition works for both conservative and dissipative systems.
], footer_text: "Chapter 7")

// === FINAL SLIDE ===
#page(
  background: rect(width: 100%, height: 100%, fill: theme.colors.primary),
)[
  #set align(center + horizon)
  #set text(fill: theme.colors.white, weight: "bold", font: theme.fonts.sans)
  
  #text(size: theme.sizes.title_slide)[Thank You]
  #v(1em)
  #set text(size: theme.sizes.body, weight: "normal")
  Questions?
]
