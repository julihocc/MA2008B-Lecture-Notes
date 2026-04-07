#import "../../../utils.typ": *
= Nonlinear Differential Equations

This chapter covers first-order, linear constant-coefficient, and time-dependent linear systems, forming the mathematical infrastructure for qualitative analysis of nonlinear bio-system models.

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
  We seek an explicit formula for the solution to the linear equation $x' + p(t)x = q(t)$. The core idea is to find a function $mu(t)$, called the integrating factor, such that the left-hand side of the equation becomes the derivative of a single product.
  
  Define the integrating factor as:
  $ mu(t) = exp(integral_(t_0)^t p(s) dif s). $
  Note that by the Fundamental Theorem of Calculus and the chain rule, its derivative is:
  $ mu'(t) = exp(integral_(t_0)^t p(s) dif s) partial / (partial t) (integral_(t_0)^t p(s) dif s) = mu(t) p(t). $
  
  Multiplying the original differential equation by $mu(t)$ yields:
  $ mu(t) x' + mu(t) p(t) x = mu(t) q(t). $
  Recognizing the product rule on the left-hand side:
  $ partial / (partial t) [mu(t) x(t)] = mu(t) q(t). $
  
  Integrating both sides from $t_0$ to $t$:
  $ integral_(t_0)^t partial / (partial s) [mu(s) x(s)] dif s = integral_(t_0)^t mu(s) q(s) dif s. $
  Applying the Fundamental Theorem of Calculus to the left side:
  $ mu(t) x(t) - mu(t_0) x(t_0) = integral_(t_0)^t mu(s) q(s) dif s. $
  
  By definition, $mu(t_0) = exp(0) = 1$. Let $x(t_0) = x_0$. Thus:
  $ mu(t) x(t) = x_0 + integral_(t_0)^t mu(s) q(s) dif s. $
  Finally, dividing by $mu(t)$ gives the general solution:
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
    $ x(t) arrow.r x^* $ as $t arrow.r infinity$.
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
  We analyze the behavior of the system $x' = f(x)$ near an equilibrium $x^*$ by considering a small perturbation $eta(t) = x(t) - x^*$. Differentiating gives $eta' = x' = f(x^* + eta)$. 
  Performing a Taylor expansion of $f$ around $x^*$:
  $ f(x^* + eta) = f(x^*) + f'(x^*) eta + o(eta). $
  Since $f(x^*) = 0$ for an equilibrium, the linearized dynamics are governed by $eta' approx f'(x^*) eta$.
  
  1. *Case $f'(x^*) < 0$:* 
     For small $eta > 0$ (i.e., $x > x^*$), the velocity $x' approx f'(x^*) eta$ is negative, so $x$ decreases toward $x^*$.
     For small $eta < 0$ (i.e., $x < x^*$), the velocity $x'$ is positive, so $x$ increases toward $x^*$.
     Since trajectories on both sides are pushed toward $x^*$, the equilibrium is locally asymptotically stable.
     
  2. *Case $f'(x^*) > 0$:*
     For small $eta > 0$, $x'$ is positive, and $x$ moves further away from $x^*$ toward the right.
     For small $eta < 0$, $x'$ is negative, and $x$ moves further away toward the left.
     Since trajectories depart from $x^*$ on both sides, the equilibrium is unstable.
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
  As $t arrow.r 1^-$, $x(t) arrow.r infinity$. The solution exhibits finite time blow-up at $T=1$.
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

== Constant-Coefficient Linear Systems <sec:linear_systems>

=== Mathematical Review

This section studies autonomous linear systems with constant matrix
$ x' = A x. $
The origin is always an equilibrium, and its type is determined by the eigenstructure of $A$.

#definition[Equilibrium and Critical Point][
  For $x' = A x$, an equilibrium $x^*$ satisfies
  $ A x^* = 0. $
  In this section, we classify the critical point at the origin using eigenvalues of $A$.
]

