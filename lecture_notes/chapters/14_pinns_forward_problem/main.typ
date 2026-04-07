#import "../../../utils.typ": *
= Solving the Forward Problem with PINNs

This chapter explores how neural networks can act as mesh-free, infinite-resolution ODE solvers for forward simulation, bypassing traditional numerical integration schemes like Runge-Kutta.

== Neural Networks as ODE Solvers

=== Mathematical Review

#definition[The Forward Problem][
  In the "forward problem", all system parameters (e.g., $P_G, S_I, gamma$) and initial conditions are completely known. The goal is simply to simulate the trajectory of the states over time. Conventionally, we use numerical methods like ODE45 (Runge-Kutta 4th/5th order) for this.
]

#definition[PINNs as Mesh-Free Solvers][
  A neural network can solve the forward problem *without* any observed data. By representing the states $(G, I, beta)$ as outputs of a neural network fed by the single time input $t$:
  
  $ [hat(G)(t), hat(I)(t), hat(beta)(t)]^T = "NN"(t; theta) $
  
  We train the network weights $theta$ using *only* the physics loss and the initial conditions:
  $ L_"total" = L_"IC" + L_"physics" $
  
  - $L_"IC" = |hat(G)(0) - G_0|^2 + |hat(I)(0) - I_0|^2 + |hat(beta)(0) - beta_0|^2$
  - $L_"physics" = sum_j |hat(G)'(tau_j) - f_G(hat(G), hat(I), hat(beta))|^2 + dots$
  
  Once trained, the continuous function $"NN"(t; theta)$ provides an infinite-resolution, closed-form surrogate of the solution, queryable at any arbitrary time $t$ without needing sequential time-stepping.
]

=== Solved Problems

#solved_problem[Forward PINN for the Glucose-Insulin System][
  Set up the PINN forward problem for the baseline glucose-insulin dynamics:
  $G' = P_G - k_1 G - S_I I G$ and $I' = beta_0 f(G) - gamma I$. Suppose $G_0 = 150$, $I_0 = 10$.
]
#solution[
  1. Define a Feed-Forward Neural Network taking input $t$ and returning two outputs: $hat(G)(t; theta)$ and $hat(I)(t; theta)$.
  2. Define the Initial Condition Loss:
     $ L_"IC" = (hat(G)(0) - 150)^2 + (hat(I)(0) - 10)^2 $
  3. Choose $N_c$ collocation points $tau_j in [0, t_f]$.
  4. Compute time derivatives via Automatic Differentiation: $hat(G)' = (partial hat(G))/(partial t)$, $hat(I)' = (partial hat(I))/(partial t)$.
  5. Define the Physics Loss:
     $ R_G (tau_j) &= hat(G)'(tau_j) - P_G + k_1 hat(G)(tau_j) + S_I hat(I)(tau_j) hat(G)(tau_j) \
       R_I (tau_j) &= hat(I)'(tau_j) - beta_0 f(hat(G)(tau_j)) + gamma hat(I)(tau_j) \
       L_"physics" &= 1/N_c sum_j [ R_G (tau_j)^2 + R_I (tau_j)^2 ] $
  6. Minimize $L_"IC" + L_"physics"$ over the weights $theta$ using an optimizer like Adam or L-BFGS.
]

=== Supplementary Problems

#supplementary[Stiff Systems and PINN Training][
  The glucose-insulin system exhibits multiple timescales (e.g., fast insulin degradation $gamma$ vs. slow beta-cell dynamics). Discuss the challenges of training a PINN on such "stiff" ODEs compared to using an implicit ODE solver like ode15s. How might altering the sampling strategy of collocation points $tau_j$ help?
]

