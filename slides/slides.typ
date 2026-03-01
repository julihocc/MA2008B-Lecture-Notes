#import "@preview/polylux:0.3.1": *

#set page(paper: "presentation-16-9")
#set text(size: 20pt, font: "New Computer Modern")

#show: polylux-setup

#polylux-slide[
  #align(center + horizon)[
    #text(size: 2em, weight: "bold")[MA2008B - Numerical Analysis for Non-Linear Optimization]
    
    #text(size: 1.5em)[Lecture Slides]
    
    #v(1em)
    Tecnológico de Monterrey
    
    #datetime.today().display()
    
    #v(1em)
    *Author:* Dr. Juliho Castillo Colmenares, Ph.D.
  ]
]

#include "sections/01_control_theory/01_main.typ"
#include "sections/02_modeling/02_main.typ"
#include "sections/03_transient_response/03_main.typ"
#include "sections/04_optimization/04_main.typ"
#include "sections/05_frequency_response/05_main.typ"
#include "sections/06_design_compensation/06_main.typ"
#include "sections/07_lyapunov_stability/07_main.typ"
#include "sections/08_finite_element_method/08_main.typ"
#include "sections/09_nonlinear_fem/09_main.typ"
#include "sections/10_topics_trends/10_main.typ"