#definition[Characteristic Polynomial and Eigenvalues][
  The characteristic polynomial of $A$ is
  $ p(lambda) = det(lambda I - A). $
  Its roots are the eigenvalues of $A$, and they determine local phase portrait type.
]

#theorem[Matrix Exponential for Constant $A$][
  If $A$ is constant, then
  $ x' = A x, quad x(0)=x_0 $
  has solution
  $ x(t) = e^(A t) x_0, $
  where
  $ e^(A t) = sum_(k=0)^infinity (A t)^k / k!. $
]
#proof[
  We verify that $x(t) = e^{A t} x_0$ satisfies both the differential equation and the initial condition.
  Recall the power series definition of the matrix exponential:
  $ e^{A t} = I + A t + (A^2 t^2) / (2!) + (A^3 t^3) / (3!) + dots.c = sum_(k=0)^infinity (A^k t^k) / (k!). $
  
  Differentiating the series term-by-term with respect to $t$:
  $ partial / (partial t) e^{A t} &= partial / (partial t) [sum_(k=0)^infinity (A^k t^k) / (k!)] = sum_(k=1)^infinity (k A^k t^(k-1)) / (k!) \
  &= sum_(k=1)^infinity (A^k t^(k-1)) / ((k-1)!) = A sum_(k=1)^infinity (A^(k-1) t^(k-1)) / ((k-1)!). $
  By shifting the index $j = k-1$, we see that the sum is exactly the original series:
  $ partial / (partial t) e^{A t} = A sum_(j=0)^infinity (A^j t^j) / (j!) = A e^{A t}. $
  
  Substituting into $x(t) = e^{A t} x_0$:
  $ x'(t) = (partial / (partial t) e^{A t}) x_0 = (A e^{A t}) x_0 = A (e^{A t} x_0) = A x(t). $
  Thus, it satisfies the differential equation. 
  
  Furthermore, at $t = 0$:
  $ x(0) = e^{A \cdot 0} x_0 = I x_0 = x_0. $
  The solution is verified.
]

#theorem[Classification by Eigenvalues in $RR^2$][
  For $x' = A x$ in $RR^2$:
  - Two real negative eigenvalues: asymptotically stable node.
  - Two real positive eigenvalues: unstable node.
  - Real eigenvalues of opposite sign: saddle (unstable).
  - Complex pair $alpha plus.minus i beta$ with $beta != 0$:
    stable focus if $alpha<0$, unstable focus if $alpha>0$, center if $alpha=0$.
]
#proof[
  The stability and qualitative behavior of the origin are dictated by the explicit form of the general solution $x(t)$.
  
  1. *Real Distinct Eigenvalues ($lambda_1 != lambda_2$):*
     The general solution is $x(t) = c_1 e^(lambda_1 t) v_1 + c_2 e^(lambda_2 t) v_2$, where $v_i$ are eigenvectors.
     - If $lambda_1, lambda_2 < 0$, both terms decay to zero as $t arrow.r infinity$, resulting in an *asymptotically stable node*.
     - If $lambda_1, lambda_2 > 0$, both terms grow unboundedly, resulting in an *unstable node*.
     - If $lambda_1 > 0$ and $lambda_2 < 0$, trajectories approach the origin along the $v_2$-direction but are repelled along the $v_1$-direction, resulting in a *saddle*.
     
  2. *Complex Conjugate Eigenvalues ($lambda = alpha plus.minus i beta$):*
     Using Euler's formula, the general solution is $x(t) = e^(alpha t) [c_1 cos(beta t) + c_2 sin(beta t)] w$, where $w$ is a complex-valued vector.
     The trigonometric terms ($cos, sin$) represent rotational motion with frequency $beta$ (oscillations). The exponential term $e^(alpha t)$ acts as a scaling factor:
     - If $alpha < 0$, the scaling factor decays to zero, leading to an *asymptotically stable focus* (inward spiral).
     - If $alpha > 0$, the scaling factor grows to infinity, leading to an *unstable focus* (outward spiral).
     - If $alpha = 0$, the amplitude remains constant, resulting in closed periodic orbits called a *center*.
]

