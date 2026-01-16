#import "../../utils.typ": *
== Canonical Forms of State Equations

=== Mathematical Review

*Canonical forms* provide standardized state-space representations that reveal system structure and simplify analysis and design.

#definition[Similarity Transformation][
  State-space systems $(A, B, C, D)$ and $(hat(A), hat(B), hat(C), hat(D))$ represent the same system if:
  $ hat(A) = T A T^(-1)$, $hat(B) = T B$, $hat(C) = C T^(-1)$, $hat(D) = D$
  where $T$ is an invertible transformation matrix.

  Transfer function invariance: $hat(G)(s) = G(s)$
]

#definition[Controllable Canonical Form][
  System in controllable canonical form:
  $ A_"cc" = [-(a_(n-1)) -(a_(n-2)) ... -(a_1) -(a_0); 1 0 ... 0 0; 0 1 ... 0; ...; 0 0 ... 0 1] $
  $ B_"cc" = [1; 0; 0; ...; 0] $
  $ C_"cc" = [b_(n-1) b_(n-2) ... b_1 b_0] $

  Characteristic polynomial: $det(s I - A_"cc") = s^n + a_(n-1) s^(n-1) + ... + a_0$
]

#definition[Observable Canonical Form][
  System in observable canonical form:
  $ A_"oc" = [-(a_(n-1)) 1 0 ... 0; -(a_(n-2)) 0 1 ... 0; ...; -(a_0) 0 0 ... 1] $
  $ B_"oc" = [b_(n-1); b_(n-2); ...; b_1 b_0] $
  $ C_"oc" = [1 0 0 ... 0] $

  Characteristic polynomial: $det(s I - A_"oc") = s^n + a_(n-1) s^(n-1) + ... + a_0$
]

#definition[Jordan Canonical Form][
  System in Jordan canonical form:
  $ A_J = op("diag")(J_1, J_2, ..., J_k)$
  where each Jordan block:
]
$ J_i = [lambda_i 1 0 ... 0 lambda_i 1 ... 0; ...; 0 0 ... 1] $

Reveals eigenvalue structure and system dynamics.

#theorem[Diagonalization][
  System with distinct eigenvalues can be diagonalized:
  $ A_d = T^(-1) A T = op("diag")(lambda_1, lambda_2, ..., lambda_n) $
  Transformation columns: $T = [v_1 v_2 ... v_n]$ (eigenvectors)
  Decoupled dynamics: $dot(z)_i = lambda_i z_i + (T^(-1) B)_i u$
]

#example[Controllable Form Conversion][
  Convert $dot(x) = [-2 -3; 1 0]x + [0; 1]u$ to controllable canonical form.
]
#solution[
  Step 1: Characteristic polynomial
  $det(s I - A) = det([[s+2 -3 1]; [-1 s]]) = s^2 + 5s + 6$

  Step 2: Identify coefficients
  $a_1 = 5$, $a_0 = 6$

  Step 3: Controllable form
  $A_"cc" = [-5 -6; 1 0]$, $B_"cc" = [1; 0]$
  $C_"cc" = [b_1 b_0] = [5 6]$

  Step 4: Find transformation matrix
  Solve $T A_"cc" = A T$, $T B_"cc" = B$
  $T = [[1 1 0]; [0 1 1]]$
  Verify: $A = T A_"cc" T^(-1)$, $B = T B_"cc"$ ✓
]

#example[Observable Form Conversion][
  Transform to observable canonical form for $G(s) = (3s + 2)/(s^3 + 4s^2 + 5s + 6)$.
]
#solution[
  Step 1: Identify coefficients
  $a_2 = 4$, $a_1 = 5$, $a_0 = 6$
  $b_2 = 3$, $b_1 = 2$, $b_0 = 0$

  Step 2: Observable canonical matrices
  $A_"oc" = [-4 1 0; -5 0 1; -6 0 0]$
  $B_"oc" = [3; 2; 0]$
  $C_"oc" = [1 0 0]$

  Step 3: Verify
  Characteristic polynomial matches: $s^3 + 4s^2 + 5s + 6$ ✓
]

#example[Jordan Form Analysis][
  Analyze system $A = [[0 1 0; 0 0 1; 0 0]]$ (triple eigenvalue at origin).
]
#solution[
  Step 1: Eigenvalue structure
  $lambda = 0$ with algebraic multiplicity 3

  Step 2: Jordan blocks
  One Jordan block of size 3:
  $J = [0 1 0; 0 0 1; 0 0]$

  Step 3: Physical interpretation
  $dot(x)_1 = x_2$, $dot(x)_2 = x_3$, $dot(x)_3 = 0$
  Chained integrators with no damping
]

=== Physical Interpretations

#definition[Modal Coordinates][
  Physical meaning of canonical forms:
  - *Controllable form*: Input effects on system modes
]
- *Observable form*: Output contributions from system states
- *Jordan form*: Natural frequencies and mode coupling
- *Diagonal form*: Independent system modes

#example[Physical System Analysis][
  Analyze coupled mass-spring system using modal decomposition.
]
#solution[
  Physical model: $M diaer(x) + K x = F(t)$
  State-space: $dot(x) = [0 I; -M^(-1)K]x + [0; M^(-1)]F(t)$
  Modal transformation: $x = T z$ where $T$ contains mode shapes
  Result: $diaer(z)_i + omega_i^2 z_i = f_i(t)$
  Each mode: independent second-order system
]

=== Solved Problems

#solved_problem[Canonical Transformation][
  Transform $dot(x) = [0 1 0; 0 -2]x + [0; 1]u$ to controllable canonical form.
]
#solution[
  Step 1: Characteristic polynomial
  $det(s I - A) = det([[s+1 0; -1 s]]) = s^2 + 2s + 3s + 2$

  Step 2: Identify coefficients
  $a_1 = 2$, $a_0 = 3$

  Step 3: Controllable form
  $A_"cc" = [-2 -3; 1 0]$, $B_"cc" = [1; 0]$
  $C_"cc" = [b_1 b_0] = [2 3]$

  Step 4: Transformation matrix
  Solve $T A_"cc" = A T$, $T B_"cc" = B$
  $T = [[1 1 0]; [0 1 1]]$
  Verify: $A = T A_"cc" T^(-1)$, $B = T B_"cc"$ ✓
]

#solved_problem[Jordan Application][
  Analyze system with Jordan block $A_J = [lambda 1 0; 0 0 lambda 1]$.
]
#solution[
  Step 1: System response
  $x_1(t) = (x_1(0) + x_2(0)t)e^(lambda t)$
  $x_2(t) = (x_2(0) + x_3(0)t)e^(lambda t)$
  $x_3(t) = (x_3(0) + x_3(1)t)e^(lambda t)$

  Step 2: Physical interpretation
  Mode 1: Standard first-order response
  Modes 2,3: Polynomia growth due to chain of integrators

  Step 3: System behavior
  Marginal stability with polynomial growth
]

=== Supplementary Problems

#supplementary[Transform Properties][
  Prove that trace and determinant are invariant under similarity transformations.
]

#supplementary[Numerical Issues][
  Discuss numerical stability problems when computing Jordan forms for nearly repeated eigenvalues.
]