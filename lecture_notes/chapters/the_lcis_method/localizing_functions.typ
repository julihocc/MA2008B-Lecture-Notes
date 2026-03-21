#import "../../../utils.typ": *
== Localizing Functions and Theorems 1 & 2

=== Mathematical Review

#definition[Lie Derivative and the LCIS Principle][
  Given the system $x' = f(x)$ and a smooth function $h: RR^n -> RR$, the *Lie derivative* is:
  $ L_f h(x) = nabla h(x) dot f(x) = sum_i (partial h)/(partial x_i) f_i(x) $
  Define the set $S_h = {x : L_f h(x) = 0}$. All compact invariant sets (equilibria, limit cycles, attractors) must reside inside the domain restricted by the extremes of $h$ on $S_h$.
]

#theorem[Theorem 1 (Primary Localization Bound)][
  Let $Omega_h = [h_"min"^(S_h), h_"max"^(S_h)]$ be the range of $h$ over $S_h$. Then every compact invariant set is contained in the compact localizing set $K_h = {x : h(x) in Omega_h}$.
]

#theorem[Theorem 2 (Iterative Tightening)][
  Given two localizing functions $h_1$ and $h_2$, the refined localizing set is $K = K_{h_1} inter K_{h_2}$. Applying multiple localizing functions successively yields tighter and tighter bounds.
]

=== Solved Problems

#solved_problem[Computing $G_"max"$ via LCIS][
  For $G' = P_G - k_1 G - k_2 I G$ with $I >= 0$, use $h = G$ and Theorem 1 to find the maximum possible glucose level.
]
#solution[
  $ L_f h = G' = P_G - G(k_1 + k_2 I) $
  On $S_h$: $G = P_G / (k_1 + k_2 I)$.
  This is maximized when $I = 0$:
  $ G_"max" = P_G / k_1 $
  Therefore, all invariant sets satisfy $G(t) <= P_G / k_1$ for all time. $square$
]

=== Supplementary Problems

#supplementary[Computing $I_"max"$][
  Apply Theorem 1 to $I' = beta f(G) - gamma I$ using $h = I$ and the bound $G <= G_"max"$ to derive $I_"max"$.
]
