function plotData(x, y)
    # PLOTDATA Plots the data points x and y into a new figure.
    figure()
    plot(x, y, "rx", markersize=4)
    ylabel("Profit in \$10,000s")
    xlabel("Population of City in 10,000s")
    legend(loc="southeast")
end