#proposition[Trace-Determinant Test in $RR^2$][
  Let $tau = tr(A)$ and $Delta = det(A)$. The discriminant is
  $ D = tau^2 - 4 Delta. $
  Then:
  - $Delta < 0$: saddle.
  - $Delta > 0$, $D > 0$: node (stable if $tau<0$, unstable if $tau>0$).
  - $Delta > 0$, $D < 0$: focus/center (stable if $tau<0$, unstable if $tau>0$, center if $tau=0$).
]
#proof[
  The characteristic polynomial for a $2 times 2$ matrix $A$ is $det(lambda I - A) = 0$. This expands to:
  $ p(lambda) = lambda^2 - (a + d)lambda + (a d - b c) = lambda^2 - tr(A)lambda + det(A) = lambda^2 - tau lambda + Delta. $
  The roots are given by the quadratic equation $lambda = (tau plus.minus sqrt(tau^2 - 4Delta)) / 2 = (tau plus.minus sqrt(D)) / 2$.
  
  1. *Saddle ($Delta < 0$):*
     Since $Delta < 0$, it follows that $D = tau^2 - 4Delta$ is strictly positive. The eigenvalues are real. Furthermore, since $lambda_1 lambda_2 = Delta < 0$, the two real eigenvalues must have opposite signs.
  
  2. *Nodes ($Delta > 0, D > 0$):*
     The roots are real and have the same sign (since $lambda_1 lambda_2 = Delta > 0$). Their sum is $lambda_1 + lambda_2 = tau$.
     - If $tau < 0$, both eigenvalues are negative (stable node).
     - If $tau > 0$, both are positive (unstable node).
     
  3. *Complex Cases ($Delta > 0, D < 0$):*
     The roots are $lambda = (tau plus.minus i sqrt(-D)) / 2$. The real part is $alpha = tau / 2$.
     - If $tau < 0$, the real part is negative (stable focus).
     - If $tau > 0$, the real part is positive (unstable focus).
     - If $tau = 0$, the real part is zero, leaving purely imaginary roots (center).
]

=== Solved Problems

#solved_problem[Stable Node Classification][
  Classify the origin for
  $ x' = A x, quad A = mat(-1, 0; 0, -3), $
  and solve the IVP with $x(0)=mat(1;2)$.
]
#solution[
  Since $A$ is diagonal,
  $ e^(A t)=mat(e^(-t),0;0,e^(-3t)). $
  Therefore,
  $ x(t)=mat(e^(-t);2e^(-3t)). $

  The eigenvalues are $lambda_1=-1$, $lambda_2=-3$, both negative and real.
  Hence the origin is an asymptotically stable node.
]

#solved_problem[Saddle Classification][
  Classify the origin for
  $ x' = A x, quad A = mat(2,0;0,-1). $
]
#solution[
  The eigenvalues are $lambda_1=2$ and $lambda_2=-1$.
  Since they have opposite signs, the origin is a saddle.

  Equivalently, with $tau = 1$ and $Delta = -2 < 0$, the trace-determinant test also gives saddle.
]

#solved_problem[Stable Focus Classification][
  Classify the origin for
  $ x' = A x, quad A = mat(-1,-4;1,-1). $
]
#solution[
  The characteristic polynomial is
  $ lambda^2 + 2lambda + 5 = 0, $
  so
  $ lambda_(1,2) = -1 plus.minus 2i. $
  Since the real part is negative, trajectories spiral toward the origin.
  The critical point is a stable focus.
]

#solved_problem[Center Classification][
  Classify the origin for
  $ x' = A x, quad A = mat(0,-2;2,0). $
]
#solution[
  The characteristic polynomial is
  $ lambda^2 + 4 = 0, $
  so eigenvalues are $plus.minus 2i$ (purely imaginary).
  Therefore the origin is a center for this linear system.
]

