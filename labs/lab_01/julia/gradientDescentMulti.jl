function gradientDescentMulti(X, y, theta, alpha, num_iters)
    # GRADIENTDESCENTMULTI Performs gradient descent to learn theta
    # theta = GRADIENTDESCENTMULTI(X, y, theta, alpha, num_iters) updates theta by
    # taking num_iters gradient steps with learning rate alpha.

    m = length(y)
    J_history = zeros(Float64, num_iters)

    for iter in 1:num_iters
        # TODO: Perform a single gradient step on the parameter vector theta.
        # h = X * theta
        # gradients = (X' * (h - y)) / m
        # theta = theta .- alpha .* gradients

        J_history[iter] = computeCostMulti(X, y, theta)
    end

    return theta, J_history
end
