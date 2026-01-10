#import "../../utils.typ": *
== Root Contour Diagrams

=== Mathematical Review

Root contours extend root locus to show pole movement as multiple parameters vary simultaneously.

#definition[Root Contour][
  While root locus varies one parameter ($K$), root contour shows pole trajectories as two or more parameters vary. Useful for:
  - Varying compensator parameters
  - Analyzing parameter sensitivity
  - Multi-parameter optimization
]

#example[Two-Parameter Contour][
  For $G(s) = K_1/(s(s+K_2))$:
  - Fix $K_1$, vary $K_2$: one family of curves
  - Fix $K_2$, vary $K_1$: another family
  - Contour shows intersection
]

#definition[Constant Damping Loci][
  Lines from origin at angle $theta = cos^(-1)(zeta)$ represent constant damping ratio.
  - $zeta = 0$: imaginary axis
  - $zeta = 0.5$: $theta = 60 degree$
  - $zeta = 0.707$: $theta = 45 degree$
  - $zeta = 1$: negative real axis
]

#example[Damping Constraint][
  For $zeta >= 0.5$, acceptable region is left of lines at $plus.minus 60 degree$.
]

#definition[Constant Natural Frequency Loci][
  Circles centered at origin with radius $omega_n$ represent constant natural frequency.
]

#example[Frequency Constraint][
  For $omega_n <= 5$, acceptable region is inside circle of radius 5.
]

#theorem[Performance Region][
  Intersection of damping and frequency constraints defines acceptable pole locations:
  $ "Region" = {s: |s| <= omega_n "and" |arg(s)| >= cos^(-1)(zeta)} $
]

#example[Design Region][
  For $zeta >= 0.5$ and $omega_n <= 4$:
  Poles must be in sector between $plus.minus 60 degree$ lines, inside circle of radius 4.
]

=== Solved Problems

#solved_problem[Parameter Space Design][
  For $G(s) = K_1(s+K_2)/(s(s+1)(s+3))$, find $(K_1, K_2)$ for $zeta = 0.7$, $omega_n = 2$.
]
#solution[
  Desired poles: $s = -1.4 plus.minus 1.43j$ (from $zeta = 0.7, omega_n = 2$)

  Characteristic equation:
  $ s^3 + 4s^2 + 3s + K_1 s + K_1 K_2 = 0 $
  $ s^3 + 4s^2 + (3+K_1)s + K_1 K_2 = 0 $

  Substitute $s = -1.4 + 1.43j$:
  Real and imaginary parts give two equations in $(K_1, K_2)$.

  Solving: $K_1 approx 2.5$, $K_2 approx 1.6$
]

#solved_problem[Sensitivity Analysis][
  Analyze sensitivity of pole location to 10% variation in $K$ for $G(s) = K/(s(s+2))$.
]
#solution[
  Nominal: $K = 4$ gives poles at $s = -1 plus.minus j$

  With $K = 4.4$ (10% increase):
  $ s^2 + 2s + 4.4 = 0 $
  $ s = -1 plus.minus j 1.095 $

  Pole movement: $Delta s approx plus.minus 0.095j$

  Sensitivity: $S_("k")^s = (Delta s/s)/(Delta K/K) = (0.095/1)/(0.4/4) = 0.95$

  Moderate sensitivity to gain variations.
]

=== Supplementary Problems

#supplementary[Three-Parameter Design][
  Design PID controller $(K_p, K_("i"), K_d)$ using root contours.
]

#supplementary[Robust Design][
  Find parameter region ensuring stability despite 20% variations.
]

#supplementary[Multi-Objective Optimization][
  Optimize for minimum settling time subject to overshoot constraint.
]
