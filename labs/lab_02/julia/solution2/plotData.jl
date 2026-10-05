using Plots

function plotData(X, y)
    #PLOTDATA Plots the data points X and y into a new figure
    #   PLOTDATA(x,y) plots the data points with + for the positive examples
    #   and o for the negative examples. X is assumed to be a Mx2 matrix.

    # ====================== YOUR CODE HERE ======================
    # Instructions: Plot the positive and negative examples on a
    #               2D plot, first you will want to identify all
    #               the positive and negative examples. Recommend
    #               using the findall function for this. For example
    #                             findall(==(1), y)
    #               can find all the positive results. Next you'll
    #               want to plot these examples separately.
    #

    # Identify positive and negative examples using findall
    pos = findall(==(1), y)
    neg = findall(==(0), y)

    # Create initial plot using positive examples
    p = scatter(
        X[pos, 1],      # x coordinates of positive examples
        X[pos, 2];      # y coordinates of positive examples
        color=:black,
        marker=:cross,
        markersize=7,
        linewidth=2,
        label="Positive examples",
    )
    scatter!(           # Build on existing plot
        p,              # variable to plot on
        X[neg, 1],      # x coordinates of negative examples
        X[neg, 2];      # y coordinates of negative examples
        marker=:circle,
        markercolor=:yellow,
        markerstrokecolor=:black,
        markersize=7,
        label="Negative examples",
    )
    return p
end
