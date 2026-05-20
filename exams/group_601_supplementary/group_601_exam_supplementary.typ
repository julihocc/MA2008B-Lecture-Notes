#import "../exam_template.typ": *

#show: exam.with(
  title: "Exam for Group 601",
  date: "",
)

_Covering Sections 5.1, 5.2, 5.3, 6.1, and 6.2_

#selection_grading_rule()

#question(title: "5.1 Phase-Line Analysis")[
  For the autonomous equation $x' = x(x-1)(x-4)$, identify equilibria, determine their stability, and sketch the phase line.
]

#question(title: "5.2 Trace-Determinant Diagram Point")[
  For
  $ A = mat(-2,3;-1,0), $
  compute $(tau, Delta, D)$ and classify the origin.
]

#question(title: "5.3 Fundamental Matrix Computation")[
  For
  $ A(t)=mat(2t,0;0,-3), $
  compute a fundamental matrix and verify invertibility.
]

#question(title: "6.1 Competitive Exclusion Principle Phase Analysis")[
  Two species $x(t)$ and $y(t)$ competing for the same limited resource can be modeled by the Lotka-Volterra competition system:
  $ x' &= r_1 x(1 - x - alpha y) \ y' &= r_2 y(1 - y - beta x) $
  Sketch the corresponding nullclines for the case where $alpha > 1$ and $beta > 1$ (representing strong inter-species competition). Use phase plane geometry to visually demonstrate that the interior co-existence equilibrium is a saddle point, providing mathematical justification for the ecological principle of competitive exclusion _(Hardin, Science 131:1292-1297, 1960; Gause, The Struggle for Existence, 1934)_ (i.e., almost all trajectories converge to either $(1,0)$ or $(0,1)$).
  *Hint:* Compute all equilibria first, then use the Jacobian determinant at the interior point to verify saddle behavior.
]

#question(title: "6.2 Jacobian Matrix and Local Stability")[
  For the planar $(G, I)$ subsystem with constant $beta_0$:
  1. Compute the analytical Jacobian matrix $J(G,I)$ evaluated at an arbitrary point $(G, I)$.
  2. For the numerically computed equilibrium point $x^* approx (40.306, 0.555)$, evaluate the Jacobian matrix.
  3. Compute the trace, determinant, and eigenvalues of this matrix to rigorously classify the local asymptotic stability of the equilibrium point.
  *Hint:* Use $f'(G) = (2 dot 13000 dot G)/(13000 + G^2)^2$ for this secretion function.
]
