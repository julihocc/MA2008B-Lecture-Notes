# %% [markdown]
# # Companion Script: 4.2 Root Locus Analysis
# 
# This notebook implements the computational solutions for the **Solved Problems** found in Section 4.2 of the MA2008B Lecture Notes: Root Locus Analysis.
# 
# We utilize the `control` library for empirical verification alongside `sympy` for exact analytical deductions, exactly mirroring the techniques applied in the lecture notes.

# %%
import numpy as np
import sympy as sp
import matplotlib.pyplot as plt
import control as ctrl
from sympy import symbols, Eq, solve, diff

s, K = symbols('s K', real=True)

# Helper function to print results nicely
def print_section(title):
    print(f"\n{'='*50}")
    print(f"{title}")
    print(f"{'='*50}")

# %% [markdown]
# ---
# ## Solved Problem 1: Characteristic Equation and Pole Locations
# 
# **Problem Statement:**
# For the characteristic polynomial $\Delta(s,K) = s(s+2) + K$, derive the characteristic equation and the characteristic roots as functions of $K$.

# %%
print_section("Solved Problem 1: Characteristic Equation")

# Define the characteristic equation Delta = 0
Delta = s * (s + 2) + K
char_eq = Eq(Delta, 0)
print(f"Characteristic Equation:\n{char_eq}\n")

# Expand and solve for s in terms of K
expanded_Delta = sp.expand(Delta)
roots_s = solve(expanded_Delta, s)

print("Characteristic Roots (s) as a function of K:")
for i, root in enumerate(roots_s):
    print(f"s_{i+1} = {root}")
    
print("\nAnalytical match: s = -1 ± sqrt(1 - K)")

# %% [markdown]
# ---
# ## Solved Problem 2: Angle Condition Check
# 
# **Problem Statement:**
# For the open-loop transfer function $F(s) = \frac{1}{(s+1)(s+2)}$, check whether the test point $s_0 = -1.5$ satisfies the angle condition and lies on the root locus.

# %%
print_section("Solved Problem 2: Angle Condition Check")

# Evaluate F(s) at s_0 = -1.5
s0 = -1.5
F_s0 = 1 / ((s0 + 1) * (s0 + 2))

print(f"Test Point s_0: {s0}")
print(f"F(s_0) evaluated: {F_s0}")

# The angle condition requires that the angle of F(s0) is an odd multiple of 180 degrees
# Since F(-1.5) = -4, a negative real number, its angle is indeed exactly 180 degrees.
angle_rad = np.angle(F_s0)
angle_deg = np.degrees(angle_rad)

print(f"Angle of F(s_0): {angle_deg} degrees")

if np.isclose(np.abs(angle_deg), 180.0):
    print("Conclusion: s_0 = -1.5 satisfies the angle condition and is ON the root locus.")
    
    # Calculate the required gain K using the magnitude condition: K = 1 / |F(s0)|
    target_K = 1 / np.abs(F_s0)
    print(f"Magnitude Condition: Required gain K to reach s_0 is {target_K}")
else:
    print("Conclusion: s_0 = -1.5 does NOT satisfy the angle condition.")

# %% [markdown]
# ---
# ## Solved Problem 3: Breakaway Point Calculation
# 
# **Problem Statement:**
# For $\Delta(s,K) = 1 + \frac{K}{s(s+2)}$, compute the real-axis breakaway/break-in point.

# %%
print_section("Solved Problem 3: Breakaway Point Calculation")

# Define the Normalized Characteristic Equation
normalized_eq = Eq(1 + K / (s * (s + 2)), 0)

# 1. Solve the equation for K
K_expr = solve(normalized_eq, K)[0]
print(f"Gain K expressed functionally: K(s) = {sp.expand(K_expr)}")

# 2. Differentiate K with respect to s
dK_ds = diff(K_expr, s)
print(f"dK/ds: {sp.expand(dK_ds)}")

# 3. Set dK/ds = 0 and solve for s to find candidate breakaway points
breakaway_candidates = solve(Eq(dK_ds, 0), s)

