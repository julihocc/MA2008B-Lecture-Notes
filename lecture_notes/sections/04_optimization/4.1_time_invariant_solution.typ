#import "../../utils.typ": *
== Solution of Time-Invariant State Equation

=== Mathematical Review

The solution of time-invariant state equations provides the foundation for analyzing system behavior over time.

For the homogeneous system $dot(x) = A x$, the state at time $t$ must be obtained from $x(0)$ through a linear map that depends on elapsed time.
That map is the state transition matrix $Phi(t)$, which propagates initial conditions and also appears in the forced-response convolution term when inputs are present.

#definition[State Transition Matrix][
  For the linear time-invariant homogeneous system $dot(x)=A x$, the state transition matrix is the unique matrix function $Phi(t)$ such that
  $ dot(Phi)(t)=A Phi(t), quad Phi(0)=I. $
  Consequently, for any initial condition $x(0)$,
  $ x(t)=Phi(t)x(0). $
]

#theorem[Equivalent Representations of $Phi(t)$][
  For constant $A$, the state transition matrix in time domain satisfies:
  $ Phi(t)=e^(A t). $
  Also,
  $ cal(L){Phi(t)}=(s I-A)^(-1). $
  Equivalently,
  $ Phi(t)=cal(L)^(-1){(s I-A)^(-1)}. $
]

#proof[
  By definition, $Phi(t)$ is the unique solution of
  $ dot(Phi)(t)=A Phi(t), quad Phi(0)=I. $
  Consider $E(t)=e^(A t)$. From the power-series definition,
  $ E(t)=sum_(k=0)^infinity ((A t)^k)/k!, $ so
  $ dot(E)(t)=A E(t), quad E(0)=I. $
  Hence $E(t)$ satisfies the same initial-value problem as $Phi(t)$; by uniqueness,
  $ Phi(t)=e^(A t). $
  Now take Laplace transform in the matrix differential equation:
  - Derivative property: $cal(L){dot(X)}=s cal(L){X}-X(0)$.
  - Linearity with constant matrix: for constant $A$,
    $cal(L){A X(t)}=A cal(L){X(t)}. $
  - Inverse identity: $cal(L)^(-1){cal(L){X(t)}}=X(t)$.

  $ cal(L){dot(Phi)}=s cal(L){Phi(t)}-Phi(0)=A cal(L){Phi(t)}. $
  Using $Phi(0)=I$,
  $ (s I-A) cal(L){Phi(t)}=I. $
  Therefore,
  $ cal(L){Phi(t)}=(s I-A)^(-1). $
  Taking inverse Laplace transform gives
  $ Phi(t)=cal(L)^(-1){(s I-A)^(-1)}. $
  Combining both identities,
  $ Phi(t)=e^(A t)=cal(L)^(-1){(s I-A)^(-1)}. $
]

#example[Diagonal Matrix][
  Consider
  $ A = mat(-1, 0;0, -2) $
  and compute $e^(A t)$ from the power-series definition:
  $ e^(A t) = I + A t + (A t)^2/2! + (A t)^3/3! + dots $

  Because $A$ is diagonal, every power of $A$ remains diagonal:
  $ A^k = mat((-1)^k, 0;0, (-2)^k), $ therefore
  $ (A t)^k/k! = mat(((-1)t)^k/k!, 0;0, ((-2)t)^k/k!) $

  Now sum term by term in each diagonal entry:
  $ e^(A t) = mat(sum_(k=0)^infinity ((-t)^k)/k!, 0;0, sum_(k=0)^infinity ((-2t)^k)/k!) $
  $ = mat(e^(-t), 0;0, e^(-2t)) $

  Interpretation:
  - The diagonal form means the two modal states evolve independently (no coupling terms).
  - The first mode decays as $e^(-t)$ with time constant $1$, and the second decays as $e^(-2t)$ with time constant $1/2$.
  - The faster decay $e^(-2t)$ disappears sooner, so the long-term transient is governed by $e^(-t)$.
  - Since both eigenvalues are negative, the equilibrium at the origin is asymptotically stable and $Phi(t) -> 0$ as $t -> infinity$.
]

#theorem[Complete Solution][
  For the linear time-invariant state equation $dot(x) = A x + B u$ with initial condition $x(0)$, the complete solution for the state trajectory $x(t)$ is:
  $ x(t) = e^(A t) x(0) + integral_0^t e^(A(t-tau)) B u(tau) d tau $
  - First term: free response (initial conditions)
  - Second term: forced response (input)
]

