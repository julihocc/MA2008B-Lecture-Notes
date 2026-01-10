#import "../../utils.typ": *
== Root Locus Analysis and Design

=== Mathematical Review

Root locus is a graphical method showing how closed-loop poles move as a parameter (typically gain $K$) varies.

#definition[Root Locus][
  For unity feedback system with open-loop transfer function $K G(s)H(s)$, the root locus is the set of points in the s-plane satisfying:
  $ 1 + K G(s)H(s) = 0 $
  or equivalently: $K G(s)H(s) = -1$
]

#example[Simple Root Locus][
  For $G(s) = 1/(s(s+2))$:
  $ 1 + K/(s(s+2)) = 0 $
  $ s^2 + 2s + K = 0 $
  Poles: $s = -1 plus.minus sqrt(1-K)$
]

#theorem[Angle and Magnitude Conditions][
  A point $s_0$ is on the root locus if:
  - *Angle:* $angle G(s_0)H(s_0) = plus.minus 180 degree (2k+1)$
  - *Magnitude:* $|K G(s_0)H(s_0)| = 1$
]

#example[Angle Condition Check][
  For $G(s) = 1/((s+1)(s+2))$, check if $s = -1.5$ is on locus:
  $ angle G(-1.5) = angle 1/((-0.5)(-0.5+1)) = angle 1/(-0.25) = 180 degree $ ✓
]

#definition[Breakaway/Break-in Points][
  Points where multiple branches meet/separate, found from:
  $ (d K)/(d s) = 0 quad "or" quad (d)/(d s)[G(s)H(s)] = 0 $
]

#example[Breakaway Calculation][
  For $K = -s(s+2)$:
  $ (d K)/(d s) = -(2s+2) = 0 => s = -1 $
]

=== Solved Problems

#solved_problem[Sketch Root Locus][
  Sketch root locus for $G(s) = 1/(s(s+1)(s+3))$.
]
#solution[
  1. Poles: $0, -1, -3$ (3 branches start here)
  2. Zeros: none (3 branches go to infinity)
  3. Asymptotes: $n-m = 3$ asymptotes at angles $60 degree, 180 degree, 300 degree$
  4. Centroid: $sigma = (0-1-3)/3 = -4/3$
  5. Breakaway: From $K = -s(s+1)(s+3)$:
    $(d K)/(d s) = -(3s^2 + 8s + 3) = 0$
    $s = (-8 plus.minus sqrt(64-36))/6 = -0.45, -2.22$
]

#solved_problem[Design for Damping Ratio][
  For $G(s) = 1/(s(s+4))$, find $K$ for $zeta = 0.5$.
]
#solution[
  Desired pole angle from negative real axis: $theta = cos^(-1)(zeta) = 60 degree$

  Pole location: $s = -sigma plus.minus j omega$ where $omega/sigma = tan(60 degree) = sqrt(3)$

  On root locus: $s^2 + 4s + K = 0$
  For $zeta = 0.5$: $s = -omega_n/2 plus.minus j omega_n sqrt(3)/2$

  Comparing: $2 zeta omega_n = 4 => omega_n = 4$
  Thus $K = omega_n^2 = 16$
]

=== Supplementary Problems

#supplementary[Complex Zeros][
  Sketch root locus for system with complex zeros.
]

#supplementary[Gain Margin][
  Find gain margin from root locus crossing imaginary axis.
]