#solved_problem[Defective Repeated Eigenvalue][
  Consider
  $ x' = A x, quad A = mat(-2,1;0,-2). $
  Classify the origin and compute $e^(A t)$.
]
#solution[
  The characteristic polynomial is
  $ (lambda+2)^2=0, $
  so there is a repeated eigenvalue $lambda=-2$.
  Write
  $ A = -2I + N, quad N = mat(0,1;0,0), quad N^2=0. $

  Then
  $ e^(A t)=e^(-2t)e^(N t)=e^(-2t)(I+t N)
  = e^(-2t) mat(1,t;0,1). $

  Since the eigenvalue is negative, the origin is asymptotically stable.
  The phase portrait is an improper (degenerate) stable node.
]

#solved_problem[Trace-Determinant Classification][
  Classify the origin for
  $ A = mat(1,4;-1,-3) $
  using $(tau, Delta, D)$, where $tau=tr(A)$, $Delta=det(A)$, and $D=tau^2-4Delta$.
]
#solution[
  Compute
  $ tau = 1 + (-3) = -2, $
  $ Delta = 1(-3)-4(-1)=1, $
  $ D = (-2)^2 - 4(1)=0. $

  Since $Delta>0$ and $D=0$, there is a repeated real eigenvalue.
  Because $tau<0$, the origin is stable (node-type boundary case).

  Directly, $p(lambda)=lambda^2+2lambda+1=(lambda+1)^2$, confirming repeated eigenvalue $-1$.
]

=== Supplementary Problems

#supplementary[Unstable Node Classification][
  Classify the origin for
  $ A = mat(2,0;0,5). $
]

#supplementary[Focus Type from Eigenvalues][
  For eigenvalues $lambda_(1,2)=0.4 plus.minus 3i$, classify the critical point at the origin.
]

#supplementary[Matrix Exponential with Repeated Eigenvalue][
  Compute $e^(A t)$ for
  $ A = mat(-1,1;0,-1) $
  and classify the origin.
]

#supplementary[Trace-Determinant Diagram Point][
  For
  $ A = mat(-2,3;-1,0), $
  compute $(tau, Delta, D)$ and classify the origin.
]

#supplementary[Trajectory from Initial Data][
  For
  $ A = mat(-2,0;0,1), quad x(0)=mat(3;-2), $
  compute $x(t)$ and describe long-term behavior.
]

== Time-Dependent Linear Systems

=== Mathematical Review

This section generalizes the previous one from constant matrices to
$ x' = A(t) x, $
where $A(t)$ depends on time.
The main objects are the fundamental matrix and transition matrix, which provide explicit propagation formulas.

#definition[Linear Time-Dependent System][
  A linear time-dependent system is
  $ x'(t) = A(t) x(t), $
  where $A(t)$ is a continuous $n times n$ matrix-valued function.
]

#definition[Fundamental Matrix][
  A matrix $Phi(t)$ is a fundamental matrix for $x' = A(t)x$ if
  $ Phi'(t)=A(t)Phi(t) $
  and $det(Phi(t_0)) != 0$ for some $t_0$.

  Every solution can be written as $x(t)=Phi(t)c$.
]

#definition[Transition Matrix][
  The transition matrix from $s$ to $t$ is
  $ Phi(t,s)=Phi(t)Phi(s)^(-1). $
  It satisfies
  $ x(t)=Phi(t,s)x(s), quad Phi(t,t)=I. $
]

#theorem[Existence and Representation][
  If $A(t)$ is continuous on an interval, then for each initial condition
  $ x(t_0)=x_0 $
  there exists a unique solution, and it can be represented as
  $ x(t)=Phi(t,t_0)x_0. $
]

_Remark:_ While the rigorous proof relies on concepts like Picard iterations or the Peano-Baker series and is generally beyond our scope here, the representation $x(t) = Phi(t, t_0)x_0$ follows naturally by verifying that it satisfies both the initial condition and the differential equation.

