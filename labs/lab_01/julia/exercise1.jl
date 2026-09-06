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
using Plots

include("warmUpExercise.jl")
include("plotData.jl")
include("computeCost.jl")
include("gradientDescent.jl")
include("utils.jl")

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
m = length(y)
plotData(X, y)
pause()

## =================== Part 3: Gradient Descent ===================
println("Running Gradient Descent ...")
X = [ones(length(y)) data[:, 1]]
theta = zeros(2)
iterations = 1500
alpha = 0.01
println(computeCost(X, y, theta))
theta, J_history = gradientDescent(X, y, theta, alpha, iterations)
println("Theta found by gradient descent: ")
println(theta)

## =================== Part 4: Plot Linear Fit ===================
x_data = X[:, 2]
p = plotData(x_data, y, theta)
pause()

## ===================== Part 5: Predictions =====================
predict1 = dot([1, 3.5], theta)
println("For population = 35,000, we predict a profit of \$$(predict1 * 10000)")
predict2 = dot([1, 7], theta)
println("For population = 70,000, we predict a profit of \$$(predict2 * 10000)")
pause()

## ==================== Part 6: Visualizing J ====================
println("Visualizing J(theta_0, theta_1) ...")
gr() # set the backend for plotting

# Grid over which we will calculate J
theta0_vals = range(-10, 10, length=100)
theta1_vals = range(-1, 4, length=100)

# initialize J_vals to an empty matrix
J_vals = Matrix{Float64}(undef, length(theta0_vals), length(theta1_vals))

# Fill out J_vals
for i in eachindex(theta0_vals)
    for j in eachindex(theta1_vals)
	    t = [theta0_vals[i], theta1_vals[j]]
	    J_vals[i,j] = computeCost(X, y, t);
    end
end

# Plot the 3D surface of J(theta_0, theta_1)
println("Plotting 3D surface of J(theta_0, theta_1) ...")
p = plot(theta1_vals, theta0_vals, J_vals,
        st=:surface,
        xflip=true,
        ylabel = "\$\\theta_0\$",
        xlabel = "\$\\theta_1\$",
        zlabel = "J(\$\\theta_0\$, \$\\theta_1\$)",
        title = "Surface Plot of J(\$\\theta_0\$, \$\\theta_1\$)")
#savefig(p, "assets/surface.svg") # save plot as SVG file
display(p)
pause()

# Plot the contour of J(theta_0, theta_1)
println("Plotting contour of J(theta_0, theta_1) ...")
p = contour(theta0_vals, theta1_vals, J_vals', # In Plots, z[i, j] corresponds to x[j] and y[i]
        levels=100,
        xlabel = "\$\\theta_0\$",
        ylabel = "\$\\theta_1\$",
        title = "Contour Plot of J(\$\\theta_0\$, \$\\theta_1\$)")
scatter!([theta[1]], [theta[2]],
        color=:red,
        marker=:x,
        markersize=5,
        label="Optimal Theta")
#savefig(p, "assets/contour.svg") # save plot as SVG file
display(p)
pause()