# %% [markdown]
# # 4.4 Second-Order Nonlinear Systems
# Computational companion aligned with the current notes:
# - Finding equilibria for 2D autonomous systems
# - Computing the Jacobian matrix and eigenvalues (Hartman-Grobman)
# - Plotting global phase portraits with streamplot

# %%
import sympy as sp
import numpy as np
import matplotlib.pyplot as plt

def print_header(title: str) -> None:
    print(f"\n{'=' * 78}\n{title}\n{'=' * 78}")

# %% [markdown]
# ## Setup

# %%
x, y = sp.symbols("x y", real=True)

# %% [markdown]
# ## Solved Problem: Linearizing a Nonlinear System
# System: 
# x' = x(1 - x - y)
# y' = y(1 - 2x - y/2)

# %%
f_sys = x * (1 - x - y)
g_sys = y * (1 - 2*x - y/2)

# 1. Find Equilibria
eqs = sp.solve([sp.Eq(f_sys, 0), sp.Eq(g_sys, 0)], (x, y))

# 2. Compute Jacobian
J = sp.Matrix([[sp.diff(f_sys, x), sp.diff(f_sys, y)],
               [sp.diff(g_sys, x), sp.diff(g_sys, y)]])

print_header("4.4 Solved: Linearizing a Nonlinear System")
print("System:")
print("x' =", f_sys)
print("y' =", g_sys)
print("\nEquilibria:", eqs)
print("\nJacobian J(x,y) =")
sp.pprint(J)

# 3. Classify Each Equilibrium
print("\n--- Classification ---")
for (eq_x, eq_y) in eqs:
    J_eq = J.subs({x: eq_x, y: eq_y})
    eigs = J_eq.eigenvals()
    print(f"\nAt ({eq_x}, {eq_y}):")
    print("Eigenvalues:", list(eigs.keys()))
    
    # Simple heuristic for classification based on eigenvalues:
    real_parts = [sp.re(val) for val in eigs.keys()]
    if all(r < 0 for r in real_parts):
        print("-> Stable Node/Focus")
    elif all(r > 0 for r in real_parts):
        print("-> Unstable Node/Focus")
    elif any(r > 0 for r in real_parts) and any(r < 0 for r in real_parts):
        print("-> Saddle Point (Unstable)")
    else:
        print("-> Center or inconclusive (zero real part)")

# %% [markdown]
# ## Solved Problem: The Nonlinear Pendulum (Phase Portrait)
# x' = y
# y' = -sin(x)

# %%
print_header("4.4 Solved: The Nonlinear Pendulum Phase Portrait")
print("Generating plot for pendulum...")

# Define the grid
X, Y = np.meshgrid(np.linspace(-8, 8, 400), np.linspace(-4, 4, 400))
U = Y
V = -np.sin(X)

# Plotting
plt.figure(figsize=(10, 5))
plt.title(r"Phase Portrait of the Undamped Pendulum: $x'=y, y'=-\sin(x)$")
plt.streamplot(X, Y, U, V, density=1.5, color='b', linewidth=0.8, arrowsize=1)
plt.xlabel("Angle $x$")
plt.ylabel("Angular Velocity $y$")
plt.grid(True)
plt.axhline(0, color='black', lw=1)
plt.axvline(0, color='black', lw=1)
# Plot the centers and saddles
centers_x = [-2*np.pi, 0, 2*np.pi]
saddles_x = [-np.pi, np.pi]
plt.plot(centers_x, [0, 0, 0], 'go', label="Centers (Stable)")
plt.plot(saddles_x, [0, 0], 'ro', label="Saddles (Unstable)")
plt.legend(loc="upper right")
plt.xlim([-8, 8])
plt.ylim([-4, 4])
# plt.show() # Uncomment to view the plot
print("Plot generated successfully.")
