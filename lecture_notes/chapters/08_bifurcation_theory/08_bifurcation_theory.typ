#import "../../../utils.typ": *
= Bifurcation Theory

This chapter introduces parametric bifurcations -- saddle-node, Hopf -- explaining mathematically how the destruction of the physiological stable point constitutes the "Pathway to Diabetes."

*Learning objectives:*
- Identify Hopf and saddle-node bifurcation conditions from local linearization data.
- Interpret bifurcation diagrams in terms of physiological regime changes.
- Connect oscillation onset and loss of homeostasis to parameter variation.
- Use continuation and fold conditions to describe irreversible transitions.

== Hopf Bifurcation in Biological Oscillators

=== Mathematical Review

#definition[Parameterized System and Equilibrium Branch][
  Let $f : RR^n times RR -> RR^n$ be a sufficiently smooth map. The *parameterized autonomous system* is
  $ dot(x) = f(x, mu), quad x in RR^n, quad mu in RR. $
  A *smooth equilibrium branch* is a curve $(x^*(mu), mu)$ satisfying $f(x^*(mu), mu) = 0$ for all $mu$ in an open interval. The *Jacobian along the branch* is $A(mu) := D_x f(x^*(mu), mu) in RR^(n times n)$.
]

#example[
  Consider the planar system
  $ x' = mu - x^2, quad y' = -y. $
  Start by finding the equilibria. The second equation gives
  $ y' = -y = 0 quad => quad y^* = 0. $
  Substituting this into the first equation yields
  $ x' = mu - x^2 = 0 quad => quad x^2 = mu. $

  Therefore:
  - if $mu < 0$, there is no real equilibrium;
  - if $mu = 0$, there is one equilibrium at $x^* = 0$;
  - if $mu > 0$, there are two equilibria
    $ x^* = plus.minus sqrt(mu). $

  So for $mu > 0$ the equilibrium set is
  $ (x^*, y^*) = (plus.minus sqrt(mu), 0). $

  The Jacobian matrix is
  $ A(x,y; mu) = mat(-2x, 0; 0, -1). $
  Evaluating along the equilibrium branches gives
  $ A(mu) = mat(-2x^*, 0; 0, -1). $

  On the upper branch $x^* = sqrt(mu)$, the eigenvalues are
  $ lambda_1 = -2 sqrt(mu), quad lambda_2 = -1, $
  so both are negative and this branch is stable.

  On the lower branch $x^* = -sqrt(mu)$, the eigenvalues are
  $ lambda_1 = 2 sqrt(mu), quad lambda_2 = -1, $
  so one is positive and one is negative, making that branch unstable.

  As $mu$ approaches $0$ from above, the two equilibrium branches move toward each other and meet at the non-hyperbolic point $(0,0)$, where the Jacobian becomes singular.
]

#definition[Limit Cycle][
  Let $dot(x) = f(x)$, $x in RR^n$, be an autonomous system with $f$ of class $C^1$. A *limit cycle* is an isolated periodic orbit: a closed trajectory $Gamma$ such that no other closed orbit lies in a sufficiently small tubular neighborhood of $Gamma$.

  More precisely, $Gamma$ is *stable* (or *attracting*) if there exists a neighborhood $U$ of $Gamma$ such that every trajectory starting in $U$ satisfies $"dist"(phi_t(x_0), Gamma) -> 0$ as $t -> +oo$. It is *unstable* (or *repelling*) if the same holds as $t -> -oo$. A limit cycle that is attracting from one side and repelling from the other is called *semi-stable*.

  A limit cycle is *structurally stable*: it persists, up to continuous orbit-preserving conjugacy, under any sufficiently small $C^1$ perturbation of $f$. This contrasts with the center of a Hamiltonian system, which is surrounded by a one-parameter family of closed orbits and is destroyed by generic perturbations.
]

#example[
  In the Van der Pol oscillator $x'' + (x^2 - mu) x' + x = 0$ (equivalently $x' = y$, $y' = -x - (x^2 - mu) y$), take $mu > 0$. The origin is no longer the only long-term observable structure: nearby trajectories are repelled from the equilibrium but are trapped by nonlinear damping farther away, so they approach a closed periodic orbit.

  The important point is that this closed orbit is *isolated*. There is one distinguished cycle that attracts nearby trajectories, rather than a whole continuum of closed curves. That isolated nature is what makes it a limit cycle rather than a center.

  Now compare this with the conservative oscillator $x'' + x = 0$. In that system every initial condition with fixed energy lies on its own closed orbit, so there is a whole one-parameter family of periodic trajectories. Because these orbits are not isolated, even a small perturbation to the vector field typically destroys the family.

  By contrast, if we perturb the Van der Pol system slightly, for example by adding a small forcing term such as $+ 0.01 sin(t)$, the attracting oscillatory behavior persists as a slightly deformed nearby cycle. So the qualitative behavior survives the perturbation.

  That is the practical meaning of structural stability here: the oscillation is not an artifact of exact algebraic symmetry, but a robust dynamical feature of the system.
]

#definition[Hopf Bifurcation Point][
  A point $(x^*(mu_c), mu_c)$ on an equilibrium branch is a *Hopf bifurcation point* if:
  + $A(mu_c)$ has a *simple pair* of purely imaginary eigenvalues $lambda_(1,2)(mu_c) = plus.minus i omega_0$ with $omega_0 > 0$.
  + All remaining eigenvalues of $A(mu_c)$ have *nonzero* real part.
  Condition (1) makes the critical center manifold exactly two-dimensional; Condition (2) rules out additional zero or imaginary eigenvalues that would require a higher-codimension analysis.
]

