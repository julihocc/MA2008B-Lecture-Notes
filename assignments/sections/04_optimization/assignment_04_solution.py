import sympy as sp


def section(title: str) -> None:
    print(f"\n{'=' * 84}\n{title}\n{'=' * 84}")


def part_1_first_order_odes() -> None:
    t = sp.Symbol("t", real=True)

    section("Part 1.1: Linear IVP x' + 2x = 4, x(0)=1")
    x_sol = 2 - sp.exp(-2 * t)
    residual = sp.simplify(sp.diff(x_sol, t) + 2 * x_sol - 4)
    print("ODE: x' + 2x = 4, x(0)=1")
    print(f"Closed-form solution: x(t) = {x_sol}")
    print(f"Residual check x' + 2x - 4 = {residual}")
    print(f"Initial condition check x(0) = {sp.simplify(x_sol.subs(t, 0))}")

    section("Part 1.2: Logistic IVP x' = r x (1 - x/K), x(0)=x0")
    r, K, x0 = sp.symbols("r K x0", positive=True, real=True)
    logistic = K / (1 + ((K - x0) / x0) * sp.exp(-r * t))
    print("Closed form:")
    print(f"x(t) = {sp.simplify(logistic)}")

    section("Part 1.3: Bifurcation for x' = lambda x - x^3")
    lam, xs = sp.symbols("lam xs", real=True)
    f = lam * xs - xs**3
    dfdx = sp.diff(f, xs)
    eq = sp.solve(sp.Eq(f, 0), xs)
    print(f"f(x,lambda) = {f}")
    print(f"Equilibria: {eq}")
    print(f"f'(x) = {dfdx}")


def part_2_linear_systems() -> None:
    t = sp.Symbol("t", real=True)

    section("Part 2.1: Diagonal system e^(A t) and x(t)")
    A1 = sp.Matrix([[3, 0], [0, -1]])
    x01 = sp.Matrix([2, -1])
    Phi1 = sp.simplify(sp.exp(A1 * t))
    x1 = sp.simplify(Phi1 * x01)
    print(f"A =\n{A1}")
    print(f"Phi(t)=e^(At)=\n{Phi1}")
    print(f"x(t)=\n{x1}")

    section("Part 2.2: State transition for A=[[0,1],[-2,-3]]")
    A2 = sp.Matrix([[0, 1], [-2, -3]])
    Phi2 = sp.simplify(sp.exp(A2 * t))
    check = sp.simplify(sp.diff(Phi2, t) - A2 * Phi2)
    print(f"A =\n{A2}")
    print(f"Phi(t)=\n{Phi2}")
    print(f"Check Phi'(t) - A Phi(t) =\n{check}")
    print(f"Check Phi(0)=\n{Phi2.subs(t, 0)}")

    section("Part 2.3: Infinity norm growth bound")
    A3 = sp.Matrix([[1, 2], [0, -1]])
    norm_inf = A3.norm(sp.oo)
    print(f"A =\n{A3}")
    print(f"||A||_inf = {norm_inf}")
    print("Bound: ||x(t)||_inf <= exp(||A||_inf * t) ||x(0)||_inf")


def part_3_autonomous_systems() -> None:
    x, y = sp.symbols("x y", real=True)

    section("Part 3.1: Classification for x' = y, y' = -x - 0.2y")
    A = sp.Matrix([[0, 1], [-1, -sp.Rational(1, 5)]])
    print(f"Jacobian matrix:\n{A}")
    print(f"Eigenvalues: {A.eigenvals()}")

    section("Part 3.2: Linearization for x' = y - x^3, y' = -x - y")
    f1 = y - x**3
    f2 = -x - y
    J = sp.Matrix([[sp.diff(f1, x), sp.diff(f1, y)], [sp.diff(f2, x), sp.diff(f2, y)]])
    J0 = J.subs({x: 0, y: 0})
    print(f"J(x,y)=\n{J}")
    print(f"J(0,0)=\n{J0}")
    print(f"Eigenvalues at origin: {J0.eigenvals()}")

    section("Part 3.3: Bendixson criterion for x' = x + y, y' = -x + 2y")
    P = x + y
    Q = -x + 2 * y
    divergence = sp.Matrix([P, Q]).jacobian([x, y]).trace()
    print(f"P(x,y) = {P}")
    print(f"Q(x,y) = {Q}")
    print(f"div F = {divergence}")
    print("Conclusion: divergence has constant positive sign -> no nontrivial periodic orbits in simply connected regions.")


if __name__ == "__main__":
    part_1_first_order_odes()
    part_2_linear_systems()
    part_3_autonomous_systems()
