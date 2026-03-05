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

#solved_problem[Classical Logistic IVP Solution][
  Solve the initial value problem
  $ x' = r x (1 - x/K), quad x(0)=x_0, $
  with $r>0$, $K>0$, and $0 < x_0 < K$.
]
#solution[
  Rewrite as
  $ x' = r x - (r/K) x^2, $
  which is separable:
  $ (K)/(x(K-x)) dif x = r dif t. $

  Using partial fractions,
  $ 1/x + 1/(K-x) $ integrates to
  $ ln |x/(K-x)| = r t + C. $
  Hence
  $ x/(K-x) = C e^(r t). $

  Solving for $x(t)$:
  $ x(t) = K/(1 + C_1 e^(-r t)). $
  From $x(0)=x_0$, $C_1 = (K-x_0)/x_0$.

  Therefore,
  $ x(t) = K/(1 + ((K-x_0)/x_0)e^(-r t)). $
]

#solved_problem[Pitchfork Bifurcation Analysis][
  Analyze equilibria and local stability of the autonomous system
  $ x' = lambda x - x^3 $
  as the parameter $lambda$ varies.
]
#solution[
  Equilibria satisfy
  $ lambda x - x^3 = x (lambda - x^2) = 0. $
  Hence:
  - $x^* = 0$ for all $lambda$
  - $x^* = +- sqrt(lambda)$ when $lambda > 0$

  Using $f(x)=lambda x - x^3$, we get
  $ f'(x)=lambda - 3x^2. $

  At $x^*=0$: $f'(0)=lambda$,
  so $x^*=0$ is stable for $lambda<0$ and unstable for $lambda>0$.

  At $x^*=+-sqrt(lambda)$ (for $lambda>0$):
  $ f'(+-sqrt(lambda)) = lambda - 3lambda = -2lambda < 0, $
  so both nonzero equilibria are asymptotically stable.

  Therefore, at $lambda=0$ the system undergoes a supercritical pitchfork bifurcation.
]

=== Supplementary Problems

#supplementary[Generalized Logistic Dynamics][
  For $x' = 0.8x(1-(x/5)^2)$, determine equilibria and classify their local stability.
]

#supplementary[Parameter-Driven Bifurcation][
  Study $x' = lambda - x^2$. Find the critical value of $lambda$ where the phase portrait changes.
]

#supplementary[Existence and Uniqueness Check][
  For $x' = t^2 + x^2$, $x(0)=1$, verify on a bounded rectangle in the $(t,x)$-plane whether standard existence and uniqueness conditions are satisfied.
]

#supplementary[Linear Equation with Variable Coefficient][
  Solve $x' - 1/t x = t^2$ for $t > 0$ using an integrating factor, and impose $x(1)=0$.
]

#supplementary[Phase-Line Analysis][
  For the autonomous equation $x' = x(x-2)(3-x)$, identify equilibria, determine their stability, and sketch the phase line.
]