#example[
  Consider the planar system
  $ x' = -y + x(mu - x^2 - y^2), quad y' = x + y(mu - x^2 - y^2). $
  First verify that the origin is an equilibrium:
  $ x'(0,0) = 0, quad y'(0,0) = 0. $
  So $(x^*, y^*) = (0,0)$ for every value of $mu$.

  To study its type, compute the Jacobian matrix. Writing
  $ f(x,y) = -y + x(mu - x^2 - y^2), $
  $ g(x,y) = x + y(mu - x^2 - y^2), $
  we obtain
  $ f_x = mu - 3 x^2 - y^2, quad f_y = -1 - 2 x y, $
  $ g_x = 1 - 2 x y, quad g_y = mu - x^2 - 3 y^2. $

  Evaluating at the origin gives
  $ J(0,0; mu) = mat(mu, -1; 1, mu). $
  The characteristic polynomial is
  $ det(lambda I - J) = (lambda - mu)^2 + 1, $
  so the eigenvalues are
  $ lambda_(1,2) = mu plus.minus i. $

  At the critical value $mu = 0$, the eigenvalues are
  $ lambda_(1,2) = plus.minus i, $
  a simple pair of purely imaginary eigenvalues.

  The sign of $mu$ determines the stability:
  - if $mu < 0$, the real part is negative, so the origin is a stable spiral;
  - if $mu > 0$, the real part is positive, so the origin is an unstable spiral.

  Thus the equilibrium changes stability exactly when $mu$ crosses $0$, which is the local signature of a Hopf bifurcation at
  $ mu_c = 0. $
]

#definition[First Lyapunov Coefficient][
  For a sufficiently smooth planar system $dot(x) = f(x, y; mu)$, $dot(y) = g(x, y; mu)$ at an equilibrium with eigenvalues $plus.minus i omega_0$, write all partial derivatives at the equilibrium with subscript notation ($f_(x x) := partial^2 f / partial x^2$, etc.). The *first Lyapunov coefficient* is
  $ ell_1 = 1/16 [f_(x x x) + f_(x y y) + g_(x x y) + g_(y y y)] $
  $ + 1/(16 omega_0) [f_(x y)(f_(x x) + f_(y y)) - g_(x y)(g_(x x) + g_(y y)) - f_(x x) g_(x x) + f_(y y) g_(y y)]. $
]

#example[
  Consider the system at a critical Hopf point:
  $ x' = -y - x^3 - x y^2, quad y' = x - x^2 y - y^3. $
  The origin is an equilibrium with Jacobian $J = mat(0, -1; 1, 0)$, giving eigenvalues $plus.minus i$ and critical frequency $omega_0 = 1$.
  
  Let's compute the first Lyapunov coefficient. The right-hand sides are $f(x,y) = -y - x^3 - x y^2$ and $g(x,y) = x - x^2 y - y^3$.
  Because there are no quadratic terms, all second partial derivatives evaluated at $(0,0)$ are zero. Thus, the entire second bracket in the $ell_1$ formula vanishes.
  
  For the third derivatives at $(0,0)$, we have:
  $ f_(x x x) = -6, quad f_(x y y) = -2, quad g_(x x y) = -2, quad g_(y y y) = -6. $
  
  Plugging these into the formula yields:
  $ ell_1 = 1/16 [-6 - 2 - 2 - 6] = -16/16 = -1. $
  
  Since $ell_1 < 0$, any emerging limit cycle will be stable (attracting).
]

#theorem[Poincare-Andronov-Hopf][
  Suppose $dot(x) = f(x, mu)$ is sufficiently smooth and $(x^*(mu_c), mu_c)$ is a Hopf bifurcation point. Assume in addition:
  - *(Transversality)* The eigenvalues $lambda(mu) = alpha(mu) plus.minus i omega(mu)$ near $mu_c$ satisfy $alpha'(mu_c) != 0$, i.e. the real part crosses zero with nonzero speed.
  - *(Non-degeneracy)* The *first Lyapunov coefficient* $ell_1(mu_c) != 0$.
  Then a unique family of periodic orbits bifurcates from $(x^*(mu_c), mu_c)$:
  - $ell_1 < 0$ *(supercritical)*: a family of *stable* limit cycles exists on the side where $alpha > 0$; the equilibrium loses stability smoothly and the transition is reversible.
  - $ell_1 > 0$ *(subcritical)*: a family of *unstable* limit cycles precedes the stability loss; crossing $mu_c$ produces a catastrophic *hard* transition to a distant attractor.
  In both cases the period of the bifurcating orbit satisfies $T(mu) -> 2pi / omega_0$ as $mu -> mu_c$.
]

#example[
  The Van der Pol oscillator $x'' + (x^2 - mu) x' + x = 0$ can be written as
  $ x' = y, quad y' = -x - (x^2 - mu) y. $
  The first step is to locate the equilibrium. Setting $x' = 0$ gives
  $ y^* = 0. $
  Substituting into the second equation then gives
  $ 0 = -x - (x^2 - mu) 0 = -x, $
  so $x^* = 0$. Hence the origin is the equilibrium for all $mu$.

  The Jacobian matrix of the planar system is
  $ J(x,y; mu) = mat(0, 1; -1 - 2 x y, mu - x^2). $
  At the origin this simplifies to
  $ J(0,0; mu) = mat(0, 1; -1, mu). $

  The characteristic polynomial is
  $ lambda^2 - mu lambda + 1 = 0, $
  so the eigenvalues are
  $ lambda_(1,2) = mu / 2 plus.minus sqrt(mu^2 / 4 - 1). $

  At $mu = 0$ we obtain
  $ lambda_(1,2) = plus.minus i, $
  so the critical frequency is
  $ omega_0 = 1. $

  For small negative $mu$, the real part $mu/2$ is negative, so the origin is stable. For small positive $mu$, the real part becomes positive, so the origin loses stability.

  The nonlinear terms determine what replaces the stable equilibrium after the loss of stability. In the Van der Pol system one finds
  $ ell_1 = -1/16 < 0. $
  Since the first Lyapunov coefficient is negative, the Hopf bifurcation is supercritical: a small stable limit cycle is created for $mu > 0$.

  So the picture is:
  - for $mu < 0$, trajectories spiral into the origin;
  - at $mu = 0$, the origin is critical with purely imaginary eigenvalues;
  - for small $mu > 0$, the origin becomes unstable and a stable oscillation appears.

  The period of the newly created cycle approaches
  $ T(mu) -> 2 pi / omega_0 = 2 pi $
  as $mu -> 0$.
]
#example[
  For the system
  $ x' = -y + x(mu - r^2), quad y' = x + y(mu - r^2) $
  where $r^2 = x^2 + y^2$, convert the system to polar coordinates.

  Using the identities
  $ r' = (x x' + y y') / r, quad theta' = (x y' - y x') / r^2, $
  compute the radial equation first:
  $ x x' + y y' = x(-y + x(mu - r^2)) + y(x + y(mu - r^2)). $
  Expanding gives
  $ x x' + y y' = -x y + x^2(mu - r^2) + x y + y^2(mu - r^2). $
  The mixed terms cancel, so
  $ x x' + y y' = (x^2 + y^2)(mu - r^2) = r^2(mu - r^2). $
  Hence
  $ r' = r(mu - r^2). $

  For the angular equation,
  $ x y' - y x' = x(x + y(mu - r^2)) - y(-y + x(mu - r^2)). $
  Expanding again,
  $ x y' - y x' = x^2 + x y (mu - r^2) + y^2 - x y (mu - r^2) = x^2 + y^2 = r^2. $
  Therefore
  $ theta' = 1. $

  The full polar form is
  $ r' = r(mu - r^2), quad theta' = 1. $

  At $mu = 0$, the radial equation becomes
  $ r' = -r^3, $
  so small radii decrease toward zero while the angle continues rotating with constant speed. The linear part has frequency
  $ omega_0 = 1. $

  The key nonlinear term is the cubic term $-r^3$ in the amplitude equation. Its negative sign means that when a nonzero orbit appears for $mu > 0$, it is attracting rather than repelling. In Lyapunov-coefficient language this corresponds to
  $ ell_1 < 0. $

  Thus this normal form is the canonical supercritical Hopf example: a stable limit cycle is created smoothly as $mu$ increases through zero.
]

