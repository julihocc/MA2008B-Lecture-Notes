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
  The system $x' = mu - x^2$, $y' = -y$ has a single equilibrium for each $mu$. Solving $mu = (x^*)^2$ gives two branches when $mu > 0$: $x^* = plus.minus sqrt(mu)$ with $y^* = 0$. The Jacobian at equilibrium is
  $ A(mu) = mat(-2x^*, 0; 0, -1) = mat(minus 2sqrt(mu), 0; 0, -1). $
  As $mu$ increases, the $x$-component eigenvalue $-2sqrt(mu)$ becomes more negative, indicating strengthening stability in that direction.
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
  Equilibrium: $(x^*, y^*) = (0, 0)$ for all $mu$. The Jacobian at the origin is
  $ J(0,0; mu) = mat(mu, -1; 1, mu). $
  Eigenvalues: $lambda = mu plus.minus i$. At $mu = 0$, we have $lambda = plus.minus i$, a simple conjugate pair of purely imaginary eigenvalues. For $mu < 0$, both eigenvalues have negative real part (stable); for $mu > 0$, both have positive real part (unstable). This is a clean Hopf bifurcation at $mu_c = 0$.
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
  The origin is an equilibrium for all $mu$. The Jacobian is $J = mat(0, 1; -1, mu)$ with eigenvalues $lambda = mu / 2 plus.minus sqrt(mu^2 / 4 - 1)$. At $mu = 0$, $lambda = plus.minus i$ (Hopf point with $omega_0 = 1$). For $mu > 0$, the Lyapunov coefficient is $ell_1 = -1/16 < 0$ (supercritical), so a stable limit cycle emerges for small $mu > 0$. The bifurcation is reversible: reducing $mu$ back below zero shrinks the cycle back to the origin. The period of the emerging cycle is $T(mu) approx 2pi$ for small $mu$.
]


#definition[First Lyapunov Coefficient][
  For a sufficiently smooth planar system $dot(x) = f(x, y; mu)$, $dot(y) = g(x, y; mu)$ at an equilibrium with eigenvalues $plus.minus i omega_0$, write all partial derivatives at the equilibrium with subscript notation ($f_(x x) := partial^2 f / partial x^2$, etc.). The *first Lyapunov coefficient* is
  $ ell_1 = 1/16 [f_(x x x) + f_(x y y) + g_(x x y) + g_(y y y)] $
  $ + 1/(16 omega_0) [f_(x y)(f_(x x) + f_(y y)) - g_(x y)(g_(x x) + g_(y y)) - f_(x x) g_(x x) + f_(y y) g_(y y)]. $
  The sign of $ell_1$ fully determines the bifurcation type: $ell_1 < 0$ gives a stable (supercritical) limit cycle; $ell_1 > 0$ gives an unstable (subcritical) one.
]
#example[
  For the system
  $ x' = -y + x(mu - r^2), quad y' = x + y(mu - r^2) $
  where $r^2 = x^2 + y^2$, convert to polar coordinates: $r' = r(mu - r^2)$, $theta' = 1$. When $mu = 0$ the origin is a center with $omega_0 = 1$. The cubic nonlinearity $-r^3$ in the amplitude equation determines the Lyapunov coefficient: $ell_1 = -1/4 < 0$. This indicates a supercritical bifurcation--stable limit cycles emerge smoothly from the origin as $mu$ increases above zero.
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
  Thus $tau = 2mu$ and $Delta = mu^2 + 1 > 0$ always. A Hopf bifurcation occurs at $mu_c = 0$ where $tau = 0$. For $mu < 0$ the origin is stable; for $mu > 0$ it is unstable, with $omega_0 = sqrt(Delta) = 1$. Numerical continuation or bifurcation software would identify $mu = 0$ as the Hopf point by monitoring when $tau$ crosses zero with $tau'(mu_c) = 2 != 0$.
]


