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
  #text(1.5em, weight: "bold")[MA2008B - Numerical Analysis for Non-Linear Optimization]

  #text(1.2em)[Lecture Notes]
  \ \
  Tecnológico de Monterrey
  \
  #datetime.today().display()
]

#import "utils.typ": *
#show: thmrules

#outline(indent: auto)
#pagebreak()

// Include modules here. Order matters.
#include "sections/01_control_theory/01_main.typ"
