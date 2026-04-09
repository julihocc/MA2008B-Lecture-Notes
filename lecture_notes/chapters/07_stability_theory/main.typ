#import "../../../utils.typ": *
= Stability Theory

This chapter covers Lyapunov's indirect and direct methods, with applications to proving local and global stability in metabolic glucose-insulin models.

*Learning objectives:*
- Construct Lyapunov candidates for planar metabolic models.
- Use matrix inequalities to verify local asymptotic stability.
- Apply invariant-set reasoning to estimate basins of attraction.
- Distinguish linearized stability conclusions from nonlinear global claims.

== Global Stability of Metabolic Models (Lyapunov Direct Method)

=== Mathematical Review

#theorem[Lyapunov Direct Method for Bio-Systems][
  If there exists a continuously differentiable scalar function $V(x) > 0$ with $V(x^*) = 0$ at the equilibrium $x^*$, and $dot(V)(x) < 0$ along all trajectories of $x' = f(x)$, then $x^*$ is globally asymptotically stable.
]

#definition[Candidate Lyapunov Function for Glucose-Insulin][
  For the minimal model with equilibrium $(G^*, I^*)$, define:
  $ V(G, I) = (G - G^*)^2 + c (I - I^*)^2 $
  for some constant $c > 0$. Then $dot(V)$ is evaluated along the system trajectories. Negative definiteness of $dot(V)$ guarantees all glucose-insulin trajectories return to the healthy equilibrium.
]

=== Solved Problems

#solved_problem[Checking Negative Definiteness][
  For the linearized system $delta x' = J delta x$ near $P_1$, verify that the quadratic Lyapunov function $V = delta x^T P delta x$ yields $dot(V) = delta x^T (J^T P + P J) delta x < 0$ when $P$ is chosen as the identity (i.e., both eigenvalues of $J^T + J$ are negative).
]
#solution[
  Compute $J^T + J$ (the symmetric part of $J$). If all eigenvalues of this symmetric matrix are strictly negative, then $dot(V) < 0$ for all $delta x != 0$. This confirms local stability and, under appropriate conditions on the nonlinear terms, global stability.
]

=== Supplementary Problems

#supplementary[Energy Interpretation][
  Explain why $V(G, I)$ can be interpreted as the "metabolic energy distance" from the healthy state $(G^*, I^*)$, and what it means clinically when $dot(V) < 0$.
  *Hint:* Interpret each quadratic term as a weighted deviation penalty from equilibrium.
]

#supplementary[Constructing a Weighted Quadratic Lyapunov Function][
  Consider the linearized system $delta x' = J delta x$ with $delta x = (delta G, delta I)^T$.
  1. Propose a weighted quadratic candidate $V = p_1 (delta G)^2 + p_2 (delta I)^2$ with $p_1, p_2 > 0$.
  2. Compute $dot(V)$ explicitly in terms of the entries of $J$.
  3. Derive sufficient inequalities on $p_1, p_2$ that make $dot(V)$ negative definite.
  4. Interpret how changing $p_1/p_2$ changes the relative penalization of glucose and insulin deviations.
  *Hint:* Write $dot(V)$ as a quadratic form in $(delta G, delta I)$ and apply definiteness conditions.
]

#supplementary[Invariant Level Sets and Basins of Attraction][
  For a nonlinear planar system $x' = f(x)$ with equilibrium $x^*$ and Lyapunov function $V(x)$:
  1. Define the sublevel set $Omega_c = {x in RR^2 : V(x) <= c}$.
  2. State conditions under which $Omega_c$ is positively invariant.
  3. Explain how invariant sublevel sets provide inner estimates of the basin of attraction of $x^*$.
  4. Apply this reasoning qualitatively to glucose-insulin dynamics near a healthy equilibrium.
  *Hint:* Use $dot(V) <= 0$ on $Omega_c$ to show trajectories cannot cross outward through the boundary.
]

#supplementary[LaSalle Invariance Principle in a Metabolic Setting][
  Assume a candidate Lyapunov function satisfies $dot(V)(x) <= 0$ in a compact positively invariant set $Omega$.
  1. Define the set $E = {x in Omega : dot(V)(x) = 0}$.
  2. Determine the largest invariant subset $M subset E$ in a model where $dot(V)=0$ implies $G=G^*$ and $I$ may vary.
  3. Use LaSalle's invariance principle to conclude whether trajectories converge to $(G^*, I^*)$.
  4. Discuss what this conclusion means for long-term metabolic regulation.
  *Hint:* Characterize all states in $E$ that remain in $E$ under system dynamics.
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

