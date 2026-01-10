#import "../../utils.typ": *
== Reduction of Parameter Variation via Feedback

=== Mathematical Review

Feedback control reduces the sensitivity of system performance to parameter variations and disturbances.

#definition[Sensitivity Function][
  Sensitivity of closed-loop transfer function $T$ to plant parameter $p$:
  $ S_p^T = (partial T)/(partial p) dot p/T $
]

#example[Sensitivity to Gain][
  For $T = (K G)/(1 + K G)$:
  $ S_K^T = (partial T)/(partial K) dot K/T = 1/(1 + K G) $
  As $K -> infinity$, $S_K^T -> 0$ (low sensitivity).
]

#theorem[Feedback Reduces Sensitivity][
  With high loop gain $K G >> 1$:
  $ T approx 1/H quad "(independent of" G")" $
  where $H$ is feedback transfer function.
]

#example[Parameter Insensitivity][
  Open-loop: $y = G u$ (fully dependent on $G$)
  Closed-loop: $y = G/(1 + G H) r approx 1/H r$ (independent of $G$ for high gain)
]

#definition[Disturbance Rejection][
  For disturbance $d$ entering at plant output:
  $ Y(s) = (G/(1 + G H))R(s) + (1/(1 + G H))D(s) $
  High $G H$ reduces disturbance effect.
]

#example[Disturbance Attenuation][
  With $G H = 100$:
  $ Y(s) = (100/101)R(s) + (1/101)D(s) $
  Disturbance is attenuated by factor of 101.
]

=== Solved Problems

#solved_problem[Calculate Sensitivity Reduction][
  Compare open-loop and closed-loop sensitivity for $G = K/(s+1)$ with unity feedback.
]
#solution[
  *Open-loop:* $T_("ol") = K/(s+1)$
  $ S_K^(T_("ol")) = (partial T_("ol"))/(partial K) dot K/T_("ol") = 1 $

  *Closed-loop:* $T_("cl") = K/(s+1+K)$
  $ S_K^(T_("cl")) = (partial T_("cl"))/(partial K) dot K/T_("cl") = (s+1)/(s+1+K) $

  At steady-state ($s=0$):
  $ S_K^(T_("cl")) = 1/(1+K) $

  For $K=10$: sensitivity reduced by factor of 11.
]

#solved_problem[Disturbance Rejection Design][
  Design controller to reject disturbance by 95% at steady-state.
]
#solution[
  Disturbance transfer function:
  $ Y(s)/D(s) = 1/(1 + G(s)C(s)) $

  At steady-state ($s=0$), require:
  $ |Y(0)/D(0)| = 1/(1 + G(0)C(0)) <= 0.05 $

  Solving:
  $ 1 + G(0)C(0) >= 20 $
  $ G(0)C(0) >= 19 $

  If $G(0) = 2$, then $C(0) >= 9.5$.
  Use PI controller with $K_i$ large enough.
]

=== Supplementary Problems

#supplementary[Robustness Analysis][
  Analyze robustness to 20% variation in plant gain.
]

#supplementary[Multiple Disturbances][
  Design controller to reject disturbances at different frequencies.
]

#supplementary[Measurement Noise][
  Balance disturbance rejection with noise amplification.
]
