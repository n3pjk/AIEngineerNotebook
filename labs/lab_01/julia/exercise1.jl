# Lab 1
# Exercise 1: Linear Regression

println("Running warmUpExercise ...")
println("5x5 Identity Matrix: ")
A = warmUpExercise()
println(A)

println("Program paused. Press enter to continue.")
println("Plotting Data ...")

# data = readdlm("../lab1data1.txt")
# X = data[:, 1]
# y = data[:, 2]
# plotData(X, y)

println("Running Gradient Descent ...")

# X = [ones(length(y)) data[:, 1]]
# theta = zeros(2)
# iterations = 1500
# alpha = 0.01
# println(computeCost(X, y, theta))
# theta = gradientDescent(X, y, theta, alpha, iterations)
# println("Theta found by gradient descent: ")
# println(theta)

# predict1 = [1, 3.5] * theta
# println("For population = 35,000, we predict a profit of ", predict1 * 10000)
# predict2 = [1, 7] * theta
# println("For population = 70,000, we predict a profit of ", predict2 * 10000)

println("Visualizing J(theta_0, theta_1) ...")
