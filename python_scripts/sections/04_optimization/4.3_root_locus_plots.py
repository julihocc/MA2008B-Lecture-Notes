# %% [markdown]
# # Companion Script: 4.3 Root Locus Plots
# 
# This notebook implements the computational solutions for the **Solved Problems** found in Section 4.3 of the MA2008B Lecture Notes: Root Locus Plots.
# 
# We utilize the `control` library to visualize root locus branches, asymptotes, and centroids, and `sympy` to analytically pinpoint features like breakaway points or marginal stability boundaries (imaginary-axis crossings).

# %%
import numpy as np
import sympy as sp
import matplotlib.pyplot as plt
import control as ctrl
from sympy import symbols, Eq, solve, diff

s, K = symbols('s K')

# Helper function to print results nicely
def print_section(title):
    print(f"\n{'='*50}")
    print(f"{title}")
    print(f"{'='*50}")

# Helper to standardize plots
def style_plot(title):
    plt.title(title)
    plt.xlabel('Real Axis')
    plt.ylabel('Imaginary Axis')
    plt.grid(True)
    plt.axvline(x=0, color='k', linestyle='--', alpha=0.5)
    plt.axhline(y=0, color='k', linestyle='--', alpha=0.5)

# %% [markdown]
# ---
# ## Solved Problem 1: Basic Plot Data
# 
# **Problem Statement:**
# For the characteristic equation:
# $$ 1 + \frac{K}{s(s+4)} = 0 $$
# determine the branch count, start/end points, and any finite breakaway point.

# %%
print_section("Solved Problem 1: Basic Plot Data")

# Define Plant F(s) = 1 / (s(s+4))
s_ctrl = ctrl.TransferFunction.s
F1 = 1 / (s_ctrl * (s_ctrl + 4))

poles = ctrl.poles(F1)
zeros = ctrl.zeros(F1)
n = len(poles)
m = len(zeros)

print(f"Open-loop Poles (Start points): {poles}")
print(f"Open-loop Zeros: {zeros}")
print(f"Number of branches (n): {n}")
print(f"Branches ending at infinity (n-m): {n-m}")

# Calculate Analytical Breakaway Point
K_expr1 = -s * (s + 4)
dK_ds1 = diff(K_expr1, s)
breakaway_s = solve(Eq(dK_ds1, 0), s)

print(f"Analytical Breakaway Point (dK/ds = 0): {breakaway_s}")

# Let's verify by plotting the root locus
plt.figure(figsize=(8, 6))
ctrl.root_locus(F1, plot=True, grid=False)
plt.plot(np.real(breakaway_s[0]), 0, 'rx', markersize=10, label=f'Breakaway ({float(np.real(breakaway_s[0])):.1f})')
style_plot("Root Locus: 1 + K / (s(s+4))")
plt.legend()
plt.show()

# %% [markdown]
# ---
# ## Solved Problem 2: Asymptotes and Centroid Calculation
# 
# **Problem Statement:**
# For the system
# $$ 1 + \frac{K(s+1)}{s(s+2)(s+3)} = 0 $$
# compute the asymptote count, asymptote angles, and centroid.

# %%
print_section("Solved Problem 2: Asymptotes and Centroid")

# Define Plant F(s)
F2 = (s_ctrl + 1) / (s_ctrl * (s_ctrl + 2) * (s_ctrl + 3))

poles2 = ctrl.poles(F2)
zeros2 = ctrl.zeros(F2)
n2 = len(poles2)
m2 = len(zeros2)

print(f"Poles: {np.round(poles2, 1)}")
print(f"Zeros: {np.round(zeros2, 1)}")
print(f"Asymptote Count (n - m): {n2 - m2}")

# Calculate Centroid
sigma_a = (np.sum(poles2) - np.sum(zeros2)) / (n2 - m2)

# Calculate Angles
angles_deg = [(2*k + 1)*180 / (n2 - m2) for k in range(n2 - m2)]

print(f"\nCalculated Centroid (sigma_a): {float(np.real(sigma_a)):.2f}")
print(f"Calculated Asymptote Angles: {angles_deg} degrees")

# Let's visualize the asymptotes on the root locus
plt.figure(figsize=(8, 6))
ctrl.root_locus(F2, plot=True, grid=False)
plt.plot(sigma_a, 0, 'rx', markersize=10, label=f'Centroid ({float(np.real(sigma_a)):.2f})')

# Plotting dashed lines for asymptotes
for angle in angles_deg:
    angle_rad = np.radians(angle)
    length = 10
    plt.plot([sigma_a, sigma_a + length*np.cos(angle_rad)], 
             [0, length*np.sin(angle_rad)], 
             'r--', alpha=0.5, label='Asymptote' if angle == angles_deg[0] else None)

style_plot("Root Locus With Asymptotes")
plt.legend()
plt.xlim([-5, 2])
plt.ylim([-5, 5])
plt.show()

