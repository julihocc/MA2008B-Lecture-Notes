#import "../../../utils.typ": *
== The PINN Loss Function and SciML

=== Mathematical Review

#definition[Limitations of Purely Data-Driven Models][
  Traditional "black-box" machine learning models (like standard LSTMs or Transformers) struggle in biomedical contexts because they:
  1. *Require massive datasets*, which are rarely available in clinical settings.
  2. *Fail to extrapolate* outside their training data.
  3. *Offer no physical guarantees*, potentially predicting biologically impossible states (e.g., negative glucose concentrations).
]

#definition[Physics-Informed Neural Networks (PINNs)][
  A PINN embeds the known laws of physics (expressed as ODEs or PDEs) directly into the neural network's loss function. Instead of just fitting data, the network is penalized if its outputs do not satisfy the governing differential equations.
  
  For a system $x' = f(x)$, we parameterise the solution using a neural network $x(t) approx hat(x)(t; theta)$.
  The total loss is:
  $ L_"total" = L_"data" + lambda L_"physics" $
  
  Where:
  - $L_"data" = 1/N sum_(i=1)^N |hat(x)(t_i; theta) - x_i^"obs"|^2$ (Mean Squared Error on observed clinical data)
  - $L_"physics" = 1/N_c sum_(j=1)^(N_c) |hat(x)'(tau_j; theta) - f(hat(x)(tau_j; theta))|^2$ (Residual of the ODE at $N_c$ "collocation points" $tau_j$)
  - $lambda$ is a weighting hyperparameter balancing data fit versus physical consistency.
]

=== Solved Problems

#solved_problem[PINN Loss for a One-Compartment Model][
  Write the explicit PINN loss function for the simple mass-balance model $C' = P_0 - k C$, assuming we have 5 noisy clinical observations $C_i^"obs"$ at times $t_i$.
]
#solution[
  The neural network predicts $hat(C)(t; theta)$. The loss components are:
  
  1. *Data Loss* (evaluated at the 5 observation times $t_i$):
  $ L_"data" = 1/5 sum_(i=1)^5 (hat(C)(t_i; theta) - C_i^"obs")^2 $
  
  2. *Physics Loss* (evaluated at $N_c$ arbitrary collocation points $tau_j$ in the time domain):
  The ODE residual is $R(t) = hat(C)'(t; theta) + k hat(C)(t; theta) - P_0$. By automatic differentiation, we compute $hat(C)'(tau_j)$.
  $ L_"physics" = 1/N_c sum_(j=1)^(N_c) (hat(C)'(tau_j; theta) + k hat(C)(tau_j; theta) - P_0)^2 $
  
  The total loss to minimise during training is $L_"total" = L_"data" + lambda L_"physics"$.
]

=== Supplementary Problems

#supplementary[Role of the Hyperparameter $lambda$][
  Discuss the training behaviour of a PINN at the two extremes: $lambda = 0$ and $lambda -> infinity$. In a scenario with highly noisy clinical data but a perfectly known ODE model, how should $lambda$ be adjusted?
]
