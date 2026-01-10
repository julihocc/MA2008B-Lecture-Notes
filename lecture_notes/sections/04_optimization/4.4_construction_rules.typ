#import "../../utils.typ": *
== General Rules for Constructing Root Locus

=== Mathematical Review

Systematic rules enable quick sketching of root locus without detailed calculations.

#definition[Rule 1: Number and Symmetry][
  - Number of branches = max($n, m$) where $n$ = poles, $m$ = zeros
  - Locus is symmetric about real axis
]

#example[Branch Count][
  $G(s) = (s+1)/((s+2)(s+3)(s+4))$: 3 branches (3 poles, 1 zero)
]

#definition[Rule 2: Real Axis Segments][
  Root locus exists on real axis to the left of an odd number of real poles and zeros.
]

#example[Real Axis Locus][
  Poles at $-1, -3$, zero at $-2$:
  Locus on $(-infinity, -3]$ and $[-2, -1]$
]

#definition[Rule 3: Starting and Ending Points][
  - Branches start at open-loop poles ($K = 0$)
  - Branches end at open-loop zeros ($K -> infinity$)
  - If $n > m$, $(n-m)$ branches go to infinity along asymptotes
]

#example[Asymptotic Behavior][
  3 poles, 1 zero: 2 branches approach infinity at $plus.minus 90 degree$ from centroid
]

#definition[Rule 4: Breakaway/Break-in Points][
  Found from:
  $ (d K)/(d s) = 0 quad "where" K = -1/(G(s)H(s)) $
  Must verify points are actually on locus.
]

#example[Breakaway Verification][
  For $K = -s(s+4)$: $(d K)/(d s) = -(2s+4) = 0 => s = -2$
  Check: $s = -2$ is between poles at $0$ and $-4$ ✓
]

#definition[Rule 5: Imaginary Axis Crossing][
  Use Routh criterion to find $K$ and $omega$ where locus crosses $j omega$ axis.
]

#example[Crossing Point][
  For $s^3 + 3s^2 + 2s + K = 0$:
  Routh gives $K = 6$ at $s = plus.minus j sqrt(2)$
]

#definition[Rule 6: Departure/Arrival Angles][
  At complex pole $p_("i")$:
  $ theta_("dep") = 180 degree - sum_(j != i) angle(p_("i") - p_("j")) + sum_("k") angle(p_("i") - z_("k")) $
]

#example[Departure from Complex Pole][
  Pole at $-1+2j$ with conjugate at $-1-2j$:
  $ theta_("dep") = 180 degree - 90 degree = 90 degree $
]

=== Solved Problems

#solved_problem[Apply All Rules][
  Construct root locus for $G(s) = K/((s+1)(s^2+2s+2))$ using systematic rules.
]
#solution[
  1. *Poles:* $-1, -1 plus.minus j$ | *Zeros:* none
  2. *Branches:* 3 (all to infinity)
  3. *Real axis:* $(-infinity, -1]$
  4. *Asymptotes:* 3 at $60 degree, 180 degree, 300 degree$ from $sigma = -4/3$
  5. *Departure angles:* At $-1+j$:
    $theta = 180 degree - 90 degree - 45 degree = 45 degree$
  6. *Breakaway:* On real axis near $-1$
]

#solved_problem[Design Using Root Locus][
  For $G(s) = K/(s(s+2))$, find $K$ for poles at $s = -1 plus.minus j$.
]
#solution[
  Characteristic equation: $s^2 + 2s + K = 0$

  Desired poles: $s = -1 plus.minus j$
  Substituting $s = -1 + j$:
  $ (-1+j)^2 + 2(-1+j) + K = 0 $
  $ (1-2j-1) + (-2+2j) + K = 0 $
  $ -2 + K = 0 $
  $ K = 2 $
]

=== Supplementary Problems

#supplementary[Fourth-Order System][
  Apply all rules to sketch locus for fourth-order system.
]

#supplementary[Lead Compensator][
  Design lead compensator using root locus.
]
