#import "../../utils.typ": *
== Bode Plots

=== Mathematical Review

The *frequency response* of a system is obtained by evaluating the transfer function along the imaginary axis $s = j omega$, where $omega$ is the angular frequency in radians per second.

#definition[Frequency Response][
  The frequency response $G(j omega)$ is obtained from the transfer function $G(s)$ by substituting $s = j omega$:
  $ G(j omega) = G(s)|_(s=j omega) = |G(j omega)| e^(j angle(G(j omega))) $
  where $|G(j omega)|$ is the magnitude and $angle(G(j omega))$ is the phase angle.
]

#definition[Bode Plots][
  Bode plots consist of two separate graphs:
  1. *Magnitude plot*: $20 log_(10) |G(j omega)|$ (in decibels) vs $log_(10)(omega)$
  2. *Phase plot*: $angle(G(j omega))$ (in degrees) vs $log_(10)(omega)$
]

#example[First-Order System][
  For $G(s) = K/(tau s + 1)$, the frequency response is:
  $ G(j omega) = K/(j omega tau + 1) $
  Magnitude: $|G(j omega)| = K/sqrt(1 + (omega tau)^2)$
  Phase: $angle(G(j omega)) = -tan^(-1)(omega tau)$
]

=== Construction Rules

#theorem[First-Order Terms][
  For a term $(1 + j omega/omega_c)$:
  - Low frequency asymptote: 0 dB
  - High frequency asymptote: $+20 log_(10)(omega/omega_c)$ dB
  - Break frequency: $omega_c$
  - Phase: $0°$ to $+90°$ over 2 decades
]

#theorem[Second-Order Terms][
  For $1 + 2 zeta (j omega/omega_n) + (j omega/omega_n)^2$:
  - Natural frequency: $omega_n$
  - Damping ratio: $zeta$
  - Resonant peak occurs for $zeta < 1/sqrt(2)$
]

=== Solved Problems

#solved_problem[Bode Plot Construction][
  Construct the Bode plot for $G(s) = 10(s+2)/(s(s+5)(s+10))$.
]
#solution[
  Rewrite in standard form:
  $ G(s) = (10 × 2/5 × 10) (s/2 + 1)/(s/1 (s/5 + 1) (s/10 + 1)) = 0.4 (s/2 + 1)/(s (s/5 + 1) (s/10 + 1)) $
  
  *Magnitude plot:*
  - Low frequency: $-20 log_(10)(omega)$ (integrator)
  - Break frequencies: $omega = 2, 5, 10$ rad/s
  - High frequency: $-40 log_(10)(omega)$
  
  *Phase plot:*
  - Start at $-90°$ (integrator)
  - Add $+90°$ at $omega = 2$ (zero)
  - Add $-90°$ at $omega = 5$ (pole)
  - Add $-90°$ at $omega = 10$ (pole)
  - End at $-180°$
]

#solved_problem[System Identification][
  From Bode magnitude data, identify the transfer function if the magnitude decreases by 20 dB/decade at high frequencies and has a break frequency at $omega = 1$ rad/s.
]
#solution[
  A 20 dB/decade slope indicates one pole more than zeros.
  The break frequency at $omega = 1$ suggests a pole at $s = -1$.
  Possible transfer function: $G(s) = K/(s + 1)$
  The gain $K$ is determined from the low-frequency magnitude.
]

=== Supplementary Problems

#supplementary[Second-Order System][
  Construct the Bode plot for $G(s) = 25/(s^2 + 4s + 25)$. Identify the natural frequency and damping ratio.
]

#supplementary[Phase Margin][
  For $G(s) = 100/(s+1)(s+10)$, find the frequency where the phase is $-180°$ and calculate the gain margin.
]