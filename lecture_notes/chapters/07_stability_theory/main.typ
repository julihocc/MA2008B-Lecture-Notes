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

#theorem[Lyapunov Direct Method (Local Asymptotic Stability)][
  Let $x^*$ be an equilibrium point of $x' = f(x)$. If there exists a continuously differentiable scalar function $V(x)$ defined on a neighborhood $U$ of $x^*$ such that:
  1. $V(x^*) = 0$,
  2. $V(x) > 0$ for all $x in U$ with $x != x^*$,
  3. $dot(V)(x) < 0$ for all $x in U$ with $x != x^*$,
  then $x^*$ is locally asymptotically stable.
]
#proof[
  The condition $dot(V)(x) < 0$ implies that evaluating $V$ along any trajectory $x(t) in U$ yields a strictly decreasing function $V(t)$, as long as the trajectory is not at the equilibrium.
  Because $V(x)$ is continuous and bounded below by $0$, the sequence $V(x(t))$ must approach a limit $L >= 0$ as $t arrow.r infinity$.
  If $L > 0$, the trajectory remains bounded away from $x^*$, meaning $dot(V)(x(t))$ would be bounded away from zero by some negative constant, forcing $V(x(t))$ to eventually become negative. This contradicts $V(x) >= 0$.
  Therefore, the limit must be $L = 0$. Since $V(x) = 0$ only at $x = x^*$, it follows that $x(t) arrow.r x^*$, proving local asymptotic stability.
]

#theorem[Lyapunov Direct Method (Global Asymptotic Stability)][
  Let $x^*$ be an equilibrium point of $x' = f(x)$. If there exists a continuously differentiable scalar function $V(x)$ defined on all of the state space such that:
  1. $V(x^*) = 0$,
  2. $V(x) > 0$ for all $x != x^*$,
  3. $dot(V)(x) < 0$ for all $x != x^*$,
  4. Radial unboundedness: $V(x) arrow.r infinity$ as $||x|| arrow.r infinity$,
  then $x^*$ is globally asymptotically stable.
]
#proof[
  The proof follows the local case, adding a guarantee that trajectories do not escape to infinity.
  The condition that $V(x)$ is radially unbounded ensures that its sublevel sets, defined as $Omega_c = {x : V(x) <= c}$, are bounded.
  Since $dot(V)(x) < 0$, the scalar value $V(x(t))$ is decreasing. Thus, any trajectory starting at $x(0)$ remains trapped inside the bounded set $Omega_c$ where $c = V(x(0))$.
  Because the trajectory is bounded and $V(x(t))$ must decrease to $0$, the trajectory must converge to $x^*$. Since this holds for any starting point $x(0)$, $x^*$ is globally asymptotically stable.
]

#theorem[Lyapunov Indirect Method (Linearization)][
  Consider an equilibrium $x^*$ of a nonlinear system $x' = f(x)$ with Jacobian matrix $J(x^*)$.
  - If all eigenvalues of $J(x^*)$ satisfy $text("Re")(lambda_i) < 0$, then $x^*$ is locally asymptotically stable.
  - If at least one eigenvalue satisfies $text("Re")(lambda_i) > 0$, then $x^*$ is unstable.
]
#proof[
  We prove the local asymptotic stability condition. Let $A = J(x^*)$ and define the perturbation variable $delta x = x - x^*$. 
  By Taylor expansion around $x^*$, the dynamics are:
  $ delta x' = A delta x + g(delta x), $
  where the remainder $g(delta x)$ satisfies $lim_(||delta x|| arrow.r 0) (||g(delta x)||)/(||delta x||) = 0$.
  
  Since the eigenvalues of $A$ have strictly negative real parts, for any symmetric positive-definite matrix $Q$, there exists a symmetric positive-definite matrix $P$ that uniquely solves the Lyapunov equation:
  $ A^T P + P A = -Q. $
  
  We propose the candidate Lyapunov function $V(delta x) = delta x^T P delta x$ for the nonlinear system. Its time derivative evaluates to:
  $ dot(V)(delta x) &= delta x'^T P delta x + delta x^T P delta x' \
  &= (A delta x + g(delta x))^T P delta x + delta x^T P (A delta x + g(delta x)) \
  &= delta x^T (A^T P + P A) delta x + 2 delta x^T P g(delta x) \
  &= -delta x^T Q delta x + 2 delta x^T P g(delta x). $
  
  Because $Q$ is positive definite, the term $-delta x^T Q delta x$ is strictly negative and shrinks proportionally to $||delta x||^2$. The remainder $g(delta x)$ vanishes faster than $||delta x||$, meaning that for sufficiently small $||delta x||$, the higher-order term $2 delta x^T P g(delta x)$ is strictly overpowered by the quadratic term.
  Therefore, in a sufficiently small neighborhood of the origin:
  $ dot(V)(delta x) < 0 quad text("for all ") delta x != 0. $
  
  By the Local Asymptotic Stability theorem of the Direct Method, the equilibrium $x^*$ is locally asymptotically stable.
]

