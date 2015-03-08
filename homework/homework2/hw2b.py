
"""
Demonstration module for quadratic interpolation.
Update this docstring to describe your code.
Modified by: ** your name here **
"""


import numpy as np
import matplotlib.pyplot as plt
from numpy.linalg import solve

def quad_interp(xi,yi):
    """
    Quadratic interpolation.  Compute the coefficients of the polynomial
    interpolating the points (xi[i],yi[i]) for i = 0,1,2.
    Returns c, an array containing the coefficients of
      p(x) = c[0] + c[1]*x + c[2]*x**2.

    """

    # check inputs and print error message if not valid:

    error_message = "xi and yi should have type numpy.ndarray"
    assert (type(xi) is np.ndarray) and (type(yi) is np.ndarray), error_message

    error_message = "xi and yi should have length 3"
    assert len(xi)==3 and len(yi)==3, error_message

    # Set up linear system to interpolate through data points:
    A = np.vstack([np.ones(3), xi, xi**2]).T

    ### Fill in this part to compute c ###
    c = solve(A,yi)

    return c


def plot_quad(xi, yi):
    """
    Plot quadratic interpolation. Compute the polynomial and make a plot.
    """
    c = quad_interp(xi, yi)
    x = np.linspace(xi.min() - 1, xi.max() + 1, 1000)
    y = c[0] + c[1]*x + c[2]*x**2

    plt.figure(1)       # open plot figure window
    plt.clf()           # clear figure
    plt.plot(x,y,'b-')  # connect points with a blue line

    # Add data points  (polynomial should go through these points!)
    plt.plot(xi,yi,'ro')   # plot as red circles
    plt.ylim(y.min() - 1, y.max() + 1)         # set limits in y for plot

    plt.title("Data points and interpolating polynomial")

    plt.savefig('quadratic.png')   # save figure as .png file
    
    # return c so that this function has same input/output as quad_interp
    return c

def cubic_interp(xi, yi):
    """
    Cubic interpolation.  Compute the coefficients of the polynomial
    interpolating the points (xi[i],yi[i]) for i = 0,1,2,3.
    Returns c, an array containing the coefficients of
      p(x) = c[0] + c[1]*x + c[2]*x**2 + c[3]*x**3.
    """

    # check inputs and print error message if not valid:

    error_message = "xi and yi should have type numpy.ndarray"
    assert (type(xi) is np.ndarray) and (type(yi) is np.ndarray), error_message

    error_message = "xi and yi should have length 3"
    assert len(xi)==4 and len(yi)==4, error_message

    # Set up linear system to interpolate through data points:
    A = np.vstack([np.ones(4), xi, xi**2, xi**3]).T

    ### Fill in this part to compute c ###
    c = solve(A,yi)

    return c

def plot_cubic(xi, yi):
    """
    Plot quadratic interpolation. Compute the polynomial and make a plot.
    """
    c = cubic_interp(xi, yi)
    x = np.linspace(xi.min() - 1, xi.max() + 1, 1000)
    y = c[0] + c[1]*x + c[2]*x**2 + c[3]*x**3

    plt.figure(1)       # open plot figure window
    plt.clf()           # clear figure
    plt.plot(x,y,'b-')  # connect points with a blue line

    # Add data points  (polynomial should go through these points!)
    plt.plot(xi,yi,'ro')   # plot as red circles
    plt.ylim(y.min() - 1, y.max() + 1)         # set limits in y for plot

    plt.title("Data points and interpolating polynomial")

    plt.savefig('cubic.png')   # save figure as .png file
    
    # return c so that this function has same input/output as quad_interp
    return c


def poly_interp(xi, yi):
    """
    Polynomial interpolation.  Compute the coefficients of the polynomial
    interpolating the points (xi[i],yi[i]) for i = 0,1,2,3..n.
    Returns c, an array containing the coefficients of
      p(x) = c[0] + c[1]*x + c[2]*x**2 + c[3]*x**3...c[n]*x**n.
    """

    # check inputs and print error message if not valid:

    error_message = "xi and yi should have type numpy.ndarray"
    assert (type(xi) is np.ndarray) and (type(yi) is np.ndarray), error_message

    error_message = "xi and yi should have equal length"
    assert len(xi)==len(yi), error_message

    # Set up linear system to interpolate through data points:
    A = np.vstack([xi**j for j in range(len(xi))]).T

    ### Fill in this part to compute c ###
    c = solve(A,yi)

    return c


