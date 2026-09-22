function computeCostMulti(X, y, theta)
    # COMPUTECOSTMULTI Compute cost for linear regression with multiple variables.
    m = length(y)
    J = (1 / (2 * m)) * ((X * theta .- y)' * (X * theta .- y))
    return J
end
