function featureNormalize(X)
    # FEATURENORMALIZE Normalizes the features in X
    # FEATURENORMALIZE(X) returns a normalized version of X where the mean value
    # of each feature is 0 and the standard deviation is 1.

    X_norm = copy(X)
    mu = zeros(Float64, 1, size(X, 2))
    sigma = zeros(Float64, 1, size(X, 2))

    # TODO: For each feature dimension, compute the mean and standard deviation,
    # subtract the mean from the dataset, then divide by the standard deviation.
    # X_norm = (X .- mu) ./ sigma

    return X_norm, mu, sigma
end
