#import "../../../utils.typ": *
== Time-Dependent Linear Systems

=== Mathematical Review

This section generalizes the previous one from constant matrices to
$ x' = A(t) x, $
where $A(t)$ depends on time.
The main objects are the fundamental matrix and transition matrix, which provide explicit propagation formulas.

#definition[Linear Time-Dependent System][
  A linear time-dependent system is
  $ x'(t) = A(t) x(t), $
  where $A(t)$ is a continuous $n times n$ matrix-valued function.
]

#definition[Fundamental Matrix][
  A matrix $Phi(t)$ is a fundamental matrix for $x' = A(t)x$ if
  $ Phi'(t)=A(t)Phi(t) $
  and $det(Phi(t_0)) != 0$ for some $t_0$.

  Every solution can be written as $x(t)=Phi(t)c$.
]

#definition[Transition Matrix][
  The transition matrix from $s$ to $t$ is
  $ Phi(t,s)=Phi(t)Phi(s)^(-1). $
  It satisfies
  $ x(t)=Phi(t,s)x(s), quad Phi(t,t)=I. $
]

#theorem[Existence and Representation][
  If $A(t)$ is continuous on an interval, then for each initial condition
  $ x(t_0)=x_0 $
  there exists a unique solution, and it can be represented as
  $ x(t)=Phi(t,t_0)x_0. $
]

#theorem[Variation of Constants][
  For the nonhomogeneous system
  $ x'(t)=A(t)x(t)+r(t), $
  a solution with $x(t_0)=x_0$ is
  $ x(t)=Phi(t,t_0)x_0 + integral_(t_0)^t Phi(t,s)r(s) dif s. $
]
#proof[
  Let
  $ y(t)=Phi(t,t_0)x_0 + integral_(t_0)^t Phi(t,s)r(s) dif s. $
  Differentiate using
  $ (partial Phi(t,s))/(partial t)=A(t)Phi(t,s) $
  and Leibniz rule:
  $ y'(t)=A(t)y(t)+r(t). $
  Also $y(t_0)=x_0$.
]

#proposition[Norm-Based Growth Bound][
  If
  $ norm(A(t)) <= M $ on $[t_0,t]$, then every solution of
  $ x' = A(t)x $
  satisfies
  $ norm(x(t)) <= e^(M(t-t_0)) norm(x_0). $
]

=== Solved Problems

#solved_problem[Fundamental Matrix for a Diagonal $A(t)$][
  Solve
  $ x' = A(t)x, quad A(t)=mat(t,0;0,-2), $
  and construct a fundamental matrix.
]
#solution[
  The system is decoupled:
  $ x_1' = t x_1, quad x_2' = -2 x_2. $
  Hence
  $ x_1(t)=c_1 e^(t^2/2), quad x_2(t)=c_2 e^(-2t). $

  A fundamental matrix is
  $ Phi(t)=mat(e^(t^2/2),0;0,e^(-2t)). $
  Since
  $ det(Phi(t))=e^(t^2/2-2t) != 0, $
  it is invertible for all $t$.
]

#solved_problem[Transition Matrix and IVP Solution][
  For the system above, solve the IVP
  $ x(0)=mat(2;-1) $
  using the transition matrix.
]
#solution[
  From the first solved problem,
  $ Phi(t)=mat(e^(t^2/2),0;0,e^(-2t)), quad Phi(0)=I. $
  Thus
  $ Phi(t,0)=Phi(t)Phi(0)^(-1)=Phi(t). $

  Therefore,
  $ x(t)=Phi(t,0)x(0)=mat(2e^(t^2/2);-e^(-2t)). $
]

#solved_problem[Variation of Constants with Input][
  Solve
  $ x' = A(t)x + r(t), $
  where
  $ A(t)=mat(0,0;0,-1), quad r(t)=mat(1;e^(-t)), quad x(0)=mat(0;0). $
]
#solution[
  A fundamental matrix for the homogeneous part is
  $ Phi(t)=mat(1,0;0,e^(-t)), quad Phi(t,s)=mat(1,0;0,e^(-(t-s))). $

  With $x(0)=0$,
  $ x(t)=integral_0^t Phi(t,s)r(s) dif s. $
  Hence
  $ x_1(t)=integral_0^t 1 dif s = t, $
  $ x_2(t)=integral_0^t e^(-(t-s))e^(-s) dif s = t e^(-t). $

  Therefore,
  $ x(t)=mat(t; t e^(-t)). $
]

#solved_problem[Norm Bound with Bounded $A(t)$][
  Suppose
  $ norm(A(t))_infinity <= 2 $ on $[0,t]$ and $norm(x(0))_infinity = 3$.
  Derive a bound for $norm(x(t))_infinity$.
]
#solution[
  By the growth bound,
  $ norm(x(t))_infinity <= e^(integral_0^t norm(A(s))_infinity dif s) norm(x(0))_infinity. $
  Since $norm(A(s))_infinity <= 2$,
  $ integral_0^t norm(A(s))_infinity dif s <= 2t. $
  Therefore,
  $ norm(x(t))_infinity <= 3 e^(2t). $
]

#solved_problem[Transition from a Nonzero Initial Time][
  Let
  $ A(t)=mat(1/t,0;0,-1), quad t>0. $
  Compute $Phi(t,1)$ and solve the IVP $x(1)=mat(3;2)$.
]
#solution[
  The equations are decoupled:
  $ x_1'=(1/t)x_1, quad x_2'=-x_2. $
  A convenient fundamental matrix is
  $ Phi(t)=mat(t,0;0,e^(-t)). $

  Then
  $ Phi(t,1)=Phi(t)Phi(1)^(-1)=mat(t,0;0,e^(1-t)). $
  Therefore
  $ x(t)=Phi(t,1)x(1)=mat(3t;2e^(1-t)). $
]

=== Supplementary Problems

#supplementary[Fundamental Matrix Computation][
  For
  $ A(t)=mat(2t,0;0,-3), $
  compute a fundamental matrix and verify invertibility.
]

#supplementary[Transition Matrix Practice][
  For
  $ A(t)=mat(0,0;0,t), $
  construct $Phi(t,s)$ explicitly.
]

#supplementary[IVP with Time-Dependent Coefficients][
  Solve
  $ x' = A(t)x, quad A(t)=mat(1,0;0,-t), quad x(0)=mat(1;1). $
]

#supplementary[Variation of Constants Drill][
  Solve
  $ x' = A(t)x + r(t), $
  with
  $ A(t)=mat(0,0;0,-2), quad r(t)=mat(e^t;1), quad x(0)=0. $
]

#supplementary[Norm Bound Application][
  Assume
  $ norm(A(t))_2 <= 0.6 $ on $[0,t]$ and $norm(x(0))_2=4$.
  Derive an explicit upper bound for $norm(x(t))_2$.
]