#proposition[Planar Hopf Detection via Trace and Determinant][
  For the parameterized planar system above, let $tau(mu) = "tr"(A(mu))$ and $Delta(mu) = det(A(mu))$. Then:
  + The eigenvalues are $lambda_(1,2) = (tau plus.minus sqrt(tau^2 - 4 Delta)) / 2$.
  + The equilibrium is a *stable spiral* when $tau < 0$ and $Delta > tau^2 / 4$, and an *unstable spiral* when $tau > 0$ and $Delta > tau^2 / 4$.
  + A *Hopf bifurcation* at $mu_c$ requires simultaneously:
    $ tau(mu_c) = 0, quad Delta(mu_c) > 0, quad tau'(mu_c) != 0. $
  + At $mu_c$, the purely imaginary eigenvalues are $lambda_(1,2) = plus.minus i sqrt(Delta(mu_c)) = plus.minus i omega_0$.
  The transversality condition $tau'(mu_c) != 0$ is equivalent to $alpha'(mu_c) != 0$ in the Hopf theorem, since $tau = 2 alpha$ for the planar system.
]

#example[
  For the system $dot(x) = mu x - y - x(x^2 + y^2)$, $dot(y) = x + mu y - y(x^2 + y^2)$, the origin is always an equilibrium with Jacobian
  $ J = mat(mu, -1; 1, mu). $

  Compute the trace and determinant explicitly:
  $ tau(mu) = "tr"(J) = mu + mu = 2 mu, $
  $ Delta(mu) = det(J) = mu^2 - (-1)(1) = mu^2 + 1. $

  Since $mu^2 + 1 > 0$ for every real $mu$, the determinant never changes sign. So the stability change can only come from the trace.

  The Hopf conditions in the planar trace-determinant form are:
  $ tau(mu_c) = 0, quad Delta(mu_c) > 0, quad tau'(mu_c) != 0. $
  Here,
  $ tau(0) = 0, quad Delta(0) = 1 > 0, quad tau'(mu) = 2, $
  so in particular
  $ tau'(0) = 2 != 0. $

  Thus the critical value is
  $ mu_c = 0. $
  At this point the eigenvalues are
  $ lambda_(1,2) = plus.minus i sqrt(Delta(0)) = plus.minus i, $
  so the critical frequency is
  $ omega_0 = 1. $

  For $mu < 0$, the trace is negative and the origin is a stable spiral. For $mu > 0$, the trace is positive and the origin is an unstable spiral. This is exactly how the trace-determinant test detects a Hopf crossing in practice.
]


=== Solved Problems

