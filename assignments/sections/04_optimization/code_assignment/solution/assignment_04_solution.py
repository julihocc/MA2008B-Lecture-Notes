# %% [markdown]
# # Assignment 04 Solution
# Section 4: Differential Equations and Dynamical Systems

# %%
import sympy as sp


def section(title: str) -> None:
    print(f"\n{'=' * 84}\n{title}\n{'=' * 84}")


# %% [markdown]
# ## Part 1: First-Order Differential Equations

# %%
t = sp.Symbol("t", real=True)

section("Part 1.1: Linear IVP x' + 2x = 4, x(0)=1")
x_sol = 2 - sp.exp(-2 * t)
residual = sp.simplify(sp.diff(x_sol, t) + 2 * x_sol - 4)
print("ODE: x' + 2x = 4, x(0)=1")
print(f"Closed-form solution: x(t) = {x_sol}")
print(f"Residual check x' + 2x - 4 = {residual}")
print(f"Initial condition check x(0) = {sp.simplify(x_sol.subs(t, 0))}")

# %%
section("Part 1.2: Logistic IVP x' = r x (1 - x/K), x(0)=x0")
r, K, x0 = sp.symbols("r K x0", positive=True, real=True)
logistic = K / (1 + ((K - x0) / x0) * sp.exp(-r * t))
print("Closed form:")
print(f"x(t) = {sp.simplify(logistic)}")

# %%
section("Part 1.3: Bifurcation for x' = lambda x - x^3")
lam, xs = sp.symbols("lam xs", real=True)
f = lam * xs - xs**3
dfdx = sp.diff(f, xs)
eq = sp.solve(sp.Eq(f, 0), xs)
print(f"f(x,lambda) = {f}")
print(f"Equilibria: {eq}")
print(f"f'(x) = {dfdx}")


# %% [markdown]
# ## Part 2: Linear Systems

# %%
t = sp.Symbol("t", real=True)
section("Part 2.1: Diagonal system e^(A t) and x(t)")
A1 = sp.Matrix([[3, 0], [0, -1]])
x01 = sp.Matrix([2, -1])
Phi1 = sp.simplify(sp.exp(A1 * t))
x1 = sp.simplify(Phi1 * x01)
print(f"A =\n{A1}")
print(f"Phi(t)=e^(At)=\n{Phi1}")
print(f"x(t)=\n{x1}")

# %%
section("Part 2.2: State transition for A=[[0,1],[-2,-3]]")
A2 = sp.Matrix([[0, 1], [-2, -3]])
Phi2 = sp.simplify(sp.exp(A2 * t))
check = sp.simplify(sp.diff(Phi2, t) - A2 * Phi2)
print(f"A =\n{A2}")
print(f"Phi(t)=\n{Phi2}")
print(f"Check Phi'(t) - A Phi(t) =\n{check}")
print(f"Check Phi(0)=\n{Phi2.subs(t, 0)}")

# %%
section("Part 2.3: Infinity norm growth bound")
A3 = sp.Matrix([[1, 2], [0, -1]])
norm_inf = A3.norm(sp.oo)
print(f"A =\n{A3}")
print(f"||A||_inf = {norm_inf}")
print("Bound: ||x(t)||_inf <= exp(||A||_inf * t) ||x(0)||_inf")


# %% [markdown]
# ## Part 3: Time-Dependent Linear Systems

# %%
s = sp.Symbol("s", real=True)
section("Part 3.1: Fundamental Matrix for A(t)=[[2t,0],[0,-3]]")
Phi_fund = sp.Matrix([[sp.exp(t**2), 0], [0, sp.exp(-3*t)]])
det_Phi = sp.simplify(Phi_fund.det())
print(f"Phi(t) =\n{Phi_fund}")
print(f"det(Phi(t)) = {det_Phi} (never zero)")

# %%
section("Part 3.2: Transition Matrix for A(t)=[[0,0],[0,t]]")
Phi_s2 = sp.Matrix([[1, 0], [0, sp.exp(t**2 / 2)]])
Phi_ts2 = sp.simplify(Phi_s2 * Phi_s2.subs(t, s).inv())
x_s2 = sp.Matrix([1, -1])
x_t2 = sp.simplify(Phi_ts2 * x_s2)
print(f"Phi(t,s) =\n{Phi_ts2}")
print(f"x(t) for x(s)=[1, -1]^T =\n{x_t2}")

# %%
section("Part 3.3: Growth Bound for ||A(t)||_2 <= 0.6")
M = sp.Rational(3, 5)  # 0.6
x0_norm2 = 4
bound2 = sp.simplify(x0_norm2 * sp.exp(M * t))
# Verify at t=5
bound_t5 = bound2.subs(t, 5)
print("Bound: ||x(t)||_2 <= exp(0.6 * t) * ||x(0)||_2")
print(f"||x(t)||_2 <= {bound2}")
print(f"At t=5, ||x(5)||_2 <= {bound_t5.evalf():.4f} (exact: {bound_t5})")
