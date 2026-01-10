#import "../../utils.typ": *
== Traditional Systems Analysis

=== Mathematical Review

Traditional systems include mechanical, electrical, and thermal systems, each governed by fundamental physical laws.

#definition[Mechanical Systems][
  Governed by Newton's laws. Key elements:
  - *Mass ($M$):* $F = M a$
  - *Spring ($K$):* $F = K x$
  - *Damper ($B$):* $F = B dot(x)$
]

#example[Simple Pendulum][
  For small angles: $M L^2 diaer(theta) + B dot(theta) + M g L theta = tau$
]

#definition[Electrical Systems][
  Governed by Kirchhoff's laws. Key elements:
  - *Resistor ($R$):* $v = R i$
  - *Capacitor ($C$):* $i = C dot(v)$
  - *Inductor ($L$):* $v = L dot(i)$
]

#example[RL Circuit][
  Series RL: $L dot(i) + R i = v_("in")$
]

#definition[Thermal Systems][
  Governed by heat transfer laws:
  - *Thermal Capacitance ($C$):* $Q = C T$
  - *Thermal Resistance ($R$):* $q = (T_1 - T_2)/R$
]

#example[Heated Room][
  $C dot(T) = q_("in") - (T - T_("amb"))/R$
]

=== Solved Problems

#solved_problem[Mass-Spring System Response][
  Find natural frequency for $M diaer(x) + K x = 0$ with $M=2 "kg"$, $K=8 "N/m"$.
]
#solution[
  Characteristic equation: $M s^2 + K = 0$
  $ s^2 = -K/M = -8/2 = -4 $
  $ s = plus.minus 2j $
  Natural frequency: $omega_n = 2 "rad/s"$
]

#solved_problem[RC Circuit Time Constant][
  For $R C dot(v)_C + v_C = v_("in")$ with $R=1000 Omega$, $C=10 mu F$, find time constant.
]
#solution[
  Standard form: $tau dot(v)_C + v_C = v_("in")$
  Time constant: $tau = R C = 1000 times 10 times 10^(-6) = 0.01 "s" = 10 "ms"$
]

=== Supplementary Problems

#supplementary[Coupled Masses][
  Derive equations for two masses connected by springs.
]

#supplementary[Bridge Circuit][
  Analyze a Wheatstone bridge using Kirchhoff's laws.
]

#supplementary[Heat Exchanger][
  Model a counter-flow heat exchanger with thermal resistances.
]
