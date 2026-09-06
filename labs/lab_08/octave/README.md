# Lab 8 - Anomaly Detection and Recommender Systems - MATLAB/Octave
[[Home](../../../README.md) | [Back](../README.md)]

## Included Files

```tree
lab_08/
├── lab8_movieParams.mat - Parameters provided for debugging
├── lab8_movies.mat - Movie review dataset
├── lab8data1.mat - First example dataset for anomaly detection
├── lab8data2.mat - Second example dataset for anomaly detection
├── README.md - General description of this lab
└── octave/
    ├── solution1
    │   ├── estimateGaussian.m - Completed estimate of Gaussian distribution
    │   │                        parameters using diagonal covariance matrix
    │   └── selectThreshold.m - Completed finding threshold for anomaly detection
    ├── solution2
    │   ├── cofiCostFunc.m - Completed implementation of collaborative filtering cost function
    │   └── exercise2.m - Alternate second exercise using normalized Y
    ├── checkCostFunction.m - Gradient checking for collaborative filtering
    ├── [2] cofiCostFunc.m - Skeleton for implementing collaborative filtering cost function
    ├── computeNumericalGradient.m - Numerically compute gradients
    ├── [1] estimateGaussian.m - Skeleton for estimating Gaussian distribution parameters
    ├── exercise1.m - Octave script that steps you through the first exercise
    ├── exercise2.m - Octave script for the second exercise
    ├── fmincg.m - Function minimization routine (similar to fminunc)
    ├── loadMovieList.m - Loads list of movies into cell array
    ├── multivariateGaussian.m - Compute probability density function of Gaussian distribution
    ├── normalizeRatings.m - Mean normalization for collaborative filtering
    ├── README.md - Octave specific information - THIS FILE
    ├── [1] selectThreshold.m - Skeleton for finding threshold for anomaly detection
    └── visualizeFit.m - 2D plot of a Gaussian distribution and a dataset
```

[[Top](#lab-8---anomaly-detection-and-recommender-systems---matlaboctave) | [Back](../README.md) | [Home](../../../README.md)]