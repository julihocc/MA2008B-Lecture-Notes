#import "exam_template.typ": *

#show: exam.with(
  title: "Exam for Group 602",
  date: "",
)

_Covering Sections 6.1, 7.1, 7.2, 5.3, and 8.1_

#question(title: "6.1 Nullclines and Equilibria")[
  Consider the planar nonlinear system:
  $ x' &= -x + y^2 \
    y' &= -y - x^2 $
  1. Determine the algebraic equations for the $x$-nullcline and the $y$-nullcline.
  2. Find all equilibrium points in $RR^2$ algebraically.
]

#question(title: "7.1 Lyapunov Direct Method")[
  Consider the planar nonlinear system
  $ x' &= -x + y^2 \
    y' &= -y - x^2, $
  and the candidate Lyapunov function
  $ V(x,y) = 1/2 x^2 + 1/2 y^2. $
  1. Verify that $V(x, y)$ is positive definite.
  2. Compute $dot(V)(x,y)$ along trajectories.
  3. Use $dot(V)$ to classify the local stability of the origin.
]

#question(title: "7.2 Linearization and Jacobian Analysis")[
  Consider the nonlinear system:
  $ x' &= x(1 - x - y) \
    y' &= y(2 - y - 3x) $
  1. Verify that the point $(x^*, y^*) = (1/2, 1/2)$ is an equilibrium point of the system.
  2. Compute the general Jacobian matrix $J(x,y)$ for this system.
  3. Evaluate the Jacobian matrix at the equilibrium $(1/2, 1/2)$.
  4. Compute the trace and determinant, and classify the local stability of the equilibrium.
]

#question(title: "5.3 Time-Dependent Linear IVP")[
  Consider the time-dependent linear system
  $ x' = A(t)x, quad A(t) = mat(1, 0; 0, -t), quad x(0)=mat(1;1). $
  1. Write the two scalar differential equations for $x_1(t)$ and $x_2(t)$.
  2. Solve each scalar equation using the initial condition.
  3. Write the solution vector $x(t)$.
]

#question(title: "8.1 Bifurcation Analysis")[
  Consider the parameterized nonlinear scalar equation:
  $ x' = mu x - x^3 $
  where $mu$ is a real bifurcation parameter.
  1. Find all equilibrium points $x^*$ as a function of the parameter $mu$.
  2. Use the first-derivative test to determine the local stability of each equilibrium branch. (Treat the cases $mu < 0$ and $mu > 0$ separately).
  3. Identify the critical parameter value $mu_c$ where a bifurcation occurs. What type of bifurcation is this?
]
