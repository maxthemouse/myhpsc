"""
Homework 3
Solve the intersections of the functions g1(x) = xcos(pix) and
g2(x) = 1 - 0.6x^2. Returns the roots and creates a plot.
"""


from newton import solve
import numpy as np
import matplotlib.pyplot as plt


def fvals(x):
    """
    Return f(x) and f'(x)
    """
    g1 = x * np.cos(np.pi * x)
    g2 = 1 - 0.6 * x ** 2
    f = g1 - g2
    fprime = (1.20000000000000 * x + np.cos(np.pi * x) -
              np.pi * x * np.sin(np.pi * x))
    return f, fprime


def g1(x):
    return x * np.cos(np.pi * x)


def g2(x):
    return 1 - 0.6 * x ** 2


def main():
    # solve for the four intersections
    guesses = [-2.18, -1.6, -0.8, 1.45]
    solutions = []
    for guess in guesses:
        s, k = solve(fvals, guess)
        solutions.append(s)
        print "With initial guess x0 = %22.15e," % guess
        print "     solve returns x = %22.15e after %d iterations" % (s, k)
    # create plot
    values = [g1(x) for x in solutions]
    x = np.linspace(-5.0, 5.0, 500)
    g1_y = g1(x)
    g2_y = g2(x)
    plt.figure(1)       # open plot figure window
    plt.clf()           # clear figure
    plt.plot(x, g1_y, 'b-', label='g1')
    plt.plot(x, g2_y, 'r-', label='g2')
    plt.legend()
    plt.plot(solutions, values, 'ko')
    plt.savefig('intersections.png')


if __name__ == "__main__":
    main()
