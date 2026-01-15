#import "../../utils.typ": *
== Closed-Loop Frequency Response

=== Mathematical Review

*Closed-loop frequency response* analysis relates the open-loop characteristics to the closed-loop performance, providing insights into system behavior in the frequency domain.

#definition[Closed-Loop Transfer Function][
  For a unity feedback system, the closed-loop transfer function is:
  $ T(s) = Y(s)/R(s) = G(s)/(1 + G(s)) $
  For general feedback: $T(s) = G(s)/(1 + G(s)H(s))$
]

#definition[Frequency Response Functions][
  The closed-loop frequency response is:
  $ T(j omega) = G(j omega)/(1 + G(j omega)H(j omega)) $
  This can be expressed in terms of magnitude and phase:
  $ T(j omega) = |T(j omega)| e^(j angle(T(j omega))) $
]

#definition[Sensitivity Functions][
  *Sensitivity function*: $S(s) = 1/(1 + G(s)H(s))$
  *Complementary sensitivity*: $T(s) = G(s)/(1 + G(s)H(s))$
  These satisfy: $S(s) + T(s) = 1$
]

=== Performance Specifications

#theorem[Bandwidth][
  The bandwidth $omega_B$ is the frequency where:
  $ |T(j omega_B)| = 1/sqrt(2) |T(j 0)| $
  For unity feedback with $T(j 0) = 1$: $|T(j omega_B)| = 0.707 = -3$ dB
  Bandwidth indicates the frequency range where the system tracks inputs effectively.
]

#definition[Resonant Peak][
  The resonant peak $M_p$ is the maximum value of $|T(j omega)|$:
  $ M_p = max_|omega| |T(j omega)| $
  The resonant frequency $omega_r$ is where this maximum occurs.
  For second-order systems: $M_p = 1/(2 zeta sqrt(1 - zeta^2))$ for $zeta < 1/sqrt(2)$
]

=== Solved Problems

#solved_problem[Closed-Loop Response Calculation][
  Calculate the closed-loop frequency response for $G(s) = 10/(s+1)(s+5)$ with unity feedback.
]
#solution[
  Step 1: Form closed-loop transfer function
  $ T(s) = G(s)/(1 + G(s)) = 10/((s+1)(s+5) + 10) = 10/(s^2 + 6s + 15) $
  
  Step 2: Evaluate at $s = j omega$
  $ T(j omega) = 10/((-omega^2 + 15) + j 6 omega) $
  
  Step 3: Calculate magnitude and phase
  $ |T(j omega)| = 10/sqrt((-omega^2 + 15)^2 + (6 omega)^2) $
  $ angle(T(j omega)) = -tan^(-1)(6 omega/(-omega^2 + 15)) $
  
  Step 4: Key performance metrics
  DC gain: $|T(j 0)| = 10/15 = 0.667 = -3.5$ dB
  Bandwidth: Solve for $|T(j omega_B)| = 0.667/sqrt(2) = 0.471$
  $ omega_B approx 2.1$ rad/s
  No resonant peak (system is overdamped)
]

#solved_problem[Sensitivity Analysis][
  For $G(s) = K/(s+1)^2$ with unity feedback, analyze sensitivity to parameter variations.
]
#solution[
  Step 1: Closed-loop transfer function
  $ T(s) = K/((s+1)^2 + K) $
  
  Step 2: Sensitivity function
  $ S(s) = 1/(1 + G(s)) = (s+1)^2/((s+1)^2 + K) $
  
  Step 3: Frequency response
  $ S(j omega) = (-omega^2 + 2j omega + 1)/((-omega^2 + 1) + K + j 2 omega) $
  
  Step 4: Sensitivity characteristics
  At low frequencies ($omega -> 0$): $|S(j 0)| = 1/(1 + K)$
  At high frequencies ($omega -> infinity$): $|S(j omega)| -> 1$
  
  Step 5: Interpretation
  - Low sensitivity at DC for large $K$
  - High sensitivity at high frequencies (inevitable)
  - Bandwidth of sensitivity decreases with increasing $K$
]

=== Supplementary Problems

#supplementary[Bandwidth Design][
  Design a controller for $G(s) = 1/(s+1)(s+4)$ to achieve a closed-loop bandwidth of at least 5 rad/s.
]

#supplementary[Performance Trade-offs][
  Explain the relationship between resonant peak, damping ratio, and settling time for a second-order closed-loop system.
]