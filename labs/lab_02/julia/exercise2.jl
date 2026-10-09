# Lab 2
# Exercise 2: Logistic Regression with Regularization
#
#  Instructions
#  ------------
#
#  This file contains code that helps you get started on the second part
#  of the lab which covers regularization with logistic regression.
#
#  You will need to complete the following functions in this exericse:
#
#     sigmoid.jl
#     costFunction.jl
#     predict.jl
#     costFunctionReg.jl
#
#  For this exercise, you will not need to change any code in this file,
#  or any other files other than those mentioned above.
#

using DelimitedFiles
using LinearAlgebra
using Optim
using Plots
using Statistics

include("costFunctionReg.jl")
include("mapFeature.jl")
include("plotData.jl")
include("plotDecisionBoundary.jl")
include("predict.jl")
include("sigmoid.jl")
include("utils.jl")

## Load Data
#  The first two columns contains the X values and the third column
#  contains the label (y).
data = readdlm("../lab2data2.txt", ',', Float64)
X = data[:, 1:2]
y = data[:, 3]

#  As in the first exercise, we plot the data to visualize the problem we are
#  dealing with.
p = plotData(X, y)

# Put some labels on
xlabel!(p, "Microchip Test 1")
ylabel!(p, "Microchip Test 2")
title!(p, "Microchip test data")
savefig(p, "img/chip_data.svg")
display(p)

## =========== Part 1: Regularized Logistic Regression ============
#  In this part, you are given a dataset with data points that are not
#  linearly separable. However, you would still like to use logistic
#  regression to classify the data points.
#
#  To do so, you introduce more features to use -- in particular, you add
#  polynomial features to our data matrix (similar to polynomial
#  regression).
#

# Add Polynomial Features

# Note that mapFeature also adds a column of ones for us, so the intercept
# term is handled
X = mapFeature(X[:, 1], X[:, 2])

# Initialize fitting parameters
initial_theta = zeros(size(X, 2))

# Set regularization parameter lambda to 1
# Try varying values of lambda from 100 down to 0.01 to see how the decision
# boundary varies
lambda = 1.0

# Compute and display initial cost and gradient for regularized logistic
# regression
cost, grad = costFunctionReg(initial_theta, X, y, lambda)

println("Cost at initial theta (zeros): $cost")
pause()

## ============= Part 2: Regularization and Accuracies =============
#  Optional Exercise:
#  In this part, you will get to try different values of lambda and
#  see how regularization affects the decision boundary
#
#  Try the following values of lambda (0, 1, 10, 100).
#
#  How does the decision boundary change when you vary lambda? How does
#  the training set accuracy vary?
#

# Set regularization parameter lambda to 1 for a moderate level of regularization.
# 0 will result in no regularization, causing the model to potentially overfit
# the data. Larger values of lambda will result in more regularization, potentially
# underfitting the data.
lambda = [0.0, 1.0, 10.0, 100.0]

#file = ["img/overfitting.svg", "img/chip_boundary.svg", "img/underfitting.svg"]
#  Set options for optimize (at most 400 iterations)
options = Optim.Options(iterations=400)
p = Vector{Plots.Plot{Plots.GRBackend}}(undef, length(lambda))
for i in 1:length(lambda)
    global p, X, y, initial_theta, file, lambda, options
    local fg!, result, theta, cost

    # Optim expects a single function that fills in the gradient in place and
    # returns the cost
    fg! = Optim.NLSolversBase.only_fg!() do F, G, t
        J, grad = costFunctionReg(t, X, y, lambda[i])
        if G !== nothing
            G .= grad
        end
        return J
    end

    # Optimize (at most 400 iterations)
    result = optimize(fg!, initial_theta, BFGS(), options)
    theta = Optim.minimizer(result)
    cost = Optim.minimum(result)
    println("Iterations: $(Optim.iterations(result)) (converged: $(Optim.converged(result)))")
    println("Cost at lambda = $(lambda[i]): $cost")

    # Plot boundary
    p[i] = plotDecisionBoundary(theta, X, y)

    # Add title and labels
    title!(p[i], "lambda = $(lambda[i])")
    xlabel!(p[i], "Microchip Test 1")
    ylabel!(p[i], "Microchip Test 2")
    #savefig(p[i], file[i])
    display(p[i])

    # Compute accuracy on our training set
    predictions = predict(theta, X)
    println("Train Accuracy: $(mean(predictions .== y) * 100)")
    pause()
    i = i + 1
end
