#import "../../utils.typ": *
== Root Locus Diagrams

=== Mathematical Review

In this section, we focus on plotting the root-trajectory set of a parameterized characteristic equation.
The objective is geometric: determine where branches start, where they end, and how they move in the complex plane as the parameter changes.

Notation used below: $s in CC$ is the complex variable, $K in RR$ is the real parameter, and
$ Delta(s,K)=P(s)+K Q(s)=0 $
is the characteristic equation.
When $P(s) != 0$, define
$ F(s)=Q(s)/P(s), $
so the normalized form is
$ 1+K F(s)=0. $

#definition[Trajectory-Plot Elements][
  For a normalized equation $1+K F(s)=0$ with rational $F(s)$:
  - poles of $F$ are branch starting points (at $K=0$),
  - zeros of $F$ are branch ending points (as $K -> infinity$),
  - if $F$ has real coefficients, the trajectory is symmetric about the real axis.
]

#proposition[Branch Count and Endpoints][
  Let $n$ be the number of poles of $F$ and $m$ the number of zeros of $F$ (counted with multiplicity).
  Then:
  - the trajectory has $n$ branches,
  - $m$ branches end at finite zeros,
  - $n-m$ branches go to infinity.
]

#proof[
  Write
  $ F(s)=N(s)/D(s), $
  where $D$ has degree $n$ and $N$ has degree $m$ (with $n>=m$).
  The normalized characteristic equation
  $ 1+K F(s)=0 $
  is equivalent to
  $ D(s)+K N(s)=0. $

  For each fixed $K$, this is an algebraic equation of degree $n$ in $s$, so counting multiplicities it has $n$ roots.
  As $K$ varies continuously, these roots trace $n$ continuous branches.

  At $K=0$, the equation becomes
  $ D(s)=0, $
  so branch starting points are the poles of $F$.

  For large $K$, divide by $K$:
  $ N(s) + D(s)/K = 0. $
  As $K -> infinity$, $m$ roots approach solutions of
  $ N(s)=0, $
  i.e., finite zeros of $F$.
  The remaining $n-m$ roots cannot converge to finite points and therefore go to infinity.

  Hence the trajectory has $n$ branches, with $m$ finite-end branches and $n-m$ branches ending at infinity.
]

#theorem[Asymptotes and Centroid]
[For $n>m$ in the normalized form $1+K F(s)=0$:
  - number of asymptotes: $n-m$,
  - asymptote angles:
    $ theta_k = ((2k+1)180 degree)/(n-m), quad k=0,1,...,n-m-1, $
  - centroid:
    $ sigma_a = (sum "poles" - sum "zeros")/(n-m). $
]

#proof[
  For large $|s|$, finite zeros/poles contribute approximately their highest-order terms, so
  $ F(s) approx c/s^(n-m), $
  for some real constant $c != 0$.
  The characteristic equation
  $ 1+K F(s)=0 $
  becomes asymptotically
  $ s^(n-m) approx -K c. $
  Therefore the $n-m$ branches at infinity follow equally spaced directions,
  giving angles
  $ theta_k = ((2k+1)180 degree)/(n-m). $

  The centroid formula follows from balancing pole-zero contributions in the first-order term of the large-$s$ expansion, yielding
  $ sigma_a = (sum "poles" - sum "zeros")/(n-m). $
]

#definition[Departure/Arrival Angles][
  At a simple complex pole $p$, the local departure angle is obtained from the angle condition by subtracting all known angle contributions except the unknown branch angle at $p$.
  At a simple complex zero $z$, the arrival angle is obtained analogously.
]

=== Solved Problems

#solved_problem[Basic Plot Data][
  For
  $ 1+K/(s(s+4))=0, $
  determine branch count, start/end points, and any finite breakaway point.
]
#solution[
  Here $F(s)=1/(s(s+4))$ has poles at $s=0,-4$ and no finite zeros.
  So there are $n=2$ branches, both starting at $0,-4$ and ending at infinity.

  From
  $ 1+K/(s(s+4))=0, $
  we get
  $ K=-s(s+4). $
  Breakaway candidates satisfy
  $ (d K)/(d s)=-(2s+4)=0 => s=-2. $
  Thus the finite breakaway point is
  $ s=-2. $
]

