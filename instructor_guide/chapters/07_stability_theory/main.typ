#import "../../../utils.typ": *

= Stability Theory

== Mathematical Stability Theory

=== Supplementary Problems

#supplementary[Constructing a Weighted Quadratic Lyapunov Function][
  Consider the linearized system $delta x' = J delta x$ with $delta x = (delta x_1, delta x_2)^T$.
  1. Propose a weighted quadratic candidate $V = p_1 (delta x_1)^2 + p_2 (delta x_2)^2$ with $p_1, p_2 > 0$.
  2. Compute $dot(V)$ explicitly in terms of the entries of $J$.
  3. Derive sufficient inequalities on $p_1, p_2$ that make $dot(V)$ negative definite.
  4. Interpret how changing $p_1 / p_2$ changes the relative penalization of state deviations.
]
#solution[
  *1. Candidate and Matrix Form:*
  The candidate is $V(delta x) = delta x^T P delta x$ where $P = mat(p_1, 0; 0, p_2)$ with $p_i > 0$.

  *2. Time Derivative:*
  Along trajectories, $dot(V) = delta x^T (J^T P + P J) delta x$. Let $J = mat(a, b; c, d)$.
  $ J^T P + P J = mat(a, c; b, d) mat(p_1, 0; 0, p_2) + mat(p_1, 0; 0, p_2) mat(a, b; c, d) = mat(2 a p_1, b p_1 + c p_2; b p_1 + c p_2, 2 d p_2). $
  Thus, $dot(V) = 2 a p_1 delta x_1^2 + 2 (b p_1 + c p_2) delta x_1 delta x_2 + 2 d p_2 delta x_2^2$.

  *3. Negative Definiteness Conditions:*
  Using Sylvester's criterion, the symmetric matrix $M = J^T P + P J$ is negative definite if:
  - $2 a p_1 < 0 => a < 0$ (since $p_1 > 0$).
  - $det(M) = (2 a p_1)(2 d p_2) - (b p_1 + c p_2)^2 > 0$.
  This simplifies to $4 a d p_1 p_2 > (b p_1 + c p_2)^2$.

  *4. Interpretation:*
  The ratio $p_1 / p_2$ represents the "importance" or "stiffness" assigned to glucose vs. insulin deviations. A large $p_1$ relative to $p_2$ implies that small errors in glucose are considered more "energetic" (costly) than corresponding errors in insulin.
]

#supplementary[Invariant Level Sets and Basins of Attraction][
  For a nonlinear planar system $x' = f(x)$ with equilibrium $x^*$ and Lyapunov function $V(x)$:
  1. Define the sublevel set $Omega_c = {x in RR^2 : V(x) <= c}$.
  2. State conditions under which $Omega_c$ is positively invariant.
  3. Explain how invariant sublevel sets provide inner estimates of the basin of attraction of $x^*$.
  4. Apply this reasoning qualitatively to a nonlinear planar model near a stable equilibrium.
]
#solution[
  *1. Definition:*
  $Omega_c$ is the set of all states where the Lyapunov "energy" is less than or equal to $c$. Geometrically, this is the interior of the curve $V(x) = c$.

  *2. Invariance Condition:*
  $Omega_c$ is positively invariant if $dot(V)(x) <= 0$ for all $x$ on the boundary $V(x) = c$. This ensures that once a trajectory enters $Omega_c$, it can never cross the boundary outward because $V$ is non-increasing.

  *3. Basin of Attraction Estimate:*
  The basin of attraction is the set of all points that converge to $x^*$. If $Omega_c$ is a compact set where $dot(V) < 0$ (except at $x^*$), then every trajectory starting in $Omega_c$ stays in $Omega_c$ and converges to $x^*$. Thus, $Omega_c$ is an *inner estimate* (a subset) of the true basin.

  *4. Qualitative Application:*
  In glucose regulation, if $V$ is a distance from the normoglycemic state, a certified $Omega_c$ defines a "safe zone" where the patient's metabolism is guaranteed to return to equilibrium despite initial disturbances.
]

