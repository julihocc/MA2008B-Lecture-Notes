#import "../../utils.typ": *
== Root Contour Diagrams

=== Mathematical Review

Root contours generalize root-locus geometry from one-parameter variation to multi-parameter families.
Instead of tracing poles under variation of a single gain, one studies level sets and trajectories produced by simultaneous variation of parameters such as gain, compensator zero, and compensator pole.

#definition[Root-Contour Family][
  Let
  $ Delta(s,alpha,beta)=0 $
  be a characteristic equation depending on two real parameters.
  The root contour is the set of all $s in CC$ for which there exists $(alpha,beta)$ satisfying the equation.
  Curves obtained by fixing one parameter and varying the other are one-parameter slices of this two-parameter family.
]

#definition[Constant Damping and Constant Frequency Curves][
  For a complex pole $s=sigma+j omega$, define
  $ omega_n=sqrt(sigma^2+omega^2) $
  and
  $ zeta=-sigma/omega_n $
  when $sigma<0$.
  Hence constant-damping loci are rays from the origin, and constant-natural-frequency loci are circles centered at the origin.
]

#theorem[Admissible Performance Region][
  Suppose the design requires
  $ zeta >= zeta_min $
  and
  $ omega_n <= omega_(n,max). $
  Then admissible dominant poles must satisfy
  $ |s| <= omega_(n,max) $
  and
  $ |arg(s)| >= cos^(-1)(zeta_min), $
  with $Re(s)<0$.
]

#proof[
  The inequality
  $ omega_n <= omega_(n,max) $
  is equivalent to
  $ |s| <= omega_(n,max), $
  which defines a disk.
  Also,
  $ zeta=-sigma/sqrt(sigma^2+omega^2) >= zeta_min $
  gives angular bounds
  $ |arg(s)| >= cos^(-1)(zeta_min) $
  in the left half-plane.
  Their intersection yields the admissible region.
]

#proposition[Local Parameter Sensitivity][
  If $Delta(s,p)=0$ and $partial Delta/partial s != 0$ at a nominal point $(s_0,p_0)$, then locally
  $ (d s)/(d p) = - (partial Delta/partial p)/(partial Delta/partial s) $ at $(s_0,p_0)$.
]

#proof[
  Differentiate the identity
  $ Delta(s(p),p)=0 $
  with respect to $p$.
  By the chain rule,
  $ (partial Delta/partial s) (d s)/(d p) + partial Delta/partial p = 0. $
  Solving for $(d s)/(d p)$ gives the stated formula.
]

=== Solved Problems

#solved_problem[Parameter Space Design][
  For
  $ Delta(s,K_1,K_2)=s(s+1)(s+3)+K_1(s+K_2)=0, $
  find $(K_1, K_2)$ for $zeta = 0.7$, $omega_n = 2$.
]
#solution[
  The desired dominant pole is
  $ s_d=-zeta omega_n + j omega_n sqrt(1-zeta^2) = -1.4 + j 1.428. $

  With unity feedback,
  $ Delta(s)=s(s+1)(s+3)+K_1(s+K_2)=0, $
  so
  $ Delta(s)=s^3+4s^2+3s + K_1 s + K_1 K_2. $

  Evaluate at $s_d$.
  Let
  $ A=s_d^3+4s_d^2+3s_d. $
  Numerically,
  $ A approx 1.305 - j 6.228. $
  The equation
  $ A + K_1(s_d+K_2)=0 $
  gives two real equations:
  $ K_1 Im(s_d) = -Im(A), $
  $ K_1 (Re(s_d)+K_2) = -Re(A). $

  Hence
  $ K_1 approx 4.36, $
  and then
  $ K_2 approx 1.10. $
  Therefore one feasible parameter pair is
  $ (K_1,K_2) approx (4.36,1.10). $
]

#solved_problem[Sensitivity Analysis][
  Analyze sensitivity of pole location to a 10% variation in $K$ for
  $ Delta(s,K)=s^2+2s+K=0. $
]
#solution[
  The closed-loop polynomial is
  $ Delta(s,K)=s^2+2s+K. $
  At $K_0=4$, poles are
  $ s_0=-1 plus.minus j sqrt(3). $

  From
  $ (d s)/(d K)=-(partial Delta/partial K)/(partial Delta/partial s), $
  we obtain
  $ (d s)/(d K) = -1/(2s+2). $
  At the upper pole $s_0=-1+j sqrt(3)$,
  $ 2s_0+2 = j 2 sqrt(3), $
  so
  $ (d s)/(d K) = j/(2 sqrt(3)). $

  For $Delta K=0.4$ (10% increase), the linear estimate is
  $ Delta s approx (d s)/(d K) Delta K = j 0.115. $
  Exact poles at $K=4.4$ are
  $ s=-1 plus.minus j sqrt(3.4), $
  giving an actual imaginary shift of about $0.112$.
  The linear sensitivity prediction is therefore accurate in this range.
]

#solved_problem[Performance Region Interpretation][
  For requirements
  $ zeta >= 0.5 $
  and
  $ omega_n <= 4, $
  describe the admissible dominant-pole region.
]
#solution[
  The damping requirement implies
  $ |arg(s)| >= cos^(-1)(0.5)=60 degree $
  in the left half-plane.
  The natural-frequency requirement gives
  $ |s| <= 4. $

  Therefore admissible poles are inside the radius-4 circle and inside the left-half-plane sector bounded by rays at $120 degree$ and $240 degree$ (equivalently, between the two constant-damping rays corresponding to $zeta=0.5$).
]

=== Supplementary Problems

#supplementary[Two-Parameter Mapping][
  For
  $ Delta(s,K_1,K_2)=s^3+5s^2+(4+K_1)s+K_1 K_2, $
  derive the two real equations in $(K_1,K_2)$ obtained by imposing a target pole
  $ s_d=-1.2 + j 1.6. $
]

#supplementary[Feasible Parameter Pair][
  Using the previous problem, compute one feasible pair $(K_1,K_2)$ that places a pole at $s_d=-1.2 + j 1.6$.
]

#supplementary[Constant-Damping Ray][
  Determine the line angle associated with
  $ zeta=0.6 $
  and write the equation of the corresponding ray in the left half-plane.
]

#supplementary[Constant-Frequency Circle][
  For
  $ omega_n=3.5, $
  write the geometric equation of the corresponding locus in the $s$-plane.
]

#supplementary[Region Membership Test][
  For constraints
  $ zeta >= 0.55 $
  and
  $ omega_n <= 5, $
  decide whether each point is admissible:
  $ s_1=-2 + j 2, s_2=-1 + j 4, s_3=-4 + j 1. $
]

#supplementary[Sensitivity Formula Practice][
  For
  $ Delta(s,p)=s^3+2s^2+(1+p)s+p, $
  compute
  $ (d s)/(d p) $
  symbolically using the local sensitivity proposition.
]

#supplementary[Numerical Sensitivity][
  Evaluate the previous derivative at $p=1$ and $s=-1$.
  Interpret the sign of the real part of $(d s)/(d p)$.
]

#supplementary[Gain Perturbation][
  For
  $ Delta(s,K)=s^2+4s+K, $
  estimate pole displacement for a $5\%$ increase around $K=8$ using
  $ (d s)/(d K). $
]

#supplementary[Robust Region Statement][
  Formulate a sufficient geometric condition ensuring that all dominant poles remain admissible when $K$ varies in an interval $[K_min,K_max]$.
]

#supplementary[Contour vs. Locus][
  Explain, in mathematical terms, the difference between a one-parameter root locus and a two-parameter root contour for the same plant.
]
