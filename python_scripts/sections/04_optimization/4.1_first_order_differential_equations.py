import sympy as sp


def print_header(title: str) -> None:
    print(f"\n{'=' * 72}\n{title}\n{'=' * 72}")


def run_solved_problems() -> None:
    t, r, K, x0, lam, x = sp.symbols("t r K x0 lam x", positive=True, real=True)

    print_header("4.1 Solved Problem: Linear IVP with Integrating Factor")
    mu = sp.exp(2 * t)
    solution_linear = 2 - sp.exp(-2 * t)
    print(f"Integrating factor mu(t): {mu}")
    print(f"x(t): {solution_linear}")

    print_header("4.1 Solved Problem: Classical Logistic IVP")
    logistic_solution = K / (1 + ((K - x0) / x0) * sp.exp(-r * t))
    print(f"x(t) = {sp.simplify(logistic_solution)}")

    print_header("4.1 Solved Problem: Pitchfork Bifurcation Analysis")
    f = lam * x - x**3
    df = sp.diff(f, x)
    equilibria = sp.solve(sp.Eq(f, 0), x)
    print(f"f(x, lambda) = {f}")
    print(f"Equilibria: {equilibria}")
    print(f"f'(x) = {df}")


def run_supplementary_problems() -> None:
    t = sp.symbols("t", positive=True, real=True)
    x = sp.Function("x")

    print_header("4.1 Supplementary Template: Variable-Coefficient Linear ODE")
    ode = sp.Eq(sp.diff(x(t), t) - x(t) / t, t**2)
    candidate = sp.dsolve(ode, ics={x(1): 0})
    print(f"ODE: {ode}")
    print(f"Solution with x(1)=0: {candidate}")


if __name__ == "__main__":
    run_solved_problems()
    run_supplementary_problems()