#solved_problem[Glycolytic Oscillator][
  A simplified Sel'kov model for oscillations in glycolysis (the breakdown of sugar) is:
  $ x' = -x + a y + x^2 y \ y' = b - a y - x^2 y $
  where $x$ and $y$ are dimensionless concentrations of ADP and F6P, and $a,b > 0$.
  Show that the unique equilibrium can undergo a Hopf bifurcation as $b$ varies.
]
#solution[
  *1. Solve the equilibrium equations explicitly.*
  At equilibrium we require $x' = 0$ and $y' = 0$.

  Start with the second equation:
  $ 0 = b - a y - x^2 y = b - (a + x^2) y. $
  Rearranging gives
  $ (a + x^2) y = b quad => quad y = b / (a + x^2). $

  Substitute this expression into the first equation:
  $ 0 = -x + a y + x^2 y = -x + a frac(b, a + x^2) + x^2 frac(b, a + x^2). $
  Combine the last two terms over the common denominator:
  $ 0 = -x + frac(a b + x^2 b, a + x^2) = -x + frac(b(a + x^2), a + x^2) = -x + b. $
  Hence
  $ x^* = b. $

  Substituting $x^* = b$ back into the formula for $y$ gives
  $ y^* = b / (a + b^2). $

  Therefore the system has the unique equilibrium
  $ (x^*, y^*) = (b, b / (a + b^2)). $

  *2. Compute the Jacobian matrix.*
  Write
  $ f(x,y) = -x + a y + x^2 y, quad g(x,y) = b - a y - x^2 y. $
  The partial derivatives are
  $ f_x = -1 + 2 x y, quad f_y = a + x^2, $
  $ g_x = -2 x y, quad g_y = -(a + x^2). $
  Thus
  $ J(x,y) = mat(-1 + 2 x y, a + x^2; -2 x y, -(a + x^2)). $

  At the equilibrium, let
  $ D = a + b^2. $
  Then
  $ x^* y^* = b dot frac(b, a + b^2) = b^2 / D, $
  so the Jacobian becomes
  $ J(x^*, y^*) = mat(-1 + 2 b^2 / D, D; -2 b^2 / D, -D). $

  *3. Compute the trace and determinant step by step.*
  For a planar Hopf bifurcation we inspect
  $ tau = "tr"(J), quad Delta = det(J). $

  First the determinant:
  $ Delta = (-1 + 2 b^2 / D)(-D) - D (-2 b^2 / D). $
  Expand each term separately:
  $ (-1 + 2 b^2 / D)(-D) = D - 2 b^2, $
  $ D (-2 b^2 / D) = -2 b^2. $
  Therefore
  $ Delta = (D - 2 b^2) - (-2 b^2) = D = a + b^2 > 0. $

  Now the trace:
  $ tau = (-1 + 2 b^2 / D) + (-D) = -1 + 2 b^2 / D - D. $
  Write the first two terms over the denominator $D$:
  $ -1 + 2 b^2 / D = -D / D + 2 b^2 / D = (2 b^2 - D) / D. $
  Since $D = a + b^2$,
  $ 2 b^2 - D = 2 b^2 - (a + b^2) = b^2 - a. $
  Hence
  $ tau = (b^2 - a) / D - D = (b^2 - a - D^2) / D. $
  Substituting back $D = a + b^2$ yields
  $ tau = (b^2 - a - (a + b^2)^2) / (a + b^2). $

  *4. Solve the Hopf condition $tau = 0$.*
  Since the denominator $a + b^2$ is strictly positive, the condition $tau = 0$ is equivalent to
  $ b^2 - a - (a + b^2)^2 = 0. $
  Rearranging gives
  $ b^2 - a = (a + b^2)^2. $

  Set
  $ z = b^2. $
  Then the equation becomes
  $ z - a = (a + z)^2 = a^2 + 2 a z + z^2. $
  Moving all terms to one side,
  $ 0 = z^2 + (2 a - 1) z + (a^2 + a), $
  or equivalently
  $ z^2 - (1 - 2 a) z + (a + a^2) = 0. $

  The discriminant is
  $ (1 - 2 a)^2 - 4(a + a^2) = 1 - 8 a. $
  Therefore real critical values exist exactly when
  $ a <= 1/8. $
  In that case,
  $ z_c = ((1 - 2 a) plus.minus sqrt(1 - 8 a)) / 2, $
  and since $z = b^2$,
  $ b_c = sqrt(z_c). $

  *5. Verify transversality.*
  Express the trace as a function of $z = b^2$:
  $ tau(z) = -1 + 2 z / (a + z) - (a + z). $
  Differentiate term by term:
  $ d tau / d z = 2 frac((a + z) - z, (a + z)^2) - 1 = 2 a / (a + z)^2 - 1. $
  Since $z = b^2$, the chain rule gives
  $ d tau / d b = d tau / d z dot d z / d b = 2 b (2 a / (a + b^2)^2 - 1). $

  At a nondegenerate critical value $b = b_c > 0$, if
  $ d tau / d b != 0, $
  then the pair of complex eigenvalues crosses the imaginary axis with nonzero speed. This is exactly the transversality condition.

  *6. State the conclusion clearly.*
  We have shown:
  - $Delta > 0$ at the equilibrium,
  - $tau = 0$ at the critical value $b = b_c$,
  - $d tau / d b != 0$ at a nondegenerate crossing.

  Therefore, for parameters with $a <= 1/8$ and nondegenerate crossing at $b = b_c$, the equilibrium undergoes a Hopf bifurcation as $b$ varies. At onset, the oscillation frequency is
  $ omega_0 = sqrt(Delta(b_c)) = sqrt(a + b_c^2). $
  Determining whether the Hopf bifurcation is supercritical or subcritical requires the sign of the first Lyapunov coefficient $ell_1$.
]

