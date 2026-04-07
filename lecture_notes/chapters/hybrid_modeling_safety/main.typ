#import "../../../utils.typ": *
= Hybrid Modeling & Safety Bounds

This chapter explores the synthesis of analytical bio-system theory with Scientific Machine Learning: embedding the theoretical Theorem 1/2 Localizing Bounds (from Ch.9 and Ch.10) directly into the PINN loss to guarantee Safe AI architectures.

== LCIS-Constrained PINNs and Safe AI

=== Mathematical Review

#definition[The Safe AI Paradigm in Metabolic Modeling][
  While standard PINNs enforce ODE residuals, they can still produce biologically absurd outputs during early training epochs or when extrapolating (e.g., predicting negative glucose). A *Safe AI* architecture bakes the analytical bounds guaranteed by mathematical theorems directly into the loss landscape.
]

#definition[Constrained PINN Definition][
  We extend the total loss function by incorporating hard penalty constraints derived from the Positivity Lemma (Ch.9) and the LCIS Method (Ch.10).
  
  $ L_"total" = L_"data" + lambda_1 L_"physics" + lambda_2 L_"positivity" + lambda_3 L_"safety" $
  
  - *Positivity Penalty:*
    $ L_"positivity" = sum_j [ max(0, -hat(G)(tau_j))^2 + max(0, -hat(I)(tau_j))^2 + max(0, -hat(beta)(tau_j))^2 ] $
    This severely penalises any predicted value falling below zero.
    
  - *Safety Bound Penalty (LCIS):*
    From Theorem 2 (Localizing Functions), we know strict population bounds $G_"max"$, $I_"max"$, and $B_"max"$.
    $ L_"safety" = sum_j [ max(0, hat(G)(tau_j) - G_"max")^2 + max(0, hat(I)(tau_j) - I_"max")^2 + max(0, hat(beta)(tau_j) - B_"max")^2 ] $
    This limits predictions to the proven invariant compact set $K$.
]

#definition[The Digital Twin of Human Metabolism][
  Integrating patient-specific parameter discovery (Ch.15) with rigorous safety bounds yields a "Digital Twin". This continuous-time, queryable surrogate model can be embedded inside a closed-loop Artificial Pancreas (connecting to the PID control laws of Ch.4). The hardware controller uses the PINN's real-time forward prediction to safely optimise insulin delivery.
]

=== Solved Problems

#solved_problem[Writing the Complete Safe AI Loss][
  Write the unified constrained PINN loss $L_"total"$ for a model with known maximum stress bounds $G_"max"(E^*)$ from Chapter 11.
]
#solution[
  $ L_"total" &= sum_i |hat(G)(t_i) - G_i|^2 quad &text("(Data Term)") \
            &+ lambda_1 sum_j |hat(G)' - f_G(hat(G), hat(E))|^2 quad &text("(ODE Residual)") \
            &+ lambda_2 sum_j max(0, -hat(G))^2 quad &text("(Positivity, Lema 1)") \
            &+ lambda_3 sum_j max(0, hat(G) - G_"max"(E^*))^2 quad &text("(LCIS Theorem 2)") $
  The theoretical bounds $G_"max"(E^*)$ are established independently before training using the analytical Lie derivative calculations from Ch.11, ensuring the neural network cannot violate fundamental physicochemical laws.
]

=== Supplementary Problems

#supplementary[Extrapolation Assurances][
  When a black-box LSTM forecasts $2$ hours into the future, its output distribution often explodes. How does the inclusion of $L_"safety"$ and the LCIS bounds guarantee that the $2$-hour forecast of a PINN remains within realistic boundaries, even if the underlying $L_"data"$ was insufficient or corrupted?
]

