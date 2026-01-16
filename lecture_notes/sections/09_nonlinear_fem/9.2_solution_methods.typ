#import "../../utils.typ": *

== Solution Methods for Nonlinear Equations

=== Mathematical Review

Since $K(d)$ depends on $d$, the equilibrium equation $F = K(d) d$ cannot be solved directly. Iterative methods are used.

#theorem[Newton-Raphson Method][
  The most common iterative method finding roots of residual $R(d) = f_("ext") - f_("int")(d) = 0$.
  Iteration $i+1$:
  $ K_T (d^((i))) Delta d^((i)) = R(d^((i))) $
  $ d^((i+1)) = d^((i)) + Delta d^((i)) $
  where $K_T = (diff f_("int"))/(diff d)$ is the *tangent stiffness matrix*.
]

#definition[Load Control vs Displacement Control][
  - *Load Control*: Prescribe force steps, solve for displacement. Fails near limit points (snap-through).
  - *Displacement Control*: Prescribe displacement steps, solve for reaction forces. Can trace post-buckling paths.
  - *Arc-Length Method*: Simultaneously varies load and displacement to trace complex paths.
]

=== Solved Problems

#solved_problem[Newton-Raphson Iteration][
  Perform one N-R iteration for $f(x) = x^3 - 5 = 0$ starting at $x_0 = 2$.
]
#solution[
  1. Residual: $R(x_0) = -f(x_0) = -(2^3 - 5) = -3$
  2. Tangent stiffness: $K_T = f'(x) = 3x^2 => K_T(2) = 12$
  3. Solve increment: $K_T Delta x = R => 12 Delta x = -3 => Delta x = -0.25$
  4. Update: $x_1 = 2 - 0.25 = 1.75$
]
