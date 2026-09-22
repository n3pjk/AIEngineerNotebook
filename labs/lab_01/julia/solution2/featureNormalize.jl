function featureNormalize(X)
    # FEATURENORMALIZE Normalizes the features in X.
    X_norm = copy(X)
    mu = zeros(Float64, 1, size(X, 2))
    sigma = zeros(Float64, 1, size(X, 2))

    n = size(X, 2)
    for i in 1:n
        mu[i] = mean(X[:, i])
        sigma[i] = std(X[:, i])
        X_norm[:, i] = (X[:, i] .- mu[i]) ./ sigma[i]
    end

    return X_norm, mu, sigma
end
