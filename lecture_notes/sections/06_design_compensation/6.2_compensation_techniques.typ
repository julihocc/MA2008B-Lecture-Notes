#import "../../utils.typ": *
== Compensation Techniques

=== Mathematical Review

*Compensation* involves adding networks to improve system performance while maintaining stability. The three primary types are lead, lag, and lead-lag compensators.

#definition[Phase Lead Compensation][
  A lead compensator adds phase advance in a specific frequency range:
  $ G_c(s) = K (1 + alpha tau s)/(1 + tau s)$ where $0 < alpha < 1$
  Maximum phase lead: $phi_m = sin^(-1)((1 - alpha)/(1 + alpha))$
  Occurs at frequency: $omega_m = 1/(tau sqrt(alpha))$
]

#definition[Phase Lag Compensation][
  A lag compensator adds attenuation at high frequencies:
  $ G_c(s) = K (1 + tau s)/(1 + beta tau s)$ where $beta > 1$
  Improves steady-state accuracy while maintaining stability.
]

#definition[Lead-Lag Compensation][
  Combines both phase lead and lag characteristics:
  $ G_c(s) = K (1 + tau_1 s)/(1 + alpha tau_1 s) × (1 + tau_2 s)/(1 + beta tau_2 s)$
  Provides phase lead and improved steady-state performance.
]

=== Design Procedures

#theorem[Lead Compensator Design][
  Design steps for phase lead compensation:
  1. Determine required phase margin $P_M_(r e q)$
  2. Calculate additional phase needed: $phi = P_M_(r e q) - P_M_(c u r r e n t) + s a f e t y m a r g i n$
  3. Compute lead parameter: $alpha = (1 - sin(phi))/(1 + sin(phi))$
  4. Place zero and pole: $omega_z = omega_(g c) sqrt(alpha)$, $omega_p = omega_z/alpha$
  5. Adjust gain for desired crossover frequency
]

#example[Lead Design Example][
  For system with $G(s) = 10/(s(s+2))$, design lead compensator for $P_M = 45°$.
]
#solution[
  Step 1: Current phase margin is $15°$ at $omega = 2$ rad/s
  Step 2: Additional phase needed: $phi = 45° - 15° + 5° = 35°$
  Step 3: $alpha = (1 - sin(35°))/(1 + sin(35°)) = 0.27$
  Step 4: $omega_z = 2 sqrt(0.27) = 1.04$ rad/s, $omega_p = 3.85$ rad/s
  Step 5: $G_c(s) = (1 + 0.96s)/(1 + 0.26s)$
]

=== Lag Compensation

#theorem[Lag Compensator Design][
  Design steps for phase lag compensation:
  1. Determine error constant improvement needed
  2. Choose pole frequency: $omega_p << omega_(g c)$ (typically 1/10 of crossover)
  3. Compute zero location for desired gain
  4. Verify stability margins after compensation
]

#example[Lag Design Example][
  Improve steady-state error for $G(s) = K/(s+1)(s+5)$ from 10% to 2%.
]
#solution[
  Step 1: Required gain increase: factor of 5
  Step 2: Place pole at $omega_p = 0.2$ rad/s (1/10 of current crossover)
  Step 3: Zero at $omega_z = 1.0$ rad/s
  Step 4: $G_c(s) = 5(1 + s)/(1 + 5s)$
]

=== Solved Problems

#solved_problem[Lead-Lag Design][
  Design lead-lag compensator for system $G(s) = 4/(s(s+1)(s+2))$ to achieve $P_M = 50°$ and $e_(s s) < 1%$.
]
#solution[
  Step 1: Current analysis shows $P_M = 25°$, $K_v = 4/2 = 2$
  Step 2: Lead design for additional $30°$:
  $alpha = (1 - sin(30°))/(1 + sin(30°)) = 0.33$
  
  Step 3: Lag design for error improvement:
  Required $K_v = 100$ → gain factor of 50
  $G_(l a g)(s) = 50(1 + 0.5s)/(1 + 25s)$
  
  Step 4: Combined compensator:
  $G_c(s) = (1 + 0.3s)/(1 + 0.1s) × (1 + 0.5s)/(1 + 25s)$
]

#solved_problem[Compensation Selection][
  Compare lead vs lag vs lead-lag for different system types and specifications.
]
#solution[
  *Lead compensation*: Best for improving stability margins and transient response
  *Lag compensation*: Best for improving steady-state accuracy
  *Lead-lag compensation*: Comprehensive improvement for both transient and steady-state
  
  Selection guidelines:
  - Stability problems → Lead compensation
  - Accuracy problems → Lag compensation  
  - Both issues → Lead-lag compensation
]

=== Supplementary Problems

#supplementary[Network Synthesis][
  Design a passive RC lead network with maximum phase lead of $45°$ at $omega = 10$ rad/s.
]

#supplementary[Digital Implementation][
  Convert an analog lead compensator $G_c(s) = (1 + s)/(1 + 0.1s)$ to digital form using bilinear transformation with $T = 0.01s$.]