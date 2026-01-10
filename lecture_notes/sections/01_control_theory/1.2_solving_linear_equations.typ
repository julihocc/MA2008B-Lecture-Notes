#import "../../utils.typ": *
== Solving Linear Time-Invariant Differential Equations

=== Mathematical Review

A Linear Time-Invariant (LTI) system $dot(x) = A x + B u$ has solutions described by the matrix exponential.

#theorem[Solution to Homogenous System][
  For a homogenous system $dot(x) = A x$ (where $u(t) = 0$), the solution is:
  $ x(t) = e^(A t) x(0) $
  where $e^(A t) = sum_(k=0)^infinity (A^k t^k) / k!$ is the *Matrix Exponential*.
]

#example[1D Homogenous][
  If $dot(x) = 3x$, then $A=3$, and $x(t) = e^(3t)x(0)$.
]

#theorem[General Solution][
  For the non-homogenous system $dot(x) = A x + B u$, the general solution is:
  $ x(t) = e^(A (t - t_0)) x(t_0) + integral_(t_0)^t e^(A (t - tau)) B u(tau) d tau $
]

#example[Constant Input][
  If $dot(x) = -x + 1$ with $x(0)=0$, then $x(t) = integral_0^t e^(-(t-tau)) d tau = 1 - e^(-t)$.
]

=== Solved Problems

#solved_problem[Scalar Decay][
  Solve the scalar system $dot(x) = -2x$ with initial condition $x(0) = 5$.
]
#solution[
  Here $A = -2$ (a $1 times 1$ matrix). The solution is:
  $ x(t) = e^(-2t) x(0) = 5 e^(-2t) $
  This represents an exponential decay.
]

#solved_problem[Diagonal Matrix Exponential][
  Find $e^(A t)$ for $A = mat(2, 0; 0, 3)$.
]
#solution[
  Since $A$ is diagonal, the matrix exponential is simply the exponential of diagonal elements:
  $ e^(A t) = mat(e^(2t), 0; 0, e^(3t)) $
]

=== Supplementary Problems

#supplementary[Nilpotent Matrix][
  Find $e^(A t)$ for the nilpotent matrix $A = mat(0, 1; 0, 0)$.
]

#supplementary[Forced Response][
  Write the integral expression for the solution of $dot(x) = -x + 1$ with $x(0)=0$.
]
