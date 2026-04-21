#import "../../../utils.typ": *
= Bifurcation Theory

This chapter introduces parametric bifurcations — saddle-node, Hopf — explaining mathematically how the destruction of the physiological stable point constitutes the "Pathway to Diabetes."

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

#definition[Hopf Bifurcation Point][
  A point $(x^*(mu_c), mu_c)$ on an equilibrium branch is a *Hopf bifurcation point* if:
  + $A(mu_c)$ has a *simple pair* of purely imaginary eigenvalues $lambda_(1,2)(mu_c) = plus.minus i omega_0$ with $omega_0 > 0$.
  + All remaining eigenvalues of $A(mu_c)$ have *nonzero* real part.
  Condition (1) makes the critical center manifold exactly two-dimensional; Condition (2) rules out additional zero or imaginary eigenvalues that would require a higher-codimension analysis.
]

#theorem[Poincaré–Andronov–Hopf][
  Suppose $dot(x) = f(x, mu)$ is sufficiently smooth and $(x^*(mu_c), mu_c)$ is a Hopf bifurcation point. Assume in addition:
  - *(Transversality)* The eigenvalues $lambda(mu) = alpha(mu) plus.minus i omega(mu)$ near $mu_c$ satisfy $alpha'(mu_c) != 0$, i.e.\ the real part crosses zero with nonzero speed.
  - *(Non-degeneracy)* The *first Lyapunov coefficient* $ell_1(mu_c) != 0$.
  Then a unique family of periodic orbits bifurcates from $(x^*(mu_c), mu_c)$:
  - $ell_1 < 0$ *(supercritical)*: a family of *stable* limit cycles exists on the side where $alpha > 0$; the equilibrium loses stability smoothly and the transition is reversible.
  - $ell_1 > 0$ *(subcritical)*: a family of *unstable* limit cycles precedes the stability loss; crossing $mu_c$ produces a catastrophic *hard* transition to a distant attractor.
  In both cases the period of the bifurcating orbit satisfies $T(mu) -> 2pi \/ omega_0$ as $mu -> mu_c$.
]

#definition[First Lyapunov Coefficient][
  For a sufficiently smooth planar system $dot(x) = f(x, y; mu)$, $dot(y) = g(x, y; mu)$ at an equilibrium with eigenvalues $plus.minus i omega_0$, write all partial derivatives at the equilibrium with subscript notation ($f_(x x) := partial^2 f \/ partial x^2$, etc.). The *first Lyapunov coefficient* is
  $ ell_1 = 1/16 [f_(x x x) + f_(x y y) + g_(x x y) + g_(y y y)] $
  $ + 1/(16 omega_0) [f_(x y)(f_(x x) + f_(y y)) - g_(x y)(g_(x x) + g_(y y)) - f_(x x) g_(x x) + f_(y y) g_(y y)]. $
  The sign of $ell_1$ fully determines the bifurcation type: $ell_1 < 0$ gives a stable (supercritical) limit cycle; $ell_1 > 0$ gives an unstable (subcritical) one.
]

#proposition[Planar Hopf Detection via Trace and Determinant][
  For the parameterized planar system above, let $tau(mu) = "tr"(A(mu))$ and $Delta(mu) = det(A(mu))$. Then:
  + The eigenvalues are $lambda_(1,2) = (tau plus.minus sqrt(tau^2 - 4 Delta)) \/ 2$.
  + The equilibrium is a *stable spiral* when $tau < 0$ and $Delta > tau^2 \/ 4$, and an *unstable spiral* when $tau > 0$ and $Delta > tau^2 \/ 4$.
  + A *Hopf bifurcation* at $mu_c$ requires simultaneously:
    $ tau(mu_c) = 0, quad Delta(mu_c) > 0, quad tau'(mu_c) != 0. $
  + At $mu_c$, the purely imaginary eigenvalues are $lambda_(1,2) = plus.minus i sqrt(Delta(mu_c)) = plus.minus i omega_0$.
  The transversality condition $tau'(mu_c) != 0$ is equivalent to $alpha'(mu_c) != 0$ in the Hopf theorem, since $tau = 2 alpha$ for the planar system.
]

