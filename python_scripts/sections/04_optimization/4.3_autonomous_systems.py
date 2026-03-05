import sympy as sp


def print_header(title: str) -> None:
    print(f"\n{'=' * 72}\n{title}\n{'=' * 72}")


def run_solved_problems() -> None:
    x, y, lam = sp.symbols("x y lam", real=True)

    print_header("4.3 Solved Problem: Phase-Plane Classification")
    A = sp.Matrix([[0, 1], [-1, -sp.Rational(1, 5)]])
    eigvals_A = A.eigenvals()
    print(f"A =\n{A}")
    print(f"Eigenvalues: {eigvals_A}")

    print_header("4.3 Solved Problem: Linearization of a Nonlinear System")
    f1 = y - x**3
    f2 = -x - y
    J = sp.Matrix([[sp.diff(f1, x), sp.diff(f1, y)], [sp.diff(f2, x), sp.diff(f2, y)]])
    J0 = J.subs({x: 0, y: 0})
    print(f"Jacobian J(x,y) =\n{J}")
    print(f"J(0,0) =\n{J0}")
    print(f"Eigenvalues at origin: {J0.eigenvals()}")

    print_header("4.3 Solved Problem: Bendixson Criterion")
    P = x + y
    Q = -x + 2 * y
    divergence = sp.diff(P, x) + sp.diff(Q, y)
    print(f"P(x,y) = {P}")
    print(f"Q(x,y) = {Q}")
    print(f"div F = dP/dx + dQ/dy = {divergence}")


def run_supplementary_problems() -> None:
    x, y = sp.symbols("x y", real=True)

    print_header("4.3 Supplementary Template: Nullcline Computation")
    f = x - y**2
    g = x**2 - y
    nullcline_x = sp.solve(sp.Eq(f, 0), y)
    nullcline_y = sp.solve(sp.Eq(g, 0), y)
    print(f"x' = {f}, y' = {g}")
    print(f"x'-nullclines (y as function of x): {nullcline_x}")
    print(f"y'-nullclines (y as function of x): {nullcline_y}")


if __name__ == "__main__":
    run_solved_problems()
    run_supplementary_problems()
