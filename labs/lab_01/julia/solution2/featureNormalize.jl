function featureNormalize(X)
    # FEATURENORMALIZE Normalizes the features in X
    # FEATURENORMALIZE(X) returns a normalized version of X where the mean value
    # of each feature is 0 and the standard deviation is 1. This is often a good preprocessing step to do when
    # working with learning algorithms.

    # You need to set these values correctly
    X_norm = copy(X)
    mu = zeros(Float64, 1, size(X, 2))
    sigma = zeros(Float64, 1, size(X, 2))

    # ====================== YOUR CODE HERE ======================
    # Instructions: First, for each feature dimension, compute the mean
    #          of the feature and subtract it from the dataset,
    #          storing the mean value in mu. Next, compute the
    #          standard deviation of each feature and divide
    #          each feature by it's standard deviation, storing
    #          the standard deviation in sigma.
    #
    #          Note that X is a matrix where each column is a
    #          feature and each row is an example. You need
    #          to perform the normalization separately for
    #          each feature.
    #
    # Hint: You might find the 'mean' and 'std' functions useful.
    #

    # Compute the mean of each feature
    mu = mean(X_norm, dims=1)

    # Subtract the mean from each feature
    X_norm = X_norm .- mu

    # Compute the standard deviation of each feature
    sigma = std(X_norm, dims=1)

    # Divide each feature by its standard deviation
    X_norm = X_norm ./ sigma

    ## Brute force solution (not recommended)
    # The following brute force method is not as efficient and should be
    # avoided in favor of vectorized operations.
    # n = size(X, 2)
    # for i in 1:n
    #     mu[i] = mean(X[:, i])
    #     sigma[i] = std(X[:, i])
    #     X_norm[:, i] = (X[:, i] .- mu[i]) ./ sigma[i]
    # end

    # ============================================================
    return X_norm, mu, sigma
end