#definition[Limit Cycles and Structural Stability][
  A *limit cycle* is an isolated closed orbit in phase space. It is *stable* (attracting) if nearby trajectories spiral onto it, and *unstable* (repelling) if they spiral away. Unlike the *center* of a conservative system (which is structurally unstable and destroyed by any perturbation), a limit cycle persists under small smooth perturbations to the vector field. This structural stability is the mathematical reason biological oscillations -- heartbeats, circadian clocks, insulin pulses -- are self-sustaining and robust to noise.
]

#example[
  In the Van der Pol oscillator $x'' + (x^2 - mu) x' + x = 0$ (or equivalently $x' = y$, $y' = -x - (x^2 - mu) y$), for any $mu > 0$ a unique stable limit cycle exists in the $(x, y)$ plane. Adding a small perturbation like $+ 0.01 sin(t)$ to the system barely deforms this cycle; it remains the dominant attractor. In contrast, a center (e.g., the conservative oscillator $x'' + x = 0$) has a family of concentric cycles; any nonlinear perturbation destroys this continuous family. The Van der Pol limit cycle's robustness under perturbation is what makes it a genuine biological attractor.
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
  The scalar system $dot(x) = mu - x^2$ has equilibria satisfying $x^2 = mu$. For $mu > 0$, two equilibria exist: $x^* = plus.minus sqrt(mu)$. The upper branch $x^+ = +sqrt(mu)$ has $f_x = -2x^+ < 0$ (stable), while the lower branch $x^- = -sqrt(mu)$ has $f_x = -2x^- > 0$ (unstable). At $mu = 0$, both branches meet at $x_c = 0$ where $f_x = 0$ (the zero eigenvalue). Beyond $mu = 0$ (i.e., for $mu < 0$), no real equilibria exist. The fold point is $(mu_c, x_c) = (0, 0)$.
]


#theorem[Saddle-Node Bifurcation Normal Form][
  Under the conditions of the definition above, there exist a $C^k$ local change of coordinates and smooth reparameterization $nu = nu(mu)$ (with $nu(mu_c) = 0$, $nu'(mu_c) != 0$) such that the system is locally topologically equivalent to the *normal form*
  $ dot(u) = nu - u^2. $
  Equilibria: $u^* = plus.minus sqrt(nu)$ exist for $nu > 0$ (two branches), and no real equilibrium exists for $nu < 0$. The branch $u^* = +sqrt(nu)$ is stable ($partial f / partial u = -2u^* < 0$) and the branch $u^* = -sqrt(nu)$ is unstable ($partial f / partial u > 0$). At $nu = 0$ a single *non-hyperbolic* equilibrium $u = 0$ remains; its stable manifold has codimension one.
]

#example[
  Consider the planar system
  $ dot(x) = mu - x^2 - y, quad dot(y) = -y. $
  The $y$-equation forces $y$ to decay toward zero exponentially, so near the fold we focus on the $x$-dynamics. Setting $y approx 0$, we get $dot(x) approx mu - x^2$, which is exactly the normal form. For $mu > 0$, two equilibria exist: $(plus.minus sqrt(mu), 0)$. The linearization at $(sqrt(mu), 0)$ is $-2sqrt(mu) < 0$ (stable), while at $(-sqrt(mu), 0)$ it is $2sqrt(mu) > 0$ (unstable). At $mu = 0$, the two collide at the origin. The full 2D system undergoes a saddle-node bifurcation along the $x$-direction while the $y$-direction remains contracting. This is a concrete realization of the abstract normal form.
]


#example[
  The system $dot(x) = mu - x^2$ already exhibits the normal form with $u = x$ and $nu = mu$: no coordinate change is needed. For $mu > 0$, the $u$-axis is crossed by the parabola $nu = u^2$ at two points; below the parabola, no equilibrium exists; above it, two exist with opposite stability. This parabolic bifurcation diagram is topologically the same for *any* system undergoing a saddle-node bifurcation near its critical point.
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
  
  The continuation slope is $d x^* / d mu = -f_mu / f_x = -1 / (-2x)$, which is undefined at $x = 0$. This explains the vertical tangent to the parabolic bifurcation curve at the fold point--the equilibrium curve must be reparameterized by arc length to continue past the fold.
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




