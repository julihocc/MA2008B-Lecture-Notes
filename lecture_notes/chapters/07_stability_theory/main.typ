#import "../../../utils.typ": *
= Stability Theory

This chapter covers Lyapunov's indirect and direct methods, with applications to proving local and global stability in metabolic glucose-insulin models.

*Learning objectives:*
- Construct Lyapunov candidates for planar metabolic models.
- Use matrix inequalities to verify local asymptotic stability.
- Apply invariant-set reasoning to estimate basins of attraction.
- Distinguish linearized stability conclusions from nonlinear global claims.

== Mathematical Stability Theory

=== Mathematical Review

A central question in the study of dynamical systems is not merely whether solutions exist, but whether they return to or remain near a reference state after a perturbation. Lyapunov's theory answers this question without solving the differential equation explicitly. The key insight is to construct an auxiliary scalar function $V(x)$—called a *Lyapunov function*—that acts as a generalized "energy": if this energy is always decreasing along trajectories, the system must be converging to its equilibrium.

We develop two complementary approaches. The *direct method* works with the nonlinear system itself and provides both local and global conclusions depending on whether the Lyapunov function is defined on a neighborhood or on the whole state space. The *indirect method* (or linearization) reduces the question to checking the eigenvalues of the Jacobian at the equilibrium, at the cost of yielding only local information.

#theorem[Lyapunov Direct Method (Local Asymptotic Stability)][
  Let $x^*$ be an equilibrium point of $x' = f(x)$. If there exists a continuously differentiable scalar function $V(x)$ defined on a neighborhood $U$ of $x^*$ such that:
  1. $V(x^*) = 0$,
  2. $V(x) > 0$ for all $x in U$ with $x != x^*$,
  3. $dot(V)(x) < 0$ for all $x in U$ with $x != x^*$,
  then $x^*$ is locally asymptotically stable.
]
#proof[
  We establish the two conditions of local asymptotic stability separately.

  *Step 1: Lyapunov Stability (trajectories that start close, stay close).*
  Since $V$ is continuous and $V(x^*) = 0$, for any $epsilon > 0$ the sublevel set
  $ Omega_epsilon = {x in U : V(x) <= c_epsilon } $
  can be chosen to lie inside the ball $B(x^*, epsilon)$ by taking $c_epsilon$ sufficiently small. Because $dot(V)(x) < 0$ for $x != x^*$, the value $V(x(t))$ is strictly decreasing along any trajectory. Therefore, if $x(0) in Omega_epsilon$, then $V(x(t)) <= V(x(0)) <= c_epsilon$ for all $t >= 0$, meaning $x(t)$ never leaves $Omega_epsilon subset B(x^*, epsilon)$. This proves that $x^*$ is Lyapunov stable.

  *Step 2: Asymptotic Convergence (trajectories approach $x^*$).*
  Fix $x(0)$ sufficiently close to $x^*$ so that $x(t)$ remains in $U$ for all $t >= 0$ (guaranteed by Step 1). Since $V(x(t))$ is strictly decreasing and bounded below by $0$, it converges to a limit $L >= 0$.
  Suppose for contradiction that $L > 0$. Then the trajectory stays in the compact set ${ x in U : L <= V(x) <= V(x(0)) }$, which is bounded away from $x^*$. On this compact set, $dot(V)$ is continuous and strictly negative, so there exists $gamma > 0$ such that $dot(V)(x(t)) <= -gamma$ for all $t >= 0$. Integrating gives $V(x(t)) <= V(x(0)) - gamma t$, which eventually becomes negative. This contradicts $V(x) >= 0$, so $L = 0$.
  Since $V(x) = 0$ only at $x = x^*$, it follows that $x(t) arrow.r x^*$ as $t arrow.r infinity$.
]