#definition[Limit Cycles and Structural Stability][
  A *limit cycle* is an isolated closed orbit in phase space. It is *stable* (attracting) if nearby trajectories spiral onto it, and *unstable* (repelling) if they spiral away. Unlike the *center* of a conservative system (which is structurally unstable and destroyed by any perturbation), a limit cycle persists under small smooth perturbations to the vector field. This structural stability is the mathematical reason biological oscillations — heartbeats, circadian clocks, insulin pulses — are self-sustaining and robust to noise.
]

=== Solved Problems

#solved_problem[Glycolytic Oscillator][
  A simplified Sel'kov model for oscillations in glycolysis (the breakdown of sugar) is:
  $ x' = -x + a y + x^2 y \ y' = b - a y - x^2 y $
  where $x$ and $y$ are dimensionless concentrations of ADP and F6P, and $a,b > 0$.
  Show that the unique equilibrium can undergo a Hopf bifurcation as $b$ varies.
]
#solution[
  *1. Find the equilibrium:*
  Set $y' = 0$: $b = (a + x^2) y => y = b / (a + x^2)$.
  Substitute into $x'=0$:
  $ -x + a (b / (a + x^2)) + x^2 (b / (a + x^2)) = 0 $
  $ -x + (a+x^2) / (a+x^2) b = 0 => x = b. $
  Thus, $y = b / (a + b^2)$. The unique equilibrium is $(x^*, y^*) = (b, b / (a + b^2))$.

  *2. Evaluate the Jacobian at the equilibrium:*
  $ J(x,y) = mat(-1 + 2 x y, a + x^2; -2 x y, - (a + x^2)). $
  At $(x^*, y^*)$, note that $x^* y^* = b^2 / (a + b^2)$. Let $D = a + b^2$.
  $ J = mat(-1 + 2 b^2/D, D; -2 b^2/D, -D). $
  
  *3. Verify the Hopf algebraic conditions:*
  For a planar system, Hopf requires $Delta > 0$, $tau = 0$, and transversality.
  $ Delta = det(J) = (-1 + 2b^2 / D)(-D) - D(-2b^2 / D) = D = a + b^2 > 0. $
  $ tau = "tr"(J) = -1 + 2b^2 / (a+b^2) - (a+b^2)
  = (b^2 - a - (a+b^2)^2) / (a+b^2). $

  Setting $tau = 0$ gives
  $ b^2 - a = (a+b^2)^2. $
  Let $z = b^2$. Then $z$ solves
  $ z^2 - (1 - 2a) z + (a + a^2) = 0, $
  whose discriminant is $1 - 8a$. Hence real critical values exist iff $a <= 1/8$, with
  $ z_c = ((1 - 2a) plus.minus sqrt(1 - 8a)) / 2, quad b_c = sqrt(z_c). $

  *4. Check transversality:*
  Using $z=b^2$,
  $ tau(z) = -1 + 2z/(a+z) - (a+z), $
  so
  $ d tau / d z = -1 + 2a / (a+z)^2, quad d tau / d b = 2b(-1 + 2a / (a+b^2)^2). $
  At a nondegenerate critical point $b=b_c>0$, $d tau / d b != 0$, so the conjugate eigenvalues cross the imaginary axis with nonzero speed.

  Therefore, for parameters with $a <= 1/8$ and nondegenerate crossing at $b=b_c$, the equilibrium undergoes a Hopf bifurcation. The local oscillation frequency at onset is
  $ omega_0 = sqrt(Delta(b_c)) = sqrt(a + b_c^2). $
  (Supercritical vs. subcritical type is determined by the first Lyapunov coefficient $ell_1$.)
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
  Conditions (3) and (4) together guarantee that exactly two equilibrium branches — one stable, one unstable — collide and disappear at $(x_c, mu_c)$.
]