def plot_poly(xi, yi):
    """
    Plot quadratic interpolation. Compute the polynomial and make a plot.
    """
    c = poly_interp(xi, yi)
    x = np.linspace(xi.min() - 1, xi.max() + 1, 1000)
    n = len(xi)
    y = c[n-1]
    for j in range(n-1, 0, -1):
        y = y*x + c[j-1]

    plt.figure(1)       # open plot figure window
    plt.clf()           # clear figure
    plt.plot(x,y,'b-')  # connect points with a blue line

    # Add data points  (polynomial should go through these points!)
    plt.plot(xi,yi,'ro')   # plot as red circles
    plt.ylim(y.min() - 1, y.max() + 1)         # set limits in y for plot

    plt.title("Data points and interpolating polynomial")

    plt.savefig('poly.png')   # save figure as .png file
    
    # return c so that this function has same input/output as quad_interp
    return c

    
def test_quad1():
    """
    Test code, no return value or exception if test runs properly.
    """
    xi = np.array([-1.,  0.,  2.])
    yi = np.array([ 1., -1.,  7.])
    c = plot_quad(xi,yi)
    c_true = np.array([-1.,  0.,  2.])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)

def test_quad2():
    """
    Test code, no return value or exception if test runs properly.
    """
    xi = np.array([-1.,  1.,  2.])
    yi = np.array([ 0., 4.,  3.])
    c = plot_quad(xi,yi)
    c_true = np.array([3.,  2., -1.])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)


def test_cubic1():
    """
    Test code, no return value or exception if test runs properly.
    """
    xi = np.array([-2., -1., 0., 2.])
    yi = np.array([-1., 0., -1., 15.])
    c = plot_cubic(xi,yi)
    c_true = np.array([-1., 0., 2., 1.])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)


def test_cubic2():
    """
    Test code, no return value or exception if test runs properly.
    """
    xi = np.array([-2, -1.,  1.,  2.])
    yi = np.array([11., 2., 2., -13.])
    c = plot_cubic(xi,yi)
    c_true = np.array([3.,  2., -1., -2])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)


def test_poly1():
    """
    Test code, no return value or exception if test runs properly.
    """
    xi = np.array([-1.,  0.,  2.])
    yi = np.array([ 1., -1.,  7.])
    c = poly_interp(xi,yi)
    c_true = np.array([-1.,  0.,  2.])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)
    xi = np.array([-1.,  1.,  2.])
    yi = np.array([ 0., 4.,  3.])
    c = poly_interp(xi,yi)
    c_true = np.array([3.,  2., -1.])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)
    xi = np.array([-2., -1., 0., 2.])
    yi = np.array([-1., 0., -1., 15.])
    c = poly_interp(xi,yi)
    c_true = np.array([-1., 0., 2., 1.])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)
    xi = np.array([-2, -1.,  1.,  2.])
    yi = np.array([11., 2., 2., -13.])
    c = poly_interp(xi,yi)
    c_true = np.array([3.,  2., -1., -2])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)
    xi = np.array([-3., -2, -1.,  1.,  3.])
    yi = np.array([123., 27., 3., 3., 27.])
    c = poly_interp(xi,yi)
    c_true = np.array([3.,  2., -1., -2, 1])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)
    xi = np.array([-3, -2, -1.,  1.,  2., 3.])
    yi = np.array([-201., -21., 1., 3., 19., 189.])
    c = poly_interp(xi,yi)
    c_true = np.array([3.,  2., -1., -2, 0, 1])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)

def test_poly2():
    xi = np.array([-3, -2, -1.,  1.,  2., 3.])
    yi = np.array([-201., -21., 1., 3., 19., 189.])
    c = plot_poly(xi,yi)
    c_true = np.array([3.,  2., -1., -2, 0, 1])
    print "c =      ", c
    print "c_true = ", c_true
    # test that all elements have small error:
    assert np.allclose(c, c_true), \
        "Incorrect result, c = %s, Expected: c = %s" % (c,c_true)

        
if __name__=="__main__":
    # "main program"
    # the code below is executed only if the module is executed at the command line,
    #    $ python demo2.py
    # or run from within Python, e.g. in IPython with
    #    In[ ]:  run demo2
    # not if the module is imported.
    print "Running test..."
    test_poly2()
