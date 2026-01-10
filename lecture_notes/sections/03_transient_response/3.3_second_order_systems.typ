#import "../../utils.typ": *
== Second-Order Systems

=== Mathematical Review

Second-order systems exhibit rich dynamic behavior including oscillations and overshoot.

#definition[Standard Second-Order Form][
  $ G(s) = (omega_n^2)/(s^2 + 2 zeta omega_n s + omega_n^2) $
  where:
  - $omega_n$: natural frequency (rad/s)
  - $zeta$: damping ratio (dimensionless)
]

#example[Mass-Spring-Damper][
  For $M diaer(x) + B dot(x) + K x = F$:
  $ omega_n = sqrt(K/M), quad zeta = B/(2 sqrt(K M)) $
]

#definition[Damping Cases][
  - *Underdamped ($zeta < 1$):* Oscillatory response
  - *Critically damped ($zeta = 1$):* Fastest non-oscillatory
  - *Overdamped ($zeta > 1$):* Slow, non-oscillatory
]

#example[Pole Locations][
  Poles: $s = -zeta omega_n plus.minus omega_n sqrt(zeta^2 - 1)$

  For $zeta < 1$: $s = -zeta omega_n plus.minus j omega_n sqrt(1 - zeta^2)$
]

#theorem[Step Response (Underdamped)][
  For $zeta < 1$:
  $ y(t) = 1 - (e^(-zeta omega_n t))/sqrt(1 - zeta^2) sin(omega_d t + phi) $
  where $omega_d = omega_n sqrt(1 - zeta^2)$ is damped frequency.
]

#example[Performance Specs][
  - *Peak time:* $t_p = pi/omega_d$
  - *Percent overshoot:* $M_p = e^((-pi zeta)/sqrt(1-zeta^2)) times 100\%$
  - *Settling time:* $t_s approx 4/(zeta omega_n)$ (2% criterion)
]

=== Solved Problems

#solved_problem[Design for 10% Overshoot][
  Find $zeta$ for $M_p = 10\%$ and calculate $t_s$ if $omega_n = 5$ rad/s.
]
#solution[
  From overshoot formula:
  $ 0.10 = e^((-pi zeta)/sqrt(1-zeta^2)) $
  $ ln(0.10) = (-pi zeta)/sqrt(1-zeta^2) $
  $ -2.303 = (-pi zeta)/sqrt(1-zeta^2) $

  Solving: $zeta approx 0.591$

  Settling time:
  $ t_s = 4/(zeta omega_n) = 4/(0.591 times 5) = 1.35"s" $
]

#solved_problem[Pole Placement][
  Place poles at $s = -2 plus.minus 3j$ for $G(s) = omega_n^2/(s^2 + 2 zeta omega_n s + omega_n^2)$.
]
#solution[
  From pole locations:
  $ -zeta omega_n = -2 => zeta omega_n = 2 $
  $ omega_n sqrt(1-zeta^2) = 3 $

  Squaring second equation:
  $ omega_n^2(1-zeta^2) = 9 $
  $ omega_n^2 - (zeta omega_n)^2 = 9 $
  $ omega_n^2 - 4 = 9 $
  $ omega_n = sqrt(13) = 3.606 "rad/s" $
  $ zeta = 2/3.606 = 0.555 $
]

=== Supplementary Problems

#supplementary[Critically Damped Design][
  Design system for fastest response without overshoot.
]

#supplementary[Bandwidth Calculation][
  Find bandwidth for second-order system with $omega_n = 10$, $zeta = 0.7$.
]

#supplementary[Resonance Peak][
  Calculate resonance peak $M_r$ for underdamped system.
]