#theorem[Variation of Constants][
  For the nonhomogeneous system
  $ x'(t)=A(t)x(t)+r(t), $
  a solution with $x(t_0)=x_0$ is
  $ x(t)=Phi(t,t_0)x_0 + integral_(t_0)^t Phi(t,s)r(s) dif s. $
]
#proof[
  Let the proposed solution be
  $ x(t) = Phi(t,t_0)x_0 + integral_(t_0)^t Phi(t,s)r(s) dif s. $
  We will verify this satisfies both the differential equation and the initial condition.
  
  First, differentiate $x(t)$ with respect to $t$:
  $ x'(t) = partial / (partial t) [Phi(t,t_0)x_0] + partial / (partial t) [integral_(t_0)^t Phi(t,s)r(s) dif s]. $
  Using the fundamental property of the transition matrix, $(partial Phi(t,s))/(partial t) = A(t)Phi(t,s)$, the first term becomes $A(t)Phi(t,t_0)x_0$. 
  
  For the second term, we apply the Leibniz integral rule (differentiation under the integral sign):
  $ partial / (partial t) [integral_(t_0)^t Phi(t,s)r(s) dif s] &= Phi(t,t)r(t) + integral_(t_0)^t (partial Phi(t,s))/(partial t) r(s) dif s \
  &= I r(t) + integral_(t_0)^t A(t)Phi(t,s)r(s) dif s \
  &= r(t) + A(t) integral_(t_0)^t Phi(t,s)r(s) dif s. $
  
  Substituting these components back into the expression for $x'(t)$, we obtain:
  $ x'(t) &= A(t)Phi(t,t_0)x_0 + r(t) + A(t) integral_(t_0)^t Phi(t,s)r(s) dif s \
  &= A(t) underbrace((Phi(t,t_0)x_0 + integral_(t_0)^t Phi(t,s)r(s) dif s), = x(t)) + r(t) \
  &= A(t)x(t) + r(t). $
  Thus, the nonhomogeneous differential equation holds.
  
  Finally, evaluating the solution at the initial time $t = t_0$:
  $ x(t_0) = Phi(t_0,t_0)x_0 + integral_(t_0)^(t_0) Phi(t_0,s)r(s) dif s = I x_0 + 0 = x_0. $
  Therefore, the initial condition is satisfied.
]

#definition[Vector and Induced Matrix Norms][
  A vector norm $norm(x)$ measures the "size" of a vector $x in RR^n$. Common norms include:
  - *1-norm* (Sum of magnitudes): $norm(x)_1 = sum_(i=1)^n |x_i|$
  - *2-norm* (Euclidean norm): $norm(x)_2 = sqrt(sum_(i=1)^n x_i^2)$
  - *$infinity$-norm* (Maximum magnitude): $norm(x)_infinity = max_(i) |x_i|$

  Any vector norm induces a corresponding *matrix norm* on an $n times n$ matrix $A$, defined as the maximum possible stretching of a vector:
  $ norm(A) = max_(x != 0) (norm(A x)) / (norm(x)). $
]

#proposition[Induced Matrix Norm Property][
  By definition, an induced matrix norm always satisfies the condition
  $ norm(A x) <= norm(A) norm(x). $
]
#proof[
  We consider two cases for the vector $x in RR^n$:
  1. If $x = 0$, then $A x = 0$. Using the properties of norms, we have $norm(A x) = 0$ and $norm(A)norm(x) = norm(A) \cdot 0 = 0$. Thus, $0 <= 0$ holds.
  2. If $x != 0$, we look at the definition of the induced matrix norm:
     $ norm(A) = sup_(y != 0) (norm(A y)) / (norm(y)). $
     Since the supremum is the least upper bound, for any specific $x != 0$ in the domain, it must be true that:
     $ (norm(A x)) / (norm(x)) <= norm(A). $
     Multiplying both sides of the inequality by the non-negative scalar $norm(x)$ yields:
     $ norm(A x) <= norm(A) norm(x). $
  In both cases, the inequality is satisfied.
]