#supplementary[Indirect Method and Stability Classification][
  Let the Jacobian at an equilibrium be $J = mat(a, b; c, d)$.
  1. Express the trace and determinant of $J$.
  2. Write the linear stability conditions in terms of $text("tr")(J)$ and $det(J)$.
  3. Classify the equilibrium type for each case: (i) $det(J) < 0$, (ii) $det(J) > 0$ and $text("tr")(J) < 0$, (iii) $det(J) > 0$ and $text("tr")(J) > 0$.
  4. Explain why linear asymptotic stability supports a local Lyapunov argument for the nonlinear model.
]
#solution[
  *1. Definitions:*
  $text("tr")(J) = a + d$ and $det(J) = a d - b c$.

  *2. Stability Conditions:*
  An equilibrium is locally asymptotically stable if all eigenvalues have negative real parts. For a $2 times 2$ matrix, this occurs if and only if:
  $ text("tr")(J) < 0 quad "and" quad det(J) > 0. $

  *3. Classification:*
  - (i) $det(J) < 0$: One positive and one negative real eigenvalue. The origin is a *saddle point* (unstable).
  - (ii) $det(J) > 0, text("tr")(J) < 0$: Real parts are negative. The origin is a *stable node or focus*.
  - (iii) $det(J) > 0, text("tr")(J) > 0$: Real parts are positive. The origin is an *unstable node or focus*.

  *4. Local Lyapunov Argument:*
  If the linearization is asymptotically stable, there exists a quadratic Lyapunov function $V(x) = x^T P x$ for the linear part. By Taylor's theorem, for sufficiently small $x$, the linear terms dominate $dot(V)$, ensuring $dot(V) < 0$ locally for the full nonlinear system.
]

#supplementary[Lyapunov Equation for a $2 times 2$ Stable Matrix][
  Let $A = mat(-2, 1; -3, -4)$ and choose $Q = I$.
  1. Solve the continuous Lyapunov equation $A^T P + P A = -Q$ for the symmetric matrix $P$.
  2. Verify that $P$ is positive definite.
  3. Conclude asymptotic stability of the origin for $x' = A x$ using $V(x) = x^T P x$.
]
#solution[
  *1. Matrix Calculation:*
  Let $P = mat(p_1, p_2; p_2, p_3)$. The equation is:
  $ mat(-2, -3; 1, -4) mat(p_1, p_2; p_2, p_3) + mat(p_1, p_2; p_2, p_3) mat(-2, 1; -3, -4) = mat(-1, 0; 0, -1). $
  Expanding:
  $ mat(-4 p_1 - 6 p_2, p_1 - 6 p_2 - 3 p_3; p_1 - 6 p_2 - 3 p_3, 2 p_2 - 8 p_3) = mat(-1, 0; 0, -1). $
  Solving the system:
  - $(1) -4 p_1 - 6 p_2 = -1$
  - $(2) p_1 - 6 p_2 - 3 p_3 = 0$
  - $(3) 2 p_2 - 8 p_3 = -1$
  From (3), $p_2 = 4 p_3 - 0.5$. Substitute into (1): $-4 p_1 - 24 p_3 + 3 = -1 => p_1 = 1 - 6 p_3$.
  Substitute both into (2): $(1 - 6 p_3) - 6(4 p_3 - 0.5) - 3 p_3 = 0 => 1 - 6 p_3 - 24 p_3 + 3 - 3 p_3 = 0 => 33 p_3 = 4 => p_3 = 4/33$.
  Then $p_1 = 1 - 24/33 = 9/33 = 3/11$ and $p_2 = 4(4/33) - 1/2 = 16/33 - 16.5/33 = -0.5/33 = -1/66$.
  $ P = mat(9/33, -1/66; -1/66, 4/33). $

  *2. Definiteness Check:*
  - $p_1 = 9/33 > 0$.
  - $det(P) = (9/33)(4/33) - (-1/66)^2 = 36/1089 - 1/4356 = 144/4356 - 1/4356 = 143/4356 > 0$.
  Since $p_1 > 0$ and $det(P) > 0$, $P$ is positive definite.

  *3. Conclusion:*
  Since we found a $P > 0$ such that $A^T P + P A = -I < 0$, the origin is globally asymptotically stable.
]

