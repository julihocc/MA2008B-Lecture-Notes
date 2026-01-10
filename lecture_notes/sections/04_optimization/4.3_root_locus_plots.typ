#import "../../utils.typ": *
== Root Locus Diagrams

=== Mathematical Review

Root locus diagrams provide visual insight into system stability and transient response as gain varies.

#definition[Key Features of Root Locus][
  - *Number of branches:* Equal to number of poles
  - *Starting points:* Open-loop poles (at $K=0$)
  - *Ending points:* Open-loop zeros (at $K -> infinity$)
  - *Symmetry:* Symmetric about real axis
]

#example[Second-Order Locus][
  For $G(s) = 1/(s(s+4))$:
  - 2 branches start at $s=0, -4$
  - Both go to infinity (no finite zeros)
  - Breakaway point at $s = -2$
]

#theorem[Asymptotes][
  For $n$ poles and $m$ zeros ($n > m$):
  - Number of asymptotes: $n - m$
  - Angles: $theta_("k") = (180 degree (2k+1))/(n-m)$ for $k = 0, 1, ..., n-m-1$
  - Centroid: $sigma_a = (sum "poles" - sum "zeros")/(n-m)$
]

#example[Asymptote Calculation][
  For $G(s) = (s+1)/(s(s+2)(s+3))$:
  - $n = 3, m = 1 => n-m = 2$ asymptotes
  - Angles: $90 degree, 270 degree$
  - Centroid: $(0-2-3-(-1))/2 = -2$
]

#definition[Departure/Arrival Angles][
  At complex poles/zeros, branches depart/arrive at specific angles:
  $ theta_d = 180 degree - sum angle("from zeros") + sum angle("from other poles") $
]

#example[Departure Angle][
  For pole at $s = -1 + j$ with other pole at $s = -1 - j$:
  $ theta_d = 180 degree - 0 + 90 degree = 270 degree $
]

=== Solved Problems

#solved_problem[Complete Root Locus Sketch][
  Sketch root locus for $G(s) = (s+2)/(s(s+1)(s+4))$.
]
#solution[
  1. *Poles:* $0, -1, -4$ | *Zeros:* $-2$
  2. *Branches:* 3 (from poles)
  3. *Asymptotes:* $n-m = 2$
    - Angles: $90 degree, 270 degree$
    - Centroid: $(0-1-4-(-2))/2 = -1.5$
  4. *Real axis segments:* $[-4, -2]$ and $[-1, 0]$
  5. *Breakaway:* Between $-1$ and $0$
    From $K = -s(s+1)(s+4)/(s+2)$:
    Solving $(d K)/(d s) = 0$ gives $s approx -0.46$
]

#solved_problem[Imaginary Axis Crossing][
  Find where root locus crosses imaginary axis for $G(s) = 1/(s(s+2)(s+5))$.
]
#solution[
  Characteristic equation: $s^3 + 7s^2 + 10s + K = 0$

  Routh array:
  $
    s^3: quad &1 quad 10 \
    s^2: quad &7 quad K \
    s^1: quad &(70-K)/7 \
    s^0: quad &K
  $

  At imaginary axis crossing: $(70-K)/7 = 0 => K = 70$

  From auxiliary equation: $7s^2 + K = 0$
  $ s = plus.minus j sqrt(K/7) = plus.minus j sqrt(10) $
]

=== Supplementary Problems

#supplementary[Multiple Breakaway Points][
  Find all breakaway/break-in points for third-order system.
]

#supplementary[Root Locus with Delay][
  Sketch root locus for system with time delay $e^(-s T)$.
]
