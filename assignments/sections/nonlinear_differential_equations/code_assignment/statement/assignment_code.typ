#import "../../../../../utils.typ": *

= Assignment 4: Code Assignment (Differential Equations and Dynamical Systems)
*Total Points:* 100

== Objective
Apply computational software (Python + SymPy recommended) to analyze first-order differential equations, linear systems, and autonomous systems, consistent with the redesigned Section 4.

== System Description
This assignment follows the three redesigned subsections:

- 4.1 First-Order Differential Equations
- 4.2 Constant-Coefficient Linear Systems
- 4.3 Time-Dependent Linear Systems
- 4.4 Second-Order Nonlinear Systems
- 4.5 Additional Topics

You must combine analytical derivations with computational verification.

== Detailed Instructions & Deliverables

*General Guidelines:*
- Work in teams of exactly 3 students.
- Submit your final work as a combined PDF report.
- Include all source code (scripts/functions/notebook cells) in an appendix or inline in the report.
- All plots must have clearly labeled axes, titles, and legends where appropriate.
- Use notation consistent with lecture notes (state variables, Jacobian, matrix exponential, norms).

---

=== Part 1: First-Order Differential Equations (20 Points)
Use analytical derivations and symbolic computation.

1. *[5 pts]* Solve the linear IVP
  $ x' + 2x = 4, quad x(0)=1 $
  using integrating factors, and verify your expression computationally.

2. *[5 pts]* For the logistic IVP
  $ x' = r x (1 - x/K), quad x(0)=x_0, quad 0 < x_0 < K, $
  derive $x(t)$ analytically and verify numerically for one parameter set.

3. *[5 pts]* For the transcritical bifurcation $x' = lambda x - x^2$,
  compute equilibria and classify local stability as a function of $lambda$.

4. *[5 pts]* For $x' = x^2$ with $x(0) = 0.5$, compute the finite-time blow-up symbolically and plot the numerical solution up to the asymptote.

=== Part 2: Linear Systems (20 Points)
Use matrix methods and computational checks.

1. *[6 pts]* For
  $ A = mat(3, 0;0, -1), quad x(0)=mat(2;-1), $
  compute $e^(A t)$ and obtain $x(t)$ explicitly.

2. *[8 pts]* For
  $ A = mat(0, 1;-2, -3), $
  derive $e^(A t)$ and write the full state-transition solution
  $ x(t)=e^(A t)x_0 $. Verify your expression symbolically.

3. *[6 pts]* For
  $ A = mat(1, 2;0, -1), $
  derive an exponential growth bound for $norm(x(t))_infinity$.

=== Part 3: Time-Dependent Linear Systems (20 Points)
Use fundamental matrices, transition matrices, and growth bounds.

1. *[5 pts]* For $A(t) = mat(2t, 0;0, -3)$, compute a fundamental matrix $Phi(t)$.

2. *[5 pts]* For $A(t) = mat(0, 0;0, t)$, construct the transition matrix $Phi(t, s)$.

3. *[5 pts]* Assume $norm(A(t))_2 <= 0.6$. If $norm(x(0))_2 = 4$, derive an explicit upper bound for $norm(x(t))_2$ and verify computationally at $t=5$.

4. *[5 pts]* For $u(t) <= 2 + integral_0^t 3 u(s) dif s$, use Grönwall's Inequality to find an explicit exponential bound for $u(t)$.

=== Part 4: Second-Order Nonlinear Systems (20 Points)
Use Jacobians and phase portraits.

1. *[10 pts]* For the competing species model:
  $ x' = x(2-x-y), quad y' = y(3-2x-y), $
  compute all non-negative equilibria. Compute the Jacobian at each equilibrium and classify its stability using the Hartman-Grobman theorem.
  
2. *[10 pts]* Use Python (`matplotlib.pyplot.streamplot`) to plot the global phase portrait for the system above in the region $x, y in [0, 4]$. Overlay the equilibria computed in the previous step.

=== Part 5: Advanced Topics (20 Points)
Use conserved quantities, limit cycles, and numerical schemes.

1. *[7 pts]* Consider the predator-prey system $x' = 2x - x y, quad y' = -y + x y$. Find a first integral $H(x,y)$ such that $H$ is constant along trajectories. Verify analytically.

2. *[7 pts]* Consider the system $r' = r(1-r^2), quad theta' = 1$ in polar coordinates. Plot the numerical solution starting near the origin to demonstrate the stable limit cycle at $r=1$.

3. *[6 pts]* For the scalar IVP $x' = x + t^2$ with $x(0)=1$, perform a numerical integration using the Euler Method and RK4 on $[0, 2]$ with $h=0.1$. Plot both approximations against the exact solution.

=== Report Quality Rubric (Optional but Recommended)
- *Mathematical correctness (40%):* correct derivations and stability claims.
- *Computational verification (35%):* code reproduces analytical results.
- *Communication clarity (25%):* readable steps, labeled plots, and concise conclusions.
