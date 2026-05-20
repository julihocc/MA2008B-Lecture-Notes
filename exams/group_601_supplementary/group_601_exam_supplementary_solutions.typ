#import "../exam_template.typ": *

#show: exam.with(
  title: "Solutions: Exam for Group 601",
  date: "",
  show_student_info: false
)

_Covering Sections 5.1, 5.2, 5.3, 6.1, and 6.2_

#question(title: "5.1 Phase-Line Analysis")[
  For the autonomous equation $x' = x(x-1)(x-4)$, identify equilibria, determine their stability, and sketch the phase line.
]
#solution[
  *1. Equilibrium Points:*
  Equilibria occur where
  $ x(x - 1)(x - 4) = 0. $
  Hence
  $ x^* = 0, quad x^* = 1, quad x^* = 4. $

  *2. Phase-Line Signs:*
  Test one point in each interval:
  - If $x < 0$, then $x' < 0$.
  - If $0 < x < 1$, then $x' > 0$.
  - If $1 < x < 4$, then $x' < 0$.
  - If $x > 4$, then $x' > 0$.

  *3. Stability:*
  The arrows point away from $0$, toward $1$, and away from $4$.
  Therefore $x^*=0$ is unstable, $x^*=1$ is locally asymptotically stable, and $x^*=4$ is unstable.
]

#solution_pagebreak()

#question(title: "5.2 Trace-Determinant Diagram Point")[
  For
  $ A = mat(-2,3;-1,0), $
  compute $(tau, Delta, D)$ and classify the origin.
]
#solution[
  *1. Trace and Determinant:*
  $ tau = text("tr")(A) = -2 + 0 = -2. $
  $ Delta = det(A) = (-2)(0) - 3(-1) = 3. $

  *2. Discriminant:*
  $ D = tau^2 - 4 Delta = (-2)^2 - 4(3) = 4 - 12 = -8. $

  *3. Classification:*
  Since $Delta > 0$ and $D < 0$, the eigenvalues are complex conjugates.
  Since $tau < 0$, their real part is negative.
  Therefore the origin is a *stable focus*.
]

#solution_pagebreak()

#question(title: "5.3 Fundamental Matrix Computation")[
  For
  $ A(t)=mat(2t,0;0,-3), $
  compute a fundamental matrix and verify invertibility.
]
#solution[
  *1. Scalar Solutions:*
  The system is decoupled:
  $ x_1' = 2t x_1, quad x_2' = -3x_2. $
  Therefore
  $ x_1(t) = c_1 e^(t^2), quad x_2(t) = c_2 e^(-3t). $

  *2. Fundamental Matrix:*
  A fundamental matrix is
  $ Phi(t) = mat(e^(t^2), 0; 0, e^(-3t)). $

  *3. Invertibility:*
  $ det(Phi(t)) = e^(t^2) e^(-3t) = e^(t^2 - 3t). $
  Since an exponential is never zero, $det(Phi(t)) != 0$ for all $t in RR$.
]

#solution_pagebreak()

#question(title: "6.1 Competitive Exclusion Principle Phase Analysis")[
  Two species $x(t)$ and $y(t)$ competing for the same limited resource can be modeled by the Lotka-Volterra competition system:
  $ x' &= r_1 x(1 - x - alpha y) \ y' &= r_2 y(1 - y - beta x) $
  Sketch the corresponding nullclines for the case where $alpha > 1$ and $beta > 1$ (representing strong inter-species competition). Use phase plane geometry to visually demonstrate that the interior co-existence equilibrium is a saddle point, providing mathematical justification for the ecological principle of competitive exclusion _(Hardin, Science 131:1292-1297, 1960; Gause, The Struggle for Existence, 1934)_ (i.e., almost all trajectories converge to either $(1,0)$ or $(0,1)$).
  *Hint:* Compute all equilibria first, then use the Jacobian determinant at the interior point to verify saddle behavior.
]
#solution[
  *1. Nullclines:*
  Setting $x'=0$ gives
  $ x = 0 quad "or" quad 1 - x - alpha y = 0. $
  Thus the $x$-nullclines are
  $ x=0 quad "and" quad x + alpha y = 1. $

  Setting $y'=0$ gives
  $ y = 0 quad "or" quad 1 - y - beta x = 0. $
  Thus the $y$-nullclines are
  $ y=0 quad "and" quad beta x + y = 1. $

  *2. Equilibria in $RR_+^2$:*
  The boundary intersections give
  $ (0,0), quad (1,0), quad (0,1). $
  For the interior equilibrium, solve
  $ x + alpha y = 1, quad beta x + y = 1. $
  This gives
  $ x = (alpha - 1)/(alpha beta - 1), quad y = (beta - 1)/(alpha beta - 1). $
  Since $alpha>1$ and $beta>1$, the interior point lies in $RR_+^2$.
  Hence the equilibria are
  $ (0,0), quad (1,0), quad (0,1), quad ((alpha - 1)/(alpha beta - 1), (beta - 1)/(alpha beta - 1)). $

  *3. Interior Stability Type:*
  Let $F(x,y) = r_1 x(1 - x - alpha y)$ and $H(x,y) = r_2 y(1 - y - beta x)$.
  Then
  $ J(x,y) = mat(r_1(1 - 2x - alpha y), -r_1 alpha x; -r_2 beta y, r_2(1 - 2y - beta x)). $
  At the interior equilibrium, the relations $1 - x^* - alpha y^*=0$ and $1 - y^* - beta x^*=0$ give
  $ J(x^*,y^*) = mat(-r_1 x^*, -r_1 alpha x^*; -r_2 beta y^*, -r_2 y^*). $
  Hence
  $ det(J(x^*,y^*)) = r_1 r_2 x^* y^* (1 - alpha beta) < 0. $
  The determinant is negative, so the interior coexistence equilibrium is a saddle point. Its stable manifold separates the basins of attraction of the boundary equilibria $(1,0)$ and $(0,1)$, which is the phase-plane mechanism behind competitive exclusion.
]

#solution_pagebreak()

#question(title: "6.2 Jacobian Matrix and Local Stability")[
  For the planar $(G, I)$ subsystem with constant $beta_0$:
  1. Compute the analytical Jacobian matrix $J(G,I)$ evaluated at an arbitrary point $(G, I)$.
  2. For the numerically computed equilibrium point $x^* approx (40.306, 0.555)$, evaluate the Jacobian matrix.
  3. Compute the trace, determinant, and eigenvalues of this matrix to rigorously classify the local asymptotic stability of the equilibrium point.
  *Hint:* Use $f'(G) = (2 dot 13000 dot G)/(13000 + G^2)^2$ for this secretion function.
]
#solution[
  *1. Jacobian Matrix:*
  The planar subsystem is
  $ G' = P_G - k_1 G - k_2 I G, quad I' = beta_0 f(G) - gamma I. $
  Therefore
  $ J(G,I) = mat(-k_1 - k_2 I, -k_2 G; beta_0 f'(G), -gamma). $

  *2. Evaluation at $x^* approx (40.306,0.555)$:*
  Using the unrounded equilibrium corresponding to this displayed approximation,
  together with the given parameters and derivative,
  $ J^* approx mat(-21.436, -1451.033; 0.004900, -0.200). $

  *3. Stability Classification:*
  The trace and determinant are approximately
  $ text("tr")(J^*) approx -21.636, quad det(J^*) approx 11.397. $
  The eigenvalues are approximately
  $ lambda_1 approx -21.096, quad lambda_2 approx -0.540. $
  Both eigenvalues are real and negative, so the unique equilibrium is a *locally asymptotically stable node*.
]
