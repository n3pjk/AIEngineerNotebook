## Lab 1
#  Exercise 2: Linear regression with multiple variables
#
#  Instructions
#  ------------
#
#  This file contains code that helps you get started on the
#  linear regression exercise.
#
#  You will need to complete the following functions in this
#  exercise:
#
#     gradientDescentMulti.m
#     computeCostMulti.m
#     featureNormalize.m
#     normalEqn.m
#
#  For this part of the exercise, you will need to change some
#  parts of the code below for various experiments (e.g., changing
#  learning rates).
#
using LinearAlgebra
using Statistics
using StatsBase
using DelimitedFiles
using Plots
using Printf

include("featureNormalize.jl")
include("gradientDescentMulti.jl")
include("computeCostMulti.jl")
include("normalEqn.jl")
include("utils.jl")

## ================ Part 1: Feature Normalization ================
println("Loading data ...")
data = readdlm("../lab1data2.txt", ',', Float64)
X = data[:, 1:2]
y = data[:, 3]
m = length(y)

# Display the first few examples of the dataset
println("First 5 examples of X from the dataset: ")
display(X[1:5, :])
println("First 5 examples of y from the dataset: ")
display(y[1:5])
pause()

println("Normalizing Features ...")
X_norm, mu, sigma = featureNormalize(X)

println("mu = $(mu)")
println("sigma = $(sigma)")

# Add intercept term
X = [ones(m) X_norm]


## ================ Part 2: Gradient Descent ================

# ====================== YOUR CODE HERE ======================
# Instructions: We have provided you with the following starter
#               code that runs gradient descent with a particular
#               learning rate (alpha).
#
#               Your task is to first make sure that your functions -
#               computeCost and gradientDescent already work with
#               this starter code and support multiple variables.
#
#               After that, try running gradient descent with
#               different values of alpha and see which one gives
#               you the best result.
#
#               Finally, you should complete the code at the end
#               to predict the price of a 1650 sq-ft, 3 br house.
#
# Hint: By using the 'hold on' command, you can plot multiple
#       graphs on the same figure.
#
# Hint: At prediction, make sure you do the same feature normalization.
#
println("Running gradient descent ...")

# Choose some alpha value
alpha  = 0.01
num_iters = 400

# Initialize theta and run gradient descent
theta = zeros(3)
theta, J_history = gradientDescentMulti(X, y, theta, alpha, num_iters)

# Plot the convergence of the cost function over the iterations
p = plot(1:length(J_history), J_history,
    linewidth=2,
    color=:blue,
    label="0.01",
    xlabel="Number of iterations",
    ylabel="\$J(\\theta)\$")
#savefig(p, "assets/convergence.svg")
display(p)

println("Theta computed from gradient descent:")
println(theta)
pause()

# Estimate the price of a 1650 sq-ft, 3 br house
# ====================== YOUR CODE HERE ======================
# Recall that the first column of X is all-ones. Thus, it does
# not need to be normalized.
gd_price = 0.0 # You should change this


# ============================================================

@printf("Predicted price of a 1650 sq-ft, 3 br house (using gradient descent):\n\$%.2f\n", gd_price)
pause()

## ================ Part 3: Normal Equations ================

println("Solving with normal equations...")

## ====================== YOUR CODE HERE ======================
# Instructions: The following code computes the closed form
#               solution for linear regression using the normal
#               equations. You should complete the code in
#               normalEqn.m
#
#               After doing so, you should complete this code
#               to predict the price of a 1650 sq-ft, 3 br house.
#

# Load Data
data = readdlm("../lab1data2.txt", ',', Float64)
X = data[:, 1:2]
y = data[:, 3]
m = length(y)

# Add intercept term
X = [ones(m) X]

# Calculate the parameters from the normal equations
theta = normalEqn(X, y)

println("Theta computed from the normal equations:")
println(theta)

# Estimate the price of a 1650 sq-ft, 3 br house
# ====================== YOUR CODE HERE ======================
ne_price = 0.0; # You should change this


# ============================================================

@printf("Predicted price of a 1650 sq-ft, 3 br house (using normal equations):\n\$%.2f\n", ne_price)
@printf("Deviation between prices: %.2f%%\n", percent_deviation(gd_price, ne_price))
pause()
