#import "@preview/bookly:0.1.0": *
#import "../utils.typ": *

#let tecBlue = rgb("#0039A6") // Official Tec Cobalt
#let tecLightBlue = rgb("#6366F1") // Vibrant Electric Indigo for 'WOW' gradients
#let tecDarkBlue = rgb("#020617") // Premium Nocturnal Navy for high-contrast headers

#show: book.with(title: "Numerical Analysis", author: "Dr. Juliho Castillo Colmenares, Ph.D.", book-config: (
  theme: "modern",
  lang: "en",
  colors: (primary: tecBlue, secondary: tecLightBlue, boxeq: rgb("#F8FAFC"), header: tecDarkBlue),
  fonts: (body: "New Computer Modern", math: "New Computer Modern Math"),
  title-page: book-title-page(
    subtitle: "For Non-Linear Optimization",
    edition: "v1.2.0 (Compiled: " + datetime.today().display("[day] [month repr:short] [year]") + ")",
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

#part("Control Theory & Bio-System Modeling")

#include "chapters/01_fundamentals_systems_modeling/main.typ"
#include "chapters/02_transient_response_physiology/main.typ"
#include "chapters/03_frequency_response_oscillations/main.typ"
#include "chapters/04_design_compensation_control/main.typ"

#part("Nonlinear Systems & Stability Analysis")

#include "chapters/05_nonlinear_differential_equations/main.typ"
#include "chapters/06_equilibrium_point_analysis/main.typ"
#include "chapters/07_stability_theory/main.typ"
#include "chapters/08_bifurcation_theory/main.typ"

#part("Advanced Analytical Tools for Bio-Systems")

#include "chapters/09_positivity_invariant_sets/main.typ"
#include "chapters/10_the_lcis_method/main.typ"
#include "chapters/11_metabolic_case_study/main.typ"
#include "chapters/12_computational_implementation/main.typ"

#part("Physics-Informed Neural Networks")

#include "chapters/13_scientific_ml_intro/main.typ"
#include "chapters/14_pinns_forward_problem/main.typ"
#include "chapters/15_pinns_inverse_problem/main.typ"
#include "chapters/16_hybrid_modeling_safety/main.typ"
