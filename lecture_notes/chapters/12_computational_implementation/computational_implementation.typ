#import "../../../utils.typ": *
= Computational Implementation

This chapter covers the computational translation of bio-system theoretical models, focusing on spatial PDEs via the Nonlinear Finite Element Method (FEM) and temporal ODE validation via adaptive Runge-Kutta simulators (ODE45) applied alongside clinical platforms like the UVA/Padova simulator.


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

== Computational Validation of Bio-System Models

=== Mathematical Review

#definition[Numerical Integration: Runge-Kutta Methods][
  Advanced solvers like ODE45 use adaptive step sizes based on the Runge-Kutta framework to solve stiff initial value problems:
  $ x' = f(x, t), quad x(t_0) = x_0 $
  The standard 4th-order Runge-Kutta (RK4) step to approximate $x(t_{n+1})$ from $x(t_n)$ with step-size $h$ is defined by intermediate slopes:
  $
  k_1 &= f(t_n, x_n) \
  k_2 &= f(t_n + h/2, x_n + h k_1 / 2) \
  k_3 &= f(t_n + h/2, x_n + h k_2 / 2) \
  k_4 &= f(t_n + h, x_n + h k_3)
  $
  The state is then updated via the weighted average:
  $ x_{n+1} = x_n + h / 6 (k_1 + 2 k_2 + 2 k_3 + k_4) $
  For stressed biological systems (like epinephrine bolus kinetics), adaptive solvers continually resize $h$ to bound the local truncation error, ensuring stability across both fast and slow timescales.
]

#definition[In Silico Clinical Trials (UVA/Padova Simulator)][
  The FDA-accepted UVA/Padova simulator is the industry standard for "in silico" clinical trials of closed-loop insulin delivery (e.g. Artificial Pancreas). Control algorithms (MPC, PID, LQR) can be rigorously validated continuously against a cohort of $n = 100$ mathematical differential models representing virtual patients—spanning pediatric, adolescent, and adult physiology—with zero human risk.
]

=== Solved Problems

#solved_problem[Verifying the Analytical $G_"max"$ Bound Numerically][
  Describe the numerical experiment used to validate the analytically derived LCIS bound $G_"max" = (P_G + P_(G,e)(E^*)) / k_1$ for the stressed model.
]
#solution[
  1. Set model parameters and extreme initial condition: $G(0) = G_"max" - epsilon$, $I(0) = 0$, $E(0) = E^*$.
  2. Run ODE45 for $T_"sim" = 500$ minutes.
  3. Plot $G(t)$ and verify numerically that $G(t) <= G_"max"$ for all $t$.
  4. Confirm the trajectory is bounded and eventually converges toward an equilibrium inside the LCIS-computed set.
]

=== Supplementary Problems

#supplementary[Adaptive Step Size Importance][
  Explain why fixed-step Euler integration would produce incorrect results when simulating the sharp epinephrine bolus. What is the minimum step size $h$ required for Euler stability given the stiffness ratio of the model?
]

