#import "../../../utils.typ": *
== First-Order Differential Equations

=== Mathematical Review

This section covers Chapter 1 topics: basic results, first-order linear equations, autonomous equations, generalized logistic equation, and bifurcation.

#definition[Initial Value Problem (IVP)][
  A first-order IVP has the form
  $ x'(t) = f(t, x(t)), quad x(t_0) = x_0. $
  Existence and uniqueness are separate questions and use different assumptions.
]

#definition[Lipschitz Continuity in $x$][
  Let $D$ be a domain in the $(t,x)$-plane, and let $f$ map $D$ into the real numbers.
  We say that $f$ is Lipschitz continuous with respect to $x$ on $D$ if there exists a constant $L>0$ such that
  $ |f(t,x_1)-f(t,x_2)| <= L |x_1-x_2| $
  for all $(t,x_1),(t,x_2) in D$ with the same $t$.

  Any such constant $L$ is called a Lipschitz constant (in $x$) for $f$ on $D$.

  - Local Lipschitz in $x$: for each $(t_0,x_0)$ in the domain, there exists a neighborhood $U$ of $(t_0,x_0)$ and $L_U>0$ such that the inequality holds on $U$.
  - Global Lipschitz in $x$: there exists a single constant $L>0$ such that the inequality holds on the entire domain.
]

#theorem[Local Existence and Uniqueness for First-Order IVPs][
  Consider the IVP
  $ x' = f(t,x), quad x(t_0)=x_0. $

  - Existence: if $f$ is continuous in a neighborhood of $(t_0,x_0)$, then the IVP admits at least one local solution.
  - Uniqueness: if, in addition, $f$ is locally Lipschitz in $x$ (uniformly in $t$ on a small rectangle), then the local solution is unique.

  In particular, local Lipschitz continuity in $x$ is sufficient for IVP uniqueness.
]

The uniqueness condition is the stronger one. A common practical sufficient condition is:
if $(partial f)/(partial x)$ exists and is continuous (or just bounded) on a neighborhood of $(t_0,x_0)$, then $f$ is locally Lipschitz in $x$, hence the IVP is locally well-posed (existence + uniqueness).

In practice, the local hypotheses can be organized as the following implication chain near $(t_0,x_0)$:
- continuity of $f$ implies local existence;
- local Lipschitz continuity of $f$ in $x$ implies local uniqueness;
- existence of $(partial f)/(partial x)$ with continuity (or boundedness) implies local Lipschitz continuity in $x$.

Hence, continuity of $(partial f)/(partial x)$ (or its local boundedness) is a convenient sufficient condition for local well-posedness (existence and uniqueness).

#definition[Finite time blow-up][
  Even when solutions exist and are unique locally, they may not exist for all time. If a solution $x(t)$ rapidly goes to infinity as $t$ approaches some finite time $T$, we say the solution exhibits finite time blow-up.
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

#definition[Phase-Line Method (1D Autonomous Systems)][
  For
  $ x' = f(x), $
  the phase line is built by:
  - finding equilibria from $f(x)=0$,
  - splitting the real line into intervals between equilibria,
  - assigning the sign of $f(x)$ on each interval.

  If $f(x)>0$, arrows point to the right ($x$ increases).
  If $f(x)<0$, arrows point to the left ($x$ decreases).
  An equilibrium is asymptotically stable when arrows on both sides point toward it.
]

#definition[Stability Notions for Equilibria][
  Let $x^*$ be an equilibrium of $x' = f(x)$.

  - Stable (Lyapunov stable): solutions that start sufficiently close to $x^*$ remain close to $x^*$ for all future time.
  - Unstable: $x^*$ is not stable; arbitrarily small perturbations can move away from $x^*$.
  - Locally asymptotically stable: $x^*$ is stable and, in addition, nearby solutions satisfy
    $ x(t) -> x^* $ as $t -> infinity$.
]

#definition[Hyperbolic Equilibrium (1D)][
  An equilibrium $x^*$ of $x' = f(x)$ is called hyperbolic if $f'(x^*) != 0$. At a hyperbolic equilibrium, the first-derivative test is conclusive for determining local stability.
]

