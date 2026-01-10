#import "../../utils.typ": *
== State-Space Analysis

=== Mathematical Review

State-space analysis uses the vector-matrix representation of systems.

#definition[State Controllability][
  A system is *controllable* if the state vector can be transferred from any initial state to any final state in finite time. The Controllability Matrix is:
  $ cal(C) = [B, A B, A^2 B, ..., A^(n-1) B] $
  The system is fully controllable if $op("rank")(cal(C)) = n$.
]

#definition[State Observability][
  A system is *observable* if the initial state can be determined from the output history. The Observability Matrix is:
  $ cal(O) = [C^T, A^T C^T, (A^T)^2 C^T, ..., (A^T)^(n-1) C^T]^T $
  The system is fully observable if $op("rank")(cal(O)) = n$.
]

=== Solved Problems

#example[Controllability Check][
  Check controllability for $A = mat(0, 1; -2, -3)$, $B = mat(0; 1)$.
]
#solution[
  Compute $cal(C) = [B, A B]$.
  $ A B = mat(0, 1; -2, -3) mat(0; 1) = mat(1; -3) $
  $ cal(C) = mat(0, 1; 1, -3) $
  Determinant is $0(-3) - 1(1) = -1 != 0$. Rank is 2 ($n=2$).
  Therefore, the system is *controllable*.
]

#example[Observability Check][
  Check observability for same $A$ with $C = mat(1, 0)$.
]
#solution[
  Compute $cal(O) = [C, C A]^T$.
  $ C A = mat(1, 0) mat(0, 1; -2, -3) = mat(0, 1) $
  $ cal(O) = mat(1, 0; 0, 1) $
  This is the identity matrix. Rank is 2.
  Therefore, the system is *observable*.
]

=== Supplementary Problems

#exercise[Uncontrollable Mode][
  Identify the uncontrollable mode in a system with diagonal $A = mat(-1, 0; 0, -2)$ and $B = mat(0; 1)$.
]

#exercise[Duality][
  Prove that the pair $(A, B)$ is controllable if and only if $(A^T, B^T)$ is observable? (Note: Check duality property accurately).
]