#definition[Quadratic Lyapunov Function for Linear Systems][
  For the linear system $x' = A x$, a standard candidate is
  $ V(x) = x^T P x, $
  where $P = P^T > 0$. Along trajectories,
  $ dot(V) = x^T (A^T P + P A) x. $
  If $A^T P + P A < 0$, then the origin is asymptotically stable.
]

=== Solved Problems

#solved_problem[Checking Negative Definiteness for a Linearized Model][
  For the linearized system $delta x' = J delta x$, verify that the quadratic Lyapunov function $V = delta x^T P delta x$ yields $dot(V) = delta x^T (J^T P + P J) delta x < 0$ when $P$ is chosen as the identity (i.e., both eigenvalues of $J^T + J$ are negative).
]
#solution[
  Compute $J^T + J$ (the symmetric part of $J$). If all eigenvalues of this symmetric matrix are strictly negative, then $dot(V) < 0$ for all $delta x != 0$. This confirms local stability and, under appropriate conditions on the nonlinear terms, global stability.
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
  $ m_1 ||x||^2 <= V(x) <= m_2 ||x||^2 $
  and
  $ dot(V)(x) <= - alpha ||x||^2 $
  in a neighborhood of the origin.
  1. Show that $V(t) <= V(0) e^(-(alpha/m_2) t)$.
  2. Derive an exponential norm estimate for $||x(t)||$ in terms of $||x(0)||$.
  3. Interpret the result as a quantitative stability statement.
  *Hint:* Convert the inequality for $dot(V)$ into a scalar differential inequality in $V(t)$.
]

== Biomathematical Stability in Glucose-Insulin Dynamics

In this section, we specialize the previous stability tools to physiological models, where equilibria represent clinically relevant states such as normoglycemia and chronic hyperglycemia.

=== Mathematical Review

#definition[Candidate Lyapunov Function for Glucose-Insulin][
  For a glucose-insulin model with equilibrium $(G^*, I^*)$, define
  $ V(G, I) = (G - G^*)^2 + c (I - I^*)^2 $
  for some constant $c > 0$. If $dot(V)$ is negative definite in a neighborhood (or globally on an invariant region), trajectories return to the healthy equilibrium.
]

#definition[Clinical Interpretation of Stability][
  In biomathematics, local asymptotic stability of a healthy equilibrium means small physiological perturbations (meal load, transient stress, hormonal fluctuations) decay over time. Loss of stability indicates persistent dysregulation, which may correspond to progression toward pathological states.
]

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
  $ x' = f(x) + B u(t), quad ||u(t)|| <= u_max. $
  1. Explain why strict asymptotic convergence to equilibrium may be replaced by convergence to a small neighborhood.
  2. Formulate a Lyapunov inequality that implies practical stability under bounded input.
  3. Interpret this in terms of clinically acceptable glycemic variability.
  *Hint:* Derive an estimate of the form $dot(V) <= -c_1 ||x-x^*||^2 + c_2 ||u||^2$.
]

#supplementary[Basin-of-Attraction Estimate for Safe Operating Region][
  Let $V(G,I)$ be a Lyapunov candidate around a healthy equilibrium $(G^*, I^*)$.
  1. Define a sublevel set $Omega_r = {(G,I): V(G,I) <= r}$.
  2. State conditions under which $Omega_r$ is a certified safe operating region.
  3. Explain how increasing $r$ can eventually violate invariance.
  4. Propose how this estimate can guide treatment thresholds.
  *Hint:* Check the sign of $dot(V)$ on the boundary $V=r$.
]

