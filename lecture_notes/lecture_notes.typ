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
      edition: "v0.3.0 (Compiled: " + datetime.today().display("[day] [month repr:short] [year]") + ")",
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

#include "sections/control_theory/main.typ"
#include "sections/modeling/main.typ"
#include "sections/transient_response/main.typ"
#include "sections/frequency_response/main.typ"
#include "sections/design_compensation/main.typ"

#part("Part II: Dynamical Systems")

#include "sections/nonlinear_differential_equations/main.typ"

#part("Part III: Selected Topics")

#include "sections/lyapunov_stability/main.typ"
#include "sections/finite_element_method/main.typ"
#include "sections/nonlinear_fem/main.typ"
#include "sections/topics_trends/main.typ"