#proof[
  Start from the linear time-invariant state equation:
  $ dot(x) = A x + B u, quad x(0) = x_0 $

  Multiply by $e^(-A t)$ and define
  $ z(t) = e^(-A t) x(t). $
  Then, by the product rule,
  $ dot(z) = -A e^(-A t) x + e^(-A t) dot(x) $
  $ = -A e^(-A t) x + e^(-A t)(A x + B u) $
  $ = e^(-A t) B u(t). $
  Integrating from $0$ to $t$:
  $ z(t) - z(0) = integral_0^t e^(-A tau) B u(tau) d tau. $
  Since $z(0) = e^0 x(0) = x(0)$, we get
  $ z(t) = x(0) + integral_0^t e^(-A tau) B u(tau) d tau. $
  Multiply both sides by $e^(A t)$:
  $ x(t) = e^(A t) x(0) + e^(A t) integral_0^t e^(-A tau) B u(tau) d tau $
  $ = e^(A t) x(0) + integral_0^t e^(A(t-tau)) B u(tau) d tau. $
  Therefore, the complete solution is proved.
]

#example[Zero Input Response][
  For $x(0) = mat(1;2)$ and $A = mat(0, 1;-2, -3)$:
  $ x(t) = e^(A t) mat(1;2) $
]

#proposition[Eigenvalue Decomposition Formula][
  If $A$ is diagonalizable, i.e., $A = V Lambda V^(-1)$ with $Lambda$ diagonal, then:
  $ e^(A t) = V e^(Lambda t) V^(-1) $
]

#proof[
  Using $A = V Lambda V^(-1)$, for any integer $k >= 1$:
  $ A^k = (V Lambda V^(-1))^k = V Lambda^k V^(-1). $
  Now apply the power-series definition of the matrix exponential:
  $ e^(A t) = sum_(k=0)^infinity ((A t)^k)/k! $
  $ = sum_(k=0)^infinity (A^k t^k)/k! $
  $ = sum_(k=0)^infinity (V Lambda^k V^(-1) t^k)/k!. $
  Since $V$ and $V^(-1)$ do not depend on $k$, factor them outside the series:
  $ e^(A t) = V (sum_(k=0)^infinity (Lambda^k t^k)/k!) V^(-1) $
  $ = V e^(Lambda t) V^(-1). $
  Therefore, the proposition is proved.
]

#example[Eigenvalue Method][
  For $A = mat(0, 1;-2, -3)$ with eigenvalues $lambda_1 = -1, lambda_2 = -2$:
  $ e^(A t) = V e^(Lambda t) V^(-1). $
  Step 1: Build eigenvectors.
  For $lambda_1 = -1$:
  $ (A + I) v_1 = 0 => mat(1, 1;-2, -2) v_1 = 0 $
  choose $v_1 = mat(1;-1)$.

  For $lambda_2 = -2$:
  $ (A + 2I) v_2 = 0 => mat(2, 1;-2, -1) v_2 = 0 $
  choose $v_2 = mat(1;-2)$.

  Step 2: Form diagonalization matrices.
  $ V = mat(1, 1;-1, -2), quad Lambda = mat(-1, 0;0, -2) $
  $ det(V) = -1, quad V^(-1) = mat(2, 1;-1, -1). $
  Step 3: Exponentiate the diagonal matrix.
  $ e^(Lambda t) = mat(e^(-t), 0;0, e^(-2t)). $
  Step 4: Multiply explicitly.
  $ V e^(Lambda t) = mat(e^(-t), e^(-2t);-e^(-t), -2e^(-2t)) $

  Therefore,
  $ e^(A t) = mat(
    2e^(-t) - e^(-2t), e^(-t) - e^(-2t);
    -2e^(-t) + 2e^(-2t), -e^(-t) + 2e^(-2t)
  ) $.

  Consistency checks:
  - At $t = 0$, $e^(A 0) = I$.
  - $d/(d t) e^(A t)|_(t=0) = A$.
]

=== Solved Problems

#solved_problem[Compute State Transition Matrix][
  Find $e^(A t)$ for $A = mat(0, 1;-1, 0)$.
]
#solution[
  Method 1: Laplace transform
  $ (s I - A)^(-1) = mat(s, -1;1, s)^(-1) = 1/(s^2+1) mat(s, 1;-1, s) $

  Taking inverse Laplace:
  $ e^(A t) = mat(cos(t), sin(t);-sin(t), cos(t)) $

  This represents rotation matrix.

  Method 2: Power series (using $A^2 = -I$)
  For $A = mat(0, 1;-1, 0)$:
  $ A^2 = mat(-1, 0;0, -1) = -I $

  Then
  $ e^(A t) = I + A t + (A t)^2/2! + (A t)^3/3! + dots $
  $ = (I - t^2/2! I + t^4/4! I - dots) + (t A - t^3/3! A + t^5/5! A - dots) $
  $ = I cos(t) + A sin(t) $

  Therefore
  $ e^(A t) = mat(cos(t), sin(t);-sin(t), cos(t)). $
  Verification:
  - Both methods give the same candidate
    $ Phi(t) = mat(cos(t), sin(t);-sin(t), cos(t)). $
  - Initial-condition check:
    $ Phi(0) = mat(cos(0), sin(0);-sin(0), cos(0)) = mat(1, 0;0, 1) = I. $
  - Differential-equation check:
    $ dot(Phi)(t) = mat(-sin(t), cos(t);-cos(t), -sin(t)). $
    Also,
    $ A Phi(t) = mat(0, 1;-1, 0) mat(cos(t), sin(t);-sin(t), cos(t)) $
    $ = mat(-sin(t), cos(t);-cos(t), -sin(t)) = dot(Phi)(t). $
  Hence $Phi(t)$ satisfies both defining conditions
  $ dot(Phi) = A Phi, quad Phi(0) = I, $
  so it is indeed the state transition matrix.
]

