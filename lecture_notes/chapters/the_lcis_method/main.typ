#import "../../../utils.typ": *
= The LCIS Method

This chapter formalizes the Localization of Compact Invariant Sets (LCIS) method using localizing functions to determine maximum biological state bounds analytically, without numerical solvers.

== Localizing Functions and the LCIS Method

=== Mathematical Review

#definition[Lie Derivative and the LCIS Principle][
  For the system $x' = f(x)$ and a smooth function $h: RR^n -> RR$, the *Lie derivative* is:
  $ L_f h(x) = nabla h(x) dot f(x) = sum_i (partial h)/(partial x_i) f_i(x) $
  Define $S_h = {x : L_f h(x) = 0}$. All compact invariant sets are bounded by the extremes of $h$ on $S_h$.
]

#theorem[Theorem 1 (Primary Localization Bound)][
  Every compact invariant set is contained within $K_h = {x : h_"min"^(S_h) <= h(x) <= h_"max"^(S_h)}$.
]

#theorem[Theorem 2 (Iterative Tightening)][
  Given localizing functions $h_1, h_2, dots$, the refined localizing set is:
  $K = K_(h_1) inter K_(h_2) inter dots$
  Each additional function tightens the bound.
]

=== Solved Problems

#solved_problem[Computing $G_"max"$ (Theorem 1)][
  For $G' = P_G - k_1 G - k_2 I G$ with $I >= 0$, use $h = G$.
]
#solution[
  $ L_f h = P_G - G(k_1 + k_2 I) = 0 => G = P_G / (k_1 + k_2 I) $
  Maximised at $I = 0$:
  $ G_"max" = P_G / k_1 $
  All trajectories satisfy $G(t) <= P_G / k_1$ for all time. $square$
]

#solved_problem[Computing $I_"max"$ (Theorem 2)][
  For $I' = beta f(G) - gamma I$ with $f(G) <= 1$ and $G <= G_"max"$, use $h = I$.
]
#solution[
  $ L_f h = I' = beta f(G) - gamma I = 0 => I = (beta f(G)) / gamma $
  Since $f(G) <= 1$ for all $G$ (sigmoid saturation):
  $ I_"max" = beta / gamma $
  Combining with Theorem 2: all invariant sets satisfy $I(t) <= beta/gamma$. $square$
]

#solved_problem[Computing $B_"max"$ (Theorem 2 — iterative)][
  For $beta' = beta(r(G) - d(G))$ where $r(G) <= r_"max"$ and $d(G) >= d_"min" > 0$, use $h = beta$.
]
#solution[
  $ L_f h = beta' = beta(r(G) - d(G)) = 0 $
  At $beta = 0$ the trivial solution holds. For $beta > 0$: $r(G) = d(G)$. The beta-cell mass is bounded by the maximum achievable when glucose is at its physiological equilibrium $G_1^*$:
  $ B_"max" = beta_0 $
  where $beta_0$ is the initial beta-cell mass. Since $r(G) < d(G)$ for sustained $G > G^*$, beta-cell mass is monotonically bounded above by its initial value. $square$
]

=== Supplementary Problems

#supplementary[The Localization Set][
  Combining all three Theorem 2 bounds, write out the full localization set $K subset RR_+^3$ for the Topp/Mohammed model in terms of $P_G$, $k_1$, $beta$, $gamma$, and $beta_0$.
]