#theorem[Lyapunov Direct Method (Global Asymptotic Stability)][
  Let $x^*$ be an equilibrium point of $x' = f(x)$. If there exists a continuously differentiable scalar function $V(x)$ defined on all of the state space such that:
  1. $V(x^*) = 0$,
  2. $V(x) > 0$ for all $x != x^*$,
  3. $dot(V)(x) < 0$ for all $x != x^*$,
  4. Radial unboundedness: $V(x) arrow.r infinity$ as $norm(x) arrow.r infinity$,
  then $x^*$ is globally asymptotically stable.
]
#proof[
  We again establish Lyapunov stability and then asymptotic convergence, now globally.

  *Step 1: Global Lyapunov Stability (trajectories are globally bounded).*
  Radial unboundedness ensures that for each $c > 0$ the sublevel set
  $ Omega_c = {x : V(x) <= c} $
  is bounded (and closed, hence compact). Since $dot(V)(x) < 0$ for $x != x^*$, the function $V(x(t))$ is strictly decreasing along every trajectory. Therefore any trajectory starting at $x(0)$ satisfies $V(x(t)) <= V(x(0))$ for all $t >= 0$, so it remains inside the compact set $Omega_{V(x(0))}$. Because $x(0)$ was arbitrary, every trajectory is bounded. This establishes global Lyapunov stability.

  *Step 2: Global Asymptotic Convergence.*
  Since $V(x(t))$ is strictly decreasing and bounded below by $0$, it converges to a limit $L >= 0$.
  Suppose for contradiction that $L > 0$. Then the trajectory stays in the compact set ${ x : L <= V(x) <= V(x(0)) }$, which is bounded away from $x^*$. On this compact set, $dot(V)$ is continuous and strictly negative, so there exists $gamma > 0$ such that $dot(V)(x(t)) <= -gamma$ for all $t >= 0$. Integrating gives $V(x(t)) <= V(x(0)) - gamma t$, which eventually becomes negative—contradiction.
  Therefore $L = 0$. Since $V(x) = 0$ only at $x = x^*$, we conclude $x(t) arrow.r x^*$ for every starting point $x(0)$, which is global asymptotic stability.
]

#definition[Quadratic Lyapunov Function for Linear Systems][
  For the linear system $x' = A x$, a standard candidate is the quadratic form:
  $ V(x) = x^T P x, $
  where $P$ is a symmetric positive-definite matrix ($P = P^T > 0$). Along trajectories, the time derivative is:
  $ dot(V)(x) = x^T (A^T P + P A) x. $
  If we can find $P$ such that $A^T P + P A = -Q$ for some symmetric positive-definite matrix $Q$, then $dot(V)(x) = -x^T Q x < 0$ (for $x != 0$), and the origin is globally asymptotically stable.
]

#theorem[Lyapunov Indirect Method (Linearization)][
  Consider an equilibrium $x^*$ of a nonlinear system $x' = f(x)$ with Jacobian matrix $J(x^*)$.
  - If all eigenvalues of $J(x^*)$ satisfy $text("Re")(lambda_i) < 0$, then $x^*$ is locally asymptotically stable.
  - If at least one eigenvalue satisfies $text("Re")(lambda_i) > 0$, then $x^*$ is unstable.
]
#proof[
  We use the same Taylor expansion setup throughout. Let $A = J(x^*)$, define $delta x = x - x^*$, so the nonlinear dynamics become:
  $ delta x' = A delta x + g(delta x), $
  where $g(delta x)$ satisfies $lim_(norm(delta x) arrow.r 0) (norm(g(delta x)))/(norm(delta x)) = 0$, meaning $g$ is genuinely higher-order near the origin.

  *Case 1: all eigenvalues satisfy $text("Re")(lambda_i) < 0$ (local asymptotic stability).*
  Since $A$ is Hurwitz, for any symmetric positive-definite $Q$ there exists a unique symmetric positive-definite $P$ solving the continuous Lyapunov equation $A^T P + P A = -Q$.
  Using $V(delta x) = delta x^T P delta x$ as our candidate, the time derivative along trajectories of the full nonlinear system is:
  $ dot(V)(delta x) &= delta x^T (A^T P + P A) delta x + 2 delta x^T P g(delta x) \
  &= -delta x^T Q delta x + 2 delta x^T P g(delta x). $
  Let $lambda_min(Q) > 0$ denote the smallest eigenvalue of $Q$ and $norm(P)$ the induced matrix norm of $P$. Then:
  $ dot(V)(delta x) <= -lambda_min(Q) norm(delta x)^2 + 2 norm(P) norm(g(delta x)) norm(delta x). $
  Since $norm(g(delta x)) = o(norm(delta x))$, for any $epsilon > 0$ there exists $delta > 0$ such that $norm(g(delta x)) <= epsilon norm(delta x)$ whenever $norm(delta x) < delta$. Choosing $epsilon = lambda_min(Q) \/ (4 norm(P))$ gives:
  $ dot(V)(delta x) <= -frac(lambda_min(Q), 2) norm(delta x)^2 < 0 quad text("for all ") delta x != 0 text(" with ") norm(delta x) < delta. $
  By the Local Asymptotic Stability theorem of the Direct Method, $x^*$ is locally asymptotically stable.

  *Case 2: at least one eigenvalue satisfies $text("Re")(lambda_j) > 0$ (instability).*
  Let $alpha = text("Re")(lambda_j) > 0$ and let $v_j$ be the corresponding (possibly complex) eigenvector of $A$. Consider initial conditions of the form $delta x(0) = s dot Re(v_j)$ for small $s > 0$. For the *linearized* system $delta x' = A delta x$, the solution component along $Re(v_j)$ grows at least as fast as $e^(alpha t)$, so $norm(delta x_"lin"(t)) >= s e^(alpha t) norm(Re(v_j))$.
  For the full nonlinear system, we apply Grönwall's inequality to the error $e(t) = delta x(t) - delta x_"lin"(t)$, which satisfies $e' = A e + g(delta x)$. Since $norm(g(delta x)) <= C norm(delta x)^2$ near the origin, the error remains $o(e^(alpha t))$ for small $s$. Therefore, for sufficiently small $s$:
  $ norm(delta x(t)) >= frac(s, 2) e^(alpha t) norm(Re(v_j)) arrow.r infinity. $
  Since initial conditions with arbitrarily small $s > 0$ produce trajectories that grow away from $x^*$, the equilibrium is unstable.
]

