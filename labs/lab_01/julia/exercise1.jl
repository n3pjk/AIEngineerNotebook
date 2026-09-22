# Lab 1
# Exercise 1: Linear Regression
#
#  Instructions
#  ------------
#
#  This file contains code that helps you get started on the
#  linear exercise. You will need to complete the following functions
#  in this exercise:
#
#     warmUpExercise.jl
#     plotData.jl
#     gradientDescent.jl
#     computeCost.jl
#
#  For this exercise, you will not need to change any code in this file,
#  or any other files other than those mentioned above.
#
#  x refers to the population size in 10,000s
#  y refers to the profit in $10,000s
#
using LinearAlgebra
using DelimitedFiles

include("warmUpExercise.jl")
include("plotData.jl")
include("computeCost.jl")
include("gradientDescent.jl")

function pause()
    println("Program paused. Press enter to continue.")
    readline()
end

## ==================== Part 1: Basic Function ====================
# Complete warmUpExercise.m
println("Running warmUpExercise ...")
println("5x5 Identity Matrix: ")
A = warmUpExercise()
display(A)
pause()

## ======================= Part 2: Plotting =======================
println("Plotting Data ...")
data = readdlm("../lab1data1.txt", ',', Float64)
X = data[:, 1]
y = data[:, 2]
plotData(X, y)
pause()

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
