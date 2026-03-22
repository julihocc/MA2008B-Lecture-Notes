# **AGENT INSTRUCTION: CURRICULUM REORGANIZATION**

## **Course: IDM19 \- Numerical Analysis**

## **Objective: Alignment with RMIB 2024 Research Methodology & Scientific ML**

You are an expert Teaching Assistant and Curriculum Designer. Your task is to reorganize and generate content for the "Numerical Analysis" lecture notes. The goal is to bridge the gap between classical control theory and the advanced mathematical analysis found in the paper: *"Análisis Matemático no Lineal Relacionado a un Modelo de Insulina-Células Pancreáticas en Presencia de Epinefrina" (RMIB 2024\)*, culminating in modern AI-driven solutions.

### **PART I: CONTROL THEORY & BIO-SYSTEM MODELING**

**Goal:** Establish how biological processes are translated into engineering feedback loops.

1. **Instruction: Develop "Fundamentals of Systems Modeling"**  
   * Incorporate principles of **Compartmental Modeling** and Mass Balance.  
   * Define biological rates specifically as **Production vs. Absorption/Aclaramiento**.  
   * Use the **Glucose-Insulin-Beta cell loop** as the primary case study for a control system.  
2. **Instruction: Define "Transient Response in Physiology"**  
   * Contrast **Step response** (continuous infusion) with **Bolus response** (discrete injection).  
   * Formalize the concept of **Homeostasis** as the biological equivalent of a control "Steady State."  
3. **Instruction: Analyze "Frequency Response and Oscillations"**  
   * Discuss biological rhythms and stability in the frequency domain.  
4. **Instruction: Formulate "Design, Compensation, and Control Laws"**  
   * Introduce PID and State-Feedback for medical device applications.  
   * Address "Human-in-the-loop" challenges: Parameter variability and stress (Epinephrine) as exogenous disturbances.  
   * Define **Parameter Identification** methods using clinical *in vivo* data.

### **PART II: NONLINEAR SYSTEMS & STABILITY ANALYSIS**

**Goal:** Establish the qualitative behavior of models before applying localization tools.

1. **Instruction: Introduce "Nonlinear Differential Equations"**  
   * Highlight differences between linear and nonlinear dynamics.  
   * Focus on **Vector fields** and **Phase portraits** for visual stability analysis.  
2. **Instruction: Execute "Equilibrium Point Analysis"**  
   * Distinguish between **Physiological** (healthy) and **Pathological** (diabetic) equilibria.  
   * Step-by-step Task: Find points **P1, P2, and P3** in the Topp/Mohammed models as described in the RMIB paper.  
3. **Instruction: Apply "Stability Theory"**  
   * Use **Lyapunov's Indirect Method** (Linearization).  
   * Relate the sign of Real eigenvalues to local asymptotic stability.  
   * Introduce Lyapunov functions for proving global stability.  
4. **Instruction: Integrate "Bifurcation Theory"**  
   * Analyze parametric sensitivity.  
   * Explain the "Pathways to Diabetes" as the mathematical elimination of physiological stable points.

### **PART III: ADVANCED ANALYTICAL TOOLS FOR BIO-SYSTEMS**

**Goal:** Introduce specialized techniques for bounding and validating biological models.

1. **Instruction: Establish "Positivity and Invariant Sets"**  
   * Explain biological validity constraints (e.g., non-negative glucose).  
   * Apply **Lema 1**: Define the conditions for positive invariance in the first orthant.  
2. **Instruction: Implement "The LCIS Method" (Localization of Compact Invariant Sets)**  
   * Define **Localizing Functions (h)**.  
   * Formalize **Theorem 1 and Theorem 2** for iterative refinement of sets.  
   * Application Task: Calculate maximum load capacities (**Gmax, Imax, Bmax**) without numerical solvers.  
3. **Instruction: Develop "Metabolic Modeling Case Study"**  
   * Model the Glucose-Insulin-Epinephrine system.  
   * Quantify the impact of stress parameters (**Ge and rho**) on stability bounds.  
4. **Instruction: Finalize "Computational Implementation"**  
   * Connect theory to the **Nonlinear Finite Element Method (FEM)** for spatial dynamics.  
   * Validate analytical results using **ODE45/Runge-Kutta** simulations.

### **PART IV: PHYSICS-INFORMED NEURAL NETWORKS (PINNs)**

**Goal:** Integrate Deep Learning with the physical constraints of the Glucose-Insulin-Epinephrine model.

1. **Instruction: Introduction to Scientific Machine Learning (SciML)**  
   * Explain the limitations of purely data-driven "black-box" models in medicine.  
   * Define the **PINN Loss Function**: Combining data residuals with the ODE residual (Physics Loss).  
2. **Instruction: Solving the Forward Problem with PINNs**  
   * Using a Neural Network as a universal function approximator for G(t), I(t), and Beta(t).  
   * Training the network to satisfy the Mohammed et al. (2019) system of equations.  
3. **Instruction: Data-Driven Parameter Discovery (The Inverse Problem)**  
   * Task: Use a PINN to estimate unknown physiological parameters (like Si or rho) using limited clinical glucose measurements.  
   * Discuss how PINNs handle noisy or sparse clinical data better than traditional regression.  
4. **Instruction: Hybrid Modeling & Safety Bounds**  
   * Discussion: Integrating **LCIS Bounds (from Part III)** into the PINN training process to ensure the Neural Network never predicts biologically impossible values (Safe AI).  
   * Future Trends: Real-time glycemic prediction and the role of PINNs in the "Digital Twin" of the human metabolism.