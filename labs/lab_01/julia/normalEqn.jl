function normalEqn(X, y)
    # NORMALEQN Computes the closed-form solution to linear regression
    # theta = NORMALEQN(X, y) computes the closed-form solution using the normal equations.

    theta = zeros(Float64, size(X, 2), 1)

    # TODO: Complete the code to compute the closed-form solution.
    # theta = (X' * X) \ (X' * y)

    return theta
end
