#import "../../utils.typ": *
== Root Locus Analysis and Design

=== Mathematical Review

Root locus is a graphical method showing how closed-loop poles move as a parameter (typically gain $K$) varies.

#definition[Root Locus][
  For a unity-feedback system with open-loop transfer function $K G(s)H(s)$, the root locus is the set of points in the s-plane that satisfy
  $ 1 + K G(s)H(s) = 0. $
  Equivalently,
  $ K G(s)H(s) = -1. $
]

#proposition[Characteristic Equation Form][
  For a unity-feedback system, closed-loop poles are the roots of
  $ 1 + K G(s)H(s) = 0. $
  Therefore, the root locus is obtained by varying $K$ (usually $K>=0$) and tracking these roots in the s-plane.
]

#theorem[Angle and Magnitude Conditions][
  A point $s_0$ lies on the root locus if and only if:
  - *Angle condition:* $angle G(s_0)H(s_0) = (2k+1)180 degree, quad k in ZZ.$
  - *Magnitude condition:* $|K G(s_0)H(s_0)| = 1.$
]

#proof[
  From the characteristic equation,
  $ K G(s)H(s) = -1. $
  In polar form,
  $ -1 = 1 angle ((2k+1)180 degree), quad k in ZZ. $

  Hence, for any point on the locus:
  - the phase must satisfy
    $ angle (K G(s)H(s)) = (2k+1)180 degree, $
    and for real positive gain $K$, this reduces to
    $ angle G(s)H(s) = (2k+1)180 degree; $
  - the magnitude must satisfy
    $ |K G(s)H(s)| = 1. $

  Conversely, any point satisfying both conditions also satisfies
  $ K G(s)H(s) = -1, $
  so it belongs to the root locus.
]

#definition[Breakaway/Break-in Points][
  Breakaway/break-in points are real-axis points where multiple root-locus branches meet or separate.
  They are found from
  $ (d K)/(d s) = 0, $
  after expressing gain as a function of $s$ from
  $ 1 + K G(s)H(s) = 0. $
]

=== Solved Problems

#solved_problem[Characteristic Equation and Pole Locations][
  For
  $ G(s) = 1/(s(s+2)), quad H(s)=1, $
  derive the characteristic equation and closed-loop poles.
]
#solution[
  Start from
  $ 1 + K G(s)H(s)=0. $
  Substitute $G(s)$ and $H(s)=1$:
  $ 1 + K/(s(s+2)) = 0. $

  Multiply by $s(s+2)$:
  $ s(s+2) + K = 0. $
  Therefore,
  $ s^2 + 2s + K = 0. $

  Closed-loop poles are
  $ s = (-2 plus.minus sqrt(4-4K))/2 = -1 plus.minus sqrt(1-K). $
]

#solved_problem[Angle Condition Check][
  For
  $ G(s) = 1/((s+1)(s+2)), quad H(s)=1, $
  check whether $s_0=-1.5$ satisfies the angle condition.
]
#solution[
  Evaluate
  $ G(-1.5) = 1/((-1.5+1)(-1.5+2)) = 1/((-0.5)(0.5)) = 1/(-0.25). $
  Hence,
  $ angle G(-1.5) = 180 degree = (2k+1)180 degree. $

  Therefore, $s_0=-1.5$ satisfies the angle condition and is a candidate root-locus point.
]

#solved_problem[Breakaway Point Calculation][
  For
  $ G(s) = 1/(s(s+2)), quad H(s)=1, $
  compute the real-axis breakaway/break-in point.
]
#solution[
  From
  $ 1 + K/(s(s+2))=0, $
  solve for gain:
  $ K = -s(s+2). $

  Differentiate with respect to $s$:
  $ (d K)/(d s) = -(2s+2). $
  Set to zero:
  $ -(2s+2)=0 => s=-1. $

  Therefore, the breakaway/break-in point is at
  $ s=-1. $
]

#solved_problem[Sketch Root Locus][
  Sketch the root locus for
  $ G(s)=1/(s(s+1)(s+3)), quad H(s)=1. $
]
#solution[
  1. Open-loop poles:
     $ s = 0, -1, -3 $ (three branches start here).

  2. Open-loop zeros:
     none (three branches terminate at infinity).

  3. Asymptotes:
     $ n-m=3. $
     Angles are
     $ theta_q = ((2q+1)180 degree)/3, quad q=0,1,2, $
     so
     $ 60 degree, 180 degree, 300 degree. $

  4. Centroid:
      $ sigma_a = (0 + (-1) + (-3) - 0)/(3-0) = -4/3. $

  5. Breakaway candidates:
     from
     $ K = -s(s+1)(s+3), $
     $ (d K)/(d s)=-(3s^2+8s+3)=0. $
     Thus
     $ s = (-8 plus.minus sqrt(64-36))/6 = -0.45, -2.22. $
]

#solved_problem[Design for Damping Ratio][
  For
  $ G(s)=1/(s(s+4)), quad H(s)=1, quad zeta=0.5, $
  find gain $K$.
]
#solution[
  Desired pole angle from negative real axis:
  $ theta = cos^(-1)(zeta)=60 degree. $

  Standard second-order form gives
  $ s = -zeta omega_n plus.minus j omega_n sqrt(1-zeta^2). $
  With $zeta=0.5$,
  $ s = -omega_n/2 plus.minus j omega_n sqrt(3)/2. $

  Closed-loop characteristic equation is
  $ s^2+4s+K=0. $
  Compare with
  $ s^2 + 2zeta omega_n s + omega_n^2 = 0. $

  Then
  $ 2 zeta omega_n = 4 => omega_n = 4, $
  and
  $ K = omega_n^2 = 16. $
]

=== Supplementary Problems

#supplementary[Complex Zeros][
  Sketch the root locus for
  $ G(s)H(s)=((s+2)^2+4)/(s(s+1)(s+4)). $
  Identify real-axis segments, asymptotes, and the effect of the complex zeros on branch direction.
]

#supplementary[Gain Margin][
  For
  $ G(s)H(s)=K/(s(s+2)(s+4)), $
  determine the value of $K$ at which the root locus crosses the imaginary axis.
  Use that value to infer the stability limit (gain margin in the root-locus sense).
]
