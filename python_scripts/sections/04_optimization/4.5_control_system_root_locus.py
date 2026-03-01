# %% [markdown]
# # Companion Script: 4.5 Control System Root Locus
# 
# This notebook implements the computational solutions for the **Solved Problems** found in Section 4.5 of the MA2008B Lecture Notes: Root Locus of Control Systems.
# 
# We focus heavily here on analytical feasibility, exact compensator pole/zero tuning, and exploring dominant pole approximations vs. faster modes.

# %%
import numpy as np
import sympy as sp
import matplotlib.pyplot as plt
import control as ctrl
from sympy import symbols, Eq, solve

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
# ## Solved Problem 1: Settling-Time Feasibility Check
# 
# **Problem Statement:**
# For the characteristic polynomial $\Delta(s,K) = s(s+4) + K = 0$, determine whether the requirement $t_s = 1 \text{ s}$ (2% criterion) can be met by gain adjustment alone.

# %%
print_section("Solved Problem 1: Settling-Time Feasibility Check")

# Under the 2% criterion: t_s = 4 / (zeta * omega_n)
target_t_s = 1.0

# Re-arranging gives the required real-part location for the dominant poles:
# Re(s_d) = -zeta * omega_n = -4 / t_s
required_real_part = -4 / target_t_s
print(f"Target 2% Settling Time: {target_t_s} sec")
print(f"Required real part of dominant poles (zeta * omega_n): {required_real_part}")

# Analyze the characteristic polynomial roots behavior
# s^2 + 4s + K = 0
# Roots are: s = -2 +/- sqrt(4 - K)
print("\nThe roots of s^2 + 4s + K are s = -2 ± sqrt(4 - K).")
print("This means the minimum (most negative) real part the roots can ever achieve is exactly -2, "
      "which occurs when they become underdamped complex conjugates (K > 4).")
print("They simply travel straight up and down the vertical line Re(s) = -2.")

achievable_t_s = 4 / 2.0
print(f"\nThe fastest achievable settling time with proportional control is approximately: {achievable_t_s} sec.")
print("Conclusion: t_s = 1s is NOT achievable by gain adjustment alone. A compensator is required.")

# %% [markdown]
# ---
# ## Solved Problem 2: Compensator Design
# 
# **Problem Statement:**
# Design a lead compensator $C(s) = \frac{s+z}{s+p}$ for $P(s)=\frac{1}{s(s+1)}$ so that dominant poles are placed at $s_d = -1 \pm j\sqrt{3}$.
# 
# *(This corresponds to $\zeta = 0.5$, $\omega_n = 2$)*.

# %%
print_section("Solved Problem 2: Lead Compensator Design")

# Target root location
s_d = -1 + 1j * np.sqrt(3)
print(f"Target Dominant Pole (s_d): {s_d}")

# 1. Evaluate Angles of Uncompensated Plant
# P(s) = 1 / (s(s+1))
angle_pole_0 = np.degrees(np.angle(s_d - 0))
angle_pole_neg1 = np.degrees(np.angle(s_d - (-1)))

total_plant_angle = - (angle_pole_0 + angle_pole_neg1)
print(f"\nPhase contribution from P(s_d):")
print(f"  Angle from pole at s=0: {angle_pole_0:.2f} deg")
print(f"  Angle from pole at s=-1: {angle_pole_neg1:.2f} deg")
print(f"  Total Plant Phase: {total_plant_angle:.2f} deg")

# The root locus angle condition states the total phase must be -180 degrees
required_compensator_phase = -180 - total_plant_angle
# Make sure it's positive between 0 and 180
while required_compensator_phase < 0: required_compensator_phase += 360
while required_compensator_phase > 360: required_compensator_phase -= 360

print(f"Required Phase Lead from Compensator (phi_req): {required_compensator_phase:.2f} deg")

# 2. Add Compensator Zero/Pole
print("\nStrategy: Place compensator zero directly above the slower plant pole to 'cancel' its drag.")
z = 2
# Therefore, compensator phase is: angle(s_d + z) - angle(s_d + p) = phi_req
angle_zero = np.degrees(np.angle(s_d + z))

# The angle required from the compensator pole
angle_pole = angle_zero - required_compensator_phase
print(f"Chosen Zero: z = {z}")
print(f"Angle from chosen Zero at s_d: {angle_zero:.2f} deg")
print(f"Required Angle from Compensator Pole: {angle_pole:.2f} deg")

