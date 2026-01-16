#import "../../utils.typ": *

== Finite Element Formulation of Dynamic Problems

=== Mathematical Review

For dynamic problems, inertia and damping effects are included.

#definition[Dynamic Equation of Motion][
  The discretized dynamic equation is:
  $ M diaer(d) + C dot(d) + K d = F(t) $
  where:
  - $M$: Mass matrix
  - $C$: Damping matrix
  - $K$: Stiffness matrix
  - $d$: Nodal displacement vector
  - $F(t)$: Dynamic load vector
]

#definition[Mass Matrix Formulation][
  - *Consistent Mass Matrix*: Derived from the same shape functions as stiffness ($m_(i j) = integral rho N_i N_j d V$).
  - *Lumped Mass Matrix*: Diagonal matrix obtained by concentrating mass at nodes.
]

=== Solved Problems

#solved_problem[Free Vibration][
  Formulate the eigenvalue problem for undamped free vibration.
]
#solution[
  Set $C = 0$ and $F(t) = 0$:
  $ M diaer(d) + K d = 0 $
  Assume harmonic solution $d(t) = phi e^(j omega t)$:
  $ (-omega^2 M + K) phi = 0 $
  or
  $ (K - omega^2 M) phi = 0 $
  This is a generalized eigenvalue problem where $omega^2$ are eigenvalues (natural frequencies) and $phi$ are eigenvectors (mode shapes).
]
