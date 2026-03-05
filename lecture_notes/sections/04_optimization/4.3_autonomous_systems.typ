#import "../../../utils.typ": *
== Autonomous Systems

=== Mathematical Review

This section covers Chapter 3 topics: phase-plane diagrams, linear and nonlinear stability, linearization, periodic solutions, three-dimensional systems, and computational support.

#definition[Autonomous System in $RR^n$][
  An autonomous nonlinear system is
  $ x' = f(x), $
  where time does not appear explicitly in $f$.
]

#definition[Phase Plane][
  For $n=2$, the phase plane represents trajectories of
  $ x' = f(x, y), quad y' = g(x, y) $
  as geometric curves, revealing equilibria, invariant sets, and qualitative dynamics.
]

#theorem[Linearization Near Equilibrium][
  Let $x^*$ be an equilibrium of $x'=f(x)$.
  If $J = Df(x^*)$ has no eigenvalues with zero real part, then the local behavior of the nonlinear system is topologically equivalent to
  $ u' = Ju. $
]

#definition[Periodic Solutions][
  A nonconstant trajectory is periodic if there exists $T>0$ such that
  $ x(t+T)=x(t) $ for all $t$.
  Existence/nonexistence criteria depend on system structure and dimension.
]

#example[Three-Dimensional Dynamics][
  In $RR^3$, trajectories can exhibit spirals, saddles, and complex invariant sets not visible in two-dimensional phase planes.
]

#example[Chapter 3 map][
  - 3.1 Introduction
  - 3.2 Phase Plane Diagrams
  - 3.3 Phase Plane Diagrams for Linear Systems
  - 3.4 Stability of Nonlinear Systems
  - 3.5 Linearization of Nonlinear Systems
  - 3.6 Existence and Nonexistence of Periodic Solutions
  - 3.7 Three-Dimensional Systems
  - 3.8 Differential Equations and Mathematica
  - 3.9 Exercises
]

=== Solved Problems

#solved_problem[Phase-Plane Classification][
  Classify the origin for
  $ x' = y, quad y' = -x - 0.2y. $
]
#solution[
  The linear matrix is $A = mat(0, 1; -1, -0.2)$.
  Its eigenvalues are complex with negative real part, so the origin is a stable focus (spiral sink).
]

#solved_problem[Linearization of a Nonlinear System][
  Analyze local stability at the origin for
  $ x' = y - x^3, quad y' = -x - y. $
]
#solution[
  Jacobian at $(0,0)$:
  $ J = mat(0, 1; -1, -1). $
  Eigenvalues have negative real part, so the origin is locally asymptotically stable.
]

=== Supplementary Problems

#supplementary[Periodic Orbit Screening][
  Use a planar criterion (e.g., divergence sign test in a simply connected region) to discuss possible closed orbits.
]

#supplementary[3D System Exploration][
  For a selected three-dimensional autonomous model, identify equilibria and classify them via Jacobian eigenvalues.
]