#supplementary[Exponential Decay Bound from a Quadratic Lyapunov Function][
  Suppose for a nonlinear system there exists $V(x)$ and constants $m_1, m_2, alpha > 0$ such that $m_1 ||x||^2 <= V(x) <= m_2 ||x||^2$ and $dot(V)(x) <= - alpha ||x||^2$ in a neighborhood of the origin.
  1. Show that $V(t) <= V(0) e^(-(alpha / m_2) t)$.
  2. Derive an exponential norm estimate for $||x(t)||$ in terms of $||x(0)||$.
  3. Interpret the result as a quantitative stability statement.
]
#solution[
  *1. Differential Inequality:*
  From the bound $V(x) <= m_2 ||x||^2$, we have $||x||^2 >= V(x) / m_2$.
  Substituting into the bound for $dot(V)$:
  $ dot(V) <= -alpha ||x||^2 <= -(alpha / m_2) V. $
  Integrating this first-order inequality gives $V(t) <= V(0) e^(-(alpha / m_2) t)$.

  *2. Norm Estimate:*
  Using $m_1 ||x(t)||^2 <= V(t)$ and $V(0) <= m_2 ||x(0)||^2$:
  $ m_1 ||x(t)||^2 <= m_2 ||x(0)||^2 e^(-(alpha / m_2) t) $
  $ ||x(t)|| <= sqrt(m_2 / m_1) ||x(0)|| e^(-(alpha / (2 m_2)) t). $

  *3. Interpretation:*
  This shows not only that the system is stable, but that it converges at a guaranteed *geometric rate*. The term $sqrt(m_2 / m_1)$ represents the potential "transient overshoot" before the exponential decay dominates.
]

== Biomathematical Stability in Glucose-Insulin Dynamics

=== Supplementary Problems

#supplementary[Energy Interpretation in a Metabolic Model][
  Explain why $V(G, I)$ can be interpreted as a weighted metabolic distance from the healthy state $(G^*, I^*)$, and what it means clinically when $dot(V) < 0$.
]
#solution[
  *Weighted Distance:*
  The function $V(G, I) = p_1(G-G^*)^2 + p_2(I-I^*)^2$ behaves like a squared Euclidean distance, where the weights $p_1, p_2$ adjust the sensitivity to glucose vs. insulin errors. It measures the "disequilibrium energy" of the patient.

  *Clinical Meaning:*
  $dot(V) < 0$ implies that the patient's physiological state is moving closer to the target equilibrium. Chronically, $dot(V) < 0$ indicates effective homeostatic control, whereas $dot(V) > 0$ would indicate metabolic collapse or divergence towards hyperglycemia.
]

#supplementary[LaSalle Invariance Principle in a Metabolic Setting][
  Assume a candidate Lyapunov function satisfies $dot(V)(x) <= 0$ in a compact positively invariant set $Omega$.
  1. Define the set $E = {x in Omega : dot(V)(x) = 0}$.
  2. Determine the largest invariant subset $M subset E$ in a model where $dot(V) = 0$ implies $G = G^*$ and $I$ may vary.
  3. Use LaSalle's invariance principle to conclude whether trajectories converge to $(G^*, I^*)$.
  4. Discuss what this conclusion means for long-term metabolic regulation.
]
#solution[
  *1. Definition:*
  $E$ is the set of states where the Lyapunov function stops decreasing.

  *2. Invariant Subset:*
  For $M$ to be invariant, any trajectory starting in $M$ must stay in $M$. If $G$ must be $G^*$, then $G'(t) = 0$ for all time. In a model $G' = f(G, I)$, this requires $f(G^*, I(t)) = 0$. If the only value of $I$ satisfying $f(G^*, I) = 0$ is $I^*$, then $M = {(G^*, I^*)}$.

  *3. Convergence:*
  By LaSalle's Theorem, every trajectory in $Omega$ converges to the largest invariant subset $M$. Thus, trajectories converge to $(G^*, I^*)$.

  *4. Regulation Meaning:*
  This clarifies that even if the "energy" $V$ doesn't decrease strictly everywhere (e.g., $dot(V)=0$ on a line), the system dynamics will eventually pull the state to the exact equilibrium.
]