# %% [markdown]
# ---
# ## Solved Problem 3: Complete Root-Locus Sketch
# 
# **Problem Statement:**
# Sketch the complete root locus and find all critical features for:
# $$ 1 + \frac{K(s+2)}{s(s+1)(s+4)} = 0 $$

# %%
print_section("Solved Problem 3: Complete Root-Locus Sketch")

# Define Plant F(s)
F3 = (s_ctrl + 2) / (s_ctrl * (s_ctrl + 1) * (s_ctrl + 4))

poles3 = ctrl.poles(F3)
zeros3 = ctrl.zeros(F3)
n3 = len(poles3)
m3 = len(zeros3)

sigma_a3 = (np.sum(poles3) - np.sum(zeros3)) / (n3 - m3)
angles_deg3 = [(2*k + 1)*180 / (n3 - m3) for k in range(n3 - m3)]

print(f"Poles: {np.round(poles3, 1)} | Zeros: {np.round(zeros3, 1)}")
print(f"Centroid: {float(np.real(sigma_a3)):.2f} | Asymptote Angles: {angles_deg3}")

print("\nReal-Axis Segments (Odd Rule):")
print("  Between [0, -1] -> 1 pole to right (Locus exists)")
print("  Between [-1, -2] -> 2 poles to right (Empty)")
print("  Between [-2, -4] -> 3 singularities to right (Locus exists)")

# Breakaway Point Calculation
K_expr3 = -(s * (s + 1) * (s + 4)) / (s + 2)
dK_ds3 = diff(K_expr3, s)

# Using sympy to find the exact numerical roots of the numerator of the derivative
num, den = sp.fraction(sp.cancel(dK_ds3))
breakaway_candidates = solve(num, s)

print("\nAnalytical Breakaway Candidates:")
for candidate in breakaway_candidates:
    val = complex(candidate.evalf())
    valid = "Valid" if (-1 <= np.real(val) <= 0) else "Discarded"
    print(f"s = {val.real:.4f} + {val.imag:.4f}j -> {valid}")

plt.figure(figsize=(10, 8))
ctrl.root_locus(F3, plot=True, grid=False)
plt.plot(sigma_a3, 0, 'rx', markersize=10, label=f'Centroid ({float(np.real(sigma_a3)):.2f})')

# Add asymptotes
for angle in angles_deg3:
    angle_rad = np.radians(angle)
    plt.plot([sigma_a3, sigma_a3 + 10*np.cos(angle_rad)], 
             [0, 10*np.sin(angle_rad)], 
             'r--', alpha=0.5)

style_plot("Complete Root Locus Sketch")
plt.legend()
plt.xlim([-6, 2])
plt.ylim([-5, 5])
plt.show()

# %% [markdown]
# ---
# ## Solved Problem 4: Imaginary-Axis Crossing Parameter
# 
# **Problem Statement:**
# Determine where the root locus exactly crosses the imaginary axis for the characteristic polynomial:
# $$ \Delta(s,K) = s^3 + 7s^2 + 10s + K = 0 $$

# %%
print_section("Solved Problem 4: Imaginary-Axis Crossing (Marginal Stability)")

print("Applying the Routh-Hurwitz Criterion to Delta(s) = s^3 + 7s^2 + 10s + K")
print("Routh Array:")
print(f"s^3: 1        10")
print(f"s^2: 7        K")
print(f"s^1: (70-K)/7")
print(f"s^0: K")

# To find where the locus crosses the jw-axis, we force a complete row of zeros at s^1
# (70 - K) / 7 = 0
K_crit = 70.0
print(f"\nCritical Gain (K) inducing marginal stability: {K_crit}")

# The crossover frequencies come from the auxiliary equation formed by the s^2 row
# 7s^2 + K = 0
aux_eq = Eq(7*s**2 + K_crit, 0)
crossing_points = solve(aux_eq, s)

c0 = complex(crossing_points[0].evalf())
c1 = complex(crossing_points[1].evalf())
print(f"s = {c0.real:.3f} + {c0.imag:.3f}j")
print(f"s = {c1.real:.3f} + {c1.imag:.3f}j")

# Verify graphically
F4 = 1 / (s_ctrl**3 + 7*s_ctrl**2 + 10*s_ctrl)
plt.figure(figsize=(8, 8))
ctrl.root_locus(F4, plot=True, grid=False)
plt.plot([0, 0], [np.sqrt(10), -np.sqrt(10)], 'ro', markersize=8, label='j-omega crossings')
style_plot("Root locus showing Marginal Stability crossings")
plt.legend()
plt.xlim([-8, 2])
plt.ylim([-5, 5])
plt.show()

print("\nThe red dots highlight the exact analytical crossing locations mathematically proven via Routh-Hurwitz.")
