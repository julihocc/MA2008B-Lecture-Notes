#import "../../../utils.typ": *
== Constant-Coefficient Linear Systems

=== Mathematical Review

This section studies autonomous linear systems with constant matrix
$ x' = A x. $
The origin is always an equilibrium, and its type is determined by the eigenstructure of $A$.

#definition[Equilibrium and Critical Point][
  For $x' = A x$, an equilibrium $x^*$ satisfies
  $ A x^* = 0. $
  In this section, we classify the critical point at the origin using eigenvalues of $A$.
]

#definition[Characteristic Polynomial and Eigenvalues][
  The characteristic polynomial of $A$ is
  $ p(lambda) = det(lambda I - A). $
  Its roots are the eigenvalues of $A$, and they determine local phase portrait type.
]

#theorem[Matrix Exponential for Constant $A$][
  If $A$ is constant, then
  $ x' = A x, quad x(0)=x_0 $
  has solution
  $ x(t) = e^(A t) x_0, $
  where
  $ e^(A t) = sum_(k=0)^infinity (A t)^k / k!. $
]
#proof[
  Let $Phi(t)=e^(A t)$. Since $A$ is constant,
  $ Phi'(t)=A Phi(t), quad Phi(0)=I. $
  Setting $x(t)=Phi(t)x_0$ gives
  $ x'(t)=A x(t) $ and $x(0)=x_0$.
]

#theorem[Classification by Eigenvalues in $RR^2$][
  For $x' = A x$ in $RR^2$:
  - Two real negative eigenvalues: asymptotically stable node.
  - Two real positive eigenvalues: unstable node.
  - Real eigenvalues of opposite sign: saddle (unstable).
  - Complex pair $alpha plus.minus i beta$ with $beta != 0$:
    stable focus if $alpha<0$, unstable focus if $alpha>0$, center if $alpha=0$.
]

#proposition[Trace-Determinant Test in $RR^2$][
  Let $tau = tr(A)$ and $Delta = det(A)$. The discriminant is
  $ D = tau^2 - 4 Delta. $
  Then:
  - $Delta < 0$: saddle.
  - $Delta > 0$, $D > 0$: node (stable if $tau<0$, unstable if $tau>0$).
  - $Delta > 0$, $D < 0$: focus/center (stable if $tau<0$, unstable if $tau>0$, center if $tau=0$).
]

=== Solved Problems

#solved_problem[Stable Node Classification][
  Classify the origin for
  $ x' = A x, quad A = mat(-1, 0; 0, -3), $
  and solve the IVP with $x(0)=mat(1;2)$.
]
#solution[
  Since $A$ is diagonal,
  $ e^(A t)=mat(e^(-t),0;0,e^(-3t)). $
  Therefore,
  $ x(t)=mat(e^(-t);2e^(-3t)). $

  The eigenvalues are $lambda_1=-1$, $lambda_2=-3$, both negative and real.
  Hence the origin is an asymptotically stable node.
]

#solved_problem[Saddle Classification][
  Classify the origin for
  $ x' = A x, quad A = mat(2,0;0,-1). $
]
#solution[
  The eigenvalues are $lambda_1=2$ and $lambda_2=-1$.
  Since they have opposite signs, the origin is a saddle.

  Equivalently, with $tau = 1$ and $Delta = -2 < 0$, the trace-determinant test also gives saddle.
]

#solved_problem[Stable Focus Classification][
  Classify the origin for
  $ x' = A x, quad A = mat(-1,-4;1,-1). $
]
#solution[
  The characteristic polynomial is
  $ lambda^2 + 2lambda + 5 = 0, $
  so
  $ lambda_(1,2) = -1 plus.minus 2i. $
  Since the real part is negative, trajectories spiral toward the origin.
  The critical point is a stable focus.
]

#solved_problem[Center Classification][
  Classify the origin for
  $ x' = A x, quad A = mat(0,-2;2,0). $
]
#solution[
  The characteristic polynomial is
  $ lambda^2 + 4 = 0, $
  so eigenvalues are $plus.minus 2i$ (purely imaginary).
  Therefore the origin is a center for this linear system.
]

#solved_problem[Defective Repeated Eigenvalue][
  Consider
  $ x' = A x, quad A = mat(-2,1;0,-2). $
  Classify the origin and compute $e^(A t)$.
]
#solution[
  The characteristic polynomial is
  $ (lambda+2)^2=0, $
  so there is a repeated eigenvalue $lambda=-2$.
  Write
  $ A = -2I + N, quad N = mat(0,1;0,0), quad N^2=0. $

  Then
  $ e^(A t)=e^(-2t)e^(N t)=e^(-2t)(I+t N)
  = e^(-2t) mat(1,t;0,1). $

  Since the eigenvalue is negative, the origin is asymptotically stable.
  The phase portrait is an improper (degenerate) stable node.
]

#solved_problem[Trace-Determinant Classification][
  Classify the origin for
  $ A = mat(1,4;-1,-3) $
  using $(tau, Delta, D)$, where $tau=tr(A)$, $Delta=det(A)$, and $D=tau^2-4Delta$.
]
#solution[
  Compute
  $ tau = 1 + (-3) = -2, $
  $ Delta = 1(-3)-4(-1)=1, $
  $ D = (-2)^2 - 4(1)=0. $

  Since $Delta>0$ and $D=0$, there is a repeated real eigenvalue.
  Because $tau<0$, the origin is stable (node-type boundary case).

  Directly, $p(lambda)=lambda^2+2lambda+1=(lambda+1)^2$, confirming repeated eigenvalue $-1$.
]

=== Supplementary Problems

#supplementary[Unstable Node Classification][
  Classify the origin for
  $ A = mat(2,0;0,5). $
]

#supplementary[Focus Type from Eigenvalues][
  For eigenvalues $lambda_(1,2)=0.4 plus.minus 3i$, classify the critical point at the origin.
]

#supplementary[Matrix Exponential with Repeated Eigenvalue][
  Compute $e^(A t)$ for
  $ A = mat(-1,1;0,-1) $
  and classify the origin.
]

#supplementary[Trace-Determinant Diagram Point][
  For
  $ A = mat(-2,3;-1,0), $
  compute $(tau, Delta, D)$ and classify the origin.
]

#supplementary[Trajectory from Initial Data][
  For
  $ A = mat(-2,0;0,1), quad x(0)=mat(3;-2), $
  compute $x(t)$ and describe long-term behavior.
]
