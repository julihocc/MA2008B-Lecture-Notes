#import "../../utils.typ": *
== Root Locus Diagrams

=== Mathematical Review

This section focuses on constructing root-trajectory plots for parameterized characteristic equations.
The objective is geometric: determine where branches start, where they terminate, and how they evolve in the complex plane as the parameter changes.

Notation used below: $s in CC$ is the complex variable, $K in RR$ is the real parameter, and
$ Delta(s,K)=P(s)+K Q(s)=0 $
is the characteristic equation.
When $P(s) != 0$, define
$ F(s)=Q(s)/P(s), $
so the normalized form is
$ 1+K F(s)=0. $

#definition[Trajectory-Plot Elements][
  Consider the normalized equation $1+K F(s)=0$ with rational $F(s)$.
  The poles of $F$ are branch starting points at $K=0$, whereas the zeros of $F$ are branch ending points as $K -> infinity$.
  If $F$ has real coefficients, the trajectory is symmetric with respect to the real axis.
]

#proposition[Branch Count and Endpoints][
  Let $n$ be the number of poles of $F$ and $m$ the number of zeros of $F$ (counted with multiplicity).
  Then the trajectory has exactly $n$ branches.
  Of these, $m$ branches terminate at finite zeros, and the remaining $n-m$ branches go to infinity.
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

#theorem[Asymptotes and Centroid][Let
  $ F(s)=N(s)/D(s), $
  where $D$ is degree-$n$ with poles $p_1,...,p_n$ and
  $N$ is degree-$m$ with zeros $z_1,...,z_m$ (counted with multiplicity), and $n>m$.
  For the normalized equation $1+K F(s)=0$, the number of asymptotes is $n-m$.
  Their angles are given by
  $ theta_k = ((2k+1)180 degree)/(n-m), quad k=0,1,...,n-m-1, $
  and their centroid is
  $ sigma_a = ((sum_(i=1)^n p_i)-(sum_(j=1)^m z_j))/(n-m). $
]

#proof[
  Since $n>m$, for large $|s|$ we have
  $ F(s)=N(s)/D(s) approx c/s^(n-m), $
  where $c != 0$ is the ratio of leading coefficients.
  Then
  $ 1+K F(s)=0 $
  gives asymptotically
  $ s^(n-m) approx -K c. $
  Therefore there are $n-m$ directions at infinity, equally spaced by
  $ 360 degree/(n-m), $
  with principal angles
  $ theta_k = ((2k+1)180 degree)/(n-m). $

  For the centroid, expand the products:
  $ D(s)=s^n-(sum_(i=1)^n p_i)s^(n-1)+... $
  and
  $ N(s)=s^m-(sum_(j=1)^m z_j)s^(m-1)+... . $
  Dividing the characteristic equation
  $ D(s)+K N(s)=0 $
  by $s^m$ and retaining the dominant two powers in $s$ for large $|s|$ yields
  $ s^(n-m) - ((sum_(i=1)^n p_i)-(sum_(j=1)^m z_j)) s^(n-m-1) + ... approx -K. $
  The asymptotes are the rays of the polynomial in the variable
  $ w=s-sigma_a, $
  and cancellation of the $w^(n-m-1)$ term gives
  $ sigma_a = ((sum_(i=1)^n p_i)-(sum_(j=1)^m z_j))/(n-m). $
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

#solved_problem[Complete Trajectory Sketch][Sketch the root trajectory set for
  $ 1+K (s+2)/(s(s+1)(s+4))=0. $
]
#solution[
  Define
  $ F(s)=(s+2)/(s(s+1)(s+4)). $
  The poles are $0,-1,-4$ ($n=3$), and the zero is $-2$ ($m=1$).
  Therefore, three branches start at the poles; one ends at $-2$, and two go to infinity.

  Since $n-m=2$, there are two asymptotes with angles $90 degree$ and $270 degree$.
  The centroid is
  $ sigma_a = (0+(-1)+(-4)-(-2))/2 = -1.5. $

  By the odd-count rule, the real-axis segments are $(-4,-2)$ and $(-1,0)$.
  To locate a breakaway point, write
  $ K = -s(s+1)(s+4)/(s+2). $
  Solving
  $ (d K)/(d s)=0, 2s^3+11s^2+20s+8=0, $
  gives a candidate near
  $ s approx -0.55, $
  which belongs to $(-1,0)$ and is therefore admissible.
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

#supplementary[Real-Axis Segments][For
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

#supplementary[Imaginary-Axis Crossing][Find the parameter value(s) where
  $ Delta(s,K)=s^3+5s^2+6s+K=0 $
  has purely imaginary roots.
]

#supplementary[Target Damping Region][
  For
  $ Delta(s,K)=s^2+3s+K, quad zeta=0.6, $
  determine the value of $K$ that places the roots on the corresponding damping line.
]
