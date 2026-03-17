# %% [markdown]
# # 4.5 Advanced Topics in Differential Equations
# Computational companion aligned with the current notes:
# - Verifying a First Integral (Conserved Quantity)
# - Simulating Limit Cycles
# - Numerical Methods: Euler vs Runge-Kutta (RK4)

# %%
import sympy as sp
import numpy as np
import matplotlib.pyplot as plt
from scipy.integrate import solve_ivp

def print_header(title: str) -> None:
    print(f"\n{'=' * 78}\n{title}\n{'=' * 78}")

# %% [markdown]
# ## Setup

# %%
t, x, y = sp.symbols("t x y", real=True)

# %% [markdown]
# ## Solved Problem: Finding a First Integral (Nonlinear Pendulum)

# %%
print_header("4.5 Solved: First Integral of the Pendulum")

f_pend = y
g_pend = -sp.sin(x)
E = 0.5 * y**2 - sp.cos(x)

print("System: x' = y, y' = -sin(x)")
print("Energy Function: E(x,y) =", E)

# dE/dt = dE/dx * x' + dE/dy * y'
dE_dt = sp.diff(E, x) * f_pend + sp.diff(E, y) * g_pend

print("dE/dt along trajectories =", sp.simplify(dE_dt))
print("Since dE/dt = 0, E is a constant of motion (First Integral).")


# %% [markdown]
# ## Solved Problem: Limit Cycle Simulation
# System:
# x' = x - y - x(x^2 + y^2)
# y' = x + y - y(x^2 + y^2)
# (This is r' = r(1-r^2), theta' = 1 in Cartesian coords)

# %%
print_header("4.5 Solved: Stable Limit Cycle")
print("Simulating limit cycle approach using scipy.integrate...")

def limit_cycle_sys(t, state):
    x_val, y_val = state
    r2 = x_val**2 + y_val**2
    dxdt = x_val - y_val - x_val * r2
    dydt = x_val + y_val - y_val * r2
    return [dxdt, dydt]

t_span = (0, 15)
t_eval = np.linspace(t_span[0], t_span[1], 1000)

# Simulate from inside the limit cycle
sol_in = solve_ivp(limit_cycle_sys, t_span, [0.1, 0.0], t_eval=t_eval)
# Simulate from outside the limit cycle
sol_out = solve_ivp(limit_cycle_sys, t_span, [2.0, 0.0], t_eval=t_eval)

plt.figure(figsize=(6, 6))
plt.title("Approach to Stable Limit Cycle (r = 1)")
plt.plot(sol_in.y[0], sol_in.y[1], 'b-', label='From inside (r_0 = 0.1)')
plt.plot(sol_out.y[0], sol_out.y[1], 'r-', label='From outside (r_0 = 2.0)')
# Draw the limit cycle circle
circle = plt.Circle((0, 0), 1, color='k', fill=False, linestyle='--', linewidth=2, label='Limit Cycle r=1')
plt.gca().add_patch(circle)
plt.xlim([-2.5, 2.5])
plt.ylim([-2.5, 2.5])
plt.xlabel("x")
plt.ylabel("y")
plt.legend()
plt.grid(True)
# plt.show() # Uncomment to view the plot
print("Plot generated successfully.")


# %% [markdown]
# ## Supplementary: Numerical Methods (Euler vs RK4)
# System: x' = x + t, x(0) = 1

# %%
print_header("4.5 Supplementary: Euler vs RK4 Numerical Integration")

def f_num(t_val, x_val):
    return x_val + t_val

# Exact Solution: x(t) = 2e^t - t - 1
def x_exact(t_val):
    return 2 * np.exp(t_val) - t_val - 1

h = 0.1
t_steps = np.arange(0, 1.0 + h, h)

# Euler Method
x_euler = np.zeros(len(t_steps))
x_euler[0] = 1.0
for i in range(len(t_steps) - 1):
    x_euler[i+1] = x_euler[i] + h * f_num(t_steps[i], x_euler[i])

# RK4 Method
x_rk4 = np.zeros(len(t_steps))
x_rk4[0] = 1.0
for i in range(len(t_steps) - 1):
    t_n = t_steps[i]
    x_n = x_rk4[i]
    k1 = f_num(t_n, x_n)
    k2 = f_num(t_n + h/2, x_n + h*k1/2)
    k3 = f_num(t_n + h/2, x_n + h*k2/2)
    k4 = f_num(t_n + h, x_n + h*k3)
    x_rk4[i+1] = x_n + (h/6) * (k1 + 2*k2 + 2*k3 + k4)

# Print comparison
print(f"{'Time':<5} | {'Exact':<10} | {'Euler':<10} | {'Euler Err':<12} | {'RK4':<10} | {'RK4 Err':<12}")
print("-" * 75)
for i in range(len(t_steps)):
    t_val = t_steps[i]
    exact = x_exact(t_val)
    eu = x_euler[i]
    rk = x_rk4[i]
    print(f"{t_val:<5.1f} | {exact:<10.5f} | {eu:<10.5f} | {abs(exact-eu):<12.5e} | {rk:<10.5f} | {abs(exact-rk):<12.5e}")
