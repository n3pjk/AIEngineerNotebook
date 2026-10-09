# Lab 2
# Exercise 1: Logistic Regression
#
#  Instructions
#  ------------
#
#  This file contains code that helps you get started on the logistic
#  regression lab. You will need to complete the following functions
#  in this exercise:
#
#     sigmoid.m
#     costFunction.m
#     predict.m
#     costFunctionReg.m
#
#  For this exercise, you will not need to change any code in this file,
#  or any other files other than those mentioned above.
#

using DelimitedFiles
using LinearAlgebra
using Optim
using Plots
using Statistics

include("costFunction.jl")
include("plotData.jl")
include("plotDecisionBoundary.jl")
include("predict.jl")
include("sigmoid.jl")
include("utils.jl")

## Load Data
#  The first two columns contains the exam scores and the third column
#  contains the label.
data = readdlm("../lab2data1.txt", ',', Float64)
X = data[:, 1:2]
y = data[:, 3]

## ==================== Part 1: Plotting ====================
#  We start the exercise by first plotting the data to understand the
#  the problem we are working with.

println("Plotting data with + indicating (y = 1) and o indicating (y = 0).")
p = plotData(X, y)
xlabel!(p, "Exam 1 score")
ylabel!(p, "Exam 2 score")
title!(p, "Training data")
savefig(p, "img/student_data.svg")
display(p)
pause()

## ============ Part 2: Compute Cost and Gradient ============
#  In this part of the exercise, you will implement the cost and gradient
#  for logistic regression. You need to complete the code in
#  costFunction.m

#  Setup the data matrix appropriately, and add ones for the intercept term
m, n = size(X)

# Add intercept term to x and X_test
X = hcat(ones(m), X)

# Initialize fitting parameters
initial_theta = zeros(n + 1)

# Compute and display initial cost and gradient
cost, grad = costFunction(initial_theta, X, y)

println("Cost at initial theta (zeros): $cost")
println("Gradient at initial theta (zeros): $grad")
pause()

## ============= Part 3: Optimizing costFunction  =============
#  In this exercise, you will use a built-in function (Optim.optimize) to find
#  the optimal parameters theta.

#  Set options for optimize (at most 400 iterations)
options = Optim.Options(iterations=400)

#  Optim expects a single function that fills in the gradient in place and
#  returns the cost, so wrap costFunction accordingly
fg! = Optim.NLSolversBase.only_fg!() do F, G, t
    J, grad = costFunction(t, X, y)
    if G !== nothing
        G .= grad
    end
    return J
end

#  Run optimize to obtain the optimal theta
#  This function will return theta and the cost
result = optimize(fg!, initial_theta, BFGS(), options)
theta = Optim.minimizer(result)
cost = Optim.minimum(result)
iterations = Optim.iterations(result)

# Print theta to the screen
println("Cost at theta found by optimization: $cost")
println("Iterations: $iterations (converged: $(Optim.converged(result)))")
println("theta: $theta")

# Plot boundary
p = plotDecisionBoundary(theta, X, y)

# Add labels and display
xlabel!(p, "Exam 1 score")
ylabel!(p, "Exam 2 score")
savefig(p, "img/student_boundary.svg")
display(p)
pause()

## ============== Part 4: Predict and Accuracies ==============
#  After learning the parameters, you'll like to use it to predict the outcomes
#  on unseen data. In this part, you will use the logistic regression model
#  to predict the probability that a student with score 45 on exam 1 and
#  score 85 on exam 2 will be admitted.
#
#  Furthermore, you will compute the training and test set accuracies of
#  our model.
#
#  Your task is to complete the code in predict.m

#  Predict probability for a student with score 45 on exam 1
#  and score 85 on exam 2

prob = sigmoid(dot([1.0, 45.0, 85.0], theta))
println("For a student with scores 45 and 85, we predict an admission probability of $prob")

# Compute accuracy on our training set
predictions = predict(theta, X)

println("Train Accuracy: $(mean(predictions .== y) * 100)")
pause()
