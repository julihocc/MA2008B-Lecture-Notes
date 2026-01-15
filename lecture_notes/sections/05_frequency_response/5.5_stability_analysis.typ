#import "../../utils.typ": *
== Stability Analysis

=== Mathematical Review

*Stability margins* provide quantitative measures of how far a system is from instability. They are essential for robust control system design.

#definition[Gain Margin][
  The gain margin ($G_M$) is the factor by which the gain can be multiplied before the system reaches the stability limit:
  $ G_M = 1/|G(j omega_(p c))| $
  where $omega_(p c)$ is the *phase crossover frequency* where $angle(G(j omega_(p c))) = -180°$.
  In decibels: $G_M = -20 log_(10) |G(j omega_(p c))|$ (in dB)
]

#definition[Phase Margin][
  The phase margin ($P_M$) is the additional phase lag required to reach the stability limit:
  $ P_M = 180° + angle(G(j omega_(g c))) $
  where $omega_(g c)$ is the *gain crossover frequency* where $|G(j omega_(g c))| = 1$ (0 dB).
]

#example[First-Order System][
  For $G(s) = K/(tau s + 1)$:
  Phase never reaches $-180°$, so G_M = $infinity$.
  At gain crossover: $|G(j omega)| = 1 => omega_(g c) = sqrt(K^2 - 1)/tau$
  $P_M = 180° - tan^(-1)(omega_(g c) tau)$
]

=== Relative Stability Measures

#theorem[Stability Margin Interpretation][
  - *$G_M > 1$* (or $> 0$ dB): System is stable
  - *$G_M < 1$* (or $< 0$ dB): System is unstable
  - *$P_M > 0°$*: System is stable
  - *$P_M < 0°$*: System is unstable
  - Larger margins indicate more robust stability
]

#definition[Delay Margin][
  The delay margin is the maximum additional time delay that can be added before instability:
  $ t_(d m) = P_M/(omega_(g c) × 180°/pi) $
]

=== Solved Problems

#solved_problem[Margin Calculation from Bode Plot][
  For $G(s) = 10/(s+1)(s+5)$, calculate gain and phase margins.
]
#solution[
  Step 1: Find phase crossover frequency (where phase = $-180°$)
  $angle(G(j omega)) = -tan^(-1)(omega) - tan^(-1)(omega/5) = -180°$
  
  At $omega = 2.24$ rad/s:
  $angle(G(j 2.24)) = -66° - 24° = -90°$ (not $-180°$)
  
  Actually, phase never reaches $-180°$ because it's a Type 0 system with two poles.
  Therefore: G_M = $infinity$
  
  Step 2: Find gain crossover frequency (where magnitude = 0 dB)
  $|G(j omega)| = 10/sqrt((1 + omega^2)(25 + omega^2)) = 1$
  Solving gives $omega_(g c) approx 1.4$ rad/s
  
  Step 3: Calculate phase margin
  $angle(G(j 1.4)) = -tan^(-1)(1.4) - tan^(-1)(1.4/5) = -54° - 16° = -70°$
  $P_M = 180° - 70° = 110°$
  
  Results: $G_M = infinity$, $P_M = 110°$ (very stable)
]

#solved_problem[Design for Specified Margins][
  Design a lead compensator to achieve $G_M$ ≥ 10 dB and $P_M$ ≥ 45° for plant $G_p(s) = 1/(s(s+1))$.
]
#solution[
  Step 1: Analyze uncompensated system
  Plant: $G_p(s) = 1/(s(s+1))$
  At $omega = 1$ rad/s: $|G_p| = -3$ dB, $angle = -135°$
  Current $P_M = 180° - 135° = 45°$ ✓
  G_M = $infinity$ ✓
  
  Actually, the uncompensated system already meets specifications.
  If we wanted better performance:
  
  Step 2: Lead compensator design
  $G_c(s) = K (1 + tau s)/(1 + alpha tau s)$ where $alpha < 1$
  
  Choose $alpha = 0.1$, place zero at $omega = 1$
  $tau = 1$, so $G_c(s) = K (1 + s)/(1 + 0.1s)$
  
  Step 3: Adjust gain $K$
  Set $K = 1$ to maintain 0 dB at low frequencies.
  
  Final design: $G_c(s) = (1 + s)/(1 + 0.1s)$
  This improves $P_M$ to approximately $55°$ while maintaining $G_M > infinity$.
]

=== Supplementary Problems

#supplementary[Delay Margin][
  For $G(s) = 5e^(-0.2s)/(s+1)(s+2)$, calculate the delay margin if the phase margin is $30°$ at $omega = 2$ rad/s.
]

#supplementary[Stability Assessment][
  A system has $G_M = 6$ dB and $P_M = 20°$. Is this system stable? Comment on the relative stability and potential issues.
]