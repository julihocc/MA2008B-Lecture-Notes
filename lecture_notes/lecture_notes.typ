#import "@preview/bookly:0.1.0": *
#import "../utils.typ": *

#show: book.with(
  author: "Dr. Juliho Castillo Colmenares, Ph.D.",
  book-config: (
    theme: "modern",
    lang: "en",
    title-page: book-title-page(
      institution: "Tecnológico de Monterrey",
      logo: none,
      cover: none,
    ),
    title: "MA2008B",
    subtitle: "Numerical Analysis for Non-Linear Optimization",
  )
)

#show: thmrules

#show: front-matter
#tableofcontents

#show: main-matter

#part("Part I: Control Theory")

#include "sections/01_control_theory/01_main.typ"
#include "sections/02_modeling/02_main.typ"
#include "sections/03_transient_response/03_main.typ"
#include "sections/05_frequency_response/05_main.typ"
#include "sections/06_design_compensation/06_main.typ"

#part("Part II: Dynamical Systems")

#include "sections/04_optimization/04_main.typ"

#part("Part III: Selected Topics")

#include "sections/07_lyapunov_stability/07_main.typ"
#include "sections/08_finite_element_method/08_main.typ"
#include "sections/09_nonlinear_fem/09_main.typ"
#include "sections/10_topics_trends/10_main.typ"
