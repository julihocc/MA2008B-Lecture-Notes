#import "@preview/bookly:0.1.0": *
#import "../utils.typ": *

#let tecBlue = rgb("#0039A6")
#let tecLightBlue = rgb("#00B1EB")
#let tecDarkBlue = rgb("#002D72")

#show: book.with(
  title: "Numerical Analysis",
  author: "Dr. Juliho Castillo Colmenares, Ph.D.",
  book-config: (
    theme: "modern",
    lang: "en",
    colors: (
      primary: tecBlue,
      secondary: tecLightBlue,
      boxeq: rgb("#f0f0f0"),
      header: tecDarkBlue,
    ),
    fonts: (
      body: "New Computer Modern",
      math: "New Computer Modern Math",
    ),
    title-page: book-title-page(
      subtitle: "For Non-Linear Optimization",
      edition: "v0.2.0 (Compiled: " + datetime.today().display("[day] [month repr:short] [year]") + ")",
      year: str(datetime.today().year()),
      institution: "Tecnológico de Monterrey",
      series: "IDM19 - Lecture Notes",
      logo: none,
      cover: none,
    ),
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
