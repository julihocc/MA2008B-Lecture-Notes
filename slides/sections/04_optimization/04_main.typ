= System Optimization

== Solution of Time-Invariant State Equation

This section develops the solution of time-invariant state equations as a foundation for time-domain system analysis.

For the homogeneous system $dot(x) = A x$, the state at time $t$ is obtained from $x(0)$ through a linear map that depends only on elapsed time.
This map is the state transition matrix $Phi(t)$, which propagates initial conditions and also appears in the convolution term of the forced response.

*Definition (State Transition Matrix):* For the linear time-invariant homogeneous system $dot(x)=A x$, the state transition matrix is the unique matrix function $Phi(t)$ such that
  $ dot(Phi)(t)=A Phi(t), quad Phi(0)=I. $
  Consequently, for any initial condition $x(0)$,
  $ x(t)=Phi(t)x(0). $


*Proposition (Time-Domain Representation of $Phi(t)$):* For a constant matrix $A$, the state transition matrix is
  $ Phi(t)=e^(A t). $


_Proof:_ By definition, $Phi(t)$ is the unique solution of
  $ dot(Phi)(t)=A Phi(t), quad Phi(0)=I. $

  Let $E(t)=e^(A t)$, with power-series form
  $ E(t)=sum_(k=0)^infinity ((A t)^k)/k!. $
  Differentiating term by term yields
  $ dot(E)(t)=A E(t), quad E(0)=I. $
  Thus $E(t)$ satisfies the same initial-value problem as $Phi(t)$, so by uniqueness
  $ Phi(t)=e^(A t). $


*Proposition (Laplace-Domain Representation of $Phi(t)$):* For a constant matrix $A$, the state transition matrix satisfies
  $ cal(L){Phi(t)}=(s I-A)^(-1). $
  Equivalently,
  $ Phi(t)=cal(L)^(-1){(s I-A)^(-1)}. $


_Proof:_ Start from
  $ dot(Phi)(t)=A Phi(t), quad Phi(0)=I. $
  Applying Laplace transform and using linearity (with constant $A$) gives
  $ cal(L){dot(Phi)}=s cal(L){Phi(t)}-Phi(0). $
  $ s cal(L){Phi(t)}-Phi(0)=A cal(L){Phi(t)}. $
  Using $Phi(0)=I$,
  $ (s I-A) cal(L){Phi(t)}=I, $
  hence
  $ cal(L){Phi(t)}=(s I-A)^(-1). $

  Applying inverse Laplace transform,
  $ Phi(t)=cal(L)^(-1){(s I-A)^(-1)}. $


*Theorem (Complete Solution):* For the linear time-invariant state equation $dot(x) = A x + B u$ with initial condition $x(0)$, the complete state response is
  $ x(t) = e^(A t) x(0) + integral_0^t e^(A(t-tau)) B u(tau) d tau. $
  The first term is the zero-input (free) response, and the second term is the zero-state (forced) response.


_Proof:_ Start from
  $ dot(x) = A x + B u, quad x(0) = x_0 $
  and define
  $ z(t)=e^(-A t)x(t). $

  Since $A$ is constant, by the product rule,
  $ dot(z) = e^(-A t)(dot(x)-A x) $
  $ = e^(-A t) B u(t). $

  Integrating from $0$ to $t$:
  $ z(t) - z(0) = integral_0^t e^(-A tau) B u(tau) d tau. $
  Since $z(0) = e^0 x(0) = x(0)$, we get
  $ z(t) = x(0) + integral_0^t e^(-A tau) B u(tau) d tau. $

  Multiply both sides by $e^(A t)$:
  $ x(t) = e^(A t) x(0) + e^(A t) integral_0^t e^(-A tau) B u(tau) d tau. $
  $ x(t) = e^(A t) x(0) + integral_0^t e^(A(t-tau)) B u(tau) d tau. $
  Therefore, the complete solution is proved.


*Proposition (Eigenvalue Decomposition Formula):* Suppose $A$ is diagonalizable, so that
  $ A = V Lambda V^(-1), $
  where $V$ is the eigenvector (modal) matrix and $Lambda$ is diagonal with the corresponding eigenvalues.
  Then the matrix exponential is given by
  $ e^(A t) = V e^(Lambda t) V^(-1) $


