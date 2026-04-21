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
    institution: "Tecnologico de Monterrey",
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

#include "chapters/01_fundamentals_systems_modeling/01_fundamentals_systems_modeling.typ"
#include "chapters/02_transient_response_physiology/02_transient_response_physiology.typ"
#include "chapters/03_frequency_response_oscillations/03_frequency_response_oscillations.typ"
#include "chapters/04_design_compensation_control/04_design_compensation_control.typ"

#part("Nonlinear Systems & Stability Analysis")

#include "chapters/05_nonlinear_differential_equations/05_nonlinear_differential_equations.typ"
#include "chapters/06_equilibrium_point_analysis/06_equilibrium_point_analysis.typ"
#include "chapters/07_stability_theory/07_stability_theory.typ"
#include "chapters/08_bifurcation_theory/08_bifurcation_theory.typ"

#part("Advanced Analytical Tools for Bio-Systems")

#include "chapters/09_positivity_invariant_sets/09_positivity_invariant_sets.typ"
#include "chapters/10_localization_of_compact_invariant_sets/10_localization_of_compact_invariant_sets.typ"
#include "chapters/11_metabolic_case_study/11_metabolic_case_study.typ"
#include "chapters/12_computational_implementation/12_computational_implementation.typ"

#part("Physics-Informed Neural Networks")

#include "chapters/13_introduction_to_scientific_machine_learning/13_introduction_to_scientific_machine_learning.typ"
#include "chapters/14_physics_informed_neural_networks_forward_problem/14_physics_informed_neural_networks_forward_problem.typ"
#include "chapters/15_physics_informed_neural_networks_inverse_problem/15_physics_informed_neural_networks_inverse_problem.typ"
#include "chapters/16_hybrid_modeling_and_safety_bounds/16_hybrid_modeling_and_safety_bounds.typ"

