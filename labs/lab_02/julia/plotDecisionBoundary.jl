using Plots

function plotDecisionBoundary(theta, X, y)
    #PLOTDECISIONBOUNDARY Plots the data points X and y into a new figure with
    #the decision boundary defined by theta
    #   PLOTDECISIONBOUNDARY(theta, X,y) plots the data points with + for the
    #   positive examples and o for the negative examples. X is assumed to be
    #   a either
    #   1) Mx3 matrix, where the first column is an all-ones column for the
    #      intercept.
    #   2) MxN, N>3 matrix, where the first column is all-ones

    # Plot Data
    p = plotData(X[:, 2:3], y)

    if size(X, 2) <= 3
        # Only need 2 points to define a line, so choose two endpoints
        plot_x = [minimum(X[:, 2]) - 2, maximum(X[:, 2]) + 2]

        # Calculate the decision boundary line
        plot_y = (-1 ./ theta[3]) .* (theta[2] .* plot_x .+ theta[1])

        # Plot boundary line, adjust limits for better viewing
        plot!(p, plot_x, plot_y; label="Decision boundary")
        xlims!(p, 30, 100)
        ylims!(p, 30, 100)
    else
        # Here is the grid range
        u = range(-1, 1.5; length=50)
        v = range(-1, 1.5; length=50)

        # Evaluate z = theta*x over the grid
        z = [dot(vec(mapFeature(x, y)), theta) for y in v, x in u]

        # Plot z = 0
        contour!(p, u, v, z; levels=[0.0],
                linewidth=2,
                color=:green,
                legend=:topright,       # force legend to upper right
                colorbar=false,         # Suppress the z scale
                label="Decision boundary")
    end

    return p
end
