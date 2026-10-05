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

    p = scatter()
    scatter!(p)









# =========================================================================

    return p
end
