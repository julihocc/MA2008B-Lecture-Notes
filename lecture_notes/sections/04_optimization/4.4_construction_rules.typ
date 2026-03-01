#import "../../utils.typ": *
== General Rules for Constructing Root Locus

=== Mathematical Review

Systematic construction rules allow one to sketch root trajectories with limited computation while preserving exact geometric constraints.
Let
$ Delta(s,K)=P(s)+K Q(s)=0 $
be the characteristic equation, and define
$ F(s)=Q(s)/P(s) $
whenever $P(s) != 0$.
Then the normalized form is
$ 1+K F(s)=0. $

#definition[Branch Structure and Symmetry][
  Let $n$ and $m$ denote, respectively, the number of poles and zeros of $F$, counted with multiplicity.
  The root trajectory has $n$ branches; each branch starts at a pole when $K=0$.
  As $K -> infinity$, $m$ branches terminate at finite zeros and the remaining $n-m$ branches go to infinity.
  If coefficients are real, the trajectory is symmetric about the real axis.
]

#proposition[Real-Axis Segment Criterion][
  A real point belongs to the root trajectory if and only if the number of real poles and zeros of $F$ to its right is odd.
]

#proof[
  On the real axis, each factor $(s-a)$ contributes phase $0 degree$ if $s>a$ and $180 degree$ if $s<a$.
  Hence the phase of $F(s)$ is an odd multiple of $180 degree$ exactly when an odd number of real singular points lies to the right of $s$.
  By the angle condition for $1+K F(s)=0$, this is equivalent to membership in the trajectory.
]

#theorem[Asymptotes and Centroid Rule][
  Assume $n>m$.
  The $n-m$ branches that go to infinity follow asymptotes with angles
  $ theta_k=((2k+1)180 degree)/(n-m), quad k=0,1,...,n-m-1, $
  and common centroid
  $ sigma_a=((sum_(i=1)^n p_i)-(sum_(j=1)^m z_j))/(n-m), $
  where $p_i$ and $z_j$ are poles and zeros of $F$.
]

#definition[Breakaway and Break-in Points][
  On real-axis trajectory segments, candidate breakaway or break-in points are stationary points of the gain map.
  Writing the normalized equation as
  $ K(s)=-1/F(s), $
  candidates satisfy
  $ (d K)/(d s)=0. $
  Only candidates that lie on admissible real-axis segments are valid trajectory points.
]

#definition[Imaginary-Axis Crossing][
  Crossing values of $K$ are obtained by applying the Routh criterion to $Delta(s,K)$.
  A crossing occurs when a row in the first column changes sign through zero; the corresponding auxiliary equation gives the crossing frequency.
]

#definition[Departure and Arrival Angles][
  For a simple complex pole $p_i$, the departure angle is
  $ theta_("dep")=180 degree + sum_k angle(p_i-z_k) - sum_(j != i) angle(p_i-p_j). $
  For a simple complex zero $z_i$, the arrival angle is obtained by the analogous exchange of poles and zeros.
]

=== Solved Problems

#solved_problem[Apply All Rules][
  Construct root locus for $G(s) = K/((s+1)(s^2+2s+2))$ using systematic rules.
]
#solution[
  With
  $ F(s)=1/((s+1)(s^2+2s+2)), $
  the poles are $-1$ and $-1 plus.minus j$, and there are no finite zeros.
  Hence $n=3$, $m=0$, and all three branches go to infinity.

  The real-axis criterion gives the segment $(-infinity,-1)$.
  Since $n-m=3$, asymptote angles are $60 degree$, $180 degree$, and $300 degree$.
  The centroid is
  $ sigma_a = (-1 + (-1+j) + (-1-j))/3 = -1. $

  At the pole $p=-1+j$, the other-pole angle contributions are
  $ angle(p-(-1))=90 degree $
  and
  $ angle(p-(-1-j))=90 degree. $
  Therefore
  $ theta_("dep")=180 degree-(90 degree+90 degree)=0 degree. $

  For breakaway analysis,
  $ K(s)=-(s+1)(s^2+2s+2), $
  so
  $ (d K)/(d s)=-3(s+1)^2. $
  The only stationary point is $s=-1$, which is a pole location, so there is no interior finite breakaway point on the real-axis segment.
]

#solved_problem[Design Using Root Locus][
  For $G(s) = K/(s(s+2))$, find $K$ for poles at $s = -1 plus.minus j$.
]
#solution[
  The characteristic equation is
  $ s^2+2s+K=0. $
  Requiring $s=-1 plus.minus j$ gives
  $ (-1+j)^2+2(-1+j)+K=0. $
  Simplifying,
  $ -2+K=0, $
  so the required gain is
  $ K=2. $
]

#solved_problem[Imaginary-Axis Crossing by Routh][
  Determine the crossing gain and frequency for
  $ Delta(s,K)=s^3+3s^2+2s+K=0. $
]
#solution[
  Build the Routh table:
  $
    s^3: quad &1 quad 2 \
    s^2: quad &3 quad K \
    s^1: quad &(6-K)/3 \
    s^0: quad &K
  $

  A crossing occurs when the first entry of the $s^1$ row is zero, hence
  $ (6-K)/3=0 => K=6. $
  The auxiliary equation from the $s^2$ row is
  $ 3s^2+K=0. $
  With $K=6$, this yields
  $ s=plus.minus j sqrt(2). $
]

=== Supplementary Problems

#supplementary[Branch Count and Endpoints][
  For
  $ 1+K (s+2)/(s(s+1)(s+3)(s+5))=0, $
  determine $n,m$, branch count, and endpoint types.
]

#supplementary[Real-Axis Segments][
  For
  $ 1+K (s+4)/(s(s+1)(s+2)(s+6))=0, $
  determine all real-axis trajectory segments.
]

#supplementary[Asymptotes and Centroid][
  For
  $ 1+K/(s(s+2)(s+4)(s+8))=0, $
  compute asymptote angles and centroid.
]

#supplementary[Departure Angle][
  Let
  $ F(s)=1/((s+1)(s^2+2s+5)). $
  Compute the departure angle at the pole $-1+2j$.
]

#supplementary[Breakaway Candidates][
  For
  $ 1+K/(s(s+2)(s+5))=0, $
  derive $K(s)$ and solve
  $ (d K)/(d s)=0. $
]

#supplementary[Admissible Breakaway Points][
  Using the previous result, keep only candidates lying on valid real-axis segments.
]

#supplementary[Imaginary-Axis Crossing I][
  Find $K$ and crossing frequency for
  $ Delta(s,K)=s^3+4s^2+5s+K=0. $
]

#supplementary[Imaginary-Axis Crossing II][
  For
  $ Delta(s,K)=s^4+6s^3+11s^2+6s+K=0, $
  determine whether an imaginary-axis crossing exists for $K>0$.
]

#supplementary[Gain for Prescribed Pole][
  For
  $ G(s)=K/(s(s+4)), $
  find $K$ such that the closed-loop poles are at $-2 plus.minus 2j$.
]

#supplementary[Compensator Effect][
  Compare the loci of
  $ G_1(s)=K/(s(s+2)(s+5)) $
  and
  $ G_2(s)=K (s+1)/(s(s+2)(s+5)). $
  Describe how the added zero changes branch direction and asymptote structure.
]
