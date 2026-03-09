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

You must combine analytical derivations with computational verification.

== Detailed Instructions & Deliverables

*General Guidelines:*
- Work in teams of exactly 3 students.
- Submit your final work as a combined PDF report.
- Include all source code (scripts/functions/notebook cells) in an appendix or inline in the report.
- All plots must have clearly labeled axes, titles, and legends where appropriate.
- Use notation consistent with lecture notes (state variables, Jacobian, matrix exponential, norms).

---

=== Part 1: First-Order Differential Equations (30 Points)
Use analytical derivations and symbolic computation.

1. *[10 pts]* Solve the linear IVP
  $ x' + 2x = 4, quad x(0)=1 $
  using integrating factors, and verify your closed-form expression computationally.

2. *[10 pts]* For the logistic IVP
  $ x' = r x (1 - x/K), quad x(0)=x_0, quad 0 < x_0 < K, $
  derive $x(t)$ analytically and verify numerically for one parameter set of your choice.

3. *[10 pts]* For
  $ x' = lambda x - x^3, $
  compute equilibria and classify local stability as a function of $lambda$.
  Include a short bifurcation summary (before/at/after critical parameter value).

=== Part 2: Linear Systems (35 Points)
Use matrix methods and computational checks.

1. *[10 pts]* For
  $ A = mat(3, 0;0, -1), quad x(0)=mat(2;-1), $
  compute $e^(A t)$ and obtain $x(t)$ explicitly.

2. *[15 pts]* For
  $ A = mat(0, 1;-2, -3), $
  derive $e^(A t)$ and write the full state-transition solution
  $ x(t)=e^(A t)x_0 $. Verify your expression symbolically (or by checking $Phi'(t)=A Phi(t)$ and $Phi(0)=I$).

3. *[10 pts]* For
  $ A = mat(1, 2;0, -1), $
  compute $norm(A)_infinity$ and derive an exponential growth bound for $norm(x(t))_infinity$.

=== Part 3: Time-Dependent Linear Systems (35 Points)
Use fundamental matrices, transition matrices, and growth bounds.

1. *[10 pts]* For the diagonal time-dependent system
  $ x' = A(t)x, quad A(t) = mat(2t, 0;0, -3), $
  compute a fundamental matrix $Phi(t)$ and verify that $det(Phi(t)) != 0$ for all $t$.

2. *[15 pts]* For the system
  $ A(t) = mat(0, 0;0, t), $
  construct the transition matrix $Phi(t, s)$ explicitly and compute the solution for $x(s) = mat(1;-1)$.

3. *[10 pts]* Assume a time-dependent matrix $A(t)$ satisfies $norm(A(t))_2 <= 0.6$ for all $t >= 0$. If an initial condition is strictly $norm(x(0))_2 = 4$, derive an explicit upper bound for $norm(x(t))_2$ as a function of $t$. Verify this bound computationally at $t=5$.

=== Report Quality Rubric (Optional but Recommended)
- *Mathematical correctness (40%):* correct derivations and stability claims.
- *Computational verification (35%):* code reproduces analytical results.
- *Communication clarity (25%):* readable steps, labeled plots, and concise conclusions.
