function gradientDescentMulti(X, y, theta, alpha, num_iters)
    #GRADIENTDESCENTMULTI Performs gradient descent to learn theta
    #   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
    #   taking num_iters gradient steps with learning rate alpha

    # Initialize some useful values
    m = length(y)
    J_history = zeros(Float64, num_iters)

    for iter in 1:num_iters

        # Instructions: Perform a single gradient step on the parameter vector
        #               theta.
        #
        # Hint: While debugging, it can be useful to print out the values
        #       of the cost function (computeCostMulti) and gradient here.
        #
        delta = (X' * (X * theta .- y)) ./ m
        theta = theta .- alpha .* delta









        # ============================================================

        # Save the cost J in every iteration
        J_history[iter] = computeCostMulti(X, y, theta)
    end

    return theta, J_history
end
