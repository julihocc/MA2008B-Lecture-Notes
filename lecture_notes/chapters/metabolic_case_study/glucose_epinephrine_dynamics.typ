#import "../../../utils.typ": *
== Glucose-Insulin-Epinephrine: A Complete Case Study

=== Mathematical Review

#definition[The Three-Component Stress Model (RMIB 2024)][
  $ G' &= P_G + P_(G,e)(E) - (S_I - rho E) I G - k_1 G \
    I' &= beta(1 - alpha E) f(G) - gamma I \
    E' &= -k_E E + D(t) $
  *Parameters (RMIB 2024 nominal values):*
  - $P_G = 864$ mg/dL/day (hepatic glucose production)
  - $k_1 = 6.6$ $"day"^(-1)$ (insulin-independent clearance)
  - $S_I = 36$ dL/(mg$dot$day) (insulin sensitivity)
  - $gamma = 0.2$ $"day"^(-1)$ (insulin decay)
  - $k_E = 10$ $"day"^(-1)$ (Epinephrine clearance)
  - $rho = 0.3$ dL/(mg$dot$day) per unit $E$ (sensitivity impairment)
  - $alpha = 0.1$ per unit $E$ (secretion suppression)
]

=== Solved Problems

#solved_problem[Stress-Induced Increase in $G_"max"$][
  At sustained stress $E = E^*$, apply Theorem 1 with $h = G$ to quantify the shift in maximum glucose bound.
]
#solution[
  $ L_f h = P_G + P_(G,e)(E^*) - G((S_I - rho E^*) I + k_1) = 0 $
  At $I = 0$ (worst case):
  $ G_"max"(E^*) = (P_G + P_(G,e)(E^*)) / k_1 $
  Compared to the stress-free bound $P_G/k_1$, the shift is:
  $ Delta G_"max" = P_(G,e)(E^*) / k_1 $
  Additionally, the effective insulin sensitivity drops to $(S_I - rho E^*)$. For $E^* > S_I/rho$, the insulin term *inverts*, making control catastrophic. At $rho = 0.3$ and $S_I = 36$: critical Epinephrine $E_c = 36/0.3 = 120$ units — a physiologically extreme but clinically relevant threshold (e.g., severe septic shock).
]

#solved_problem[Epinephrine Clearance Time][
  The stress pulse $D(t) = D_0 delta(t)$ produces $E(0^+) = D_0/k_E$. Compute the time to clear $95%$ of Epinephrine and the time for $G_"max"$ to return to baseline.
]
#solution[
  Epinephrine decays as $E(t) = E_0 e^(-k_E t)$ with $k_E = 10$ $"day"^(-1) = 0.0069$ $"min"^(-1)$:
  $ 0.05 = e^(-k_E t_"clear") => t_"clear" = ln(20)/k_E approx 300/k_E "min" $
  With $k_E = 10$ $"day"^(-1)$: $t_"clear" approx 300/(10 times 1440) approx 20$ minutes. Glucose bounds recover once $P_(G,e)(E) approx 0$, i.e., after $approx 3$–$4$ Epinephrine half-lives ($approx 30$ min post-stress).
]

=== Supplementary Problems

#supplementary[Impact of $rho$ on the Safety Margin][
  Define the insulin sensitivity safety margin as $M = S_I - rho E^*$. Show that $M < 0$ implies the insulin action term in the $G$-equation *reverses sign*, turning insulin into a glucose-elevating agent. What is the minimum tolerable $E^*$ for a patient with reduced $S_I = 10$ and $rho = 0.3$?
]

#supplementary[Full LCIS Bounds Under Stress][
  Applying Theorem 2 to the stressed system, derive all three bounds $G_"max"(E^*)$, $I_"max"(E^*)$, and $B_"max"(E^*)$. Show how each shifts as $E^*$ increases.
]
