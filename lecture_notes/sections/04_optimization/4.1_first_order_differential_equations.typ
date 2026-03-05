#import "../../../utils.typ": *
== First-Order Differential Equations

=== Mathematical Review

This section covers Chapter 1 topics: basic results, first-order linear equations, autonomous equations, generalized logistic equation, and bifurcation.

#definition[Initial Value Problem (IVP)][
  A first-order IVP has the form
  $ x'(t) = f(t, x(t)), quad x(t_0) = x_0. $
  Under standard continuity and Lipschitz conditions, the IVP has a unique local solution.
]

#theorem[First-Order Linear Equation][
  For
  $ x' + p(t)x = q(t), $
  the integrating-factor method gives
  $ x(t) = 1/mu(t) (x_0 + integral_(t_0)^t mu(s) q(s) dif s), $
  where $ mu(t) = e^(integral_(t_0)^t p(s) dif s) $.
]
#proof[
  Consider the linear equation
  $ x' + p(t)x = q(t). $
  Let the integrating factor be
  $ mu(t) = e^(integral_(t_0)^t p(s) dif s), $
  so that $mu'(t) = p(t) mu(t)$.

  Multiply the differential equation by $mu(t)$:
  $ mu(t) x' + mu(t) p(t) x = mu(t) q(t). $
  Using $mu' = p mu$, the left-hand side is
  $ (mu(t) x(t))' = mu(t) q(t). $

  Integrating from $t_0$ to $t$ gives
  $ mu(t) x(t) - mu(t_0) x(t_0) = integral_(t_0)^t mu(s) q(s) dif s. $
  Since $mu(t_0)=1$ and $x(t_0)=x_0$,
  $ mu(t) x(t) = x_0 + integral_(t_0)^t mu(s) q(s) dif s. $

  Therefore,
  $ x(t) = 1/mu(t) (x_0 + integral_(t_0)^t mu(s) q(s) dif s). $
]

#definition[Autonomous Equation][
  An equation is autonomous if it can be written as
  $ x' = f(x). $
  Equilibrium points satisfy $f(x^*) = 0$ and are analyzed using phase-line methods.
]

#definition[Bifurcation (1D Autonomous)][
  A bifurcation occurs when a small change in parameter $lambda$ changes the number or stability of equilibria in
  $ x' = f(x, lambda). $
]

=== Solved Problems

#solved_problem[Generalized Logistic Equation Form][
  Write a generalized logistic differential equation and identify its parameters.
]
#solution[
  A generalized logistic model can be written as
  $ x' = r x (1 - (x/K)^nu), $
  where $r$ is the growth rate, $K$ is the carrying capacity, and $nu > 0$ is a shape parameter.
]

#solved_problem[Chapter 1 Coverage Checklist][
  List the Chapter 1 topics included in this section.
]
#solution[
  - 1.1 Basic Results
  - 1.2 First-Order Linear Equations
  - 1.3 Autonomous Equations
  - 1.4 Generalized Logistic Equation
  - 1.5 Bifurcation
  - 1.6 Exercises
]

#solved_problem[Linear IVP with Integrating Factor][
  Solve $x' + 2x = 4$, with $x(0)=1$.
]
#solution[
  Integrating factor: $mu(t)=e^(2t)$.
  Then
  $ (e^(2t)x)' = 4e^(2t) $. Integrating:
  $ e^(2t)x = 2 e^(2t) + C => x(t)=2 + C e^(-2t) $.
  From $x(0)=1$, $C=-1$. Therefore
  $ x(t)=2-e^(-2t). $
]

#solved_problem[Equilibria and Stability][
  Analyze equilibria of $x' = x(1-x)$.
]
#solution[
  Equilibria satisfy $x(1-x)=0$, so $x^*=0,1$.
  Since $f'(x)=1-2x$:
  - $f'(0)=1>0$ (unstable)
  - $f'(1)=-1<0$ (asymptotically stable)
]

=== Supplementary Problems

#supplementary[Generalized Logistic Dynamics][
  For $x' = 0.8x(1-(x/5)^2)$, determine equilibria and classify their local stability.
]

#supplementary[Parameter-Driven Bifurcation][
  Study $x' = lambda - x^2$. Find the critical value of $lambda$ where the phase portrait changes.
]
