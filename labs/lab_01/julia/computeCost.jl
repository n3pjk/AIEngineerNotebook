function computeCost(X, y, theta)
    # COMPUTECOST Compute cost for linear regression
    # J = COMPUTECOST(X, y, theta) computes the cost of using theta as the
    # parameter for linear regression to fit the data points in X and y.

    m = length(y)
    J = 0.0

    # TODO: Compute the cost of a particular choice of theta.
    # h = X * theta
    # errors = h - y
    # J = sum(errors .^ 2) / (2 * m)

    return J
end
