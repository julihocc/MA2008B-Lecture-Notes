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
#proof[
  Define
  $ Phi(t) = e^(A t) = sum_(k=0)^infinity (A t)^k / k!. $
  Since $A$ is constant, term-by-term differentiation gives
  $ Phi'(t) = A Phi(t), quad Phi(0) = I. $

  Let $x(t) = Phi(t) x_0$. Then
  $ x'(t) = Phi'(t) x_0 = A Phi(t) x_0 = A x(t), $
  and
  $ x(0) = Phi(0) x_0 = I x_0 = x_0. $

  Therefore, $x(t) = e^(A t) x_0$ satisfies the IVP.
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

=== Solved Problems

#solved_problem[Matrix Exponential for a Diagonal System][
  Solve
  $ x' = A x, quad x(0) = mat(2; -1), quad A = mat(3, 0; 0, -1). $
]
#solution[
  Since $A$ is diagonal,
  $ e^(A t) = mat(e^(3t), 0; 0, e^(-t)). $

  Therefore,
  $ x(t) = e^(A t) x(0) = mat(e^(3t), 0; 0, e^(-t)) mat(2; -1) = mat(2e^(3t); -e^(-t)). $
]

#solved_problem[State Transition with Constant Matrix][
  Solve $x' = A x$, $x(0)=x_0$, with
  $ A = mat(0, 1; -2, -3), quad x_0 = mat(x_(1,0); x_(2,0)). $
]
#solution[
  The characteristic polynomial is
  $ det(lambda I - A) = lambda^2 + 3lambda + 2 = (lambda+1)(lambda+2), $
  so eigenvalues are $-1$ and $-2$.

  The matrix exponential is
  $ e^(A t) = mat(
    2e^(-t)-e^(-2t), e^(-t)-e^(-2t);
    -2e^(-t)+2e^(-2t), -e^(-t)+2e^(-2t)
  ). $

  Therefore,
  $ x(t) = e^(A t) x_0. $
]

#solved_problem[Infinity-Norm Growth Estimate][
  For $x' = A x$ with
  $ A = mat(1, 2; 0, -1), $
  use the induced infinity norm to derive an exponential bound for $norm(x(t))_infinity$.
]
#solution[
  For the induced infinity norm,
  $ norm(A)_infinity = max{ |1|+|2|, |0|+|-1| } = max{3,1} = 3. $

  Standard norm bounds for linear systems give
  $ norm(x(t))_infinity <= e^(norm(A)_infinity t) norm(x(0))_infinity. $
  Hence
  $ norm(x(t))_infinity <= e^(3t) norm(x(0))_infinity. $
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
