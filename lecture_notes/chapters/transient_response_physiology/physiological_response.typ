#import "../../../utils.typ": *
== Bolus vs. Continuous Infusion (Step vs. Impulse in Physiology)

=== Mathematical Review

Two fundamental drug administration strategies map directly to classical control test signals:

#definition[Continuous Infusion (Step Input)][
  Drug is administered at a constant rate $R(t) = R_0 u(t)$. The blood concentration rises exponentially to a new steady state: $C(t) = C^*(1 - e^(-k t))$. This mirrors a step response in a first-order system.
]

#definition[Bolus Injection (Impulse Input)][
  The total dose $D_0$ is delivered instantaneously at $t=0$, modeled as $R(t) = D_0 delta(t)$. The subsequent washout follows: $C(t) = D_0/V dot e^(-k t)$. This mirrors an impulse response.
]

#definition[Homeostasis as Biological Steady State][
  *Homeostasis* is the physiological equivalent of the engineering steady state: the condition where all internal variables are maintained within tightly bounded reference ranges. The biological "controller" (pancreas, liver, kidneys) continuously adjusts its output to reject disturbances (meals, stress, exercise) and drive the system back toward its set-point.
]

=== Solved Problems

#solved_problem[Bolus vs. Infusion Concentration Profiles][
  Sketch the qualitative $C(t)$ for a $100$ mg bolus versus a $100$ mg/hr infusion in a one-compartment system with $k = 1$ $"hr"^(-1)$.
]
#solution[
  - *Bolus:* $C(0^+) = 100/V$ mg/L, decaying as $C(t) = (100/V) e^{-t}$.
  - *Infusion:* $C(0) = 0$, rising to $C^* = 100/1 = 100/V$ mg/L asymptotically. Both reach the same $C^*$ but via opposite trajectories.
]

=== Supplementary Problems

#supplementary[Repeated Dosing Steady State][
  For a bolus administered every $T$ hours, show the average steady-state concentration equals $D_0 / (k T V)$.
]
