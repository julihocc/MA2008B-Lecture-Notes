#import "../../utils.typ": *

= Solutions: Exam for Group 601
_Covering Sections 5.1, 5.2, 5.3, and 6.1_

#solved_problem[Question 1: First-Order Differential Equations][
  Consider the autonomous differential equation:
  $ x' = 2x - x^2 $
  1. Find all equilibrium points of the system.
  2. Use the first-derivative test to classify the local stability of each equilibrium point.
  3. Sketch the phase line and confirm your stability analysis.
]
#solution[
  *1. Equilibrium Points:*
  Equilibria occur where $x' = 0$:
  $ 2x - x^2 = x(2 - x) = 0. $
  Therefore, the equilibrium points are $x^* = 0$ and $x^* = 2$.

  *2. First-Derivative Test:*
  Let $f(x) = 2x - x^2$. Then the derivative is $f'(x) = 2 - 2x$.
  - At $x^* = 0$: $f'(0) = 2 > 0$. Thus, $x^* = 0$ is *unstable*.
  - At $x^* = 2$: $f'(2) = 2 - 4 = -2 < 0$. Thus, $x^* = 2$ is *locally asymptotically stable*.

  *3. Phase Line:*
  - For $x < 0$, $f(x) < 0$ (arrows point left).
  - For $0 < x < 2$, $f(x) > 0$ (arrows point right).
  - For $x > 2$, $f(x) < 0$ (arrows point left).
  Trajectories move away from $0$ and toward $2$, confirming that $0$ is unstable and $2$ is asymptotically stable.
]

#solved_problem[Question 2: Constant-Coefficient Linear Systems][
  Consider the linear system $x' = A x$, where the matrix $A$ is given by:
  $ A = mat(-2, -3; 1, 1) $
  1. Compute the trace ($tau$) and determinant ($Delta$) of the matrix $A$.
  2. Find the discriminant $D = tau^2 - 4 Delta$.
  3. Use the trace-determinant plane criteria to classify the critical point at the origin.
]
#solution[
  *1. Trace and Determinant:*
  $ tau = text("tr")(A) = -2 + 1 = -1 $
  $ Delta = det(A) = (-2)(1) - (-3)(1) = -2 + 3 = 1 $

  *2. Discriminant:*
  $ D = tau^2 - 4 Delta = (-1)^2 - 4(1) = 1 - 4 = -3 $

  *3. Classification:*
  Since $Delta > 0$ and $D < 0$, the eigenvalues are complex conjugates.
  Because $tau < 0$, the real part of the eigenvalues is negative.
  Therefore, the origin is a *stable focus* (or stable spiral).
]

#solved_problem[Question 3: Time-Dependent Linear Systems][
  Consider the time-dependent linear system $x' = A(t) x$, where:
  $ A(t) = mat(-t, 0; 0, 2t) $
  1. Solve the individual differential equations $x'_1 = -t x_1$ and $x'_2 = 2t x_2$.
  2. Construct a fundamental matrix $Phi(t)$ for this system.
  3. Verify that $det(Phi(t)) != 0$ for all $t$.
]
#solution[
  *1. Solving Individual Equations:*
  - For $x'_1 = -t x_1$: separating variables gives $(d x_1) / x_1 = -t d t$. Integrating yields $ln|x_1| = -t^2/2 + C_1$, so $x_1(t) = c_1 e^(-t^2/2)$.
  - For $x'_2 = 2t x_2$: similarly, $(d x_2) / x_2 = 2t d t$. Integrating yields $ln|x_2| = t^2 + C_2$, so $x_2(t) = c_2 e^(t^2)$.

  *2. Constructing the Fundamental Matrix:*
  Placing the independent solutions into the columns of a matrix gives:
  $ Phi(t) = mat(e^(-t^2/2), 0; 0, e^(t^2)) $

  *3. Verifying the Determinant:*
  $ det(Phi(t)) = e^(-t^2/2) dot e^(t^2) - 0 = e^(t^2/2). $
  Since the exponential function is never zero, $det(Phi(t)) != 0$ for all real $t$.
]

#solved_problem[Question 4: Vector Fields and Nullclines][
  Consider the planar competition model:
  $ x' &= x(1 - x) - x y \
    y' &= y(1 - y) - x y $
  where $x, y >= 0$.
  1. Determine the algebraic equations for the $x$-nullclines and $y$-nullclines.
  2. Find all equilibrium points in the non-negative quadrant $RR_+^2$.
]
#solution[
  *1. Nullcline Equations:*
  - *x-nullclines*: Set $x' = 0$.
    $ x(1 - x - y) = 0 quad => quad x = 0 quad text("or") quad y = 1 - x. $
  - *y-nullclines*: Set $y' = 0$.
    $ y(1 - y - x) = 0 quad => quad y = 0 quad text("or") quad y = 1 - x. $

  *2. Equilibrium Points:*
  Equilibria are points where an $x$-nullcline intersects a $y$-nullcline.
  - Intersection of $x = 0$ and $y = 0$: $(0, 0)$.
  - Intersection of $x = 0$ and $y = 1 - x$: $y = 1 - 0 = 1$, giving $(0, 1)$.
  - Intersection of $y = 1 - x$ and $y = 0$: $0 = 1 - x => x = 1$, giving $(1, 0)$.
  - Intersection of $y = 1 - x$ and $y = 1 - x$: This occurs for any point on the line segment $y = 1 - x$ where $x, y >= 0$. Thus, there is a continuous line of equilibrium points connecting $(1,0)$ and $(0,1)$.

  The equilibrium points in $RR_+^2$ are $(0,0)$, and any point $(x, y)$ such that $x + y = 1$ with $x, y >= 0$.
]
