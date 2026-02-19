#import "../../utils.typ": *
== Solution of Time-Invariant State Equation

=== Mathematical Review

The solution of time-invariant state equations provides the foundation for analyzing system behavior over time.

Before introducing the formal expression, it is useful to understand why the state transition matrix is central in state-space analysis.
For the homogeneous system $dot(x) = A x$, the future state must be obtained from the initial condition through a linear mapping that depends on elapsed time.
That mapping is exactly $Phi(t)$, so $x(t) = Phi(t) x(0)$ describes how dynamics propagate states in time.
When an input is present, the same matrix also appears inside the convolution term of the complete solution, weighting how past input values influence the present state.
This is why $Phi(t)$ is not only a computational tool, but the core object that links model structure ($A$), stability behavior, and time response.

#definition[State Transition Matrix][
  For $dot(x) = A x + B u$, the state transition matrix is:
  $ Phi(t) = e^(A t) = cal(L)^(-1){(s I - A)^(-1)} $
]

#example[Diagonal Matrix][
  Consider
  $ A = mat(-1, 0;0, -2) $
  and compute $e^(A t)$ from the power-series definition:
  $ e^(A t) = I + A t + (A t)^2/2! + (A t)^3/3! + dots $

  Because $A$ is diagonal, every power of $A$ remains diagonal:
  $ A^k = mat((-1)^k, 0;0, (-2)^k) $
  therefore
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
  $ z(t) = e^(-A t) x(t) $.
  Then, by the product rule,
  $ dot(z) = -A e^(-A t) x + e^(-A t) dot(x) $
  $ = -A e^(-A t) x + e^(-A t)(A x + B u) $
  $ = e^(-A t) B u(t) $.

  Integrating from $0$ to $t$:
  $ z(t) - z(0) = integral_0^t e^(-A tau) B u(tau) d tau $.

  Since $z(0) = e^0 x(0) = x(0)$, we get
  $ z(t) = x(0) + integral_0^t e^(-A tau) B u(tau) d tau $.

  Multiply both sides by $e^(A t)$:
  $ x(t) = e^(A t) x(0) + e^(A t) integral_0^t e^(-A tau) B u(tau) d tau $
  $ = e^(A t) x(0) + integral_0^t e^(A(t-tau)) B u(tau) d tau $.

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
  $ A^k = (V Lambda V^(-1))^k = V Lambda^k V^(-1) $.

  Now apply the power-series definition of the matrix exponential:
  $ e^(A t) = sum_(k=0)^infinity ((A t)^k)/k! $
  $ = sum_(k=0)^infinity (A^k t^k)/k! $
  $ = sum_(k=0)^infinity (V Lambda^k V^(-1) t^k)/k! $.

  Since $V$ and $V^(-1)$ do not depend on $k$, factor them outside the series:
  $ e^(A t) = V (sum_(k=0)^infinity (Lambda^k t^k)/k!) V^(-1) $
  $ = V e^(Lambda t) V^(-1) $.

  Therefore, the proposition is proved.
]

#example[Eigenvalue Method][
  For $A = mat(0, 1;-2, -3)$ with eigenvalues $lambda_1 = -1, lambda_2 = -2$:
  $ e^(A t) = V mat(e^(-t), 0;0, e^(-2t)) V^(-1) $
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
]

#solved_problem[Zero-State Response][
  Find response for $A = mat(-1, 0;0, -2)$, $B = mat(1;1)$, $u(t) = 1$, $x(0) = 0$.
]
#solution[
  $ x(t) = integral_0^t e^(A(t-tau)) B d tau $
  $ = integral_0^t mat(e^(-(t-tau)), 0;0, e^(-2(t-tau))) mat(1;1) d tau $
  $ = integral_0^t mat(e^(-(t-tau));e^(-2(t-tau))) d tau $
  $ = mat(1 - e^(-t);(1 - e^(-2t))/2) $
]

=== Supplementary Problems

#supplementary[Nilpotent Matrix][
  Find $e^(A t)$ for $A = mat(0, 1;0, 0)$ (nilpotent).
]

#supplementary[Periodic Input][
  Solve for $u(t) = sin(omega t)$.
]