#solved_problem[Asymptotes and Centroid Calculation][
  For
  $ 1+K (s+1)/(s(s+2)(s+3))=0, $
  compute asymptote count, asymptote angles, and centroid.
]
#solution[
  Let
  $ F(s)=(s+1)/(s(s+2)(s+3)). $
  Then poles are $0,-2,-3$ ($n=3$) and zero is $-1$ ($m=1$), so
  $ n-m=2. $

  Asymptote angles:
  $ theta_k=((2k+1)180 degree)/2, quad k=0,1, $
  hence
  $ 90 degree, 270 degree. $

  Centroid:
  $ sigma_a = (0+(-2)+(-3)-(-1))/2 = -2. $
]

#solved_problem[Complete Trajectory Sketch]
[Sketch the root trajectory set for
  $ 1+K (s+2)/(s(s+1)(s+4))=0. $
]
#solution[
  1. Define
     $ F(s)=(s+2)/(s(s+1)(s+4)). $
     Poles: $0,-1,-4$ ($n=3$). Zero: $-2$ ($m=1$).

  2. Branch structure:
     three branches start at poles;
     one ends at $-2$ and two go to infinity.

  3. Asymptotes:
     $ n-m=2, $
     angles $90 degree, 270 degree$,
     centroid
     $ sigma_a = (0+(-1)+(-4)-(-2))/2 = -1.5. $

  4. Real-axis segments (odd-count rule):
     $(-4,-2)$ and $(-1,0)$. 

  5. Breakaway candidate:
     from
     $ K = -s(s+1)(s+4)/(s+2), $
     solving
     $ (d K)/(d s)=0 $
     gives a candidate near
     $ s approx -0.46, $
     which lies in $(-1,0)$ and is admissible.
]

#solved_problem[Imaginary-Axis Crossing Parameter][
  Determine where the root trajectory crosses the imaginary axis for
  $ Delta(s,K)=s^3+7s^2+10s+K=0. $
]
#solution[
  Use the Routh array:
  $
    s^3: quad &1 quad 10 \
    s^2: quad &7 quad K \
    s^1: quad &(70-K)/7 \
    s^0: quad &K
  $

  Crossing occurs when the $s^1$ row leading term is zero:
  $ (70-K)/7=0 => K=70. $

  The auxiliary equation is
  $ 7s^2+K=0. $
  With $K=70$:
  $ s=plus.minus j sqrt(10). $
]

=== Supplementary Problems

#supplementary[Branch Count and Endpoints][
  For
  $ 1+K (s+5)/(s(s+1)(s+2)(s+3))=0, $
  determine $n,m$, branch count, and endpoint types.
]

#supplementary[Asymptote Geometry][
  For
  $ 1+K/(s(s+2)(s+4)(s+6))=0, $
  compute asymptote angles and centroid.
]

#supplementary[Real-Axis Segments]
[For
  $ 1+K (s+3)/(s(s+1)(s+4)(s+5))=0, $
  determine all real-axis segments belonging to the trajectory set.
]

#supplementary[Breakaway Candidates][
  For
  $ 1+K/(s(s+1)(s+4))=0, $
  compute all solutions of
  $ (d K)/(d s)=0. $
]

#supplementary[Admissible Breakaway Points][
  Using the previous problem, keep only candidates that lie on valid real-axis trajectory segments.
]

#supplementary[Complex-Zero Effect][
  Sketch the trajectory for
  $ 1+K ((s+2)^2+1)/(s(s+1)(s+4))=0, $
  and describe how nonreal zeros affect branch direction.
]

#supplementary[Angle Check at a Test Point][
  Let
  $ F(s)=1/((s+1)(s+2)(s+5)). $
  Check whether $s_0=-1.5$ satisfies the angle condition.
]

#supplementary[Magnitude Completion][
  For the same $F(s)$ and test point $s_0=-1.5$, compute the corresponding parameter value from
  $ |K F(s_0)|=1, $
  if the phase condition is satisfied.
]

#supplementary[Imaginary-Axis Crossing]
[Find the parameter value(s) where
  $ Delta(s,K)=s^3+5s^2+6s+K=0 $
  has purely imaginary roots.
]

#supplementary[Target Damping Region][
  For
  $ Delta(s,K)=s^2+3s+K, quad zeta=0.6, $
  determine the value of $K$ that places the roots on the corresponding damping line.
]
