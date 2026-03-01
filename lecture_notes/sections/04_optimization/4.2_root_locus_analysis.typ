#import "../../../utils.typ": *
== Root Locus Analysis and Design

=== Mathematical Review

This section develops root-locus analysis and design from a general mathematical viewpoint.
The central question is how roots of a parameterized characteristic equation move as a real parameter varies.
Although root locus is classical in control theory, the same framework applies to broader classes of differential equations and parameter-dependent stability problems.

Notation used in this section: $s in CC$ is the complex variable, $K in RR$ is the real parameter, and $Delta(s,K)$ is the characteristic equation.
When needed, we write $Delta(s,K)=P(s)+K Q(s)$ and define $F(s)=Q(s)/P(s)$ (where $P(s) != 0$).
The symbol $k in ZZ$ is an integer index in the phase condition.

#definition[Parameterized Characteristic Equation][
  Consider a one-parameter family of characteristic equations
  $ Delta(s,K)=0, $
  where $s in CC$ and $K in RR$ is a scalar parameter.
  In this section, $Delta$ is assumed to be polynomial (or rational) in $s$ and affine in $K$, typically written as
  $ Delta(s,K)=P(s)+K Q(s), $
  with $P,Q$ polynomial (or rational) functions of $s$.
  The corresponding root trajectories are the curves traced by solutions $s=s(K)$ as $K$ varies.
]

#definition[Root Locus][
  The root locus is the set
  $ cal(R) = { s in CC : Delta(s,K)=0, K in I }, $
  where $I$ is a subset of $RR$ (often $I=[0,infinity)$).
]

#definition[Design Objective in Root Locus][
  Root-locus design means selecting parameter values $K$ so that characteristic roots lie in a target region of the complex plane
  (for example, left half-plane, prescribed damping region, or bounded real-part strip).
]

#proposition[Normalized Form][
  If $P(s) != 0$ in a region of interest, the equation
  $ P(s)+K Q(s)=0 $
  can be normalized as
  $ 1 + K F(s) = 0, quad F(s)=Q(s)/P(s). $
]

#proof[
  Divide the equation $P(s)+K Q(s)=0$ by $P(s)$:
  $ 1 + K Q(s)/P(s) = 0. $
  Defining
  $ F(s)=Q(s)/P(s), $
  we obtain
  $ 1 + K F(s)=0. $
]

#theorem[Angle and Magnitude Conditions][
  For the normalized form $1+K F(s)=0$ with $K>0$, a point $s_0 in CC$ belongs to the root locus if and only if
  $angle F(s_0) = (2k+1)180 degree, quad k in ZZ,$
  and its magnitude satisfies
  $|K F(s_0)| = 1.$
]

#proof[
  From the characteristic equation,
  $ K F(s) = -1. $
  In polar form,
  $ -1 = 1 angle ((2k+1)180 degree), quad k in ZZ. $

  Hence, for any point on the locus, the phase must satisfy
  $ angle (K F(s)) = (2k+1)180 degree. $
  Since $K>0$ is real,
  $ angle F(s) = (2k+1)180 degree. $
  The magnitude must satisfy
  $ |K F(s)| = 1. $

  Conversely, any point satisfying both conditions also satisfies
  $ K F(s) = -1, $
  so it belongs to the root locus.
]

#definition[Breakaway/Break-in Points][
  Breakaway/break-in points are real-axis points where multiple root-locus branches meet or separate.
  For equations written as $K=K(s)$, they are found from
  $ (d K)/(d s) = 0, $
  after solving the characteristic equation for the parameter.
]

=== Solved Problems

#solved_problem[Characteristic Equation and Pole Locations][
  For
  $ Delta(s,K)=s(s+2)+K, $
  derive the characteristic equation and the characteristic roots as functions of $K$.
]
#solution[
  Expand:
  $ s^2 + 2s + K = 0. $

  The roots are
  $ s = (-2 plus.minus sqrt(4-4K))/2 = -1 plus.minus sqrt(1-K). $
]

#solved_problem[Angle Condition Check][
  For
  $ F(s)=1/((s+1)(s+2)), $
  check whether $s_0=-1.5$ satisfies the angle condition.
]
#solution[
  Here $s_0$ is the test point in the complex plane.

  Evaluate
  $ F(-1.5) = 1/((-1.5+1)(-1.5+2)) = 1/((-0.5)(0.5)) = 1/(-0.25). $
  Hence,
  $ angle F(-1.5) = 180 degree = (2k+1)180 degree. $

  Therefore, $s_0=-1.5$ satisfies the angle condition and is a candidate point on the root locus.
  If one also enforces the magnitude condition,
  $ |K F(-1.5)|=1 => K=1/|F(-1.5)|=1/4. $
]

