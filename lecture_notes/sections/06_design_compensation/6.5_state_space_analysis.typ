#import "../../utils.typ": *
== State-Space Analysis and Transfer Matrix

=== Mathematical Review

State-space analysis provides insights into system structure and facilitates multivariable system design through matrix representations.

#definition[State-Space to Transfer Function][
  For single-input single-output (SISO) systems:
  $ G(s) = C(s I - A)^(-1) B + D $
  where $(s I - A)^(-1) = a d j(s I - A)/det(s I - A)$
  
  For MIMO systems (p inputs, q outputs):
  $ G(s) = [g_(i j)(s)]_(q×p) = C(s I - A)^(-1) B + D $
]

#theorem[Controllability][
  System is controllable if any state can be reached from any initial condition:
  Controllability matrix: $P_c = [B A B A^2 B ... A^(n-1) B]$
  Rank condition: $r a n k(P_c) = n$ (full state controllability)
]

#theorem[Observability][
  System is observable if any state can be determined from output measurements:
  Observability matrix: $P_o = [C; C A; C A^2; ...; C A^(n-1)]^T$
  Rank condition: $r a n k(P_o) = n$ (full state observability)
]

#example[Controllability Analysis][
  Analyze controllability of $dot(x) = [1 2; 3 4]x + [1; 0]u$.
]
#solution[
  Step 1: Form controllability matrix
  $P_c = [B A B] = [[1 2 3 8]; [0 6 12 26]]$
  
  Step 2: Calculate rank
  $det(P_c) = 1×26 - 0×8 = 26 ≠ 0$ → rank$(P_c) = 2$
  
  Step 3: Conclusion
  Since $n = 2$ and $r a n k(P_c) = 2$, system is controllable ✓
]

#example[Transfer Function Conversion][
  Convert $A = [0 1; -2 -3]$, $B = [0; 1]$, $C = [1 0]$, $D = 0$ to transfer function.
]
#solution[
  Step 1: Calculate $s I - A$
  $ s I - A = [[s -1]; [2 s+3]]$
  
  Step 2: Find inverse
  $(s I - A)^(-1) = 1/((s+1)(s+2)) [[s+3 1]; [-2 s]]$
  
  Step 3: Multiply by $C$ and $B$
  $G(s) = [1 0] × 1/((s+1)(s+2)) [[s+3 1]; [-2 s]] × [0; 1] = 1/((s+1)(s+2))$
]

=== Multivariable Systems

#definition[MIMO Transfer Matrix][
  For systems with multiple inputs and outputs:
  $ G(s) = C(s I - A)^(-1) B + D $
  Each element $g_(i j)(s)$ relates input $j$ to output $i$
  
  Properties:
  - *Proper*: All elements satisfy $degree(n u m e r a t o r) ≤ degree(d e n o m i n a t o r)$
  - *Strictly proper*: Strict inequality for all elements
  - *Symmetric*: $G^T(s) = G(s)$ for symmetric physical systems
]

#example[2×2 System Analysis][
  Analyze $dot(x) = [0 1; -2 -3]x + [1 0; 0 1]u$, $y = [1 0; 0 1]x$.
]
#solution[
  Step 1: Transfer matrix calculation
  $G(s) = [1/(s^2+3s+2) (s+3)/(s^2+3s+2); 1/(s^2+3s+2) 1/(s+3)]$
  
  Step 2: Input-output relationships
  $Y_1(s) = G_(11)(s)U_1(s) + G_(12)(s)U_2(s)$
  $Y_2(s) = G_(21)(s)U_1(s) + G_(22)(s)U_2(s)$
  
  Step 3: System properties
  - Input 1 affects both outputs
  - Input 2 affects only output 2
  - System is coupled but not fully
]

=== Minimal Realizations

#theorem[Minimal Realization][
  A realization $(A, B, C, D)$ is minimal if:
  1. Controllable and observable
  2. No pole-zero cancellations
  3. Order equals McMillan degree of transfer function
  
  All minimal realizations are related by similarity transformations.
]

#definition[McMillan Degree][
  For MIMO transfer matrix $G(s)$:
  - Find least common denominator $d(s)$
  - McMillan degree = $degree(d(s))$
  - Represents minimal state-space dimension
]

#example[Minimal Realization][
  Find minimal realization of $G(s) = [(s+1)/(s(s+2)) (1/(s+1)); (1/(s+2)) 1/(s+2)]$.
]
#solution[
  Step 1: Transfer matrix structure
  $G(s) = [[(s+1)/(s(s+2)) 1/(s+1)]; [1/(s+2) 1/(s+2)]]$
  
  Step 2: Common denominator
  $d(s) = s(s+1)(s+2)$
  McMillan degree = 3
  
  Step 3: Minimal realization
  $A = [[-2 0 0]; [0 -1 0]; [0 0 0]]$
  $B = [[1 0]; [0 1]; [0 1]]$
  $C = [[1 1 1]; [0 1 1]]$
  $D = [[0 0]; [0 0]]$
]

=== Solved Problems

#solved_problem[Decomposition][
  Decompose $G(s) = (2s+3)/(s^2+5s+6)$ into minimal state-space form.
]
#solution[
  Step 1: Partial fraction expansion
  $G(s) = 1/(s+2) + 1/(s+3)$
  
  Step 2: Parallel realization
  $A = [[-2 0]; [0 -3]]$, $B = [[1]; [1]]$
  $C = [1 1]$, $D = 0$
  
  Step 3: Verify
  $G(s) = [1 1] [[s+3 0]; [0 s+2]] [[1]; [1]] = 1/(s+2) + 1/(s+3)$ ✓
]

#solved_problem[Transmission Zeros][
  Find transmission zeros of MIMO system $G(s) = [[(s+1)/(s+2) 1/(s+3)]; [2/(s+2) (s+4)/(s+3)]]$.
]
#solution[
   Step 1: Find transfer matrix rank
   $r a n k(G(s)) < 2$ at transmission zeros
  
  Step 2: Calculate determinant
  $det(G(s)) = (s+1)(s+4)/(s+2)(s+3) - 2/(s+2)(s+3) = (s^2+5s+4 - 2)/(s+2)(s+3) = (s^2+5s+2)/(s+2)(s+3)$
  
  Step 3: Transmission zeros
  $s^2 + 5s + 2 = 0 → s = -0.44, -4.56$
  
  Step 4: Interpretation
  At $s = -0.44$ and $s = -4.56$, system loses one rank direction
]

=== Supplementary Problems

#supplementary[Controllability Test][
  Determine controllability conditions for Jordan form system matrix with repeated eigenvalues.]

#supplementary[Realization Algorithms][
  Compare Gilbert's method vs. Ho-Kalman algorithm for minimal realization.]