#theorem[Grönwall's Inequality][
  Let $u(t)$ and $v(t)$ be non-negative continuous functions on $[t_0, t_1]$. If a constant $C >= 0$ satisfies
  $ u(t) <= C + integral_(t_0)^t v(s)u(s) dif s $
  for all $t in [t_0, t_1]$, then
  $ u(t) <= C exp(integral_(t_0)^t v(s) dif s). $
]
#proof[
  Define an auxiliary function $R(t)$ as the right-hand side of the integral inequality:
  $ R(t) = C + integral_(t_0)^t v(s) u(s) dif s. $
  By construction, $u(t) <= R(t)$ for all $t$. We differentiate $R(t)$ with respect to $t$ using the Fundamental Theorem of Calculus:
  $ R'(t) = v(t) u(t). $
  Using the assumption $u(t) <= R(t)$ and the fact that $v(t) >= 0$, we have:
  $ R'(t) <= v(t) R(t). $
  
  To solve this differential inequality, we assume $C > 0$ (if $C=0$, we can consider $C + epsilon$ and let $epsilon -> 0$ at the end). Rearranging gives:
  $ (R'(t)) / (R(t)) <= v(t). $
  Integrating both sides from $t_0$ to $t$:
  $ integral_(t_0)^t (R'(s)) / (R(s)) dif s <= integral_(t_0)^t v(s) dif s \
  ln(R(t)) - ln(R(t_0)) <= integral_(t_0)^t v(s) dif s. $
  
  Since $R(t_0) = C$, we have $ln(R(t)) <= ln(C) + integral_(t_0)^t v(s) dif s$. Exponentiating both sides:
  $ R(t) <= C exp(integral_(t_0)^t v(s) dif s). $
  Finally, since $u(t) <= R(t)$, we conclude:
  $ u(t) <= C exp(integral_(t_0)^t v(s) dif s). $
]

#proposition[Norm-Based Growth Bound][
  If
  $ norm(A(t)) <= M $ on $[t_0,t]$, then every solution of
  $ x' = A(t)x $
  satisfies
  $ norm(x(t)) <= e^(M(t-t_0)) norm(x_0), $
  where $norm(dots.c)$ denotes any vector norm and its corresponding induced matrix norm.
]
#proof[
  First, we convert the differential equation $x' = A(t)x$ into its equivalent integral form by integrating from $t_0$ to $t$:
  $ x(t) = x(t_0) + integral_(t_0)^t A(s)x(s) dif s. $
  Taking the norm of both sides and applying the triangle inequality for integrals:
  $ norm(x(t)) <= norm(x(t_0)) + norm(integral_(t_0)^t A(s)x(s) dif s) <= norm(x_0) + integral_(t_0)^t norm(A(s)x(s)) dif s. $
  
  Using the property of induced matrix norms ($norm(A x) <= norm(A) norm(x)$):
  $ norm(x(t)) <= norm(x_0) + integral_(t_0)^t norm(A(s)) norm(x(s)) dif s. $
  By the given assumption that $norm(A(s)) <= M$ for all $s \in [t\_0, t]$, we substitute the bound:
  $ norm(x(t)) <= norm(x_0) + integral_(t_0)^t M norm(x(s)) dif s. $
  
  This matches the form required for Grönwall's Inequality, with $u(t) = norm(x(t))$, $C = norm(x_0)$, and $v(s) = M$. Applying the inequality:
  $ norm(x(t)) <= norm(x_0) exp(integral_(t_0)^t M dif s) = norm(x_0) e^(M(t-t_0)). $
]

=== Solved Problems

#solved_problem[Fundamental Matrix for a Diagonal $A(t)$][
  Solve
  $ x' = A(t)x, quad A(t)=mat(t,0;0,-2), $
  and construct a fundamental matrix.
]
#solution[
  The system is decoupled:
  $ x'_1 = t x_1, quad x'_2 = -2 x_2. $
  Hence
  $ x_1(t)=c_1 e^(t^2/2), quad x_2(t)=c_2 e^(-2t). $

  A fundamental matrix is
  $ Phi(t)=mat(e^(t^2/2),0;0,e^(-2t)). $
  Since
  $ det(Phi(t))=e^(t^2/2-2t) != 0, $
  it is invertible for all $t$.
]