#solved_problem[Breakaway Point Calculation][
  For
  $ Delta(s,K)=1+K/(s(s+2)), $
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
  Sketch the root locus for the normalized equation
  $ 1+K/(s(s+1)(s+3))=0. $
]
#solution[
  Here $n$ denotes the number of poles of $F(s)$ and $m$ the number of zeros of $F(s)$.

  The singular points of
  $ F(s)=1/(s(s+1)(s+3)) $
  are poles at $s=0,-1,-3$, and there are no finite zeros.
  Therefore three branches start at these poles and all three terminate at infinity.

  Since $n=3$ and $m=0$, we have $n-m=3$ asymptotes with angles
  $ theta_q = ((2q+1)180 degree)/(n-m), quad q=0,1,2, $
  namely $60 degree$, $180 degree$, and $300 degree$.
  The centroid is
  $ sigma_a = (0 + (-1) + (-3) - 0)/(3-0) = -4/3. $

  For breakaway analysis,
  $ K = -s(s+1)(s+3), $
  so
  $ (d K)/(d s)=-(3s^2+8s+3)=0. $
  This gives
  $ s = (-8 plus.minus sqrt(64-36))/6 = -0.45, -2.22. $

  The real-axis locus exists on $(-infinity,-3)$ and $(-1,0)$, but not on $(-3,-1)$.
  Hence only $s approx -0.45$ is admissible on the locus, while $s approx -2.22$ is discarded.
]

#solved_problem[Design for Damping Ratio][
  For
  $ Delta(s,K)=s^2+4s+K, quad zeta=0.5, $
  find gain $K$.
]
#solution[
  Here $zeta$ is the damping ratio, $omega_n$ is the natural frequency, and $theta$ is the root angle measured from the negative real axis.

  Desired root angle from negative real axis:
  $ theta = cos^(-1)(zeta)=60 degree. $

  Standard second-order form gives
  $ s = -zeta omega_n plus.minus j omega_n sqrt(1-zeta^2). $
  With $zeta=0.5$,
  $ s = -omega_n/2 plus.minus j omega_n sqrt(3)/2. $

  Characteristic equation is
  $ s^2+4s+K=0. $
  Compare with
  $ s^2 + 2zeta omega_n s + omega_n^2 = 0. $

  Then
  $ 2 zeta omega_n = 4 => omega_n = 4, $
  and
  $ K = omega_n^2 = 16. $
]

=== Supplementary Problems

#supplementary[Normalized-Form Conversion][
  Rewrite
  $ Delta(s,K)=s^3+5s^2+6s+K(s+2)=0 $
  in the form
  $ 1+K F(s)=0, $
  and identify $F(s)$.
]

#supplementary[Root Formula vs Parameter][
  For
  $ Delta(s,K)=s^2+6s+(8+K)=0, $
  derive the two characteristic roots as explicit functions of $K$ and classify when they are real or complex.
]

#supplementary[Angle-Condition Test I][
  Let
  $ F(s)=1/(s(s+2)(s+5)). $
  Check whether $s_0=-1$ satisfies the angle condition.
]

#supplementary[Angle + Magnitude Completion][
  Let
  $ F(s)=1/((s+1)(s+3)). $
  Test whether $s_0=-2$ satisfies the angle condition, and if it does, compute the corresponding parameter value from
  $ |K F(s_0)|=1. $
]

#supplementary[Breakaway Candidates][
  For
  $ 1+K/(s(s+1)(s+4))=0, $
  compute breakaway/break-in candidates from
  $ (d K)/(d s)=0. $
]

#supplementary[Admissible Breakaway Point][
  For the same equation
  $ 1+K/(s(s+1)(s+4))=0, $
  determine which breakaway candidate(s) are admissible by checking real-axis locus segments.
]

#supplementary[Asymptotes and Centroid][
  For
  $ 1+K/(s(s+2)(s+4)(s+6))=0, $
  compute $n-m$, asymptote angles, and centroid.
]

#supplementary[Trajectory Sketch with Complex Zeros][
  Sketch the root locus for
  $ 1+K ((s+2)^2+4)/(s(s+1)(s+4)) = 0. $
  Identify real-axis segments, asymptotes, and how the complex zeros influence branch direction.
]

#supplementary[Damping-Ratio Design][
  For
  $ Delta(s,K)=s^2+2s+K, quad zeta=0.707, $
  determine the parameter $K$ that matches the target damping ratio.
]

#supplementary[Stability Threshold Parameter][
  For
  $ 1+K/(s(s+2)(s+4))=0, $
  determine the value(s) of $K$ at which the root locus crosses the imaginary axis.
  Use the result to infer the stability threshold interval for $K$.
]
