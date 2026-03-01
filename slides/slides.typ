#import "@preview/touying:0.5.3": *
#import themes.metropolis: *

#show: metropolis-theme.with(aspect-ratio: "16-9", config-info(
  title: [MA2008B - Lecture Slides],
  subtitle: [Numerical Analysis for Non-Linear Optimization],
  author: [Dr. Juliho Castillo Colmenares, Ph.D.],
  date: datetime.today(),
  institution: [Tecnológico de Monterrey],
))

// Include modules here. Order matters.
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
