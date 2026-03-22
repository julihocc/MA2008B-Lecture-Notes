#import "../../../utils.typ": *

== Spatial Dynamics: Nonlinear Finite Element Method (FEM)

=== Mathematical Review

#definition[Spatial Reaction-Diffusion Models][
  While standard compartmental models treat organs as perfectly mixed volumes (ODEs), actual biological tissues exhibit significant spatial gradients. The spatio-temporal dynamics of a biological concentration $C(x, t)$ (e.g., glucose in interstitial fluid) is governed by a semilinear Parabolic Partial Differential Equation (PDE):
  $ (partial C) / (partial t) = D nabla^2 C + f(C) $
  where $D$ is the diffusion tensor and $f(C)$ represents the nonlinear reaction kinetics (e.g., Michaelis-Menten metabolic consumption).
]

#theorem[The Galerkin Weak Formulation][
  To solve the PDE computationally over an arbitrary complex tissue geometry $Omega$ with boundary $partial Omega$, we apply the Finite Element Method (FEM).
  We multiply the PDE by a set of smooth test functions $v(x)$ and integrate over the domain:
  $ integral_Omega v (partial C) / (partial t) dif x = integral_Omega v (D nabla^2 C) dif x + integral_Omega v f(C) dif x $
  Applying Integration by Parts (Green's First Identity) to the diffusion term relaxes the continuity requirements:
  $ integral_Omega v (partial C) / (partial t) dif x = - integral_Omega D nabla v dot nabla C dif x + integral_(partial Omega) v (D nabla C dot bold(n)) dif S + integral_Omega v f(C) dif x $
  By expanding the unknown $C(x,t)$ into a finite basis $sum c_i(t) phi_i(x)$, the PDE is transformed into a massive system of coupled nonlinear ODEs representing the nodal concentrations $bold(c)(t)$:
  $ M bold(c)'(t) + K bold(c)(t) = F(bold(c)) $
  where $M$ is the Mass Matrix, $K$ is the Stiffness Matrix, and $F$ is the nonlinear reaction vector.
]

=== Solved Problems

#solved_problem[Isolating Spatial Homeostasis][
  When calculating the spatial steady-state (homeostasis) of a metabolic reaction-diffusion system, what happens to the FEM mathematical formulation?
]
#solution[
  At steady state, all variables cease changing with respect to time, implying $(partial C) / (partial t) = 0$, and consequently the node vector derivative $bold(c)'(t) = bold(0)$.
  The dynamic system $M bold(c)'(t) + K bold(c)(t) = F(bold(c))$ mathematically collapses into a root-finding problem for a system of nonlinear algebraic equations:
  $ K bold(c) - F(bold(c)) = bold(0) $
  This state can be efficiently solved using the multivariate Newton-Raphson method, providing the spatial distribution of the stable biological equilibrium curve.
]
