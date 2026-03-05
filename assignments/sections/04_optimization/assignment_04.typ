#import "../../../utils.typ": *

= Assignment 4A: Code Assignment (Differential Equations and Dynamical Systems)
*Total Points:* 100

== Objective
Apply computational software (Python + SymPy recommended) to analyze first-order differential equations, linear systems, and autonomous systems, consistent with the redesigned Section 4.

== System Description
This assignment follows the three redesigned subsections:

- 4.1 First-Order Differential Equations
- 4.2 Linear Systems
- 4.3 Autonomous Systems

You must combine analytical derivations with computational verification.

== Detailed Instructions & Deliverables

*General Guidelines:*
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
  $ A = mat(3, 0; 0, -1), quad x(0)=mat(2; -1), $
  compute $e^(At)$ and obtain $x(t)$ explicitly.

2. *[15 pts]* For
  $ A = mat(0, 1; -2, -3), $
  derive $e^(At)$ and write the full state-transition solution
  $ x(t)=e^(At)x_0 $. Verify your expression symbolically (or by checking $Phi'(t)=A Phi(t)$ and $Phi(0)=I$).

3. *[10 pts]* For
  $ A = mat(1, 2; 0, -1), $
  compute $norm(A)_infinity$ and derive an exponential growth bound for $norm(x(t))_infinity$.

=== Part 3: Autonomous Systems (35 Points)
Use phase-plane reasoning, linearization, and periodic-orbit criteria.

1. *[10 pts]* Classify the equilibrium at the origin for
  $ x' = y, quad y' = -x - 0.2y $
  using eigenvalue analysis.

2. *[15 pts]* For
  $ x' = y - x^3, quad y' = -x - y, $
  compute the Jacobian, evaluate it at the origin, and classify local behavior using linearization.

3. *[10 pts]* Apply Bendixson's criterion to
  $ x' = x + y, quad y' = -x + 2y $
  on a simply connected region and conclude whether nontrivial periodic orbits can exist.

=== Report Quality Rubric (Optional but Recommended)
- *Mathematical correctness (40%):* correct derivations and stability claims.
- *Computational verification (35%):* code reproduces analytical results.
- *Communication clarity (25%):* readable steps, labeled plots, and concise conclusions.
