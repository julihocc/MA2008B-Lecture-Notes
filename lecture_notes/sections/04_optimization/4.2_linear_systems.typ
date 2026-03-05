#import "../../../utils.typ": *
== Linear Systems

=== Mathematical Review

This section covers Chapter 2 topics: introduction, vector equation $x' = A(t) x$, matrix exponential function, induced matrix norm, and Floquet theory.

#definition[Linear Time-Varying System][
  A homogeneous linear system is
  $ x'(t) = A(t) x(t), $
  where $x(t) in RR^n$ and $A(t)$ is an $n times n$ matrix-valued function.
]

#definition[Fundamental Matrix][
  A matrix $Phi(t)$ is a fundamental matrix if
  $ Phi'(t) = A(t) Phi(t) $ and $det(Phi(t)) != 0$.
  The solution is $x(t) = Phi(t) c$ for constant vector $c$.
]

#theorem[Matrix Exponential for Constant $A$][
  If $A$ is constant, then
  $ x'(t) = A x(t), quad x(0) = x_0 $
  has solution
  $ x(t) = e^(A t) x_0, quad e^(A t) = sum_(k=0)^infinity (A t)^k / k!. $
]

#definition[Induced Matrix Norm][
  Given a vector norm $norm(·)$, the induced matrix norm is
  $ norm(A) = max_(x != 0) norm(A x)/norm(x). $
  It is used to bound growth of trajectories and perturbations.
]

#definition[Floquet Theory (Periodic Systems)][
  For periodic systems $x' = A(t) x$ with $A(t + T) = A(t)$, Floquet theory writes
  $ Phi(t) = P(t) e^(R t) $ with $P(t + T) = P(t)$.
  Stability is characterized through Floquet multipliers (eigenvalues of $Phi(T)$).
]

#example[Chapter 2 map][
  - 2.1 Introduction
  - 2.2 The Vector Equation $x' = A(t) x$
  - 2.3 The Matrix Exponential Function
  - 2.4 Induced Matrix Norm
  - 2.5 Floquet Theory
  - 2.6 Exercises
]

=== Solved Problems

#solved_problem[State Transition with Constant Matrix][
  Solve $x' = A x$, $x(0)=x_0$, with $A = mat(0, 1; -2, -3)$.
]
#solution[
  The state transition matrix is $e^(A t)$, so the complete solution is
  $ x(t) = e^(A t) x_0 $. In practice, compute $e^(A t)$ from diagonalization or Jordan form.
]

#solved_problem[Induced Norm Bound][
  Given $x' = A x$ and induced norm $norm(·)$, derive a growth bound.
]
#solution[
  If $norm(A) <= alpha$, then
  $ norm(x(t)) <= e^(alpha t) norm(x(0)). $
  This follows from Gronwall-type bounds applied to $(norm(x(t)))'$.
]

=== Supplementary Problems

#supplementary[Time-Varying Fundamental Matrix][
  For a given periodic matrix $A(t)$, construct a numerical approximation of $Phi(T)$ and estimate Floquet multipliers.
]

#supplementary[Norm Comparison][
  Compute and compare $norm(A)_1$, $norm(A)_2$, and $norm(A)_infinity$ for
  $A = mat(1, -2; 3, 0)$.
]

#supplementary[Matrix Exponential by Diagonalization][
  Compute $e^(A t)$ for $A = mat(4, 1; 0, 2)$ and write the explicit solution of $x' = A x$ with initial condition $x(0)=x_0$.
]

#supplementary[Liouville Formula Application][
  For $x' = A(t)x$ with $tr(A(t)) = 3t$, use Liouville's formula to determine the determinant ratio $det(Phi(t))/det(Phi(0))$.
]

#supplementary[Floquet Stability Classification][
  A periodic system has monodromy matrix eigenvalues $rho_1 = 0.7$ and $rho_2 = -1.1$. Classify the stability of the periodic solution.
]
