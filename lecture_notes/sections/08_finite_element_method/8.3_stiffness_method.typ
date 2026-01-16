#import "../../utils.typ": *

== Stiffness Method

=== Mathematical Review

The *Direct Stiffness Method* is the most common approach for implementing FEM.

#definition[Stiffness Matrix][
  Relates nodal forces $f$ to nodal displacements $d$:
  $ f = k d $
  The global stiffness matrix $K$ is assembled from element stiffness matrices.
]

#theorem[Properties of K][
  The global stiffness matrix $K$ is:
  1. Symmetric (Maxwell-Betti reciprocity)
  2. Positive semi-definite (singular before boundary conditions)
  3. Positive definite (after applying sufficient boundary conditions)
  4. Sparse and banded
]

=== Solved Problems

#solved_problem[Spring System][
  Assemble the global stiffness matrix for two springs in series with stiffness $k_1$ and $k_2$.
]
#solution[
  Nodes: 1, 2, 3. Elements: 1 (nodes 1-2), 2 (nodes 2-3).
  Element matrices:
  $ k^((1)) = mat(k_1, -k_1;-k_1, k_1) $ (indices 1, 2)
  $ k^((2)) = mat(k_2, -k_2;-k_2, k_2) $ (indices 2, 3)

  Assembly:
  $ K = mat(k_1, -k_1, 0;-k_1, k_1 + k_2, -k_2;0, -k_2, k_2) $
]
