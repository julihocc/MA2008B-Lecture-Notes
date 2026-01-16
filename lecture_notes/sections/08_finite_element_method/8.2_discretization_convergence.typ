#import "../../utils.typ": *

== Discretization and Convergence

=== Mathematical Review

Discretization is the process of approximating a continuous domain with a discrete set of elements.

#definition[Discretization Error][
  The error introduced by replacing the continuous domain with finite elements. It decreases as the mesh is refined (h-refinement) or element order is increased (p-refinement).
]

#theorem[Convergence Requirements][
  For FEM solutions to converge to the exact solution:
  1. *Completeness*: Shape functions must be able to represent constant strain and rigid body motion.
  2. *Compatibility*: Displacements must be continuous across element boundaries ($C^0$ continuity).
]

=== Solved Problems

#solved_problem[Mesh Refinement][
  Explain how h-refinement improves accuracy.
]
#solution[
  h-refinement involves reducing the element size $h$. As $h -> 0$, the approximation of the geometry and the field variables improves, reducing discretization error. The error is typically $O(h^p)$ where $p$ depends on the element order.
]