#solved_problem[Transition Matrix and IVP Solution][
  For the system above, solve the IVP
  $ x(0)=mat(2;-1) $
  using the transition matrix.
]
#solution[
  From the first solved problem,
  $ Phi(t)=mat(e^(t^2/2),0;0,e^(-2t)), quad Phi(0)=I. $
  Thus
  $ Phi(t,0)=Phi(t)Phi(0)^(-1)=Phi(t). $

  Therefore,
  $ x(t)=Phi(t,0)x(0)=mat(2e^(t^2/2);-e^(-2t)). $
]

#solved_problem[Variation of Constants with Input][
  Solve
  $ x' = A(t)x + r(t), $
  where
  $ A(t)=mat(0,0;0,-1), quad r(t)=mat(1;e^(-t)), quad x(0)=mat(0;0). $
]
#solution[
  A fundamental matrix for the homogeneous part is
  $ Phi(t)=mat(1,0;0,e^(-t)), quad Phi(t,s)=mat(1,0;0,e^(-(t-s))). $

  With $x(0)=0$,
  $ x(t)=integral_0^t Phi(t,s)r(s) dif s. $
  Hence
  $ x_1(t)=integral_0^t 1 dif s = t, $
  $ x_2(t)=integral_0^t e^(-(t-s))e^(-s) dif s = t e^(-t). $

  Therefore,
  $ x(t)=mat(t; t e^(-t)). $
]

#solved_problem[Norm Bound with Bounded $A(t)$][
  Suppose
  $ norm(A(t))_infinity <= 2 $ on $[0,t]$ and $norm(x(0))_infinity = 3$.
  Derive a bound for $norm(x(t))_infinity$.
]
#solution[
  By the growth bound,
  $ norm(x(t))_infinity <= e^(integral_0^t norm(A(s))_infinity dif s) norm(x(0))_infinity. $
  Since $norm(A(s))_infinity <= 2$,
  $ integral_0^t norm(A(s))_infinity dif s <= 2t. $
  Therefore,
  $ norm(x(t))_infinity <= 3 e^(2t). $
]

#solved_problem[Transition from a Nonzero Initial Time][
  Let
  $ A(t)=mat(1/t,0;0,-1), quad t>0. $
  Compute $Phi(t,1)$ and solve the IVP $x(1)=mat(3;2)$.
]
#solution[
  The equations are decoupled:
  $ x'_1=(1/t)x_1, quad x'_2=-x_2. $
  A convenient fundamental matrix is
  $ Phi(t)=mat(t,0;0,e^(-t)). $

  Then
  $ Phi(t,1)=Phi(t)Phi(1)^(-1)=mat(t,0;0,e^(1-t)). $
  Therefore
  $ x(t)=Phi(t,1)x(1)=mat(3t;2e^(1-t)). $
]

=== Supplementary Problems

#supplementary[Fundamental Matrix Computation][
  For
  $ A(t)=mat(2t,0;0,-3), $
  compute a fundamental matrix and verify invertibility.
]

#supplementary[Transition Matrix Practice][
  For
  $ A(t)=mat(0,0;0,t), $
  construct $Phi(t,s)$ explicitly.
]

#supplementary[IVP with Time-Dependent Coefficients][
  Solve
  $ x' = A(t)x, quad A(t)=mat(1,0;0,-t), quad x(0)=mat(1;1). $
]

#supplementary[Variation of Constants Drill][
  Solve
  $ x' = A(t)x + r(t), $
  with
  $ A(t)=mat(0,0;0,-2), quad r(t)=mat(e^t;1), quad x(0)=0. $
]

#supplementary[Norm Bound Application][
  Assume
  $ norm(A(t))_2 <= 0.6 $ on $[0,t]$ and $norm(x(0))_2=4$.
  Derive an explicit upper bound for $norm(x(t))_2$.
]