_Proof:_ Using $A = V Lambda V^(-1)$, for any integer $k >= 1$:
  $ A^k = (V Lambda V^(-1))^k = V Lambda^k V^(-1). $
  Now apply the power-series definition of the matrix exponential:
  $ e^(A t) = sum_(k=0)^infinity ((A t)^k)/k! $
  $ = sum_(k=0)^infinity (A^k t^k)/k! $
  $ = sum_(k=0)^infinity (V Lambda^k V^(-1) t^k)/k!. $
  Since $V$ and $V^(-1)$ do not depend on $k$, factor them outside the series:
  $ e^(A t) = V (sum_(k=0)^infinity (Lambda^k t^k)/k!) V^(-1) $
  $ = V e^(Lambda t) V^(-1). $
  Therefore, the proposition is proved.


== Solved Problem: Diagonal Matrix Exponential via Power Series
Compute the state transition matrix $e^(A t)$ for
  $ A = mat(-1, 0;0, -2) $
  using the power-series definition.

== Solved Problem: Compute State Transition Matrix
Find $e^(A t)$ for
  $ A = mat(0, 1;-1, 0). $

== Solved Problem: State Transition Matrix via Eigenvalue Decomposition
Compute $e^(A t)$ for
  $ A = mat(0, 1;-2, -3) $
  using diagonalization.

== Solved Problem: Zero-Input Response
For
  $ A = mat(0, 1;-2, -3), quad x(0) = mat(1;2), $
  compute the zero-input response
  $ x(t) = e^(A t) x(0). $

== Solved Problem: Zero-State Response
Find response for
  $ A = mat(-1, 0;0, -2), quad B = mat(1;1), quad u(t) = 1, quad x(0) = 0. $

== Solved Problem: Complete Response (Nonzero Initial Condition + Step Input)
For
  $ A = mat(-1, 0;0, -2), B = mat(1;1), u(t)=1, x(0)=mat(1;2), $
  compute the complete response
  $ x(t)=e^(A t)x(0)+integral_0^t e^(A(t-tau))B d tau. $

== Root Locus Analysis and Design

This section develops root-locus analysis and design from a general mathematical viewpoint.
The central question is how roots of a parameterized characteristic equation move as a real parameter varies.
Although root locus is classical in control theory, the same framework applies to broader classes of differential equations and parameter-dependent stability problems.

Notation used in this section: $s in CC$ is the complex variable, $K in RR$ is the real parameter, and $Delta(s,K)$ is the characteristic equation.
When needed, we write $Delta(s,K)=P(s)+K Q(s)$ and define $F(s)=Q(s)/P(s)$ (where $P(s) != 0$).
The symbol $k in ZZ$ is an integer index in the phase condition.

*Definition (Parameterized Characteristic Equation):* Consider a one-parameter family of characteristic equations
  $ Delta(s,K)=0, $
  where $s in CC$ and $K in RR$ is a scalar parameter.
  In this section, $Delta$ is assumed to be polynomial (or rational) in $s$ and affine in $K$, typically written as
  $ Delta(s,K)=P(s)+K Q(s), $
  with $P,Q$ polynomial (or rational) functions of $s$.
  The corresponding root trajectories are the curves traced by solutions $s=s(K)$ as $K$ varies.


*Definition (Root Locus):* The root locus is the set
  $ cal(R) = { s in CC : Delta(s,K)=0, K in I }, $
  where $I$ is a subset of $RR$ (often $I=[0,infinity)$).


*Definition (Design Objective in Root Locus):* Root-locus design means selecting parameter values $K$ so that characteristic roots lie in a target region of the complex plane
  (for example, left half-plane, prescribed damping region, or bounded real-part strip).


*Proposition (Normalized Form):* If $P(s) != 0$ in a region of interest, the equation
  $ P(s)+K Q(s)=0 $
  can be normalized as
  $ 1 + K F(s) = 0, quad F(s)=Q(s)/P(s). $


_Proof:_ Divide the equation $P(s)+K Q(s)=0$ by $P(s)$:
  $ 1 + K Q(s)/P(s) = 0. $
  Defining
  $ F(s)=Q(s)/P(s), $
  we obtain
  $ 1 + K F(s)=0. $


