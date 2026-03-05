# %% [markdown]
# # 4.2 Linear Systems
# Matrix exponential, state transition, and induced norm computations.

# %%
import sympy as sp


def print_header(title: str) -> None:
    print(f"\n{'=' * 72}\n{title}\n{'=' * 72}")


# %% [markdown]
# ## Solved Problem: Matrix Exponential for a Diagonal System

# %%
t = sp.Symbol("t", real=True)
A_diag = sp.Matrix([[3, 0], [0, -1]])
x0_diag = sp.Matrix([2, -1])
phi_diag = sp.exp(A_diag * t)
x_diag = sp.simplify(phi_diag * x0_diag)

print_header("4.2 Solved Problem: Matrix Exponential for a Diagonal System")
print(f"e^(At) =\n{phi_diag}")
print(f"x(t) =\n{x_diag}")


# %% [markdown]
# ## Solved Problem: State Transition with Constant Matrix

# %%
A = sp.Matrix([[0, 1], [-2, -3]])
phi = sp.simplify(sp.exp(A * t))

print_header("4.2 Solved Problem: State Transition with Constant Matrix")
print(f"A =\n{A}")
print(f"e^(At) =\n{phi}")
print(f"Check Phi'(t)-A*Phi(t) =\n{sp.simplify(sp.diff(phi, t) - A*phi)}")


# %% [markdown]
# ## Solved Problem: Infinity-Norm Growth Estimate

# %%
A_inf = sp.Matrix([[1, 2], [0, -1]])
norm_inf = A_inf.norm(sp.oo)

print_header("4.2 Solved Problem: Infinity-Norm Growth Estimate")
print(f"A =\n{A_inf}")
print(f"||A||_inf = {norm_inf}")
print("Bound: ||x(t)||_inf <= exp(||A||_inf * t) ||x(0)||_inf")


# %% [markdown]
# ## Supplementary Template

# %%
A_sup = sp.Matrix([[4, 1], [0, 2]])
print_header("4.2 Supplementary Template: Matrix Exponential by Diagonalization")
print(f"A =\n{A_sup}")
print(f"e^(At) =\n{sp.simplify(sp.exp(A_sup * t))}")