#solved_problem[Planar System Hopf with Explicit Lyapunov Coefficient][
  Consider the planar system
  $ x' = mu x - y - x(x^2 + y^2) \ y' = x + mu y - y(x^2 + y^2) $
  where $mu$ is a bifurcation parameter. Show that the origin undergoes a Hopf bifurcation and determine the bifurcation type (supercritical vs. subcritical).
]
#solution[
  *1. Verify that the origin is an equilibrium for every $mu$.*
  Substituting $(x,y) = (0,0)$ into the system gives
  $ x' = mu dot 0 - 0 - 0(0^2 + 0^2) = 0, $
  $ y' = 0 + mu dot 0 - 0(0^2 + 0^2) = 0. $
  Therefore the origin is an equilibrium for all parameter values.

  *2. Compute the Jacobian and the linearized eigenvalues.*
  Let
  $ f(x,y) = mu x - y - x(x^2 + y^2), $
  $ g(x,y) = x + mu y - y(x^2 + y^2). $
  Then
  $ f_x = mu - 3 x^2 - y^2, quad f_y = -1 - 2 x y, $
  $ g_x = 1 - 2 x y, quad g_y = mu - x^2 - 3 y^2. $

  Evaluating at the origin gives
  $ J(0,0; mu) = mat(mu, -1; 1, mu). $
  Hence
  $ tau(mu) = "tr"(J) = 2 mu, quad Delta(mu) = det(J) = mu^2 + 1. $

  The characteristic polynomial is
  $ lambda^2 - 2 mu lambda + (mu^2 + 1) = 0, $
  so the eigenvalues are
  $ lambda_(1,2) = mu plus.minus i. $

  At $mu = 0$ we obtain
  $ lambda_(1,2) = plus.minus i, $
  a simple conjugate pair of purely imaginary eigenvalues. Moreover,
  $ tau(0) = 0, quad Delta(0) = 1 > 0, quad tau'(0) = 2 != 0. $
  Therefore the Hopf algebraic conditions are satisfied at
  $ mu_c = 0. $

  *3. Rewrite the system in polar coordinates to study the nonlinear terms.*
  Set
  $ x = r cos(theta), quad y = r sin(theta). $
  The standard identities are
  $ r' = (x x' + y y') / r, $
  $ theta' = (x y' - y x') / r^2. $

  Compute $x x' + y y'$ first:
  $ x x' + y y' = x(mu x - y - x(x^2 + y^2)) + y(x + mu y - y(x^2 + y^2)). $
  Expand term by term:
  $ x x' + y y' = mu x^2 - x y - x^2(x^2 + y^2) + x y + mu y^2 - y^2(x^2 + y^2). $
  The mixed terms cancel, so
  $ x x' + y y' = mu(x^2 + y^2) - (x^2 + y^2)^2. $
  Since $x^2 + y^2 = r^2$,
  $ x x' + y y' = mu r^2 - r^4. $
  Therefore
  $ r' = (mu r^2 - r^4) / r = mu r - r^3. $

  Now compute $x y' - y x'$:
  $ x y' - y x' = x(x + mu y - y(x^2 + y^2)) - y(mu x - y - x(x^2 + y^2)). $
  Expanding gives
  $ x y' - y x' = x^2 + mu x y - x y(x^2 + y^2) - mu x y + y^2 + x y(x^2 + y^2). $
  Again the mixed terms cancel, leaving
  $ x y' - y x' = x^2 + y^2 = r^2. $
  Hence
  $ theta' = r^2 / r^2 = 1. $

  The polar form is therefore
  $ r' = mu r - r^3, quad theta' = 1. $

  *4. Find the periodic orbit branch from the amplitude equation.*
  Nontrivial periodic orbits correspond to nonzero constant radii, so we solve
  $ r' = 0. $
  From
  $ mu r - r^3 = r(mu - r^2) = 0, $
  we obtain
  $ r = 0 quad text("or") quad r^2 = mu. $
  Thus a nonzero periodic orbit exists exactly when
  $ mu > 0, $
  and its radius is
  $ r_* = sqrt(mu). $

  *5. Determine the stability of both the equilibrium and the cycle.*
  For the equilibrium $r = 0$, the linearized radial equation is
  $ r' approx mu r. $
  Therefore:
  - if $mu < 0$, small radii decay and the origin is stable;
  - if $mu > 0$, small radii grow and the origin is unstable.

  For the nonzero branch $r_* = sqrt(mu)$ with $mu > 0$, differentiate the radial right-hand side
  $ F(r) = mu r - r^3. $
  Then
  $ F'(r) = mu - 3 r^2. $
  Evaluating at $r = r_*$ gives
  $ F'(r_*) = mu - 3 mu = -2 mu < 0. $
  Therefore the periodic orbit of radius $sqrt(mu)$ is stable.

  *6. Read off the bifurcation type.*
  As $mu$ passes through $0$:
  - the origin changes from stable to unstable,
  - a small stable limit cycle is born for $mu > 0$.

  This is exactly a *supercritical Hopf bifurcation*.

  In normal-form language, the amplitude equation has cubic coefficient $-1$, so the first Lyapunov coefficient is negative. In particular,
  $ ell_1 < 0, $
  which agrees with the supercritical classification.
]

=== Supplementary Problems

#supplementary[Circadian Rhythm Feedback Loop][
  The Goodwin limit-cycle model describes circadian rhythms via genetic negative feedback (mRNA -> Protein -> Inhibitor). Using the concept of a supercritical Hopf bifurcation, explain how an increase in the cooperativity parameter (the Hill coefficient $n$) inside the genetic loop can suddenly cause cells to transition from a steady rest state into sustained 24-hour molecular oscillations.
  *Hint:* Relate larger Hill coefficients to sharper nonlinear feedback and destabilization of the steady state.
]

#supplementary[Trace-Determinant Hopf Detection][
  Consider a planar parameterized system with Jacobian at equilibrium
  $ J(mu) = mat(a(mu), b(mu); c(mu), d(mu)). $
  1. Write $tau(mu) = text("tr")(J(mu))$ and $Delta(mu) = det(J(mu))$.
  2. State the algebraic Hopf conditions in terms of $tau(mu)$ and $Delta(mu)$.
  3. Explain why the transversality condition $d tau / d mu != 0$ at $mu = mu_c$ is required.
  4. Classify whether the equilibrium is locally stable or unstable for $tau < 0$ and $tau > 0$, assuming $Delta > 0$.
  *Hint:* For Hopf in 2D, enforce $Delta(mu_c) > 0$, $tau(mu_c)=0$, and sign-changing trace near $mu_c$.
]

#supplementary[Nullcline Geometry and Oscillation Onset][
  For a generic activator-inhibitor model
  $ x' &= f(x,y; mu) \ y' &= g(x,y; mu), $
  assume the $x$-nullcline is cubic-like and the $y$-nullcline is approximately linear.
  1. Sketch qualitatively how the nullcline intersection changes as $mu$ increases.
  2. Describe how a change in local slope can move eigenvalues from the left half-plane to the right half-plane.
  3. Explain how this geometric transition is related to Hopf bifurcation and emergence of a limit cycle.
  *Hint:* Track how the Jacobian evaluated at the moving intersection changes its trace sign.
]

#supplementary[Biological Interpretation of Supercritical vs Subcritical Hopf][
  Compare two physiological scenarios represented by:
  1. A supercritical Hopf bifurcation that creates a small stable oscillation.
  2. A subcritical Hopf bifurcation with an unstable cycle and abrupt transition.
  For each case, explain expected behavior under small perturbations, reversibility under parameter rollback, and clinical implications for robustness of oscillatory function.
  *Hint:* Compare local attraction to a stable cycle versus escape beyond an unstable cycle threshold.
]

#supplementary[Normal Form Computation Near Hopf][
  Study the complex normal form
  $ z' = (alpha + i omega) z + c z |z|^2, $
  where $alpha in RR$, $omega > 0$, and $c in CC$.
  1. Convert to polar form $(r, theta)$ and derive the scalar amplitude equation for $r$.
  2. Determine the radius and stability of periodic orbits as a function of $alpha$ and $text("Re")(c)$.
  3. Use the sign of $text("Re")(c)$ to distinguish supercritical and subcritical Hopf bifurcations.
  *Hint:* Write $z = r e^(i theta)$ and separate real and imaginary parts after substitution.
]

== Pathways to Diabetes: A Bifurcation Perspective