*Theorem (Angle and Magnitude Conditions):* For the normalized form $1+K F(s)=0$ with $K>0$, a point $s_0 in CC$ belongs to the root locus if and only if
  $angle F(s_0) = (2k+1)180 degree, quad k in ZZ,$
  and its magnitude satisfies
  $|K F(s_0)| = 1.$


_Proof:_ From the characteristic equation,
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


*Definition (Breakaway/Break-in Points):* Breakaway/break-in points are real-axis points where multiple root-locus branches meet or separate.
  For equations written as $K=K(s)$, they are found from
  $ (d K)/(d s) = 0, $
  after solving the characteristic equation for the parameter.


== Solved Problem: Characteristic Equation and Pole Locations
For
  $ Delta(s,K)=s(s+2)+K, $
  derive the characteristic equation and the characteristic roots as functions of $K$.

== Solved Problem: Angle Condition Check
For
  $ F(s)=1/((s+1)(s+2)), $
  check whether $s_0=-1.5$ satisfies the angle condition.

== Solved Problem: Breakaway Point Calculation
For
  $ Delta(s,K)=1+K/(s(s+2)), $
  compute the real-axis breakaway/break-in point.

== Solved Problem: Sketch Root Locus
Sketch the root locus for the normalized equation
  $ 1+K/(s(s+1)(s+3))=0. $

== Solved Problem: Design for Damping Ratio
For
  $ Delta(s,K)=s^2+4s+K, quad zeta=0.5, $
  find gain $K$.

== Root Locus Diagrams

This section focuses on constructing root-locus plots for parameterized characteristic equations.
The objective is geometric: determine where branches start, where they terminate, and how they evolve in the complex plane as the parameter changes.

Notation used below: $s in CC$ is the complex variable, $K in RR$ is the real parameter, and
$ Delta(s,K)=P(s)+K Q(s)=0 $
is the characteristic equation.
When $P(s) != 0$, define
$ F(s)=Q(s)/P(s), $
so the normalized form is
$ 1+K F(s)=0. $

*Definition (Trajectory-Plot Elements):* Consider the normalized equation $1+K F(s)=0$ with rational $F(s)$.
  The poles of $F$ are branch starting points at $K=0$, whereas the zeros of $F$ are branch ending points as $K -> infinity$.
  If $F$ has real coefficients, the trajectory is symmetric with respect to the real axis.


*Proposition (Branch Count and Endpoints):* Let $n$ be the number of poles of $F$ and $m$ the number of zeros of $F$ (counted with multiplicity).
  Then the trajectory has exactly $n$ branches.
  Of these, $m$ branches terminate at finite zeros, and the remaining $n-m$ branches go to infinity.


_Proof:_ Write
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


*Theorem (Asymptotes and Centroid):* Let
  $ F(s)=N(s)/D(s), $
  where $D$ is degree-$n$ with poles $p_1,...,p_n$ and
  $N$ is degree-$m$ with zeros $z_1,...,z_m$ (counted with multiplicity), and $n>m$.
  For the normalized equation $1+K F(s)=0$, the number of asymptotes is $n-m$.
  Their angles are given by
  $ theta_k = ((2k+1)180 degree)/(n-m), quad k=0,1,...,n-m-1, $
  and their centroid is
  $ sigma_a = ((sum_(i=1)^n p_i)-(sum_(j=1)^m z_j))/(n-m). $


_Proof:_ Since $n>m$, for large $|s|$ we have
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


*Definition (Departure/Arrival Angles):* At a simple complex pole $p$, the local departure angle is obtained from the angle condition by subtracting all known angle contributions except the unknown branch angle at $p$.
  At a simple complex zero $z$, the arrival angle is obtained analogously.


== Solved Problem: Basic Plot Data
For
  $ 1+K/(s(s+4))=0, $
  determine branch count, start/end points, and any finite breakaway point.

== Solved Problem: Asymptotes and Centroid Calculation
For
  $ 1+K (s+1)/(s(s+2)(s+3))=0, $
  compute asymptote count, asymptote angles, and centroid.

== Solved Problem: Complete Root-Locus Sketch
Sketch the root locus for
  $ 1+K (s+2)/(s(s+1)(s+4))=0. $

