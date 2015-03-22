# -*- coding: utf-8 -*-


def solve(fvals, x0, debug=False):
    """Newton method to solve for a root
    Input is fvals, a function that returns the values of f(x) and f'(x)
    for any input x, x0, the initial guess, and debug, an optional
    argument with default False. Output is a tuple consisting of
    the final iterate (the approximation to the root determined) and
    the number of iterations taken.
    """
    kmax = 20
    tol = 1.e-14
    x = x0
    if debug:
        print "Initial guess: x = %22.15e." % x0
    for k in range(kmax):
        fx, fxprime = fvals(x)
        if abs(fx) < tol:
            break
        deltax = fx / fxprime
        x = x - deltax
        if debug:
            print "After %s iterations, s = %22.15e." % (k + 1, x)
    return x, k


def fvals_sqrt(x):
    """
    Return f(x) and f'(x) for applying Newton to find a square root.
    """
    f = x**2 - 4.
    fp = 2. * x
    return f, fp


def test1(debug_solve=False):
    """
    Test Newton iteration for the square root with different initial
    conditions.
    """
    for x0 in [1., 2., 100.]:
        print " "  # blank line
        x, iters = solve(fvals_sqrt, x0, debug=debug_solve)
        print "solve returns x = %22.15e after %i iterations " % (x, iters)
        fx, fpx = fvals_sqrt(x)
        print "the value of f(x) is %22.15e" % fx
        assert abs(x - 2.) < 1e-14, "*** Unexpected result: x = %22.15e" % x