#theorem[Derivative Test for Equilibrium Stability (1D)][
  For $x' = f(x)$ and an equilibrium $x^*$ with $f(x^*)=0$:
  - if $f'(x^*) < 0$, then $x^*$ is locally asymptotically stable;
  - if $f'(x^*) > 0$, then $x^*$ is unstable.
]

#proof[
  Near $x^*$, first-order expansion gives
  $ f(x) = f(x^*) + f'(x^*)(x-x^*) + o(x-x^*) = f'(x^*)(x-x^*) + o(x-x^*). $

  If $f'(x^*)<0$, then for $x>x^*$ (small distance) we get $f(x)<0$ (arrow left),
  and for $x<x^*$ we get $f(x)>0$ (arrow right).
  Both directions point toward $x^*$, so trajectories approach the equilibrium.

  If $f'(x^*)>0$, the signs reverse: right side arrows point right and left side arrows point left,
  so trajectories move away from $x^*$.
]

#theorem[Classification by Sign of $f'_(lambda)(x^*(lambda))$ Along Equilibrium Branches][
  Consider
  $ x' = f_(lambda)(x) $
  and an equilibrium branch $x = x^*(lambda)$ satisfying
  $ f_(lambda)(x^*(lambda))=0. $
  Define
  $ a(lambda) = f'_(lambda)(x^*(lambda)). $

  For each fixed $lambda$:
  - if $a(lambda)<0$, the branch is locally asymptotically stable;
  - if $a(lambda)>0$, the branch is unstable.

  A change of sign of $a(lambda)$ indicates a stability switch on that branch.
]

When
$ f'_(lambda)(x^*)=0, $
the equilibrium is nonhyperbolic and the first-derivative test is inconclusive.
In this case, stability must be determined through phase-line sign analysis or higher-order terms, which is typical at bifurcation values.

#definition[Stability Change in Bifurcation][
  In
  $ x' = f_(lambda)(x), $
  a bifurcation is detected by tracking equilibrium branches $x^*(lambda)$ and their local stability through the sign of
  $ f'_(lambda)(x^*(lambda)). $
]

#definition[Bifurcation (1D Autonomous)][
  A bifurcation occurs when a small change in parameter $lambda$ changes the number or stability of equilibria in
  $ x' = f_(lambda)(x). $
]

=== Solved Problems

#solved_problem[Finite time blow-up][
  Solve $x' = x^2$ with $x(0) = 1$. Does the solution exist for all $t > 0$?
]
#solution[
  The equation separates as $x^(-2) dif x = dif t$.
  Integrating gives $-x^(-1) = t + C$.
  Applying $x(0)=1$, we find $-1 = C$, so
  $ -1/x = t - 1 => x(t) = 1/(1-t). $
  As $t -> 1^-$, $x(t) -> infinity$. The solution exhibits finite time blow-up at $T=1$.
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
  Since $f'(x)=1-2x$, the derivative test gives:
  - $f'(0)=1>0$, so $x^*=0$ is unstable,
  - $f'(1)=-1<0$, so $x^*=1$ is locally asymptotically stable.
]

#solved_problem[Phase-Line Construction][
  Construct the phase line for
  $ x' = x(x-2)(3-x), $
  and classify each equilibrium.
]
#solution[
  Equilibria are obtained from
  $ x(x-2)(3-x)=0, $
  so
  $ x^* = 0, 2, 3. $

  Sign test on intervals:
  - If $x<0$, then $x<0$, $x-2<0$, $3-x>0$, so $f(x)>0$ (arrow right).
  - If $0<x<2$, then $x>0$, $x-2<0$, $3-x>0$, so $f(x)<0$ (arrow left).
  - If $2<x<3$, then $x>0$, $x-2>0$, $3-x>0$, so $f(x)>0$ (arrow right).
  - If $x>3$, then $x>0$, $x-2>0$, $3-x<0$, so $f(x)<0$ (arrow left).

  Therefore:
  - At $x=0$, arrows point toward the equilibrium from both sides: asymptotically stable.
  - At $x=2$, arrows point away on both sides: unstable.
  - At $x=3$, arrows point toward the equilibrium from both sides: asymptotically stable.
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