=== Mathematical Review

#definition[Saddle-Node (Fold) Bifurcation Point][
  Consider $dot(x) = f(x, mu)$ with $f : RR^n times RR -> RR^n$ of class $C^k$ ($k >= 2$). A point $(x_c, mu_c)$ is a *saddle-node bifurcation point* (also called a *fold*) if:
  + $f(x_c, mu_c) = 0$ (equilibrium condition).
  + $A_c := D_x f(x_c, mu_c)$ has a *simple zero eigenvalue*; all other eigenvalues have nonzero real part.
  + *(Non-degeneracy / curvature)* Let $v$ and $w$ be right and left eigenvectors of $A_c$ for eigenvalue $0$, normalized so that $w^T v = 1$. Then
    $ a := w^T [D_x^2 f(x_c, mu_c)(v, v)] != 0. $
  + *(Transversality / parameter sensitivity)* $b := w^T [partial_mu f(x_c, mu_c)] != 0.$
  Conditions (3) and (4) together guarantee that exactly two equilibrium branches -- one stable, one unstable -- collide and disappear at $(x_c, mu_c)$.
]

#example[
  Solve the equilibrium equation:
  $ 0 = mu - x^2 quad => quad x^2 = mu. $

  Therefore:
  - if $mu < 0$, there is no real equilibrium;
  - if $mu = 0$, there is one equilibrium at $x_c = 0$;
  - if $mu > 0$, there are two equilibria
    $ x^+ = +sqrt(mu), quad x^- = -sqrt(mu). $

  To determine their stability, differentiate
  $ f(x, mu) = mu - x^2 $
  with respect to $x$:
  $ f_x(x, mu) = -2x. $

  Evaluate this derivative at each branch:
  $ f_x(x^+, mu) = -2 sqrt(mu) < 0, $
  so the upper branch is stable, while
  $ f_x(x^-, mu) = 2 sqrt(mu) > 0, $
  so the lower branch is unstable.

  At the critical point $(x_c, mu_c) = (0,0)$, we have
  $ f_x(0,0) = 0, $
  so the equilibrium is non-hyperbolic. This is exactly the point where the two branches meet and disappear. That collision of one stable and one unstable branch is the basic saddle-node picture.
]


#theorem[Saddle-Node Bifurcation Normal Form][
  Under the conditions of the definition above, there exist a $C^k$ local change of coordinates and smooth reparameterization $nu = nu(mu)$ (with $nu(mu_c) = 0$, $nu'(mu_c) != 0$) such that the system is locally topologically equivalent to the *normal form*
  $ dot(u) = nu - u^2. $
  Equilibria: $u^* = plus.minus sqrt(nu)$ exist for $nu > 0$ (two branches), and no real equilibrium exists for $nu < 0$. The branch $u^* = +sqrt(nu)$ is stable ($partial f / partial u = -2u^* < 0$) and the branch $u^* = -sqrt(nu)$ is unstable ($partial f / partial u > 0$). At $nu = 0$ a single *non-hyperbolic* equilibrium $u = 0$ remains; its stable manifold has codimension one.
]

#example[
  Consider the planar system
  $ dot(x) = mu - x^2 - y, quad dot(y) = -y. $
  First compute the equilibria. From the second equation,
  $ dot(y) = -y = 0 quad => quad y^* = 0. $
  Substituting into the first equation gives
  $ 0 = mu - (x^*)^2 - 0 = mu - (x^*)^2, $
  so
  $ x^* = plus.minus sqrt(mu) $
  when $mu > 0$.

  Thus:
  - if $mu < 0$, there is no real equilibrium;
  - if $mu = 0$, there is one equilibrium at $(0,0)$;
  - if $mu > 0$, there are two equilibria
    $ (plus.minus sqrt(mu), 0). $

  The Jacobian matrix is
  $ J(x,y) = mat(-2x, -1; 0, -1). $
  Evaluate it at the two branches:

  At $(sqrt(mu), 0)$,
  $ J = mat(-2sqrt(mu), -1; 0, -1). $
  Since this matrix is triangular, its eigenvalues are the diagonal entries
  $ lambda_1 = -2sqrt(mu), quad lambda_2 = -1, $
  so both are negative and the equilibrium is stable.

  At $(-sqrt(mu), 0)$,
  $ J = mat(2sqrt(mu), -1; 0, -1), $
  whose eigenvalues are
  $ lambda_1 = 2sqrt(mu), quad lambda_2 = -1. $
  One eigenvalue is positive and the other is negative, so this branch is unstable.

  The reason this system is a concrete realization of the normal form is that the $y$-direction is always contracting, while the $x$-direction carries the fold mechanism. Near the bifurcation, the effective reduced equation is exactly
  $ dot(x) approx mu - x^2, $
  so the two-dimensional picture is the one-dimensional saddle-node plus an extra stable direction.
]


#example[
  In the scalar normal form
  $ dot(u) = nu - u^2, $
  equilibria satisfy
  $ 0 = nu - u^2 quad => quad u^2 = nu. $

  Therefore:
  - if $nu < 0$, there is no real equilibrium;
  - if $nu = 0$, there is one double equilibrium at $u = 0$;
  - if $nu > 0$, there are two equilibria
    $ u^* = plus.minus sqrt(nu). $

  Their stability is read from
  $ partial f / partial u = -2u. $
  At $u^* = +sqrt(nu)$ we get
  $ partial f / partial u = -2sqrt(nu) < 0, $
  so the upper branch is stable. At $u^* = -sqrt(nu)$ we get
  $ partial f / partial u = 2sqrt(nu) > 0, $
  so the lower branch is unstable.

  If we plot the equilibrium condition as
  $ nu = u^2, $
  we obtain a parabola in the $(u, nu)$ plane. Vertical lines $nu = text("constant")$ intersect this parabola in exactly the same three regimes just described: zero, one, or two equilibria.

  This is why the parabola is the universal local picture of a saddle-node bifurcation: any system satisfying the fold hypotheses can be reduced locally to this same geometry.
]


