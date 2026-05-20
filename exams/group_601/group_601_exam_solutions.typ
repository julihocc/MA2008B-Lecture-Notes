#import "../exam_template.typ": *

#show: exam.with(
  title: "Solutions: Exam for Group 601",
  date: "",
  show_student_info: false
)

_Covering Sections 5.1, 5.2, 5.3, 6.1, and 6.2_

#set text(size: 9.4pt)
#set par(justify: true, leading: 0.55em)

#question(title: "5.1 Phase-Line Analysis")[
  Consider the autonomous differential equation:
  $ x' = x(x - 1)(x - 4). $
  1. Find all equilibrium points.
  2. Determine the sign of $x'$ on each interval determined by the equilibria.
  3. Classify each equilibrium point as stable or unstable.
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

#question(title: "5.2 Trace-Determinant Classification")[
  Consider the linear system $x' = A x$, where
  $ A = mat(-2, 3; -1, 0). $
  1. Compute the trace $tau$ and determinant $Delta$ of $A$.
  2. Compute the discriminant $D = tau^2 - 4 Delta$.
  3. Use the trace-determinant criteria to classify the critical point at the origin.
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
  Consider the time-dependent linear system $x' = A(t)x$, where
  $ A(t) = mat(2t, 0; 0, -3). $
  1. Solve the two scalar equations for $x_1(t)$ and $x_2(t)$.
  2. Construct a fundamental matrix $Phi(t)$.
  3. Verify that $Phi(t)$ is invertible for all real $t$.
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

#question(title: "6.1 Nullclines and Equilibria")[
  Consider the planar competition system
  $ x' &= x(1 - x - 2y) \
    y' &= y(1 - y - 3x), $
  where $x,y >= 0$.
  1. Determine the $x$-nullclines and $y$-nullclines.
  2. Find all equilibrium points in $RR_+^2$.
  3. Use the Jacobian determinant at the interior equilibrium to decide whether it is a saddle point.
]
#solution[
  *1. Nullclines:*
  From $x'=0$ we get $x=0$ or $x+2y=1$.
  From $y'=0$ we get $y=0$ or $3x+y=1$.

  *2. Equilibria in $RR_+^2$:*
  The boundary intersections are $(0,0)$, $(1,0)$, and $(0,1)$.
  The interior equilibrium solves $x+2y=1$ and $3x+y=1$, hence
  $ (x,y) = (1/5, 2/5). $
  Thus the equilibria are
  $ (0,0), quad (1,0), quad (0,1), quad (1/5, 2/5). $

  *3. Interior Stability Type:*
  For
  $ F=x(1-x-2y), quad H=y(1-y-3x), $
  the Jacobian is
  $ J(x,y) = mat(1 - 2x - 2y, -2x; -3y, 1 - 2y - 3x). $
  At $(1/5,2/5)$,
  $ J = mat(-1/5, -2/5; -6/5, -2/5), $
  so
  $ det(J) = (-1/5)(-2/5) - (-2/5)(-6/5) = -2/5 < 0. $
  Therefore the interior equilibrium is a *saddle point*.
]

#solution_pagebreak()

#question(title: "6.2 Topp Planar Equilibrium Stability")[
  For the reduced Topp planar subsystem with
  $ P_G = 864, quad k_1 = 1.44, quad k_2 = 36, quad gamma = 0.2, quad beta_0 = 1, $
  and
  $ f(G) = G^2/(13000 + G^2), $
  the unique equilibrium is
  $ x^* approx (40.306, 0.555). $
  1. Write the Jacobian matrix $J(G,I)$ for the planar subsystem.
  2. Evaluate $J$ at $x^*$ using
     $ f'(G) = (2 dot 13000 dot G)/(13000 + G^2)^2. $
  3. Use the trace, determinant, and eigenvalues to classify the equilibrium.
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