== Solved Problem: Imaginary-Axis Crossing Parameter
Determine where the root locus crosses the imaginary axis for
  $ Delta(s,K)=s^3+7s^2+10s+K=0. $

== General Rules for Constructing Root Locus

Systematic construction rules make it possible to sketch root trajectories with modest computation while preserving exact geometric constraints.
Let
$ Delta(s,K)=P(s)+K Q(s)=0 $
be the characteristic equation, and define
$ F(s)=Q(s)/P(s) $
whenever $P(s) != 0$.
Then the normalized form is
$ 1+K F(s)=0. $

*Definition (Branch Structure and Symmetry):* Let $n$ and $m$ denote, respectively, the number of poles and zeros of $F$, counted with multiplicity.
  The root locus has $n$ branches; each branch starts at a pole when $K=0$.
  As $K -> infinity$, $m$ branches terminate at finite zeros and the remaining $n-m$ branches go to infinity.
  If coefficients are real, the root locus is symmetric about the real axis.


*Proposition (Real-Axis Segment Criterion):* A real point belongs to the root locus if and only if the number of real poles and zeros of $F$ to its right is odd.


_Proof:_ On the real axis, each factor $(s-a)$ contributes phase $0 degree$ if $s>a$ and $180 degree$ if $s<a$.
  Hence the phase of $F(s)$ is an odd multiple of $180 degree$ exactly when an odd number of real singular points lies to the right of $s$.
  By the angle condition for $1+K F(s)=0$, this is equivalent to membership in the root locus.


*Theorem (Asymptotes and Centroid Rule):* Assume $n>m$.
  The $n-m$ branches that go to infinity follow asymptotes with angles
  $ theta_k=((2k+1)180 degree)/(n-m), quad k=0,1,...,n-m-1, $
  and common centroid
  $ sigma_a=((sum_(i=1)^n p_i)-(sum_(j=1)^m z_j))/(n-m), $
  where $p_i$ and $z_j$ are poles and zeros of $F$.


*Definition (Breakaway and Break-in Points):* On real-axis trajectory segments, candidate breakaway or break-in points are stationary points of the gain map.
  Writing the normalized equation as
  $ K(s)=-1/F(s), $
  candidates satisfy
  $ (d K)/(d s)=0. $
  Only candidates that lie on admissible real-axis segments are valid trajectory points.


*Definition (Imaginary-Axis Crossing):* Crossing values of $K$ are obtained by applying the Routh criterion to $Delta(s,K)$.
  A crossing occurs when a row in the first column changes sign through zero; the corresponding auxiliary equation gives the crossing frequency.


*Definition (Departure and Arrival Angles):* For a simple complex pole $p_i$, the departure angle is
  $ theta_("dep")=180 degree + sum_k angle(p_i-z_k) - sum_(j != i) angle(p_i-p_j). $
  For a simple complex zero $z_i$, the arrival angle is obtained by the analogous exchange of poles and zeros.


== Solved Problem: Apply All Rules
Construct the root locus for
  $ 1 + K/((s+1)(s^2+2s+2)) = 0 $
  using systematic rules.

== Solved Problem: Design Using Root Locus
For
  $ Delta(s,K)=s(s+2)+K=0, $
  find $K$ for poles at $s = -1 plus.minus j$.

== Solved Problem: Imaginary-Axis Crossing by Routh
Determine the crossing gain and frequency for
  $ Delta(s,K)=s^3+3s^2+2s+K=0. $

== Root Locus of Control Systems

Consider a unity-feedback system with open-loop transfer function
$ L(s)=K C(s)P(s), $
so the closed-loop characteristic equation is
$ Delta(s,K)=1+L(s)=0. $
Root-locus design consists of choosing $K$ (and, when needed, a compensator $C$) so that selected roots of $Delta$ satisfy prescribed transient-performance requirements.

*Definition (Second-Order Target Pair):* For damping ratio $zeta in (0,1)$ and natural frequency $omega_n>0$, the target dominant pair is
  $ s_d=-zeta omega_n plus.minus j omega_n sqrt(1-zeta^2). $
  Approximate time-domain specifications are linked by
  $ t_s approx 4/(zeta omega_n) $
  (2% criterion) and
  $ M_p approx exp(-(zeta pi)/sqrt(1-zeta^2)). $