=== Solved Problems

#solved_problem[Verifying Negative Definiteness via Quadratic Lyapunov Function][
  Consider a nonlinear system linearized near an equilibrium, yielding the Jacobian:
  $ J = mat(-3, 1; -2, -4). $
  Taking $P = I$ (the identity matrix), the candidate Lyapunov function is $V(delta x) = delta x^T delta x = norm(delta x)^2$. Verify that $dot(V) < 0$ and conclude local asymptotic stability.
]
#solution[
  With $P = I$, the time derivative of $V$ along trajectories of $delta x' = J delta x$ is:
  $ dot(V)(delta x) = delta x^T (J^T P + P J) delta x = delta x^T (J^T + J) delta x. $

  *Step 1: Compute the symmetric part $J^T + J$.*
  $ J^T = mat(-3, -2; 1, -4), $
  so:
  $ J^T + J = mat(-3, -2; 1, -4) + mat(-3, 1; -2, -4) = mat(-6, -1; -1, -8). $

  *Step 2: Find the eigenvalues of $J^T + J$.*
  The characteristic polynomial is:
  $ det(lambda I - (J^T + J)) = det mat(lambda + 6, 1; 1, lambda + 8) = (lambda + 6)(lambda + 8) - 1 = lambda^2 + 14 lambda + 47. $
  The eigenvalues are:
  $ lambda_(1,2) = frac(-14 plus.minus sqrt(196 - 188), 2) = frac(-14 plus.minus sqrt(8), 2) = -7 plus.minus sqrt(2). $
  Numerically: $lambda_1 approx -5.59$ and $lambda_2 approx -8.41$. Both are strictly negative.

  *Step 3: Conclude.*
  Since all eigenvalues of $J^T + J$ are strictly negative, the matrix is negative definite, meaning:
  $ dot(V)(delta x) = delta x^T (J^T + J) delta x < 0 quad text("for all ") delta x != 0. $
  By the Lyapunov Direct Method (Local Asymptotic Stability), the equilibrium is locally asymptotically stable.

  _Remark:_ The two eigenvalues of $J$ itself are the roots of $lambda^2 + 7lambda + 14 = 0$, giving $lambda = (-7 plus.minus i sqrt(7))/2$, both with real part $-3.5 < 0$. This is consistent with the Indirect Method, and we have now established the same conclusion via the Direct Method with an explicit Lyapunov function.
]

=== Supplementary Problems

#supplementary[Constructing a Weighted Quadratic Lyapunov Function][
  Consider the linearized system $delta x' = J delta x$ with $delta x = (delta x_1, delta x_2)^T$.
  1. Propose a weighted quadratic candidate $V = p_1 (delta x_1)^2 + p_2 (delta x_2)^2$ with $p_1, p_2 > 0$.
  2. Compute $dot(V)$ explicitly in terms of the entries of $J$.
  3. Derive sufficient inequalities on $p_1, p_2$ that make $dot(V)$ negative definite.
  4. Interpret how changing $p_1/p_2$ changes the relative penalization of state deviations.
  *Hint:* Write $dot(V)$ as a quadratic form in $(delta G, delta I)$ and apply definiteness conditions.
]

