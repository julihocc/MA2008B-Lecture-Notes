#import "../../utils.typ": *

= Exam for Group 601
_Covering Sections 5.1, 5.2, 5.3, and 6.1_

#exercise[Question 1: First-Order Differential Equations][
  Consider the autonomous differential equation:
  $ x' = 2x - x^2 $
  1. Find all equilibrium points of the system.
  2. Use the first-derivative test to classify the local stability of each equilibrium point.
  3. Sketch the phase line and confirm your stability analysis.
]

#exercise[Question 2: Constant-Coefficient Linear Systems][
  Consider the linear system $x' = A x$, where the matrix $A$ is given by:
  $ A = mat(-2, -3; 1, 1) $
  1. Compute the trace ($tau$) and determinant ($Delta$) of the matrix $A$.
  2. Find the discriminant $D = tau^2 - 4 Delta$.
  3. Use the trace-determinant plane criteria to classify the critical point at the origin (e.g., saddle, stable node, unstable focus, etc.).
]

#exercise[Question 3: Time-Dependent Linear Systems][
  Consider the time-dependent linear system $x' = A(t) x$, where:
  $ A(t) = mat(-t, 0; 0, 2t) $
  1. Since the system is decoupled, solve the individual differential equations $x'_1 = -t x_1$ and $x'_2 = 2t x_2$.
  2. Construct a fundamental matrix $Phi(t)$ for this system.
  3. Verify that $det(Phi(t)) != 0$ for all $t$.
]

#exercise[Question 4: Vector Fields and Nullclines][
  Consider the planar competition model:
  $ x' &= x(1 - x) - x y \
    y' &= y(1 - y) - x y $
  where $x, y >= 0$.
  1. Determine the algebraic equations for the $x$-nullclines and $y$-nullclines.
  2. Find all equilibrium points in the non-negative quadrant $RR_+^2$.
]
