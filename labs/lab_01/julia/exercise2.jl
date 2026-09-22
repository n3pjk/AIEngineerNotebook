# Lab 1
# Exercise 2: Linear regression with multiple variables

println("Loading data ...")

# data = readdlm("../lab1data2.txt")
# X = data[:, 1:2]
# y = data[:, 3]
# m = length(y)
# println("First 10 examples from the dataset: ")
# println(X[1:10, :], " ", y[1:10])

println("Normalizing Features ...")

# X_norm, mu, sigma = featureNormalize(X)
# X = [ones(m) X_norm]

println("Running gradient descent ...")

# alpha = 0.01
# num_iters = 400
# theta = zeros(3)
# theta, J_history = gradientDescentMulti(X, y, theta, alpha, num_iters)
# plot(1:length(J_history), J_history, linewidth=2, color=:blue)
# xlabel("Number of iterations")
# ylabel("Cost J")
# println("Theta computed from gradient descent: ")
# println(theta)

# price = 0.0
# println("Predicted price of a 1650 sq-ft, 3 br house (using gradient descent):\n$", price)

println("Solving with normal equations...")

# data = readdlm("../lab1data2.txt")
# X = data[:, 1:2]
# y = data[:, 3]
# X = [ones(m) X]
# theta = normalEqn(X, y)
# println("Theta computed from the normal equations: ")
# println(theta)

# price = 0.0
# println("Predicted price of a 1650 sq-ft, 3 br house (using normal equations):\n$", price)