print("Breakaway/Break-in Point Candidates:")
for candidate in breakaway_candidates:
    print(f"s = {candidate}")

# Verify graphically (real poles at 0 and -2 imply breakaway must reside between them)
print("\nAnalytical match: The breakaway point is exactly at s = -1.")

# %% [markdown]
# ---
# ## Solved Problem 4: Sketch Root Locus
# 
# **Problem Statement:**
# Analyze and sketch the root locus for the normalized equation:
# $$ 1 + \frac{K}{s(s+1)(s+3)} = 0 $$

# %%
print_section("Solved Problem 4: Root Locus Features & Sketch")

# Define Plant
s_ctrl = ctrl.TransferFunction.s
F = 1 / (s_ctrl * (s_ctrl + 1) * (s_ctrl + 3))

poles = ctrl.poles(F)
zeros = ctrl.zeros(F)
n = len(poles)
m = len(zeros)

print(f"Open-loop Poles: {poles}")
print(f"Branches to infinity (n - m): {n - m}")

# Asymptote Centroid and Angles
sigma_a = (np.sum(poles) - np.sum(zeros)) / (n - m)
angles_deg = [(2*k + 1)*180 / (n - m) for k in range(n - m)]
print(f"Asymptote Centroid (sigma_a): {sigma_a:.2f}")
print(f"Asymptote Angles (degrees): {angles_deg}")

# Analytical Breakaway using SymPy
K_expr_sketch = -s * (s + 1) * (s + 3)
dK_ds_sketch = diff(K_expr_sketch, s)
s_candidates = solve(Eq(dK_ds_sketch, 0), s)

print(f"Breakaway candidates (dK/ds = 0): {[complex(c.evalf()) for c in s_candidates]}")
print("Only s ≈ -0.45 is admissible since it lies on the locus segment [-1, 0].")

# Plot using control library
plt.figure(figsize=(10, 8))
ctrl.root_locus(F, plot=True, grid=True, title="Root Locus Sketch")
plt.plot(sigma_a, 0, 'rx', markersize=10, label=f'Centroid: {sigma_a:.2f}')
plt.axvline(x=0, color='k', linestyle='--', alpha=0.5)
plt.axhline(y=0, color='k', linestyle='--', alpha=0.5)
plt.legend()
plt.xlim([-5, 2])
plt.ylim([-3, 3])
plt.show()

# %% [markdown]
# ---
# ## Solved Problem 5: Design for Damping Ratio
# 
# **Problem Statement:**
# For the characteristic equation $\Delta(s,K) = s^2 + 4s + K$, assume a target damping ratio of $\zeta = 0.5$. Find the required gain $K$.

# %%
print_section("Solved Problem 5: Design for Damping Ratio")

# Given characteristic polynomial: s^2 + 4s + K
# Target damping ratio
zeta_target = 0.5

# We know the generic second order characteristic equation is: s^2 + 2*zeta*omega_n*s + omega_n^2
# Equating the 's' coefficients:  4 = 2 * zeta_target * omega_n
omega_n = 4 / (2 * zeta_target)
print(f"Target Damping Ratio (zeta): {zeta_target}")
print(f"Calculated Natural Frequency (omega_n): {omega_n}")

# Equating the constant coefficients: K = omega_n^2
K_req = omega_n**2

print(f"Required Gain (K) to achieve zeta = 0.5 is: {K_req}")

# Validate Roots
Delta_final = s**2 + 4*s + K_req
roots_final = solve(Eq(Delta_final, 0), s)
print(f"Resulting Closed Loop Poles: {roots_final}")

# Check damping angle: cos(theta) = zeta
# theta = cos^-1(0.5) = 60 degrees. Let's check the roots angle:
root_eval = complex(roots_final[0].evalf())
angle = np.degrees(np.angle(root_eval))
# Angle relative to negative real axis
print(f"Root angle from positive real axis: {angle:.2f} degrees")
print(f"Root angle from negative real axis: {180 - np.abs(angle):.2f} degrees (Matches arccos(0.5) = 60!)")
