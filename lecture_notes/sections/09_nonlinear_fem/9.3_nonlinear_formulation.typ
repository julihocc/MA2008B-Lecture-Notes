#import "../../utils.typ": *

== Nonlinear Finite Element Formulation

=== Mathematical Review

Depending on the magnitude of deformation, different reference configurations are used.

#definition[Formulations][
  - *Total Lagrangian (TL)*: Stresses and strains referred to the initial (undeformed) configuration. Good for large rotations but moderate strains.
  - *Updated Lagrangian (UL)*: Stresses and strains referred to the last calculated (deformed) configuration. Good for large strains and flow problems.
]

#theorem[Stress and Strain Measures][
  For large deformations, engineering stress/strain is insufficient.
  - *Green-Lagrange Strain ($E$)*: Invariant to rigid body rotation.
  - *2nd Piola-Kirchhoff Stress ($S$)*: Energetically conjugate to Green-Lagrange strain.
  - Constitutive law: $S = C E$ (for St. Venant-Kirchhoff material).
]

=== Solved Problems

#solved_problem[Strain Measure Comparison][
  A rod of length $L$ stretches to $L + Delta L$. Compare engineering strain $epsilon$ and Green-Lagrange strain $E$ for $Delta L = L$ (100% stretch).
]
#solution[
  Stretch ratio $lambda = (L + L)/L = 2$.
  Engineering strain: $epsilon = (Delta L)/L = 1$.
  Green-Lagrange strain: $E = 1/2 (lambda^2 - 1) = 1/2 (2^2 - 1) = 1.5$.
  Note the significant difference at large deformation.
]
