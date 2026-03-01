# %% [markdown]
# # Companion Script: 4.1 Time-Invariant Solution
# 
# This notebook implements the computational solutions for the **Solved Problems** found in Section 4.1 of the MA2008B Lecture Notes: Time-Domain Solutions of Linear Time-Invariant Systems.
# 
# We use Python's `sympy` library extensively here to perform symbolic linear algebra, matrix exponentiation, and exact symbolic integration, exactly mirroring the analytical steps taught in the notes.
# 
# Let's import the necessary libraries first:

# %%
import sympy as sp
from sympy import Matrix, exp, integrate, cos, sin, symbols, diag

t, tau = symbols('t tau', real=True)

# Helper function to print results nicely
def print_section(title):
    print(f"\n{'='*50}")
    print(f"{title}")
    print(f"{'='*50}")

# %% [markdown]
# ---
# ## Solved Problem 1: Diagonal Matrix Exponential via Power Series
# 
# **Problem Statement:**
# Compute the state transition matrix $e^{At}$ for the diagonal matrix
# $$ A = \begin{bmatrix} -1 & 0 \\ 0 & -2 \end{bmatrix} $$
# using the power-series definition.

# %%
print_section("Solved Problem 1: Diagonal Matrix Exponential")

# Define the numerical matrix A
A1 = Matrix([[-1, 0], [0, -2]])
print(f"Matrix A:\n{A1}\n")

# For a diagonal matrix, e^(At) is simply the diagonal matrix of the exponentiated terms e^(lambda_i * t)
# We can use sympy's built-in exp function directly on the matrix
Phi_1 = exp(A1 * t)

print(f"State Transition Matrix e^(At):\n{Phi_1}")

# %% [markdown]
# ---
# ## Solved Problem 2: Compute State Transition Matrix (Rotational)
# 
# **Problem Statement:**
# Find $e^{At}$ for the matrix
# $$ A = \begin{bmatrix} 0 & 1 \\ -1 & 0 \end{bmatrix} $$

# %%
print_section("Solved Problem 2: State Transition Matrix (Rotational)")

A2 = Matrix([[0, 1], [-1, 0]])
print(f"Matrix A:\n{A2}\n")

# Using Sympy's exact matrix exponential operator
Phi_2 = exp(A2 * t)

print(f"State Transition Matrix e^(At) (Computed directly):\n{Phi_2}\n")

# Let's quickly verify the properties to ensure it's a valid State Transition matrix:
# 1. Phi(0) = I
print(f"Property 1: Phi(0) = I")
print(f"Phi(0):\n{Phi_2.subs(t, 0)}\n")

# 2. d/dt Phi(t) = A * Phi(t)
dPhi_dt = sp.diff(Phi_2, t)
A_Phi = A2 * Phi_2
print(f"Property 2: d/dt Phi(t) == A * Phi(t)")
print(f"d/dt Phi(t):\n{dPhi_dt}\n")
print(f"A * Phi(t):\n{A_Phi}\n")
print(f"Are they equal? {dPhi_dt == A_Phi}")

# %% [markdown]
# ---
# ## Solved Problem 3: State Transition Matrix via Eigenvalue Decomposition
# 
# **Problem Statement:**
# Compute $e^{At}$ for the matrix
# $$ A = \begin{bmatrix} 0 & 1 \\ -2 & -3 \end{bmatrix} $$
# using diagonalization $e^{At} = V e^{\Lambda t} V^{-1}$.

# %%
print_section("Solved Problem 3: Matrix Exponential via Diagonalization")

A3 = Matrix([[0, 1], [-2, -3]])
print(f"Matrix A:\n{A3}\n")

# Method: V * exp(Lambda * t) * V_inv
# Step 1: Find eigenvectors (V) and eigenvalues (Lambda)
V, Lambda = A3.diagonalize()

print(f"Eigenvector Matrix (V):\n{V}\n")
print(f"Eigenvalue Matrix (Lambda):\n{Lambda}\n")

# Step 2: Invert V
V_inv = V.inv()
print(f"Inverse of V (V^-1):\n{V_inv}\n")

# Step 3: Exponentiate the diagonal matrix Lambda
Exp_Lambda_t = exp(Lambda * t)
print(f"e^(Lambda * t):\n{Exp_Lambda_t}\n")

