#import "../../utils.typ": *

= Exam for Group 602
_Covering Mathematical Content from Chapters 5 to 8_

#exercise[Question 1: Nonlinear Phase Plane Analysis (Chapters 5 & 6)][
  Consider the planar nonlinear system:
  $ x' &= -x + y^2 \
    y' &= -y - x^2 $
  1. Determine the algebraic equations for the $x$-nullcline and the $y$-nullcline.
  2. Find all equilibrium points in $RR^2$ algebraically.
]

#exercise[Question 2: Lyapunov Direct Method (Chapter 7)][
  Consider the same planar nonlinear system as in Question 1:
  $ x' &= -x + y^2 \
    y' &= -y - x^2 $
  We will analyze the stability of the origin $(0,0)$ using the Lyapunov direct method. Let the candidate Lyapunov function be:
  $ V(x, y) = 1/2 x^2 + 1/2 y^2 $
  1. Verify that $V(x, y)$ is positive definite.
  2. Compute the derivative $dot(V)(x,y)$ along the trajectories of the system.
  3. Based on your result for $dot(V)(x,y)$, what can you conclude about the stability of the origin? Is it locally or globally asymptotically stable? Justify your answer.
]

#exercise[Question 3: Linearization and Jacobian Analysis (Chapter 7)][
  Consider the nonlinear system:
  $ x' &= x(1 - x - y) \
    y' &= y(2 - y - 3x) $
  1. Verify that the point $(x^*, y^*) = (1/2, 1/2)$ is an equilibrium point of the system.
  2. Compute the general Jacobian matrix $J(x,y)$ for this system.
  3. Evaluate the Jacobian matrix at the equilibrium $(1/2, 1/2)$.
  4. Compute the trace and determinant of the evaluated Jacobian, and classify the local stability of the equilibrium using the Lyapunov Indirect Method.
]

#exercise[Question 4: Bifurcation Analysis (Chapter 8)][
  Consider the parameterized nonlinear scalar equation:
  $ x' = mu x - x^3 $
  where $mu$ is a real bifurcation parameter.
  1. Find all equilibrium points $x^*$ as a function of the parameter $mu$.
  2. Use the first-derivative test to determine the local stability of each equilibrium branch. (Treat the cases $mu < 0$ and $mu > 0$ separately).
  3. Identify the critical parameter value $mu_c$ where a bifurcation occurs. What type of bifurcation is this?
]