*Proposition (Dominant-Pole Approximation):* If non-dominant closed-loop poles lie sufficiently farther to the left than $s_d$, then transient response is well approximated by the second-order model generated by the dominant pair.


_Proof:_ In the time domain, each pole contributes a modal term $e^(s_i t)$ multiplied by a polynomial factor.
  Modes with more negative real parts decay faster.
  Therefore, when non-dominant poles satisfy $Re(s_i) << Re(s_d)$, their contribution is negligible during the main transient interval, and the dominant pair determines overshoot and settling behavior to first order.


*Theorem (Compensator Geometry on the Root Locus):* A real compensator zero introduces positive phase near candidate points and attracts nearby branches, while a real compensator pole introduces negative phase and repels nearby branches.
  Consequently, lead compensation (zero closer to the origin than its pole) is used to increase phase margin and damping, whereas lag compensation (pole closer to the origin than its zero) is used primarily to improve low-frequency accuracy with smaller changes in transient geometry.


== Solved Problem: Settling-Time Feasibility Check
For
  $ Delta(s,K)=s(s+4)+K=0, $
  determine whether the requirement $t_s=1"s"$ (2% criterion) can be met by gain adjustment alone.

== Solved Problem: Compensator Design
Design a lead compensator for $P(s)=1/(s(s+1))$ so that dominant poles are at
  $ s_d=-1 plus.minus j sqrt(3) $
  (equivalently $zeta=0.5$, $omega_n=2$).

== Solved Problem: Dominant-Pole Interpretation
For
  $ L(s)=K/((s+1)(s+2)(s+20)), $
  explain why the pair near $-1$ and $-2$ is treated as dominant in preliminary design.

== Root Contour Diagrams

Root contours generalize root-locus geometry from one-parameter variation to multi-parameter families.
Instead of tracing poles under variation of a single gain, one studies level sets and trajectories produced by simultaneous variation of parameters such as gain, compensator zero, and compensator pole.

*Definition (Root-Contour Family):* Let
  $ Delta(s,alpha,beta)=0 $
  be a characteristic equation depending on two real parameters.
  The root contour is the set of all $s in CC$ for which there exists $(alpha,beta)$ satisfying the equation.
  Curves obtained by fixing one parameter and varying the other are one-parameter slices of this two-parameter family.


*Definition (Constant Damping and Constant Frequency Curves):* For a complex pole $s=sigma+j omega$, define
  $ omega_n=sqrt(sigma^2+omega^2) $
  and
  $ zeta=-sigma/omega_n $
  when $sigma<0$.
  Hence constant-damping loci are rays from the origin, and constant-natural-frequency loci are circles centered at the origin.


*Theorem (Admissible Performance Region):* Suppose the design requires
  $ zeta >= zeta_min $
  and
  $ omega_n <= omega_(n,max). $
  Then admissible dominant poles must satisfy
  $ |s| <= omega_(n,max) $
  and
  $ |arg(s)| >= cos^(-1)(zeta_min), $
  with $Re(s)<0$.


_Proof:_ The inequality
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


*Proposition (Local Parameter Sensitivity):* If $Delta(s,p)=0$ and $partial Delta/partial s != 0$ at a nominal point $(s_0,p_0)$, then locally
  $ (d s)/(d p) = - (partial Delta/partial p)/(partial Delta/partial s) $ at $(s_0,p_0)$.


_Proof:_ Differentiate the identity
  $ Delta(s(p),p)=0 $
  with respect to $p$.
  By the chain rule,
  $ (partial Delta/partial s) (d s)/(d p) + partial Delta/partial p = 0. $
  Solving for $(d s)/(d p)$ gives the stated formula.


== Solved Problem: Parameter Space Design
For
  $ Delta(s,K_1,K_2)=s(s+1)(s+3)+K_1(s+K_2)=0, $
  find $(K_1, K_2)$ for $zeta = 0.7$, $omega_n = 2$.

== Solved Problem: Sensitivity Analysis
Analyze sensitivity of pole location to a 10% variation in $K$ for
  $ Delta(s,K)=s^2+2s+K=0. $

== Solved Problem: Performance Region Interpretation
For requirements
  $ zeta >= 0.5 $
  and
  $ omega_n <= 4, $
  describe the admissible dominant-pole region.
