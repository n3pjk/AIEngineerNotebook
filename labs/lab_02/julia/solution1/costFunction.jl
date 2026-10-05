function costFunction(theta, X, y)
    #COSTFUNCTION Compute cost and gradient for logistic regression
    #   J = COSTFUNCTION(theta, X, y) computes the cost of using theta as the
    #   parameter for logistic regression and the gradient of the cost
    #   w.r.t. to the parameters.

    # Initialize some useful values
    m = length(y) # number of training examples

    # Clamp the predictions to prevent log(0)
    h = clamp.(sigmoid(X * theta), eps(Float64), 1 - eps(Float64))

    # Compute cost
    J = -sum(y .* log.(h) .+ (1 .- y) .* log.(1 .- h)) / m

    # Compute gradient
    grad = X' * (sigmoid(X * theta) .- y) / m

    return J, grad
end
