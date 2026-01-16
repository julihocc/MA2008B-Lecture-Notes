#import "../../utils.typ": *

== Nonlinear Problems in Engineering

=== Mathematical Review

Linearly elastic problems assume $f = K d$ where $K$ is constant. In nonlinear problems, $K$ depends on displacement $d$.

#definition[Sources of Nonlinearity][
  1. *Geometric Nonlinearity*: Large deformations or rotations (e.g., buckling, large deflection).
    $ epsilon = (d u)/(d x) + 1/2 ((d u)/(d x))^2 $
  2. *Material Nonlinearity*: Nonlinear stress-strain relationships (e.g., plasticity, hyperelasticity).
    $ sigma = f(epsilon, dot(epsilon), T) $
  3. *Contact Nonlinearity*: Changes in boundary conditions (e.g., contact/separation, friction).
    $ K(d) d = F $
]

=== Solved Problems

#solved_problem[Identifying Nonlinearity][
  Classify the nonlinearity in a rubber band being stretched to 3 times its original length.
]
#solution[
  1. *Geometric*: Stretching to 3x length involves large deformations (finite strain).
  2. *Material*: Rubber behaves hyperelastically (nonlinear stress-strain curve).
  Therefore, this problem involves both geometric and material nonlinearity.
]
