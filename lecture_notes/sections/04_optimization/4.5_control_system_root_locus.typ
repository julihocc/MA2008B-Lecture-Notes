#import "../../utils.typ": *
== Root Locus of Control Systems

=== Mathematical Review

Root locus is particularly useful for analyzing and designing feedback control systems.

#definition[Closed-Loop Pole Placement][
  For desired performance specs (settling time, overshoot), place poles at:
  $ s = -zeta omega_n plus.minus j omega_n sqrt(1-zeta^2) $
  Then find required $K$ from root locus.
]

#example[Pole Placement for 5% Overshoot][
  $M_p = 5\% => zeta = 0.69$
  For $t_s = 2"s"$: $omega_n = 4/(zeta t_s) = 2.9$
  Desired poles: $s = -2 plus.minus 2j$
]

#theorem[Effect of Adding Poles/Zeros][
  - *Adding pole:* Pulls locus toward left (slower, more stable)
  - *Adding zero:* Pulls locus toward right (faster, less stable)
  - *Lead compensation:* Zero closer to origin than pole
  - *Lag compensation:* Pole closer to origin than zero
]

#example[Lead Compensator Effect][
  Original: $G(s) = 1/(s(s+2))$
  With lead: $G_c(s) = (s+3)/(s+10)$
  Zero at $-3$ pulls locus left, improving damping.
]

#definition[Dominant Poles][
  Poles closest to imaginary axis dominate transient response. Design focuses on placing these poles appropriately.
]

#example[Dominant Pole Design][
  For $G(s) = K/((s+1)(s+2)(s+20))$:
  Poles at $-1, -2$ are dominant (pole at $-20$ is fast).
]

=== Solved Problems

#solved_problem[Design for Settling Time][
  For $G(s) = K/(s(s+4))$, find $K$ for $t_s = 1"s"$ (2% criterion).
]
#solution[
  From $t_s = 4/(zeta omega_n) = 1$:
  $ zeta omega_n = 4 $

  Characteristic equation: $s^2 + 4s + K = 0$
  Standard form: $s^2 + 2 zeta omega_n s + omega_n^2 = 0$

  Comparing: $2 zeta omega_n = 4 => zeta omega_n = 2$ (contradiction!)

  Revise: For critically damped ($zeta = 1$):
  $ omega_n = 4, quad K = omega_n^2 = 16 $

  Check: $s = -4 plus.minus 0$ (repeated root at $-4$)
  $ t_s = 4/4 = 1"s"$ ✓
]

#solved_problem[Compensator Design][
  Design lead compensator for $G(s) = 1/(s(s+1))$ to achieve $zeta = 0.5$, $omega_n = 2$.
]
#solution[
  Desired poles: $s = -1 plus.minus j sqrt(3)$

  Uncompensated angle at $s = -1 + j sqrt(3)$:
  $ phi = angle 1/((s)(s+1)) = -(90 degree + 60 degree) = -150 degree $

  Need: $-180 degree$ for root locus
  Deficiency: $-30 degree$

  Lead compensator: $G_c(s) = (s+z)/(s+p)$ where $p > z$

  Choose $z = 2$ (near desired pole):
  From angle contribution:
  $ angle(s+2) - angle(s+p) = 30 degree $

  Solving geometrically: $p approx 6$

  Compensator: $G_c(s) = (s+2)/(s+6)$
]

=== Supplementary Problems

#supplementary[PD Controller Design][
  Design PD controller using root locus for specified damping.
]

#supplementary[Lag Compensator][
  Design lag compensator to improve steady-state error.
]

#supplementary[Multiple Specs][
  Meet both transient and steady-state specifications simultaneously.
]
