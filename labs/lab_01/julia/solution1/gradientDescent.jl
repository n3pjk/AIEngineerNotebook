function gradientDescent(X, y, theta, alpha, num_iters)
    # GRADIENTDESCENT Performs gradient descent to learn theta.
    m = length(y)
    J_history = zeros(Float64, num_iters)

    for iter in 1:num_iters
        delta = (X' * (X * theta .- y)) ./ m
        theta = theta .- alpha .* delta
        J_history[iter] = computeCost(X, y, theta)
    end

    return theta, J_history
end
