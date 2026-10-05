function mapFeature(X1::AbstractArray, X2::AbstractArray)
    # MAPFEATURE Feature mapping function to polynomial features
    #
    #   MAPFEATURE(X1, X2) maps the two input features
    #   to quadratic features used in the regularization exercise.
    #
    #   Returns a new feature array with more features, comprising of
    #   X1, X2, X1.^2, X2.^2, X1*X2, X1*X2.^2, etc..
    #
    #   Inputs X1, X2 must be the same size
    #
    size(X1) == size(X2) || throw(ArgumentError("X1 and X2 must have the same size"))

    x1 = vec(X1)
    x2 = vec(X2)
    out = ones(Float64, length(x1), 1)
    degree = 6

    for i in 1:degree
        for j in 0:i
            out = hcat(out, (x1 .^ (i - j)) .* (x2 .^ j))
        end
    end

    return out
end

function mapFeature(x1::Number, x2::Number)
    return mapFeature([x1], [x2])
end
