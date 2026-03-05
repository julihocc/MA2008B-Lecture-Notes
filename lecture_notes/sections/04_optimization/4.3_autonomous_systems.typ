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
  If $J$ is the Jacobian matrix at $x^*$ and has no eigenvalues with zero real part, then the local behavior of the nonlinear system is topologically equivalent to
  $ u' = J u. $
]
#proof[
  Let $x = x^* + u$ and define
  $ g(u) = f(x^* + u). $
  Since $f(x^*) = 0$, a first-order expansion gives
  $ g(u) = J u + h(u), $
  where $J$ is the Jacobian matrix at $x^*$ and $norm(h(u))/norm(u) -> 0$ as $u -> 0$.

  Hence the nonlinear dynamics near the equilibrium can be written as
  $ u' = J u + h(u). $
  The linearized system is
  $ v' = J v. $

  If $J$ has no eigenvalues on the imaginary axis (hyperbolic equilibrium), the higher-order term $h(u)$ does not change the qualitative local phase portrait. Therefore, the nonlinear and linearized systems are locally topologically equivalent near $x^*$.
]

#definition[Periodic Solutions][
  A nonconstant trajectory is periodic if there exists $T>0$ such that
  $ x(t+T)=x(t) $ for all $t$.
  Existence/nonexistence criteria depend on system structure and dimension.
]

#definition[Three-Dimensional Dynamics][
  In $RR^3$, trajectories can exhibit spirals, saddles, and complex invariant sets not visible in two-dimensional phase planes.
]

=== Solved Problems

#solved_problem[Phase-Plane Classification][
  Classify the origin for
  $ x' = y, quad y' = -x - 0.2y. $
]
#solution[
  The linear matrix is $A = mat(0, 1; -1, -0.2)$.
  The characteristic polynomial is
  $ lambda^2 + 0.2lambda + 1 = 0, $
  so
  $ lambda_(1,2) = (-0.2 +- sqrt(0.04 - 4))/2 = -0.1 +- 0.995i. $
  Since the real part is negative, the origin is a stable focus (spiral sink).
]

#solved_problem[Linearization of a Nonlinear System][
  Analyze local stability at the origin for
  $ x' = y - x^3, quad y' = -x - y. $
]
#solution[
  Jacobian at $(0,0)$:
  $ J = mat(0, 1; -1, -1). $
  The characteristic polynomial is
  $ lambda^2 + lambda + 1 = 0, $
  giving
  $ lambda_(1,2) = (-1 +- sqrt(-3))/2 = -1/2 +- (sqrt(3))/2 i. $
  Both eigenvalues have negative real part, so the origin is locally asymptotically stable.
]

#solved_problem[Nonexistence of Periodic Orbits (Bendixson Criterion)][
  Consider the planar autonomous system
  $ x' = x + y, quad y' = -x + 2y. $
  Determine whether nontrivial periodic orbits can exist in a simply connected region of $RR^2$.
]
#solution[
  Let
  $ F(x,y) = (P(x,y), Q(x,y)) = (x+y, -x+2y). $
  The divergence is
  $ (partial P)/(partial x) + (partial Q)/(partial y) = 1 + 2 = 3. $

  Since the divergence is strictly positive everywhere (and never changes sign), the Bendixson criterion implies that no nontrivial periodic orbit can lie entirely in a simply connected region of the plane.
]

=== Supplementary Problems

#supplementary[Periodic Orbit Screening][
  Use a planar criterion (e.g., divergence sign test in a simply connected region) to discuss possible closed orbits.
]

#supplementary[3D System Exploration][
  For a selected three-dimensional autonomous model, identify equilibria and classify them via Jacobian eigenvalues.
]

#supplementary[Nullclines and Flow Regions][
  For $x' = x - y^2$ and $y' = x^2 - y$, compute nullclines and determine the qualitative direction of the vector field in each region.
]

#supplementary[Linearization Limits][
  Analyze the equilibrium at the origin for $x' = y, y' = -x^3$. Explain why linearization is inconclusive and suggest an alternative method.
]

#supplementary[Periodic Solution Nonexistence Test][
  Apply a planar nonexistence criterion to $x' = x + y, y' = -x + 2y$ on a simply connected domain and conclude whether periodic orbits can exist.
]
