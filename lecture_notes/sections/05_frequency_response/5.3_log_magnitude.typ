#import "../../utils.typ": *
== Logarithmic Magnitude Plots

=== Mathematical Review

*Logarithmic magnitude plots* (also called Nichols charts) plot the logarithmic magnitude in decibels versus the phase angle, providing a compact representation of frequency response data.

#definition[Nichols Chart][
  A Nichols chart is a plot of $20 log_(10) abs(G(j omega))$ (in dB) versus $angle(G(j omega))$ (degrees) with frequency $omega$ as a parameter.
]

#definition[Log-Magnitude Coordinates][
  The log-magnitude is expressed in decibels:
  $ M = 20 log_(10) abs(G(j omega)) $ (in dB)
  The phase angle is measured in degrees:
  $ phi = angle(G(j omega)) = tan^(-1)(text(Im)[G(j omega)]/text(Re)[G(j omega)]) $
]

#example[First-Order System][
  For $G(s) = 1/(tau s + 1)$:
  At $omega = 1/tau$: $abs(G(j omega)) = 1/sqrt(2) = -3$ dB, $angle = -45°$
  This point appears at $(-3, -45°)$ on the Nichols chart.
]

=== Frequency Response Data

#theorem[Experimental Data Representation][
  Experimental frequency response data can be plotted on a Nichols chart to:
  1. Identify system parameters
  2. Assess stability margins
  3. Compare with theoretical models
  4. Validate system identification results
]

#definition[M-Contours][
  M-contours are curves of constant closed-loop magnitude $abs(T(j omega))$ on the Nichols chart, useful for assessing closed-loop performance from open-loop data.
]

=== Solved Problems

#solved_problem[Nichols Chart Construction][
  Construct the Nichols chart data for $G(s) = 10/(s+1)(s+5)$ at frequencies $omega = [0.1, 1, 10]$ rad/s.
]
#solution[
  Calculate $G(j omega)$ at each frequency:

  $omega = 0.1$:
  $G(j 0.1) = 10/((j 0.1 + 1)(j 0.1 + 5)) = 10/((1 - 0.01) + j(0.6))$
  $abs(G(j 0.1)) approx 10/sqrt(0.99^2 + 0.6^2) approx 8.5 = 18.6$ dB
  $angle approx -tan^(-1)(0.6/0.99) approx -31°$

  $omega = 1$:
  $G(j 1) = 10/((j 1 + 1)(j 1 + 5)) = 10/((1 - 5) + j(6))$
  $abs(G(j 1)) = 10/sqrt(16 + 36) = 10/sqrt(52) = 1.39 = 2.9$ dB
  $angle = -tan^(-1)(6/-4) = -123°$

  $omega = 10$:
  $G(j 10) = 10/((j 10 + 1)(j 10 + 5)) = 10/((-99) + j(60))$
  $abs(G(j 10)) = 10/sqrt(9801 + 3600) = 0.089 = -21$ dB
  $angle = -tan^(-1)(60/-99) = -149°$
]

#solved_problem[Performance Specification][
  From Nichols chart data, determine if a system meets the specification of gain margin $> 6$ dB and phase margin $> 30°$.
]
#solution[
  The gain margin is the negative of the magnitude at the phase crossover frequency (where phase = $-180°$).
  The phase margin is $180°$ plus the phase at the gain crossover frequency (where magnitude = 0 dB).

  From the Nichols chart:
  - At phase = $-180°$, magnitude = $-8$ dB → Gain margin = $8$ dB ✓
  - At magnitude = 0 dB, phase = $-145°$ → Phase margin = $180° - 145° = 35°$ ✓

  Both specifications are satisfied.
]

=== Supplementary Problems

#supplementary[System Identification][
  Given Nichols chart data points: (0 dB, $-90°$), (-3 dB, $-135°$), (-20 dB, $-170°$), identify the system type and approximate transfer function.
]

#supplementary[M-Contour Analysis][
  For a system with Nichols plot passing through point (2 dB, $-60°$), determine the closed-loop resonant peak if the M-contour at that point represents $M_r = 1.4$.
]