using Plots

function plotData(x, y)
    #PLOTDATA Plots the data points x and y into a new figure
    #   PLOTDATA(x,y) plots the data points and gives the figure axes labels of
    #   population and profit.

    # ====================== YOUR CODE HERE ======================
    # Instructions: Plot the training data into a figure using the
    #               "scatter" and "display" functions. Set the axes
    #               labels using the "xlabel" and "ylabel" parameters.
    #               Assume the population and revenue data have been
    #               passed in as the x and y arguments of this function.

    p = scatter(x, y,                                   # data to plot
                marker = (:xcross, 5, 5, :red),       # marker style
                label="Training Data",                  # label for the legend
                title="Scatter plot of training data",  # title of the plot
                xlabel="Population of City in 10,000s", # x-axis label
                ylabel="Profit in \$10,000s")           # y-axis label
    #savefig(p, "assets/training_data.svg")             # save plot as SVG file
    display(p)                                          # display plot in the notebook or REPL

    # ============================================================

end