#solved_problem[Saddle-Node Bifurcation and Stability][
  Analyze the equilibria and their stability for
  $ x' = lambda - x^2 $
  as $lambda$ varies.
]
#solution[
  Equilibria satisfy
  $ lambda - x^2 = 0, $
  so:
  - if $lambda < 0$: no real equilibrium;
  - if $lambda = 0$: one equilibrium at $x^*=0$;
  - if $lambda > 0$: two equilibria $x^*=plus.minus sqrt(lambda)$.

  Using $f_(lambda)(x)=lambda-x^2$, we have
  $ f'_(lambda)(x) = -2x. $

  For $lambda>0$, evaluate on each branch $x^*(lambda)$:
  - at $x^*=sqrt(lambda)$,
    $ f'_(lambda)(sqrt(lambda))=-2sqrt(lambda)<0, $
    so this branch is locally asymptotically stable;
  - at $x^*=-sqrt(lambda)$,
    $ f'_(lambda)(-sqrt(lambda))=2sqrt(lambda)>0, $
    so this branch is unstable.

  At $lambda=0$, $f'_(0)(0)=0$, so the derivative test is inconclusive; phase-line inspection shows a semistable equilibrium.

  Therefore the critical value is $lambda=0$, where a saddle-node bifurcation occurs.
]

#solved_problem[Transcritical Bifurcation][
  Analyze the equilibria and stability for $x' = lambda x - x^2$.
]
#solution[
  Equilibria satisfy $x(lambda - x) = 0$, so the branches are $x^*=0$ and $x^*=lambda$.
  Since $f'_(lambda)(x) = lambda - 2x$:
  - On the branch $x^*=0$: $f'_(lambda)(0) = lambda$. It is stable for $lambda < 0$ and unstable for $lambda > 0$.
  - On the branch $x^*=lambda$: $f'_(lambda)(lambda) = -lambda$. It is unstable for $lambda < 0$ and stable for $lambda > 0$.

  At $lambda=0$, the two branches intersect and the derivative $f'_0(0)=0$ is inconclusive. The branches exchange stability at the bifurcation point, typical of a transcritical bifurcation.
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
  - $x^* = plus.minus sqrt(lambda)$ when $lambda > 0$

  Using $f_(lambda)(x)=lambda x - x^3$, we get
  $ f'_(lambda)(x)=lambda - 3x^2. $

  For the branch $x^*=0$:
  $ f'_(lambda)(0)=lambda. $
  Hence $x^*=0$ is locally asymptotically stable for $lambda<0$ and unstable for $lambda>0$.

  For $lambda>0$, at $x^*=plus.minus sqrt(lambda)$:
  $ f'_(lambda)(plus.minus sqrt(lambda)) = lambda - 3lambda = -2lambda < 0, $
  so both nonzero branches are locally asymptotically stable.

  At $lambda=0$, $f'_(0)(0)=0$, so the first-derivative test is inconclusive at the bifurcation point.

  Therefore, at $lambda=0$ the system undergoes a supercritical pitchfork bifurcation.
]

=== Supplementary Problems

#supplementary[Generalized Logistic Dynamics][
  For $x' = 0.8x(1-(x/5)^2)$, determine equilibria and classify their local stability.
]

#supplementary[Existence vs Uniqueness Conditions][
  For $x' = t^2 + x^2$, $x(0)=1$, identify a rectangle around $(0,1)$ where $f(t,x)$ is continuous and where $(partial f)/(partial x)$ is bounded, then state what each condition implies (existence and uniqueness).
]

#supplementary[When Continuity Does Not Guarantee Uniqueness][
  Analyze $x' = sqrt(abs(x))$, $x(0)=0$. Check continuity and discuss why uniqueness fails at the initial point.
]

#supplementary[Parameter-Driven Bifurcation][
  Study $x' = lambda x - x^2$. Write the family as $x' = f_(lambda)(x)$, find equilibrium branches $x^*(lambda)$, and classify stability using the sign of $f'_(lambda)(x^*(lambda))$.
]

#supplementary[Phase-Line Analysis][
  For the autonomous equation $x' = x(x-1)(x-4)$, identify equilibria, determine their stability, and sketch the phase line.
]
