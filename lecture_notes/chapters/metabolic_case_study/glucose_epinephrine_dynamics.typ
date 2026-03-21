#import "../../../utils.typ": *
== Glucose-Insulin-Epinephrine: A Complete Case Study

=== Mathematical Review

#definition[The Three-Component Stress Model (RMIB 2024)][
  $ G' &= P_G + P_(G,e)(E) - (S_I - rho E) I G - k_1 G \
    I' &= beta(1 - alpha E) f(G) - gamma I \
    E' &= -k_E E + D(t) $
  where $E(t)$ models circulating Epinephrine, $D(t)$ is the stress impulse magnitude, $rho$ captures insulin sensitivity impairment, and $alpha$ quantifies secretion suppression.
]

=== Solved Problems

#solved_problem[Stress-Induced Increase in $G_"max"$][
  At sustained stress level $E = E^*$, use the LCIS method with $h = G$ to show that $G_"max"$ increases compared to the stress-free state.
]
#solution[
  $ L_f h = G' = P_G + P_(G,e)(E^*) - G((S_I - rho E^*) I + k_1) $
  At $I = 0$ (worst case): $G_"max" = (P_G + P_(G,e)(E^*)) / k_1$.
  Since $P_(G,e)(E^*) > 0$, this bound is strictly greater than the stress-free bound $P_G / k_1$. The positive shift directly quantifies the danger of sustained epinephrine elevation.
]

=== Supplementary Problems

#supplementary[Epinephrine Half-Life][
  The Epinephrine subsystem $E' = -k_E E$ after the stress pulse passes yields $E(t) = E_0 e^(-k_E t)$. If $k_E = 0.5$ $"min"^(-1)$, compute the time required for $E$ to fall below $5%$ of its peak value. Interpret the result clinically.
]
