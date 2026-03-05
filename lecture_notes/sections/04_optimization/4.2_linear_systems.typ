#import "../../../utils.typ": *
== Linear Systems

=== Mathematical Review

This section covers Chapter 2 topics: introduction, vector equation $x' = A(t)x$, matrix exponential function, induced matrix norm, and Floquet theory.

#definition[Linear Time-Varying System][
  A homogeneous linear system is
  $ x'(t) = A(t)x(t), $
  where $x(t) in RR^n$ and $A(t)$ is an $n times n$ matrix-valued function.
]

#definition[Fundamental Matrix][
  A matrix $Phi(t)$ is a fundamental matrix if
  $ Phi'(t)=A(t)Phi(t) $ and $det(Phi(t)) neq 0$.
  The solution is $x(t)=Phi(t)c$ for constant vector $c$.
]

#theorem[Matrix Exponential for Constant $A$][
  If $A$ is constant, then
  $ x'(t)=Ax(t), quad x(0)=x_0 $
  has solution
  $ x(t)=e^(At)x_0, quad e^(At)=sum_(k=0)^infinity (A t)^k / k!. $
]

#definition[Induced Matrix Norm][
  Given a vector norm $norm(·)$, the induced matrix norm is
  $ norm(A) = max_(x neq 0) norm(Ax)/norm(x). $
  It is used to bound growth of trajectories and perturbations.
]

#definition[Floquet Theory (Periodic Systems)][
  For periodic systems $x'=A(t)x$ with $A(t+T)=A(t)$, Floquet theory writes
  $ Phi(t)=P(t)e^(Rt) $ with $P(t+T)=P(t)$.
  Stability is characterized through Floquet multipliers (eigenvalues of $Phi(T)$).
]

#example[Chapter 2 map][
  - 2.1 Introduction
  - 2.2 The Vector Equation $x' = A(t)x$
  - 2.3 The Matrix Exponential Function
  - 2.4 Induced Matrix Norm
  - 2.5 Floquet Theory
  - 2.6 Exercises
]

=== Solved Problems

#solved_problem[State Transition with Constant Matrix][
  Solve $x' = Ax$, $x(0)=x_0$, with $A = mat(0, 1; -2, -3)$.
]
#solution[
  The state transition matrix is $e^(At)$, so the complete solution is
  $ x(t)=e^(At)x_0 $. In practice, compute $e^(At)$ from diagonalization or Jordan form.
]

#solved_problem[Induced Norm Bound][
  Given $x' = Ax$ and induced norm $norm(·)$, derive a growth bound.
]
#solution[
  If $norm(A) le alpha$, then
  $ norm(x(t)) le e^(alpha t) norm(x(0)). $
  This follows from Gronwall-type bounds applied to $d/dt norm(x(t))$.
]

=== Supplementary Problems

#supplementary[Time-Varying Fundamental Matrix][
  For a given periodic matrix $A(t)$, construct a numerical approximation of $Phi(T)$ and estimate Floquet multipliers.
]

#supplementary[Norm Comparison][
  Compute and compare $norm(A)_1$, $norm(A)_2$, and $norm(A)_infinity$ for
  $A = mat(1, -2; 3, 0)$.
]