#supplementary[Invariant Level Sets and Basins of Attraction][
  For a nonlinear planar system $x' = f(x)$ with equilibrium $x^*$ and Lyapunov function $V(x)$:
  1. Define the sublevel set $Omega_c = {x in RR^2 : V(x) <= c}$.
  2. State conditions under which $Omega_c$ is positively invariant.
  3. Explain how invariant sublevel sets provide inner estimates of the basin of attraction of $x^*$.
  4. Apply this reasoning qualitatively to a nonlinear planar model near a stable equilibrium.
  *Hint:* Use $dot(V) <= 0$ on $Omega_c$ to show trajectories cannot cross outward through the boundary.
]

#supplementary[Indirect Method and Stability Classification][
  Let the Jacobian at an equilibrium be
  $ J = mat(a, b; c, d). $
  1. Express the trace and determinant of $J$.
  2. Write the linear stability conditions in terms of $text("tr")(J)$ and $det(J)$.
  3. Classify the equilibrium type for each case: (i) $det(J) < 0$, (ii) $det(J) > 0$ and $text("tr")(J) < 0$, (iii) $det(J) > 0$ and $text("tr")(J) > 0$.
  4. Explain why linear asymptotic stability supports a local Lyapunov argument for the nonlinear model.
  *Hint:* Start with the characteristic polynomial $lambda^2 - text("tr")(J) lambda + det(J)=0$.
]

#supplementary[Lyapunov Equation for a $2 times 2$ Stable Matrix][
  Let $A = mat(-2, 1; -3, -4)$ and choose $Q = I$.
  1. Solve the continuous Lyapunov equation $A^T P + P A = -Q$ for the symmetric matrix $P$.
  2. Verify that $P$ is positive definite.
  3. Conclude asymptotic stability of the origin for $x' = A x$ using $V(x)=x^T P x$.
  *Hint:* Parameterize $P = mat(p_1, p_2; p_2, p_3)$ and solve the resulting linear system.
]

#supplementary[Exponential Decay Bound from a Quadratic Lyapunov Function][
  Suppose for a nonlinear system there exists $V(x)$ and constants $m_1, m_2, alpha > 0$ such that
  $ m_1 norm(x)^2 <= V(x) <= m_2 norm(x)^2 $
  and
  $ dot(V)(x) <= - alpha norm(x)^2 $
  in a neighborhood of the origin.
  1. Show that $V(t) <= V(0) e^(-(alpha/m_2) t)$.
  2. Derive an exponential norm estimate for $norm(x(t))$ in terms of $norm(x(0))$.
  3. Interpret the result as a quantitative stability statement.
  *Hint:* Convert the inequality for $dot(V)$ into a scalar differential inequality in $V(t)$.
]

== Biomathematical Stability in Glucose-Insulin Dynamics

The abstract tools developed in the previous section—Lyapunov functions, the Lyapunov equation, and the linearization theorem—are now brought to bear on a concrete physiological problem: the regulation of blood glucose and insulin. In these models, the equilibria of interest correspond to clinically meaningful metabolic states: a *healthy equilibrium* (normoglycemia) that should be stable, and a *pathological equilibrium* (chronic hyperglycemia) whose stability signals disease progression.

Wherever the Lyapunov candidate $V$ satisfies $dot(V) < 0$ only on a subset (rather than everywhere away from equilibrium), we employ LaSalle's Invariance Principle—stated below—which extends the convergence conclusion to the semi-definite case.

=== Mathematical Review

#definition[Candidate Lyapunov Function for Glucose-Insulin][
  For a glucose-insulin model with equilibrium $(G^*, I^*)$, define
  $ V(G, I) = (G - G^*)^2 + c (I - I^*)^2 $
  for some constant $c > 0$. If $dot(V)$ is negative definite in a neighborhood (or globally on an invariant region), trajectories return to the healthy equilibrium.
]

#definition[Clinical Interpretation of Stability][
  In biomathematics, local asymptotic stability of a healthy equilibrium means small physiological perturbations (meal load, transient stress, hormonal fluctuations) decay over time. Loss of stability indicates persistent dysregulation, which may correspond to progression toward pathological states.
]

