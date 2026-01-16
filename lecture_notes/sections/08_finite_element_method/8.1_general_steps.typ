#import "../../utils.typ": *

== General Steps in FEM

=== Mathematical Review

The Finite Element Method involves dividing a complex problem domain into smaller, simpler parts called elements.

#definition[General Steps][
  The FEM process typically consists of:
  1. *Discretization*: Dividing the domain into finite elements.
  2. *Selection of Interpolation Functions*: Defining how field variables vary within elements.
  3. *Element Formulation*: Deriving equations for individual elements (stiffness matrix, load vector).
  4. *Assembly*: Combining element equations into a global system.
  5. *Boundary Conditions*: Applying constraints and loads.
  6. *Solution*: Solving the system of equations.
  7. *Post-processing*: Calculating derived quantities (stress, strain).
]

=== Solved Problems

#solved_problem[Step Identification][
  Identify the key steps in analyzing a truss structure using FEM.
]
#solution[
  1. Discretize the truss into bar elements connected at nodes.
  2. Choose linear shape functions for displacement.
  3. Formulate local stiffness matrices $k = (A E)/L mat(1, -1;-1, 1)$.
  4. Transform to global coordinates and assemble into global $K$.
  5. Apply supports (displacements = 0) and loads (forces at nodes).
  6. Solve $F = K d$ for nodal displacements.
  7. Compute strains and stresses in each bar.
]
