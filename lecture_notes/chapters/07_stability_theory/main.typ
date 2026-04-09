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

#theorem[Lyapunov Direct Method][
  If there exists a continuously differentiable scalar function $V(x) > 0$ with $V(x^*) = 0$ at the equilibrium $x^*$, and $dot(V)(x) < 0$ along all trajectories of $x' = f(x)$, then $x^*$ is globally asymptotically stable.
]

#theorem[Lyapunov Indirect Method (Linearization)][
  Consider an equilibrium $x^*$ of a nonlinear system $x' = f(x)$ with Jacobian matrix $J(x^*)$.
  - If all eigenvalues of $J(x^*)$ satisfy $text("Re")(lambda_i) < 0$, then $x^*$ is locally asymptotically stable.
  - If at least one eigenvalue satisfies $text("Re")(lambda_i) > 0$, then $x^*$ is unstable.
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