#theorem[LaSalle's Invariance Principle][
  Let $Omega$ be a compact set that is positively invariant under the flow of $x' = f(x)$. Let $V : Omega arrow.r RR$ be a continuously differentiable function such that $dot(V)(x) <= 0$ for all $x in Omega$. Define:
  $ E = {x in Omega : dot(V)(x) = 0}, $
  and let $M$ be the largest positively invariant subset of $E$. Then every solution starting in $Omega$ converges to $M$ as $t arrow.r infinity$.

  In particular, if $M = {x^*}$, then $x^*$ is asymptotically stable and every trajectory starting in $Omega$ converges to $x^*$.
]

_Remark:_ LaSalle's principle extends the Direct Method to cases where $dot(V) <= 0$ (only negative semi-definite, not strictly negative definite). It is especially useful in biomathematical models where $dot(V) = 0$ on a physically meaningful set, such as the glucose nullcline, rather than only at the equilibrium itself.

=== Solved Problems

#solved_problem[Negative Definiteness Near a Healthy Equilibrium][
  For the linearized glucose-insulin system $delta x' = J delta x$ near a healthy equilibrium $P_1$, verify that choosing $V = delta x^T delta x$ gives $dot(V) = delta x^T (J^T + J) delta x < 0$ when $J^T + J$ is negative definite.
]
#solution[
  Compute the symmetric matrix $J^T + J$ at $P_1$. If its eigenvalues are strictly negative, then for every nonzero perturbation $delta x$, we obtain
  $ dot(V) = delta x^T (J^T + J) delta x < 0. $
  Therefore, perturbations in glucose and insulin decay with time, which mathematically confirms local asymptotic stability of the healthy operating point.
]

=== Supplementary Problems

#supplementary[Energy Interpretation in a Metabolic Model][
  Explain why $V(G, I)$ can be interpreted as a weighted metabolic distance from the healthy state $(G^*, I^*)$, and what it means clinically when $dot(V) < 0$.
  *Hint:* Interpret each quadratic term as a weighted deviation penalty from equilibrium.
]

#supplementary[LaSalle Invariance Principle in a Metabolic Setting][
  Assume a candidate Lyapunov function satisfies $dot(V)(x) <= 0$ in a compact positively invariant set $Omega$.
  1. Define the set $E = {x in Omega : dot(V)(x) = 0}$.
  2. Determine the largest invariant subset $M subset E$ in a model where $dot(V)=0$ implies $G=G^*$ and $I$ may vary.
  3. Use LaSalle's invariance principle to conclude whether trajectories converge to $(G^*, I^*)$.
  4. Discuss what this conclusion means for long-term metabolic regulation.
  *Hint:* Characterize all states in $E$ that remain in $E$ under system dynamics.
]

#supplementary[Parameter-Robust Stability of the Healthy Equilibrium][
  Consider a parameterized glucose-insulin model with Jacobian $J(theta)$ at the healthy equilibrium, where $theta$ represents physiological uncertainty.
  1. State a sufficient matrix-based condition ensuring local asymptotic stability for all $theta in [theta_min, theta_max]$.
  2. Explain how trace-determinant inequalities can be used in the planar case.
  3. Discuss the biomedical meaning of robustness with respect to patient variability.
  *Hint:* For $2 times 2$ systems, enforce $text("tr")(J(theta)) < 0$ and $det(J(theta)) > 0$ uniformly on the interval.
]

#supplementary[Disturbance Rejection and Practical Stability][
  Assume meal intake acts as a bounded disturbance $u(t)$ in a glucose-insulin model:
  $ x' = f(x) + B u(t), quad norm(u(t)) <= u_max. $
  1. Explain why strict asymptotic convergence to equilibrium may be replaced by convergence to a small neighborhood.
  2. Formulate a Lyapunov inequality that implies practical stability under bounded input.
  3. Interpret this in terms of clinically acceptable glycemic variability.
  *Hint:* Derive an estimate of the form $dot(V) <= -c_1 norm(x-x^*)^2 + c_2 norm(u)^2$.
]

#supplementary[Basin-of-Attraction Estimate for Safe Operating Region][
  Let $V(G,I)$ be a Lyapunov candidate around a healthy equilibrium $(G^*, I^*)$.
  1. Define a sublevel set $Omega_r = {(G,I): V(G,I) <= r}$.
  2. State conditions under which $Omega_r$ is a certified safe operating region.
  3. Explain how increasing $r$ can eventually violate invariance.
  4. Propose how this estimate can guide treatment thresholds.
  *Hint:* Check the sign of $dot(V)$ on the boundary $V=r$.
]

