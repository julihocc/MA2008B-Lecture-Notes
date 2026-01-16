#import "../../utils.typ": *
== Introduction to State-Space Design

=== Mathematical Review

*State-space design* provides a modern approach to controller synthesis using time-domain techniques and pole placement algorithms.

#definition[State Feedback][
  State feedback control law:
  $ u(t) = -K x(t) + r(t) $
  where $K$ is feedback gain matrix, $r(t)$ is reference input
  
  Closed-loop system:
  $ dot(x) = (A - B K) x + B r $
  Characteristic equation: $det(s I - (A - B K)) = 0$
]

#theorem[Pole Placement][
  Direct specification of closed-loop pole locations:
  Given desired poles $lambda_1, lambda_2, ..., lambda_n$:
  $ d e s(s) = (s - lambda_1)(s - lambda_2)...(s - lambda_n) $
  $ d e s(s) = s^n + a_(n-1) s^(n-1) + ... + a_0$
  
  Solve Ackermann's formula:
  $ K = [0 0 ... 1] C^(-1) P_c(A)$
  where $P_c(A)$ is the controllability matrix and $C = [a_0 a_1 ... a_(n-1)]$
]

#example[Pole Placement for Second-Order System][
  Design state feedback for $dot(x) = [0 1; 0 -2]x + [0; 1]u$ with poles at $-3 ± j 4$.
]
#solution[
  Step 1: Desired characteristic polynomial
  $ d e s(s) = (s + 3 + j 4)(s + 3 - j 4) = s^2 + 6s + 25$
  
  Step 2: Check controllability
  $P_c = [B A B] = [[0 1]; [1 -2]]$, rank$(P_c) = 2$ (controllable)
  
  Step 3: Using Ackermann's formula
  $K = [k_1 k_2] = [25 4]$
  
  Step 4: Verification
  $ A - B K = [[0 1]; [0 -2]] - [[0 25]; [1 4]] = [[0 -24]; [0 -6]]$
  Closed-loop poles: eigenvalues of $A - B K$ = $-3 ± j 4$ ✓
]

=== Observer-Based Design

#definition[State Observer][
  Estimator for unmeasured states:
  $ dot(hat(x)) = A hat(x) + B u + L(y - C hat(x)) $
  where $L$ is observer gain matrix, $hat(x)$ is estimated state
  
  Observer error dynamics:
  $ dot(e) = (A - L C) e $
  Choose $L$ to place observer poles faster than system poles.
]

#theorem[Separation Principle][
  Controller and observer can be designed independently:
  1. Design feedback $K$ for desired closed-loop poles
  2. Design observer gain $L$ for fast convergence
  3. Implement using estimated states: $u = -K hat(x)$
  
  Overall closed-loop poles = system poles ∪ observer poles
]

#example[Observer Design][
  Design observer for $dot(x) = [0 1; -2 -3]x + [0; 1]u$, $y = [1 0]x$.
]
#solution[
  Step 1: Observability check
  $P_o = [C; C A] = [[1 0]; [0 1]]$, rank$(P_o) = 2$ (observable)
  
  Step 2: Desired observer poles (5x faster)
  $lambda_(o 1,2) = -15 ± j 20$
  
  Step 3: Observer gain using pole placement
  $ L = [40; 200]^T$
  
  Step 4: Observer dynamics
  $ A - L C = [[0 1]; [-2 -3]] - [[40]; [200 0]] [[1 0]] = [[-40 1]; [-202 -3]]$
  Eigenvalues: $-15 ± j 20$ ✓
]

=== Optimal Control Methods

#definition[Linear Quadratic Regulator][
  Optimal control minimizing quadratic cost:
  $ J = integral_0^infinity (x^T Q x + u^T R u) d t$
  
  Optimal control law:
  $ u = -R^(-1) B^T P x $
  where $P$ solves the Algebraic Riccati Equation:
  $ A^T P + P A - P B R^(-1) B^T P + Q = 0$
]

#example[LQR Design][
  Design LQR for $dot(x) = [0 1; 0 0]x + [0; 1]u$ with $Q = I$, $R = 1$.
]
#solution[
  Step 1: Solve ARE
  $ [0 0; 1 0]P + P[0 1; 0 0] - P[0; 1][0 1]P + [1 0; 0 1] = 0$
  
  Step 2: Solution for $P$
  $ P = [[2 1]; [1 1]]$
  
  Step 3: Optimal gain
  $ K = R^(-1) B^T P = [0 1][[2 1]; [1 1]] = [1 1]$
  
  Step 4: Closed-loop system
  $ A - B K = [[0 1]; [0 0]] - [[0 1]; [1 1]] = [[0 0]; [-1 -1]]$
  Closed-loop poles: $s^2 + s + 1 = 0$ → $s = -0.5 ± j 0.866$
]

=== Solved Problems

#solved_problem[Multi-Input Pole Placement][
  Design state feedback for $dot(x) = [0 1 0; 0 0 1; 0 0 0]x + [0 0 1; 0 0 0]u$ with desired poles at $-2, -5, -10$.
]
#solution[
  Step 1: Controllability
  $P_c = [B A B A^2 B]$ has rank 3 (controllable)
  
  Step 2: Desired polynomial
  $ d e s(s) = (s + 2)(s + 5)(s + 10) = s^3 + 17s^2 + 80s + 100$
  
  Step 3: Feedback gain
  $ K = [[100 80 17]]$
  
  Step 4: Verification
  $ A - B K$ has eigenvalues $-2, -5, -10$ ✓
]

#solved_problem[Observer with State Feedback][
  Combined controller-observer design for same system with only output measurement.
]
#solution[
  Step 1: Observer poles (10x faster)
  $lambda_(o 1,2,3) = -20, -50, -100$
  
  Step 2: Observer gain
  $ L = [[20]; [400]; [8000]]^T$
  
  Step 3: Separation principle applied
  $ u = -K hat(x) = -[100 80 17] hat(x)$
  
  Combined system poles: $-2, -5, -10, -20, -50, -100$
]

=== Supplementary Problems

#supplementary[Partial Pole Placement][
  Design state feedback for uncontrollable system using minimum-norm pseudo-inverse solution.]

#supplementary[Robust LQR][
  Design LQR with weighting matrices to achieve specified closed-loop damping ratio.]