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
  The complete solution is:
  $ x(t) = e^(A t) x(0) + integral_0^t e^(A(t-tau)) B u(tau) d tau $
  - First term: free response (initial conditions)
  - Second term: forced response (input)
]

#example[Zero Input Response][
  For $x(0) = mat(1;2)$ and $A = mat(0, 1;-2, -3)$:
  $ x(t) = e^(A t) mat(1;2) $
]

#definition[Eigenvalue Decomposition][
  If $A = V Lambda V^(-1)$ where $Lambda$ is diagonal:
  $ e^(A t) = V e^(Lambda t) V^(-1) $
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