# Calculate geometry for pole displacement p on real axis
# tan(theta) = Im(s_d) / (Re(s_d) + p)  -->  Re(s_d) + p = Im(s_d) / tan(theta)
p = 1 + np.sqrt(3) / np.tan(np.radians(angle_pole))
print(f"Calculated required Pole location p: {p:.2f}")

# 3. Calculate Gain K from Magnitude Condition
# | L(s_d) | = 1  -->  K = 1 / | P(s_d) * C'(s_d) |
L_eval = ((s_d + z) / (s_d + p)) * (1 / (s_d * (s_d + 1)))
K_req = 1 / np.abs(L_eval)
print(f"\nMagnitude Condition: K = {K_req:.2f}")

print(f"Final lead compensated system is L(s) = {K_req:.2f} * (s+{z}) / [s(s+1)(s+{p:.2f})]")

# Verification visualization
s_ctrl = ctrl.TransferFunction.s
P = 1 / (s_ctrl * (s_ctrl + 1))
C = K_req * (s_ctrl + z) / (s_ctrl + p)

plt.figure(figsize=(8, 8))
ctrl.root_locus(P*C, plot=True, grid=False)
plt.plot(np.real(s_d), np.imag(s_d), 'r*', markersize=15, label='Target s_d')
style_plot("Root Locus with Lead Compensator")
plt.legend()
plt.xlim([-6, 2])
plt.ylim([-4, 4])
plt.show()


# %% [markdown]
# ---
# ## Solved Problem 3: Dominant-Pole Interpretation
# 
# **Problem Statement:**
# For the open-loop transfer function:
# $$ L(s) = \frac{K}{(s+1)(s+2)(s+20)} $$
# Explain computationally why the pole pair near $-1$ and $-2$ is treated as dominant during preliminary compensator designs, while the pole at $-20$ is often ignored.

# %%
print_section("Solved Problem 3: Dominant-Pole Interpretation")

# Calculate the time constants (tau = 1 / abs(real_part)) of the respective modal decay terms
tau_pole_1 = 1 / 1.0
tau_pole_2 = 1 / 2.0
tau_pole_20 = 1 / 20.0

print(f"Modal Decay envelopes in Time Domain (e^(-at)):")
print(f"  Pole at s=-1  -> tau = {tau_pole_1:.2f} sec  (Settles in ~{4*tau_pole_1:.2f}s)")
print(f"  Pole at s=-2  -> tau = {tau_pole_2:.2f} sec  (Settles in ~{4*tau_pole_2:.2f}s)")
print(f"  Pole at s=-20 -> tau = {tau_pole_20:.2f} sec (Settles in ~{4*tau_pole_20:.2f}s)")

print("\nInsight: Because the pole at -20 decays an order of magnitude faster than the others, ")
print("its transient effect is essentially instantaneous. By the time the system reaches its maximum ")
print("overshoot or begins settling into its steady state, the e^(-20t) term has completely vanished.")

# Let's plot the step response with and without that pole to prove it visually
P_full = 1 / ((s_ctrl + 1) * (s_ctrl + 2) * (s_ctrl + 20))
# The truncated system must maintain the same DC gain to compare transient geometry fairly
# DC gain of P_full is 1 / (1*2*20) = 1/40.
# DC gain of P_trunc is 1 / (1*2) = 1/2. We scale P_trunc by 1/20 to match DC gains.
P_trunc = (1/20) / ((s_ctrl + 1) * (s_ctrl + 2))

# We use a relatively high proportional gain K to close the loop
K_val = 100
T = np.linspace(0, 5, 500)
_, y_full = ctrl.step_response(ctrl.feedback(K_val * P_full), T)
_, y_trunc = ctrl.step_response(ctrl.feedback(K_val * P_trunc), T)

plt.figure(figsize=(10, 6))
plt.plot(T, y_full, label='Full System (Includes s=-20)', linewidth=2)
plt.plot(T, y_trunc, label='Truncated System (Dominant Pair Only)', linestyle='--', linewidth=2)
style_plot("Step Response: Dominant Pole Validity")
plt.legend()
plt.show()
print("As seen in the plot, substituting out the fast pole results in an almost identical transient envelope.")