#proposition[Scalar Fold Conditions][
  For the scalar equation $dot(x) = f(x, mu)$ with $f : RR times RR -> RR$, the saddle-node conditions at $(x_c, mu_c)$ reduce to:
  $ f(x_c, mu_c) = 0, quad f_x(x_c, mu_c) = 0, quad f_(x x)(x_c, mu_c) != 0, quad f_mu(x_c, mu_c) != 0. $
  By the Implicit Function Theorem, these conditions imply the existence of an equilibrium curve $x^*(mu)$ with a quadratic turning point at $(x_c, mu_c)$. The continuation slope satisfies
  $ (d x^*) / (d mu) = - f_mu / f_x, $
  which diverges as $f_x -> 0$ at the fold, explaining why numerical continuation must switch to arc-length parameterization near the bifurcation.
]
#example[
  For $f(x, mu) = mu - x^2$, check the fold conditions at $(x_c, mu_c) = (0, 0)$:
  - $f(0, 0) = 0$ [OK]
  - $f_x = -2x$, so $f_x(0, 0) = 0$ [OK]
  - $f_{x x} = -2 != 0$ [OK]
  - $f_mu = 1 != 0$ [OK]
  
  We can also check the continuation slope explicitly. Along an equilibrium branch $x^*(mu)$, implicit differentiation of
  $ f(x^*(mu), mu) = 0 $
  gives
  $ d x^* / d mu = - f_mu / f_x. $

  For this example,
  $ f_mu = 1, quad f_x = -2x, $
  so
  $ d x^* / d mu = -1 / (-2x) = 1 / (2x). $

  This derivative becomes unbounded as $x -> 0$. In other words, the equilibrium curve develops a vertical tangent at the fold point. That is exactly why naive continuation in the parameter $mu$ fails there: the branch turns around, and a better local parameter such as arc length is needed to continue through the fold.
]

#definition[Hysteresis and Multistability][
  When a system exhibits two fold points at $mu = mu_1 < mu_2$, the bifurcation diagram displays an *S-shaped* equilibrium curve with three coexisting branches for $mu_1 < mu < mu_2$: upper (stable), middle (unstable), and lower (stable). The resulting phenomenon is *hysteresis*: the state at a given $mu$ depends on the direction of parameter variation, not just the current value of $mu$. If the system jumps from the upper to the lower branch at $mu_2$, reducing $mu$ restores the upper branch only at $mu_1 < mu_2$. In the diabetes context, this means that once insulin resistance $R$ surpasses $R_c$ and the healthy equilibrium disappears, reducing $R$ slightly below $R_c$ is *insufficient* for recovery -- a far larger therapeutic intervention is required.
]

=== Solved Problems

#solved_problem[Bifurcation Diagram Interpretation][
  In a glucose-insulin model, the healthy equilibrium $G_1^*(R)$ depends on insulin resistance $R$. As $R$ increases, $G_1^*$ rises. At a critical $R_c$, $G_1^*$ and an unstable $G_2^*(R)$ meet and merge. Describe the bifurcation diagram.
]
#solution[
  Let the equilibria be described by a scalar reduced equation
  $ Phi(G, R) = 0, $
  where $G$ is the equilibrium glucose level and $R$ is the insulin-resistance parameter.

  *1. State the local fold conditions.*
  A saddle-node bifurcation at $(G_c, R_c)$ is characterized by
  $ Phi(G_c, R_c) = 0, quad partial_G Phi(G_c, R_c) = 0, $
  $ partial_(G G) Phi(G_c, R_c) != 0, quad partial_R Phi(G_c, R_c) != 0. $
  The first condition says there is an equilibrium at $(G_c, R_c)$. The second says the equilibrium is non-hyperbolic in the reduced scalar direction. The last two conditions guarantee that the contact is genuinely quadratic and that the parameter really unfolds the degeneracy.

  *2. Introduce local coordinates around the critical point.*
  Define shifted variables
  $ u = G - G_c, quad r = R - R_c. $
  After Taylor expansion and rescaling, the equilibrium equation takes the local normal-form shape
  $ 0 = beta r + gamma u^2 + o(|r| + |u|^2), quad beta gamma != 0. $

  Ignoring the higher-order terms for the local picture, we solve
  $ beta r + gamma u^2 = 0. $
  Rearranging gives
  $ u^2 = -(beta/gamma) r. $
  Therefore the nearby equilibrium branches are
  $ u_(plus.minus)(r) approx plus.minus sqrt(-(beta/gamma) r). $

  This formula shows the key geometric fact:
  - on one side of $R_c$, there are *two* nearby equilibria;
  - at $R = R_c$, these two equilibria collide into one double root;
  - on the other side of $R_c$, there is *no* nearby equilibrium.

  *3. Interpret the two branches biologically and dynamically.*
  In the problem statement, the branch $G_1^*(R)$ is the healthy equilibrium and the branch $G_2^*(R)$ is unstable. Their collision at $R = R_c$ means that the healthy state disappears in a fold.

  The local stability along each branch is determined by the reduced scalar eigenvalue
  $ lambda = partial_G Phi(G^*(R), R). $
  On the healthy branch one has
  $ lambda < 0, $
  so that branch is stable. On the threshold branch one has
  $ lambda > 0, $
  so that branch is unstable.

  At the critical value $R = R_c$, both branches meet at $(R_c, G_c)$ and annihilate each other.

  *4. Describe the bifurcation diagram in words.*
  The bifurcation diagram is therefore a standard fold diagram:
  - a stable branch $P_1$ representing healthy glucose regulation,
  - an unstable branch $P_2$ representing the threshold state,
  - collision of $P_1$ and $P_2$ at $(R_c, G_c)$.

  For $R$ beyond the fold, the healthy branch no longer exists, so trajectories can no longer relax back to that physiological equilibrium. The only remaining attracting state is the diabetic branch $P_3$, which lies away from the fold and persists after the collision.
]

