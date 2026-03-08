#import "../../../utils.typ": *
== Linear Systems

=== Mathematical Review

This section introduces linear state-space dynamics with emphasis on tools that can be computed and used directly in analysis. For constant and time-varying systems, the fundamental matrix and the matrix exponential describe solution propagation, while induced matrix norms provide quantitative bounds on trajectory growth and input-driven perturbations.

The main analytical objective is to estimate solution size without solving each component explicitly. This viewpoint is central for later stability and optimization arguments, where reliable upper bounds are often more useful than closed-form trajectories.

#definition[Linear Time-Varying System][
  A homogeneous linear system is
  $ x'(t) = A(t) x(t), $
  where $x(t) in RR^n$ and $A(t)$ is an $n times n$ matrix-valued function.
]

#definition[Fundamental Matrix][
  A matrix $Phi(t)$ is a fundamental matrix if
  $ Phi'(t) = A(t) Phi(t) $
  and $det(Phi(t_0)) != 0$ for some $t_0$.
  Then $det(Phi(t)) != 0$ on the whole interval, and every solution can be written as
  $ x(t) = Phi(t) c $ for a constant vector $c$.
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

#proposition[Closed Forms for Common Induced Norms][
  For $A = (a_(i j)) in RR^(n times n)$,
  $ norm(A)_1 = max_j sum_i |a_(i j)|, $
  $ norm(A)_infinity = max_i sum_j |a_(i j)|, $
  and
  $ norm(A)_2 = sqrt(lambda_(max)(A^T A)). $
]

#theorem[Compatibility and Submultiplicativity][
  For an induced norm,
  $ norm(A x) <= norm(A) norm(x), $
  $ norm(A B) <= norm(A) norm(B), $
  and $norm(I)=1$.
]
#proof[
  From the definition,
  $ norm(A x) <= norm(A) norm(x) $ for any vector $x$.
  Apply this to $x = B y$:
  $ norm(A B y) <= norm(A) norm(B y) <= norm(A) norm(B) norm(y). $
  Taking the maximum ratio over $y != 0$ gives
  $ norm(A B) <= norm(A) norm(B). $
  Finally, $norm(I x)=norm(x)$ for all $x$, hence $norm(I)=1$.
]

#corollary[Exponential Bound for Constant Matrices][
  For constant $A$,
  $ norm(e^(A t)) <= e^(norm(A)t), quad t >= 0. $
  Therefore, solutions of $x' = A x$ satisfy
  $ norm(x(t)) <= e^(norm(A)t) norm(x(0)). $
]

#definition[Floquet Theory (Periodic Systems)][
  For periodic systems $x' = A(t) x$ with $A(t + T) = A(t)$, Floquet theory writes
  $ Phi(t) = P(t) e^(R t) $ with $P(t + T) = P(t)$.
  Stability is characterized through Floquet multipliers (eigenvalues of $Phi(T)$).
  In this module, we only state the result and focus computationally on constant-matrix methods and norm-based bounds.
]

#theorem[Liouville Formula][
  If $Phi(t)$ is a fundamental matrix of $x' = A(t)x$, then
  $ det(Phi(t)) = det(Phi(t_0)) e^(integral_(t_0)^t tr(A(s)) dif s). $
]
#proof[
  Let $W(t)=det(Phi(t))$.
  Jacobi's formula gives
  $ W'(t) = tr(Phi(t)^(-1) Phi'(t)) W(t). $
  Since $Phi' = A Phi$, we obtain
  $ Phi^(-1) Phi' = Phi^(-1) A Phi, $
  so by trace invariance under similarity
  $ tr(Phi^(-1) A Phi) = tr(A). $
  Hence
  $ W'(t) = tr(A(t)) W(t). $
  Solving this scalar linear equation yields
  $ W(t)=W(t_0)e^(integral_(t_0)^t tr(A(s)) dif s), $
  which is Liouville's formula.
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

#solved_problem[Why Matrix Norms Are the Point][
  Consider
  $ x' = A x + r(t), quad A = mat(1,2;0,-1), quad norm(r(t))_infinity <= 0.5, quad norm(x(0))_infinity <= 2. $
  Build an explicit bound for $norm(x(t))_infinity$ without solving the system component-by-component.
]
#solution[
  Split the solution into homogeneous and forced parts:
  $ x(t) = e^(A t) x(0) + integral_0^t e^(A (t-s)) r(s) dif s. $

  Using induced infinity norms and $norm(e^(A tau))_infinity <= e^(norm(A)_infinity tau)$,
  $ norm(x(t))_infinity <= e^(norm(A)_infinity t) norm(x(0))_infinity + integral_0^t e^(norm(A)_infinity (t-s)) norm(r(s))_infinity dif s. $

  Here $norm(A)_infinity=3$, so
  $ norm(x(t))_infinity <= 2e^(3t) + 0.5 integral_0^t e^(3(t-s)) dif s = 2e^(3t) + (1/6)(e^(3t)-1). $

  This is the main payoff of the section: a computable worst-case bound derived in a few lines.
]

#solved_problem[Computing $norm(A)_1$, $norm(A)_2$, and $norm(A)_infinity$][
  For
  $ A = mat(1, 2; 0, -1), $
  compute $norm(A)_1$, $norm(A)_2$, and $norm(A)_infinity$.
]
#solution[
  Column sums give
  $ norm(A)_1 = max{ |1|+|0|, |2|+|-1| } = max{1,3}=3. $

  Row sums give
  $ norm(A)_infinity = max{ |1|+|2|, |0|+|-1| } = max{3,1}=3. $

  For the Euclidean induced norm,
  $ A^T A = mat(1,2;2,5). $
  Its eigenvalues solve
  $ lambda^2 - 6lambda + 1 = 0, $
  so
  $ lambda_(max) = 3 + 2sqrt(2). $
  Hence
  $ norm(A)_2 = sqrt(3 + 2sqrt(2)) = 1 + sqrt(2). $
]

#solved_problem[Spectral Radius Versus Induced Norm][
  For
  $ N = mat(0, 2; 0, 0), $
  compare the spectral radius $rho(N)$ and the induced 2-norm $norm(N)_2$.
]
#solution[
  Since $N$ is upper triangular with diagonal entries $0,0$, all eigenvalues are zero and
  $ rho(N)=0. $

  But
  $ N^T N = mat(0,0;0,4), $
  so
  $ norm(N)_2 = sqrt(lambda_(max)(N^T N)) = sqrt(4)=2. $

  Therefore $rho(N) < norm(N)_2$, showing that a non-normal matrix can have large induced norm even with zero eigenvalues.
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

#solved_problem[Perturbation Bound with an Input Term][
  Let $z' = A z + r(t)$ with $z(0)=0$ and
  $ A = mat(1,2;0,-1), quad norm(r(t))_infinity <= 0.5. $
  Derive an upper bound for $norm(z(t))_infinity$.
]
#solution[
  Variation of constants gives
  $ z(t) = integral_0^t e^(A (t-s)) r(s) dif s. $
  Taking induced infinity norms and using $norm(e^(A tau))_infinity <= e^(norm(A)_infinity tau)$,
  $ norm(z(t))_infinity <= integral_0^t e^(norm(A)_infinity (t-s)) norm(r(s))_infinity dif s. $

  Since $norm(A)_infinity=3$ and $norm(r(s))_infinity <= 0.5$,
  $ norm(z(t))_infinity <= 0.5 integral_0^t e^(3(t-s)) dif s = (1/6)(e^(3t)-1). $
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