#supplementary[Parameter-Robust Stability of the Healthy Equilibrium][
  Consider a parameterized glucose-insulin model with Jacobian $J(theta)$ at the healthy equilibrium, where $theta$ represents physiological uncertainty.
  1. State a sufficient matrix-based condition ensuring local asymptotic stability for all $theta in [theta_min, theta_max]$.
  2. Explain how trace-determinant inequalities can be used in the planar case.
  3. Discuss the biomedical meaning of robustness with respect to patient variability.
]
#solution[
  *1. Condition:*
  A sufficient condition is that all eigenvalues of $J(theta)$ have negative real parts for every $theta$. Alternatively, requiring $J(theta)^T + J(theta) < 0$ uniformly is a stronger but useful condition.

  *2. Trace-Determinant:*
  Stability is guaranteed if $text("tr")(J(theta)) < 0$ and $det(J(theta)) > 0$ for all $theta$. In practice, one checks if the maximum trace and minimum determinant over the uncertainty range still satisfy the inequalities.

  *3. Biomedical Meaning:*
  Robustness ensures that the patient remains stable despite variability in insulin sensitivity, glucose effectiveness, or lifestyle factors. A model that is "fragile" (stable only for narrow parameter ranges) would not be a good representation of a healthy biological system.
]

#supplementary[Disturbance Rejection and Practical Stability][
  Assume meal intake acts as a bounded disturbance $u(t)$ in a glucose-insulin model: $x' = f(x) + B u(t), quad ||u(t)|| <= u_max$.
  1. Explain why strict asymptotic convergence to equilibrium may be replaced by convergence to a small neighborhood.
  2. Formulate a Lyapunov inequality that implies practical stability under bounded input.
  3. Interpret this in terms of clinically acceptable glycemic variability.
]
#solution[
  *1. Neighborhood Convergence:*
  With a persistent disturbance $u(t) != 0$, the state $x=x^*$ is usually not an equilibrium of the forced system. As long as $u(t)$ is small, the trajectories will be pushed toward $x^*$ by the internal dynamics but never quite reach it.

  *2. Lyapunov Inequality:*
  If $dot(V) <= -c_1 ||x - x^*||^2 + c_2 ||u||^2$, then for large $||x - x^*||$, the negative term dominates and $dot(V) < 0$. The system is "practically stable" because the state remains within the region $||x - x^*||^2 <= (c_2 / c_1) ||u||^2 <= (c_2 / c_1) u_max^2$, which shrinks with the disturbance magnitude.

  *3. Glycemic Variability:*
  Clinically, this corresponds to "Time in Range" (TIR). Practical stability ensures that glucose levels oscillate within a "safe" band around the target rather than drifting towards diabetic levels.
]

#supplementary[Basin-of-Attraction Estimate for Safe Operating Region][
  Let $V(G,I)$ be a Lyapunov candidate around a healthy equilibrium $(G^*, I^*)$.
  1. Define a sublevel set $Omega_r = {(G,I): V(G,I) <= r}$.
  2. State conditions under which $Omega_r$ is a certified safe operating region.
  3. Explain how increasing $r$ can eventually violate invariance.
  4. Propose how this estimate can guide treatment thresholds.
]
#solution[
  *1. Sublevel Set:*
  $Omega_r$ is an ellipse (for quadratic $V$) centered at $(G^*, I^*)$.

  *2. Safety Condition:*
  $Omega_r$ is a certified safe region if $dot(V) < 0$ for all points on its boundary. This ensures that no physiological state starting inside can ever escape to a pathological region (e.g., $G > G_max$).

  *3. Bound Violation:*
  As $r$ increases, the boundary of $Omega_r$ may reach a point where the nonlinear "destabilizing" terms overcome the stabilizing feedback, resulting in $dot(V) >= 0$.

  *4. Treatment thresholds:*
  The largest value of $r$ defines the "limit of regulation." If a patient's state approaches the boundary of this set, it indicates the need for exogenous intervention (e.g., medication) to assist the natural homeostatic feedback.
]

