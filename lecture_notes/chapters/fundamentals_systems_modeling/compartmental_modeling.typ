#import "../../../utils.typ": *
== Compartmental Modeling and Mass Balance

=== Mathematical Review

A computational model of a biological system starts from mass balance principles. Each compartment represents a kinetically homogeneous region where the rate of concentration change equals production minus clearance.

#definition[Mass Balance in a Compartment][
  For a scalar state variable $C(t)$ representing concentration in a compartment with volume $V$:
  $ V dot C'(t) = P(t) - Q(C) $
  where $P(t)$ is the external production/infusion rate and $Q(C)$ is the clearance rate.
  For linear clearance: $Q(C) = k V C$, giving $C' = P(t)/V - k C$.
]

#definition[Production vs. Clearance (Aclaramiento)][
  - *Production:* Inflow from external sources (infusion, endogenous synthesis).
  - *Clearance:* Rate of removal from the compartment, often modeled as first-order decay $k C$ or Michaelis-Menten saturation $V_"max" C / (K_m + C)$.
]

=== Solved Problems

#solved_problem[One-Compartment Equilibrium][
  Find the steady-state drug concentration for constant infusion $P_0$ into a single compartment with first-order clearance rate $k$.
]
#solution[
  At equilibrium, $C' = 0$:
  $ 0 = P_0 - k C^* => C^* = P_0 / k $
]

=== Supplementary Problems

#supplementary[Michaelis-Menten Steady State][
  Replace linear clearance with Michaelis-Menten kinetics. Show that the equilibrium satisfies $P_0 = V_"max" C^* / (K_m + C^*)$ and solve for $C^*$.
]