# Step 4: Multiply them together
Phi_3_diag = V * Exp_Lambda_t * V_inv

# Simplify the resulting expression to match the analytical solution
Phi_3_simplified = sp.simplify(Phi_3_diag)
print(f"State Transition Matrix via Diagonalization (Simplified):\n{Phi_3_simplified}")

# %% [markdown]
# ---
# ## Solved Problem 4: Zero-Input Response
# 
# **Problem Statement:**
# For the same matrix $A = \begin{bmatrix} 0 & 1 \\ -2 & -3 \end{bmatrix}$, and initial state $x(0) = \begin{bmatrix} 1 \\ 2 \end{bmatrix}$, compute the zero-input response:
# $$ x(t) = e^{At} x(0) $$

# %%
print_section("Solved Problem 4: Zero-Input Response")

# Initial condition vector
x0 = Matrix([[1], [2]])
print(f"Initial State x(0):\n{x0}\n")

# Multiply the state transition matrix computed in Problem 3 by x(0)
x_zi = Phi_3_simplified * x0

# Expand/simplify for clarity
x_zi_simplified = sp.expand(x_zi)
print(f"Zero-Input Response x(t):\n{x_zi_simplified}")

# Check endpoint behavior: as t -> infinity, x(t) should go to [0, 0] because eigenvalues are negative
# Evaluated at infinity:
limit_x_zi = sp.limit(x_zi_simplified, t, sp.oo)
print(f"\nCheck: Limit of x(t) as t -> infinity:\n{limit_x_zi}")

# %% [markdown]
# ---
# ## Solved Problem 5: Zero-State Response
# 
# **Problem Statement:**
# Find the response for the system defined by:
# $$ A = \begin{bmatrix} -1 & 0 \\ 0 & -2 \end{bmatrix}, \quad B = \begin{bmatrix} 1 \\ 1 \end{bmatrix}, \quad u(t) = 1 $$
# assuming zero initial conditions $x(0) = 0$.

# %%
print_section("Solved Problem 5: Zero-State Response")

A5 = Matrix([[-1, 0], [0, -2]])
B5 = Matrix([[1], [1]])
u = 1 # Step input

# Recompute state-transition matrix using A5 (which is the same as A1!)
Phi_5 = exp(A5 * t)

# The zero-state equation relies on the convolution integral:
# x_zs(t) = integral( Phi(t-tau) * B * u(tau) ) d_tau from 0 to t

# Substitute (t - tau) into the state transition matrix
Phi_t_minus_tau = Phi_5.subs(t, t - tau)

# Setup the integrand
integrand = Phi_t_minus_tau * B5 * u
print(f"Integrand expression inside the convolution integral:\n{integrand}\n")

# Perform the exact symbolic integration over tau from 0 to t
x_zs = integrate(integrand, (tau, 0, t))

print(f"Zero-State Response x_zs(t):\n{x_zs}")

# %% [markdown]
# ---
# ## Solved Problem 6: Complete Response
# 
# **Problem Statement:**
# Combine the zero-input case with the zero-state case to find the completely general response.
# Using the same definitions as Problem 5 but providing an initial state vector:
# $$ x(0) = \begin{bmatrix} 1 \\ 2 \end{bmatrix} $$
# Compute the complete response:
# $$ x(t) = e^{At} x(0) + \int_{0}^{t} e^{A(t-\tau)} B u(\tau) d\tau $$

# %%
print_section("Solved Problem 6: Complete Response")

# The zero-input base term using the Phi from problem 5 and x0 from problem 4
x_zi_complete = Phi_5 * x0

print(f"Term 1 (Zero-Input Response):\n{x_zi_complete}\n")

print(f"Term 2 (Zero-State Response, copied from Problem 5):\n{x_zs}\n")

# Complete Response = Zero-Input + Zero-State
x_total = x_zi_complete + x_zs
x_total_simplified = sp.simplify(x_total)

print(f"Complete Response x(t):\n{x_total_simplified}\n")

# Steady-state check: As t -> infinity, exp(-t) and exp(-2t) go to 0. 
# x(t) should converge to the constant vector [1, 1/2]^T
x_ss = sp.limit(x_total_simplified, t, sp.oo)
print(f"Steady State check (as t -> infinity): x(t) approaches \n{x_ss}")

print("\n(Note: This perfectly matches the analytical derivation found in the notes!)")
