function [C, sigma] = dataset3Params(X, y, Xval, yval)
%EX6PARAMS returns your choice of C and sigma for Part 3 of the exercise
%where you select the optimal (C, sigma) learning parameters to use for SVM
%with RBF kernel
%   [C, sigma] = EX6PARAMS(X, y, Xval, yval) returns your choice of C and 
%   sigma. You should complete this function to return the optimal C and 
%   sigma based on a cross-validation set.
%

% You need to return the following variables correctly.
C = 1;
sigma = 0.3;

% ====================== YOUR CODE HERE ======================
% Instructions: Fill in this function to return the optimal C and sigma
%               learning parameters found using the cross validation set.
%               You can use svmPredict to predict the labels on the cross
%               validation set. For example, 
%                   predictions = svmPredict(model, Xval);
%               will return the predictions on the cross validation set.
%
%  Note: You can compute the prediction error using 
%        mean(double(predictions ~= yval))
%
M = [0.01; 0.03; 0.1; 0.3; 1; 3; 10; 30];
%M1 = zeros(n, n);
C0 = 0;
sigma0 = 0;
err0 = 100;
for i = 1:8,
  C = M(i);
  for j = 1:8,
    sigma = M(j);
    fprintf(['C = %0.2f, sigma = %0.2f\n'], C, sigma);
    model = svmTrain(X, y, C, @(x1, x2) gaussianKernel(x1, x2, sigma));
    predictions = svmPredict(model, Xval);
%    M1(i,j) = mean(double(predictions ~= yval));
    err = mean(double(predictions ~= yval));
    if (err < err0)
      C0 = C;
      sigma0 = sigma;
      err0 = err;
    endif;
  end;
end;
%[val idx] = max(M1(:));
%[i,j] = ind2sub(size(M1),idx);
%C = M(i);
%sigma = M(j);
C = C0;
sigma = sigma0;
fprintf(['FINAL: C = %0.2f, sigma = %0.2f\n'], C, sigma);



% =========================================================================

end
