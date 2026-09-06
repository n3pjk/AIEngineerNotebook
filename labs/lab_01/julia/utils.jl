
function pause()
    println("Program paused. Press enter to continue.")
    readline()
end

# Define the percent deviation function
function percent_deviation(exp, acc)
    if acc == 0
        return 0.0
    end
    return abs(exp - acc) / acc * 100
end
