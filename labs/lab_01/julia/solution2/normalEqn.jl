function normalEqn(X, y)
    # NORMALEQN Computes the closed-form solution to linear regression.
    theta = zeros(Float64, size(X, 2), 1)
    theta = ((X' * X) \ (X' * y))
    return theta
end
