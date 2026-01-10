#import "../../utils.typ": *
== Higher-Order Systems

=== Mathematical Review

Higher-order systems (order $n >= 3$) can often be approximated by dominant pole analysis.

#definition[Higher-Order Transfer Function][
  General form:
  $ G(s) = (b_m s^m + ... + b_0)/(a_n s^n + ... + a_0) $
  where $n > 2$.
]

#example[Third-Order System][
  $ G(s) = K/((s+p_1)(s^2 + 2 zeta omega_n s + omega_n^2)) $
]

#theorem[Dominant Pole Approximation][
  If some poles are much closer to imaginary axis than others, the system behavior is dominated by the closest poles. Poles with $|"Re"{s}| < 1/10 |"Re"{s_("far")}|$ are dominant.
]

#example[Dominant Poles][
  For poles at $s = -1, -2 plus.minus 3j, -20$:
  - Dominant: $-1, -2 plus.minus 3j$
  - Non-dominant: $-20$ (fast decay)
]

#definition[Pole-Zero Cancellation][
  If a zero is very close to a pole, they approximately cancel:
  $ G(s) = ((s+z))/((s+p)(s+z)) approx 1/(s+p) quad "if" z approx p $
]

#example[Approximate Cancellation][
  $ G(s) = (s+2.1)/((s+2)(s+5)) approx 1/(s+5) $
]

=== Solved Problems

#solved_problem[Dominant Pole Analysis][
  Approximate $G(s) = 10/((s+1)(s+2)(s+20))$ by dominant poles.
]
#solution[
  Poles: $s = -1, -2, -20$

  The pole at $s = -20$ is far from others (ratio 10:1), so it's non-dominant.

  Approximate by first-order equivalent of dominant poles:
  $ G(s) approx 10/((s+1)(s+2)) = 10/(s^2 + 3s + 2) $

  Or further approximate by slowest pole:
  $ G(s) approx K/(s+1) $
  where $K = 10/(2 times 20) = 0.25$
]

#solved_problem[Step Response Approximation][
  Estimate settling time for $G(s) = 100/((s+2)(s^2 + 4s + 20))$.
]
#solution[
  Poles:
  - $s = -2$
  - $s = -2 plus.minus 4j$ (from $s^2 + 4s + 20$)

  All poles have $"Re"{s} = -2$, so no clear dominance.

  Settling time dominated by slowest decay:
  $ t_s approx 4/|"Re"{s}| = 4/2 = 2"s" $
]

=== Supplementary Problems

#supplementary[Fourth-Order System][
  Analyze stability and response of $G(s) = 1/(s^4 + 5s^3 + 10s^2 + 10s + 4)$.
]

#supplementary[Pole Placement][
  Design controller to place all poles at $s = -5$.
]

#supplementary[Zero Effect][
  Analyze how adding a zero affects overshoot.
]