#solved_problem[Explicit Fold-Point Computation][
  Consider a scalar model of glucose regulation
  $ dot(G) = Phi(G, R) = (R - d) - (G - K/2)^2 / K, $
  where $R$ (insulin resistance), $K > 0$ (a glucose scale), and $d$ (a critical resistance threshold) are parameters.
  Find the fold (saddle-node) point in the $(G, R)$ plane and sketch the bifurcation diagram as $R$ varies.
]
#solution[
  *1. Solve the equilibrium equation exactly.*
  Equilibria satisfy
  $ Phi(G, R) = 0, $
  so
  $ (R - d) - (G - K/2)^2 / K = 0. $
  Rearranging gives
  $ (G - K/2)^2 / K = R - d. $
  Multiplying by $K$,
  $ (G - K/2)^2 = K(R - d). $

  Therefore:
  - if $R < d$, the right-hand side is negative, so there is no real equilibrium;
  - if $R = d$, there is one double equilibrium;
  - if $R > d$, there are two equilibria.

  For $R > d$, taking square roots yields
  $ G - K/2 = plus.minus sqrt(K(R - d)), $
  hence the equilibrium branches are
  $ G^*_(plus.minus)(R) = K/2 plus.minus sqrt(K(R - d)). $

  *2. Compute the fold conditions directly.*
  Differentiate $Phi(G,R)$ with respect to $G$ and $R$:
  $ partial_G Phi = -2(G - K/2) / K, $
  $ partial_R Phi = 1, $
  $ partial_(G G) Phi = -2 / K. $

  At a fold point we require
  $ Phi(G_c, R_c) = 0, quad partial_G Phi(G_c, R_c) = 0. $

  The condition $partial_G Phi = 0$ gives immediately
  $ -2(G_c - K/2) / K = 0 quad => quad G_c = K/2. $

  Substitute this into the equilibrium equation:
  $ 0 = (R_c - d) - (G_c - K/2)^2 / K = (R_c - d) - 0, $
  so
  $ R_c = d. $

  Thus the fold point is
  $ (G_c, R_c) = (K/2, d). $

  *3. Check nondegeneracy and transversality.*
  The second derivative is
  $ partial_(G G) Phi = -2 / K != 0, $
  because $K > 0$. Also
  $ partial_R Phi = 1 != 0. $
  Therefore the degeneracy is exactly the one required for a saddle-node bifurcation.

  *4. Determine the stability of the two branches.*
  For a scalar equation, local stability is determined by the sign of
  $ partial_G Phi(G^*(R), R). $

  On the upper branch
  $ G^*_+(R) = K/2 + sqrt(K(R - d)), $
  we have
  $ G^*_+(R) - K/2 = sqrt(K(R - d)) > 0, $
  so
  $ partial_G Phi(G^*_+(R), R) = -2 sqrt(K(R - d)) / K < 0. $
  Hence the upper branch is stable.

  On the lower branch
  $ G^*_-(R) = K/2 - sqrt(K(R - d)), $
  we have
  $ G^*_-(R) - K/2 = -sqrt(K(R - d)) < 0, $
  so
  $ partial_G Phi(G^*_-(R), R) = 2 sqrt(K(R - d)) / K > 0. $
  Hence the lower branch is unstable.

  *5. Describe the bifurcation diagram clearly.*
  The bifurcation diagram has the standard fold shape:
  - For $R < d$, there are no real equilibria.
  - At $R = d$, the two branches meet at the single non-hyperbolic point $G = K/2$.
  - For $R > d$, there are two equilibrium branches:
    $ G^*_-(R) = K/2 - sqrt(K(R - d)) quad text("(unstable)"), $
    $ G^*_+(R) = K/2 + sqrt(K(R - d)) quad text("(stable)"). $

  So as $R$ decreases toward the critical value $d$, the stable and unstable branches approach each other, collide at $(K/2, d)$, and disappear together. That collision is exactly the saddle-node bifurcation.
]

=== Supplementary Problems

#supplementary[Hysteresis and Irreversibility][
  Explain why a patient who crosses $R = R_c$ cannot simply reverse the disease by reducing insulin resistance back slightly below $R_c$. How does the concept of hysteresis in bifurcation diagrams explain the clinical difficulty of reversing Type 2 Diabetes?
  *Hint:* Use branch disappearance at the fold to explain why a nearby healthy attractor no longer exists.
]

#supplementary[Fold Conditions in a Scalar Equilibrium Equation][
  Let equilibria be roots of
  $ Phi(G, R) = 0, $
  where $R$ is an insulin-resistance parameter.
  1. Write the saddle-node conditions at a fold point $(G_c, R_c)$.
  2. Explain the geometric meaning of solving
  $ Phi(G_c, R_c) = 0 $ and $ partial Phi / partial G (G_c, R_c) = 0. $
  3. State why these conditions imply collision of one stable and one unstable equilibrium branch.
  *Hint:* At the fold, the equilibrium root has multiplicity two in the scalar equation.
]

#supplementary[Basin Boundary and Separatrix Shift][
  In a bistable glucose-insulin model with equilibria $P_1$ (healthy), $P_2$ (saddle), and $P_3$ (diabetic):
  1. Explain how the stable manifold of $P_2$ defines a separatrix.
  2. Describe how increasing $R$ moves this separatrix in phase space.
  3. Interpret how this movement changes the set of initial conditions that still recover to $P_1$.
  *Hint:* Describe the separatrix as a moving boundary between attraction to $P_1$ and attraction to $P_3$.
]

#supplementary[Early-Warning Indicators Near a Fold][
  Near a saddle-node bifurcation, trajectories often exhibit critical slowing down.
  1. Define critical slowing down in terms of local eigenvalues.
  2. Explain why recovery from perturbations becomes slower as $R -> R_c^-$. 
  3. Propose two measurable time-series indicators that could signal approach to the fold point in a physiological dataset.
  *Hint:* Link slower recovery to an eigenvalue approaching zero from the negative side.
]

#supplementary[One-Parameter Continuation of Equilibria][
  Suppose $G^*(R)$ solves an implicit equation $Phi(G, R)=0$.
  1. Derive the continuation slope $d G^* / d R$ using implicit differentiation.
  2. Explain why continuation may fail at the fold point.
  3. Sketch a qualitative bifurcation diagram with stable and unstable branches, clearly marking the fold.
  4. Relate branch stability to the sign of the dominant eigenvalue of the Jacobian of the full system.
  *Hint:* Continuation slope diverges when $partial Phi / partial G = 0$.
]