#solved_problem[Zero-State Response][
  Find response for $A = mat(-1, 0;0, -2)$, $B = mat(1;1)$, $u(t) = 1$, $x(0) = 0$.
]
#solution[
  Since $x(0)=0$, only the forced term remains:
  $ x(t) = integral_0^t e^(A(t-tau)) B u(tau) d tau = integral_0^t e^(A(t-tau)) B d tau $

  For diagonal $A = mat(-1, 0;0, -2)$:
  $ e^(A(t-tau)) = mat(e^(-(t-tau)), 0;0, e^(-2(t-tau))) $

  Therefore
  $ x(t) = integral_0^t mat(e^(-(t-tau)), 0;0, e^(-2(t-tau))) mat(1;1) d tau $
  $ = integral_0^t mat(e^(-(t-tau));e^(-2(t-tau))) d tau $

  Compute each component separately:
  $ x_1(t) = integral_0^t e^(-(t-tau)) d tau = 1 - e^(-t) $
  $ x_2(t) = integral_0^t e^(-2(t-tau)) d tau = (1 - e^(-2t))/2 $

  Hence
  $ x(t) = mat(1 - e^(-t);(1 - e^(-2t))/2) $

  Verification:
  - Initial condition:
    $ x(0) = mat(1-1;(1-1)/2) = mat(0;0). $
  - Differential equation check:
    $ dot(x)(t) = mat(e^(-t);e^(-2t)). $
    Also,
    $ A x(t) + B = mat(-1, 0;0, -2) mat(1 - e^(-t);(1 - e^(-2t))/2) + mat(1;1) $
    $ = mat(e^(-t);e^(-2t)) = dot(x)(t). $
  So the computed $x(t)$ satisfies both $x(0)=0$ and $dot(x)=A x + B$.
]

=== Supplementary Problems

#supplementary[Diagonal Matrix Exponential I][
  Compute the state transition matrix $e^(A t)$ for
  $A = mat(-3, 0;0, -1). $
]

#supplementary[Diagonal Matrix Exponential II][
  Compute $e^(A t)$ for
  $A = mat(0, 0;0, -4), $
  and state the long-term limit of each state mode as $t -> infinity$.
]

#supplementary[Nilpotent Matrix][
  Compute $e^(A t)$ for the nilpotent matrix
  $A = mat(0, 1;0, 0). $
]

#supplementary[Pure Rotation Matrix][
  Use Laplace-transform method to compute $e^(A t)$ for
  $A = mat(0, 2;-2, 0). $
]

#supplementary[Jordan Block][
  Compute $e^(A t)$ for
  $A = mat(-1, 1;0, -1), $
  and identify the polynomial factor multiplying $e^(-t)$.
]

#supplementary[Eigenvalue-Decomposition Method][
  For
  $A = mat(-4, 1;2, -3), $
  diagonalize $A = V Lambda V^(-1)$ and compute
  $e^(A t) = V e^(Lambda t) V^(-1). $
]

#supplementary[Method Comparison][
  For
  $A = mat(0, 1;-1, 0), $
  compute $e^(A t)$ using both Laplace method and power-series method, and verify both results are identical.
]

#supplementary[Zero-Input Response][
  For
  $A = mat(-2, 0;0, -5), $
  $x(0) = mat(3;-1), $
  compute the zero-input response
  $x(t) = e^(A t)x(0). $
]

#supplementary[Zero-State Response (Step Input)][
  For
  $A = mat(-1, 0;0, -3), $
  $B = mat(2;1), $
  $u(t)=1, $
  $x(0)=0, $
  compute
  $x(t)=integral_0^t e^(A(t-tau))B d tau. $
]

#supplementary[Zero-State Response (Sinusoidal Input)][
  For
  $A = mat(-1, 0;0, -2), $
  $B = mat(1;1), $
  $u(t)=sin(omega t), $
  $x(0)=0, $
  set up and compute the forced response
  $x(t)=integral_0^t e^(A(t-tau))B sin(omega tau) d tau. $
]
