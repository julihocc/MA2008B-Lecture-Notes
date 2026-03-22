#import "@preview/bookly:0.1.0": *
#import "../utils.typ": *

#let tecBlue = rgb("#0039A6")
#let tecLightBlue = rgb("#00B1EB")
#let tecDarkBlue = rgb("#002D72")

#show: book.with(title: "Numerical Analysis", author: "Dr. Juliho Castillo Colmenares, Ph.D.", book-config: (
  theme: "modern",
  lang: "en",
  colors: (primary: tecBlue, secondary: tecLightBlue, boxeq: rgb("#f0f0f0"), header: tecDarkBlue),
  fonts: (body: "New Computer Modern", math: "New Computer Modern Math"),
  title-page: book-title-page(
    subtitle: "For Non-Linear Optimization",
    edition: "v0.8.0 (Compiled: " + datetime.today().display("[day] [month repr:short] [year]") + ")",
    year: str(datetime.today().year()),
    institution: "Tecnológico de Monterrey",
    series: "IDM19 - Lecture Notes",
    logo: none,
    cover: none,
  ),
))

#show: thmrules

#show: front-matter
#tableofcontents

#show: main-matter

#part("Part I: Control Theory & Bio-System Modeling")

#include "chapters/fundamentals_systems_modeling/main.typ"
#include "chapters/transient_response_physiology/main.typ"
#include "chapters/frequency_response_oscillations/main.typ"
#include "chapters/design_compensation_control/main.typ"

#part("Part II: Nonlinear Systems & Stability Analysis")

#include "chapters/nonlinear_differential_equations/main.typ"
#include "chapters/equilibrium_point_analysis/main.typ"
#include "chapters/stability_theory/main.typ"
#include "chapters/bifurcation_theory/main.typ"

#part("Part III: Advanced Analytical Tools for Bio-Systems")

#include "chapters/positivity_invariant_sets/main.typ"
#include "chapters/the_lcis_method/main.typ"
#include "chapters/metabolic_case_study/main.typ"
#include "chapters/computational_implementation/main.typ"

#part("Part IV: Physics-Informed Neural Networks")

#include "chapters/scientific_ml_intro/main.typ"
#include "chapters/pinns_forward_problem/main.typ"
#include "chapters/pinns_inverse_problem/main.typ"
#include "chapters/hybrid_modeling_safety/main.typ"
