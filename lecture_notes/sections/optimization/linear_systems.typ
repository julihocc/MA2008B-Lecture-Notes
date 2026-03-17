#import "../../../utils.typ": *
== Constant-Coefficient Linear Systems <sec:linear_systems>

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
#proof[
  The behavior of the system is determined by the explicit form of the solution $x(t)$.
  
  For distinct real eigenvalues $lambda_1, lambda_2$ with eigenvectors $v_1, v_2$, the general solution is $x(t) = c_1 e^(lambda_1 t) v_1 + c_2 e^(lambda_2 t) v_2$. 
  - If both $lambda_i < 0$, then $e^(lambda_i t) -> 0$ as $t -> infinity$ for any initial condition, so the origin is asymptotically stable.
  - If both $lambda_i > 0$, the exponentials grow unboundedly, making the origin unstable.
  - If they have opposite signs (e.g., $lambda_1 > 0, lambda_2 < 0$), solutions grow along $v_1$ and decay along $v_2$, creating a saddle point.

  For a complex conjugate pair $lambda = alpha plus.minus i beta$, Euler's formula gives solutions involving $e^(alpha t)(c_1 cos(beta t) + c_2 sin(beta t))$.
  The trigonometric terms cause the trajectory to rotate around the origin, while the $e^(alpha t)$ term scales the amplitude. 
  - If $alpha < 0$, the amplitude decays to $0$, spiraling inward (stable focus).
  - If $alpha > 0$, the amplitude grows over time, spiraling outward (unstable focus).
  - If $alpha = 0$, the amplitude is constant, forming closed periodic orbits (center).
]

#proposition[Trace-Determinant Test in $RR^2$][
  Let $tau = tr(A)$ and $Delta = det(A)$. The discriminant is
  $ D = tau^2 - 4 Delta. $
  Then:
  - $Delta < 0$: saddle.
  - $Delta > 0$, $D > 0$: node (stable if $tau<0$, unstable if $tau>0$).
  - $Delta > 0$, $D < 0$: focus/center (stable if $tau<0$, unstable if $tau>0$, center if $tau=0$).
]
#proof[
  The characteristic polynomial for a $2 times 2$ matrix $A$ can be written as
  $ p(lambda) = lambda^2 - tr(A)lambda + det(A) = lambda^2 - tau lambda + Delta. $
  Its roots are given by the quadratic formula:
  $ lambda_(1,2) = (tau plus.minus sqrt(tau^2 - 4Delta)) / 2 = (tau plus.minus sqrt(D)) / 2. $
  
  - If $Delta < 0$, then $D = tau^2 - 4Delta > 0$. The roots $lambda_1, lambda_2$ are real. Since their product is $Delta < 0$, they have opposite signs, yielding a saddle.
  - If $Delta > 0$ and $D > 0$, the roots are real and have the same sign (since their product is $Delta > 0$). Their sum is $tau$. Thus, they are both negative if $tau < 0$ (stable node) and both positive if $tau > 0$ (unstable node).
  - If $Delta > 0$ and $D < 0$, the roots are complex conjugates $lambda = (tau plus.minus i sqrt(-D)) / 2$. The real part is $tau / 2$, which dictates the stability: stable focus if $tau < 0$, unstable focus if $tau > 0$, and center if $tau = 0$.
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
