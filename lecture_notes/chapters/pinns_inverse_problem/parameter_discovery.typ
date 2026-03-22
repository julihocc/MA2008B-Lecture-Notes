#import "../../../utils.typ": *
== Parameter Discovery with PINNs

=== Mathematical Review

#definition[The Inverse Problem in Biomedicine][
  Unlike engineering systems where component parameters are known by design, biological parameters varies wildly from patient to patient. Given sparse clinical measurements (e.g., continuous glucose monitor reading $G(t)$ every 5 mins, but highly noisy), the goal is to infer unmeasured states like $I(t)$ and unknown physiological parameters like $S_I$ and $gamma$.
]

#definition[Joint Optimization in PINNs][
  In a PINN, we treat the unknown parameters $theta_"phys" = (S_I, k_1, ...)$ as *hyperparameters* of the neural network alongside its internal weights $theta_"nn"$. 
  The neural network $hat(G)(t; theta_"nn")$ is trained by jointly optimizing both sets of weights to minimise the regularized total loss:
  
  $ min_(theta_"nn", theta_"phys") [ alpha sum_i (hat(G)(t_i) - G_i^"obs")^2 + beta sum_j |hat(G)'(tau_j) - f_G (hat(G), hat(I); theta_"phys")|^2 ] $
  
  The physics loss term acts as a powerful regulariser preventing overfitting to the noisy clinical data. Even with sparse measurements, the physical constraints force smooth, biomedically valid trajectories, outperforming traditional least-squares parameter identification techniques (as seen in Ch.4).
]

=== Solved Problems

#solved_problem[Parameter Discovery for $S_I$ and $rho$][
  Suppose we have 10 noisy glucose measurements and 4 noisy epinephrine measurements from a stressed patient. Set up the PINN inverse problem to discover the insulin sensitivity $S_I$ and the impairment factor $rho$.
]
#solution[
  1. Define network: outputs $hat(G)(t)$, $hat(I)(t)$, $hat(beta)(t)$, $hat(E)(t)$.
  2. Define parameters to learn: initializing $S_I^0 = 36$ and $rho^0 = 0.3$ as trainable PyTorch tensors.
  3. Data Loss (using only known data points, assuming $I$ and $beta$ are unmeasured):
     $ L_"data" = 1/10 sum_(i=1)^10 (hat(G)(t_i^"obs") - G_i^"obs")^2 + 1/4 sum_(m=1)^4 (hat(E)(t_m^"obs") - E_m^"obs")^2 $
  4. Physics Loss (enforced over massive arbitrary collocation points $tau_j$):
     $ R_G (tau_j) &= hat(G)' - P_G - P_(G,e)(hat(E)) + (S_I - rho hat(E)) hat(I) hat(G) + k_1 hat(G) \
       R_I (tau_j) &= hat(I)' - hat(beta)(1 - alpha hat(E)) f(hat(G)) + gamma hat(I) \
       R_E (tau_j) &= hat(E)' + k_E hat(E) - D(tau_j) \
       L_"physics" &= (R_G^2 + R_I^2 + R_E^2 + R_beta^2) $
  5. As the network trains, gradients flow back through the physics loss PDE residual and adjust the values of $S_I$ and $rho$ to simultaneously satisfy the ODE constraints and fit the sparse noisy data.
]

=== Supplementary Problems

#supplementary[Identifiability from Sparse Data][
  If only glucose $G(t)$ is measured and both $I(t)$ and standard $S_I$ are unknown, the system is mathematically *unidentifiable* (multiple combinations of $I(t)$ and $S_I$ yield the same $G(t)$). How does the inclusion of the physics residual $R_I(tau_j)$ and known $beta$-cell dynamics help solve this identifiability problem compared to classical empirical curve fitting?
]
