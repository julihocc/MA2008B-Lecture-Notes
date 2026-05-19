#import "exam_template.typ": *

#show: exam.with(
  title: "Exam for Group 601",
  date: "",
)

_Covering Sections 5.1, 5.2, 5.3, 6.1, and 6.2_

#question(title: "5.1 Phase-Line Analysis")[
  Consider the autonomous differential equation:
  $ x' = x(x - 1)(x - 4). $
  1. Find all equilibrium points.
  2. Determine the sign of $x'$ on each interval determined by the equilibria.
  3. Classify each equilibrium point as stable or unstable.
]

#question(title: "5.2 Trace-Determinant Classification")[
  Consider the linear system $x' = A x$, where
  $ A = mat(-2, 3; -1, 0). $
  1. Compute the trace $tau$ and determinant $Delta$ of $A$.
  2. Compute the discriminant $D = tau^2 - 4 Delta$.
  3. Use the trace-determinant criteria to classify the critical point at the origin.
]

#question(title: "5.3 Fundamental Matrix Computation")[
  Consider the time-dependent linear system $x' = A(t)x$, where
  $ A(t) = mat(2t, 0; 0, -3). $
  1. Solve the two scalar equations for $x_1(t)$ and $x_2(t)$.
  2. Construct a fundamental matrix $Phi(t)$.
  3. Verify that $Phi(t)$ is invertible for all real $t$.
]

#question(title: "6.1 Nullclines and Equilibria")[
  Consider the planar competition system
  $ x' &= x(1 - x - 2y) \
    y' &= y(1 - y - 3x), $
  where $x,y >= 0$.
  1. Determine the $x$-nullclines and $y$-nullclines.
  2. Find all equilibrium points in $RR_+^2$.
  3. Use the Jacobian determinant at the interior equilibrium to decide whether it is a saddle point.
]

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
