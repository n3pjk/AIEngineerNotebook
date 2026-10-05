function costFunctionReg(theta, X, y, lambda)
    #COSTFUNCTIONREG Compute cost and gradient for logistic regression with regularization
    #   J = COSTFUNCTIONREG(theta, X, y, lambda) computes the cost of using
    #   theta as the parameter for regularized logistic regression and the
    #   gradient of the cost w.r.t. to the parameters.

    # Initialize some useful values
    m = length(y)

    # Compute the sigmoid
    h_unclipped = sigmoid(X * theta)

    # Clamp the predictions to prevent log(0)
    h = clamp.(h_unclipped, eps(Float64), 1 - eps(Float64))

    # Compute the regularization term
    regularization = sum(abs2, theta[2:end])

    # Compute the regularized cost
    J = -sum(y .* log.(h) .+ (1 .- y) .* log.(1 .- h)) / m +
        lambda * regularization / (2m)

    # Compute the gradient
    grad = X' * (h_unclipped .- y) / m
    grad[2:end] .+= (lambda / m) .* theta[2:end]

    return J, grad
end
