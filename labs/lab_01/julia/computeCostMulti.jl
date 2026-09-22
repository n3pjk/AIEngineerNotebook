function computeCostMulti(X, y, theta)
    # COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
    # J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
    # parameter for linear regression to fit the data points in X and y.

    m = length(y)
    J = 0.0

    # TODO: Compute the cost for a particular choice of theta.
    # h = X * theta
    # errors = h - y
    # J = sum(errors .^ 2) / (2 * m)

    return J
end