#theorem[Saddle-Node Bifurcation Normal Form][
  Under the conditions of the definition above, there exist a $C^k$ local change of coordinates and smooth reparameterization $nu = nu(mu)$ (with $nu(mu_c) = 0$, $nu'(mu_c) != 0$) such that the system is locally topologically equivalent to the *normal form*
  $ dot(u) = nu - u^2. $
  Equilibria: $u^* = plus.minus sqrt(nu)$ exist for $nu > 0$ (two branches), and no real equilibrium exists for $nu < 0$. The branch $u^* = +sqrt(nu)$ is stable ($partial f \/ partial u = -2u^* < 0$) and the branch $u^* = -sqrt(nu)$ is unstable ($partial f \/ partial u > 0$). At $nu = 0$ a single *non-hyperbolic* equilibrium $u = 0$ remains; its stable manifold has codimension one.
]

#proposition[Scalar Fold Conditions][
  For the scalar equation $dot(x) = f(x, mu)$ with $f : RR times RR -> RR$, the saddle-node conditions at $(x_c, mu_c)$ reduce to:
  $ f(x_c, mu_c) = 0, quad f_x(x_c, mu_c) = 0, quad f_(x x)(x_c, mu_c) != 0, quad f_mu(x_c, mu_c) != 0. $
  By the Implicit Function Theorem, these conditions imply the existence of an equilibrium curve $x^*(mu)$ with a quadratic turning point at $(x_c, mu_c)$. The continuation slope satisfies
  $ (d x^*) / (d mu) = - f_mu / f_x, $
  which diverges as $f_x -> 0$ at the fold, explaining why numerical continuation must switch to arc-length parameterization near the bifurcation.
]

#definition[Hysteresis and Multistability][
  When a system exhibits two fold points at $mu = mu_1 < mu_2$, the bifurcation diagram displays an *S-shaped* equilibrium curve with three coexisting branches for $mu_1 < mu < mu_2$: upper (stable), middle (unstable), and lower (stable). The resulting phenomenon is *hysteresis*: the state at a given $mu$ depends on the direction of parameter variation, not just the current value of $mu$. If the system jumps from the upper to the lower branch at $mu_2$, reducing $mu$ restores the upper branch only at $mu_1 < mu_2$. In the diabetes context, this means that once insulin resistance $R$ surpasses $R_c$ and the healthy equilibrium disappears, reducing $R$ slightly below $R_c$ is *insufficient* for recovery — a far larger therapeutic intervention is required.
]

=== Solved Problems

#solved_problem[Bifurcation Diagram Interpretation][
  In a glucose-insulin model, the healthy equilibrium $G_1^*(R)$ depends on insulin resistance $R$. As $R$ increases, $G_1^*$ rises. At a critical $R_c$, $G_1^*$ and an unstable $G_2^*(R)$ meet and merge. Describe the bifurcation diagram.
]
#solution[
  Let equilibria satisfy a scalar reduced equation
  $ Phi(G, R) = 0. $
  A fold (saddle-node) at $(G_c, R_c)$ is characterized by
  $ Phi(G_c, R_c) = 0, quad partial_G Phi(G_c, R_c) = 0, $
  $ partial_(G G) Phi(G_c, R_c) != 0, quad partial_R Phi(G_c, R_c) != 0. $

  By a local shift $u = G - G_c$, $r = R - R_c$, the equilibrium equation is equivalent (to second order) to
  $ 0 = beta r + gamma u^2 + o(|r| + |u|^2), quad beta gamma != 0. $
  Thus nearby equilibrium branches are
  $ u_(plus.minus)(r) approx plus.minus sqrt(-(beta/gamma) r), $
  which shows two branches on one side of $R_c$ and no branch on the other side.

  Stability follows from the linearization sign in the reduced direction:
  $ lambda = partial_G Phi(G^*(R), R). $
  On the upper branch ($P_1$) one has $lambda < 0$ (stable), while on the lower branch ($P_2$) one has $lambda > 0$ (unstable). At $R = R_c$, $P_1$ and $P_2$ coalesce and annihilate.

  Therefore the bifurcation diagram is a fold: stable healthy branch $P_1$ and unstable threshold branch $P_2$ meet at $(R_c, G_c)$; beyond that point only the diabetic branch $P_3$ remains as the attracting equilibrium.
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

