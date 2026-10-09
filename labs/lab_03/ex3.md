Programming Exercise 3: Multi-class Classification and Neural Networks

Machine Learning

# **Introduction**

In this exercise, you will implement one-vs-all logistic regression and neural networks to recognize hand-written digits. Before starting the programming exercise, we strongly recommend watching the video lectures and completing the review questions for the associated topics.

To get started with the exercise, you will need to download the starter code and unzip its contents to the directory where you wish to complete the exercise. If needed, use the `cd` command in Octave/MATLAB to change to this directory before starting this exercise.

You can also find instructions for installing Octave/MATLAB in the “Environment Setup Instructions” of the course website.

## **Files included in this exercise**

`ex3.m` - Octave/MATLAB script that steps you through part 1 `ex3` ~~`n`~~ `n.m` - Octave/MATLAB script that steps you through part 2 `ex3data1.mat` - Training set of hand-written digits

`ex3weights.mat` - Initial weights for the neural network exercise `submit.m` - Submission script that sends your solutions to our servers `displayData.m` - Function to help visualize the dataset

`fmincg.m` - Function minimization routine (similar to fminunc) `sigmoid.m` - Sigmoid function

- `[` _⋆_ `] lrCostFunction.m` - Logistic regression cost function

- `[` _⋆_ `] oneVsAll.m` - Train a one-vs-all multi-class classifier

- `[` _⋆_ `] predictOneVsAll.m` - Predict using a one-vs-all multi-class classifier

- `[` _⋆_ `] predict.m` - Neural network prediction function

- _⋆_ indicates files you will need to complete

Throughout the exercise, you will be using the scripts `ex3.m` and `ex3 nn.m` . These scripts set up the dataset for the problems and make calls to functions that you will write. You do not need to modify these scripts. You are only required to modify functions in other files, by following the instructions in this assignment.

## **Where to get help**

The exercises in this course use Octave<sup>1</sup> or MATLAB, a high-level programming language well-suited for numerical computations. If you do not have Octave or MATLAB installed, please refer to the installation instructions in the “Environment Setup Instructions” of the course website.

At the Octave/MATLAB command line, typing `help` followed by a function name displays documentation for a built-in function. For example, `help plot` will bring up help information for plotting. Further documentation for Octave functions can be found at the Octave documentation pages. MATLAB documentation can be found at the MATLAB documentation pages.

We also strongly encourage using the online **Discussions** to discuss exercises with other students. However, do not look at any source code written by others or share your source code with others.

# **1 Multi-class Classification**

For this exercise, you will use logistic regression and neural networks to recognize handwritten digits (from 0 to 9). Automated handwritten digit recognition is widely used today - from recognizing zip codes (postal codes) on mail envelopes to recognizing amounts written on bank checks. This exercise will show you how the methods you’ve learned can be used for this classification task.

In the first part of the exercise, you will extend your previous implemention of logistic regression and apply it to one-vs-all classification.

> 1Octave is a free alternative to MATLAB. For the programming exercises, you are free to use either Octave or MATLAB.

## **1.1 Dataset**

You are given a data set in `ex3data1.mat` that contains 5000 training examples of handwritten digits.<sup>2</sup> The `.mat` format means that that the data has been saved in a native Octave/MATLAB matrix format, instead of a text (ASCII) format like a csv-file. These matrices can be read directly into your program by using the `load` command. After loading, matrices of the correct dimensions and values will appear in your program’s memory. The matrix will already be named, so you do not need to assign names to them.

% Load saved matrices from file load('ex3data1.mat');

% The matrices X and y will now be in your Octave environment

There are 5000 training examples in `ex3data1.mat` , where each training example is a 20 pixel by 20 pixel grayscale image of the digit. Each pixel is represented by a floating point number indicating the grayscale intensity at that location. The 20 by 20 grid of pixels is “unrolled” into a 400-dimensional vector. Each of these training examples becomes a single row in our data matrix X. This gives us a 5000 by 400 matrix `X` where every row is a training example for a handwritten digit image.

The second part of the training set is a 5000-dimensional vector `y` that contains labels for the training set. To make things more compatible with Octave/MATLAB indexing, where there is no zero index, we have mapped the digit zero to the value ten. Therefore, a “0” digit is labeled as “10”, while the digits “1” to “9” are labeled as “1” to “9” in their natural order.

## **1.2 Visualizing the data**

You will begin by visualizing a subset of the training set. In Part 1 of `ex3.m` , the code randomly selects selects 100 rows from `X` and passes those rows to the `displayData` function. This function maps each row to a 20 pixel by 20 pixel grayscale image and displays the images together. We have provided

> 2This is a subset of the MNIST handwritten digit dataset ( `http://yann.lecun.com/ exdb/mnist/` ).

the `displayData` function, and you are encouraged to examine the code to see how it works. After you run this step, you should see an image like Figure 1.

<!-- Start of picture text -->
<!-- End of picture text -->

Figure 1: Examples from the dataset

## **1.3 Vectorizing Logistic Regression**

You will be using multiple one-vs-all logistic regression models to build a multi-class classifier. Since there are 10 classes, you will need to train 10 separate logistic regression classifiers. To make this training efficient, it is important to ensure that your code is well vectorized. In this section, you will implement a vectorized version of logistic regression that does not employ any `for` loops. You can use your code in the last exercise as a starting point for this exercise.

### **1.3.1 Vectorizing the cost function**

We will begin by writing a vectorized version of the cost function. Recall that in (unregularized) logistic regression, the cost function is

To compute each element in the summation, we have to compute _hθ_ ( _x_<sup>(</sup><sup>_i_)</sup> ) for every example _i_ , where _hθ_ ( _x_<sup>(</sup><sup>_i_)</sup> ) = _g_ ( _θ_<sup>_T_</sup> _x_<sup>(</sup><sup>_i_)</sup> ) and _g_ ( _z_ ) = 1+1 _e_<sup>_−z_isthe</sup>

sigmoid function. It turns out that we can compute this quickly for all our examples by using matrix multiplication. Let us define _X_ and _θ_ as

Then, by computing the matrix product _Xθ_ , we have

In the last equality, we used the fact that _a_<sup>_T_</sup> _b_ = _b_<sup>_T_</sup> _a_ if _a_ and _b_ are vectors. This allows us to compute the products _θ_<sup>_T_</sup> _x_<sup>(</sup><sup>_i_)</sup> for all our examples _i_ in one line of code.

Your job is to write the unregularized cost function in the file `lrCostFunction.m` Your implementation should use the strategy we presented above to calculate _θ_<sup>_T_</sup> _x_<sup>(</sup><sup>_i_)</sup> . You should also use a vectorized approach for the rest of the cost function. A fully vectorized version of `lrCostFunction.m` should not contain any loops.

(Hint: You might want to use the element-wise multiplication operation ( `.*` ) and the sum operation `sum` when writing this function)

### **1.3.2 Vectorizing the gradient**

Recall that the gradient of the (unregularized) logistic regression cost is a vector where the _j_<sup>th</sup> element is defined as

To vectorize this operation over the dataset, we start by writing out all

the partial derivatives explicitly for all _θj_ ,

where

Note that _x_<sup>(</sup><sup>_i_)</sup> is a vector, while ( _hθ_ ( _x_<sup>(</sup><sup>_i_)</sup> ) _−y_<sup>(</sup><sup>_i_)</sup> ) is a scalar (single number). To understand the last step of the derivation, let _βi_ = ( _hθ_ ( _x_<sup>(</sup><sup>_i_)</sup> ) _− y_<sup>(</sup><sup>_i_)</sup> ) and observe that:

where the values _βi_ = ( _hθ_ ( _x_<sup>(</sup><sup>_i_)</sup> ) _− y_<sup>(</sup><sup>_i_)</sup> ).

The expression above allows us to compute all the partial derivatives without any loops. If you are comfortable with linear algebra, we encourage you to work through the matrix multiplications above to convince yourself that the vectorized version does the same computations. You should now implement Equation 1 to compute the correct vectorized gradient. Once you are done, complete the function `lrCostFunction.m` by implementing the gradient.

**Debugging Tip:** Vectorizing code can sometimes be tricky. One common strategy for debugging is to print out the sizes of the matrices you are working with using the `size` function. For example, given a data matrix _X_ of size 100 _×_ 20 (100 examples, 20 features) and _θ_ , a vector with dimensions 20 _×_ 1, you can observe that _Xθ_ is a valid multiplication operation, while _θX_ is not. Furthermore, if you have a non-vectorized version of your code, you can compare the output of your vectorized code and non-vectorized code to make sure that they produce the same outputs.

### **1.3.3 Vectorizing regularized logistic regression**

After you have implemented vectorization for logistic regression, you will now add regularization to the cost function. Recall that for regularized logistic regression, the cost function is defined as

Note that you should _not_ be regularizing _θ_ 0 which is used for the bias term.

Correspondingly, the partial derivative of regularized logistic regression cost for _θj_ is defined as

Now modify your code in `lrCostFunction` to account for regularization. Once again, you should not put any loops into your code.

**Octave/MATLAB Tip:** When implementing the vectorization for regularized logistic regression, you might often want to only sum and update certain elements of _θ_ . In Octave/MATLAB, you can index into the matrices to access and update only certain elements. For example, `A(:, 3:5) = B(:, 1:3)` will replaces the columns 3 to 5 of A with the columns 1 to 3 from B. One special keyword you can use in indexing is the `end` keyword in indexing. This allows us to select columns (or rows) until the end of the matrix. For example, `A(:, 2:end)` will only return elements from the 2<sup>_nd_</sup> to last column of A. Thus, you could use this together with the `sum` and `.^` operations to compute the sum of only the elements you are interested in (e.g., `sum(z(2:end).^2)` ). In the starter code, `lrCostFunction.m` , we have also provided hints on yet _another_ possible method computing the regularized gradient.

_Try running your code now._

## **1.4 One-vs-all Classification**

In this part of the exercise, you will implement one-vs-all classification by training multiple regularized logistic regression classifiers, one for each of the _K_ classes in our dataset (Figure 1). In the handwritten digits dataset, _K_ = 10, but your code should work for any value of _K_ .

You should now complete the code in `oneVsAll.m` to train one classifier for each class. In particular, your code should return all the classifier parameters in a matrix Θ _∈_ R<sup>_K×_(</sup><sup>_N_+1)</sup> , where each row of Θ corresponds to the learned logistic regression parameters for one class. You can do this with a “for”-loop from 1 to _K_ , training each classifier independently.

Note that the `y` argument to this function is a vector of labels from 1 to 10, where we have mapped the digit “0” to the label 10 (to avoid confusions with indexing).

When training the classifier for class _k ∈{_ 1 _, ..., K}_ , you will want a _m_ - dimensional vector of labels _y_ , where _yj ∈_ 0 _,_ 1 indicates whether the _j_ -th training instance belongs to class _k_ ( _yj_ = 1), or if it belongs to a different class ( _yj_ = 0). You may find logical arrays helpful for this task.

**Octave/MATLAB Tip:** Logical arrays in Octave/MATLAB are arrays which contain binary (0 or 1) elements. In Octave/MATLAB, evaluating the expression `a == b` for a vector `a` (of size _m×_ 1) and scalar `b` will return a vector of the same size as `a` with ones at positions where the elements of `a` are equal to b and zeroes where they are different. To see how this works for yourself, try the following code in Octave/MATLAB: `a = 1:10; % Create a and b b = 3; a == b % You should try different values of b here`

Furthermore, you will be using `fmincg` for this exercise (instead of `fminunc` ). `fmincg` works similarly to `fminunc` , but is more more efficient for dealing with a large number of parameters.

After you have correctly completed the code for `oneVsAll.m` , the script `ex3.m` will continue to use your `oneVsAll` function to train a multi-class classifier.

_Try running your code now._

### **1.4.1 One-vs-all Prediction**

After training your one-vs-all classifier, you can now use it to predict the digit contained in a given image. For each input, you should compute the “probability” that it belongs to each class using the trained logistic regression classifiers. Your one-vs-all prediction function will pick the class for which the corresponding logistic regression classifier outputs the highest probability and return the class label (1, 2,..., or _K_ ) as the prediction for the input example.

You should now complete the code in `predictOneVsAll.m` to use the one-vs-all classifier to make predictions.

Once you are done, `ex3.m` will call your `predictOneVsAll` function using the learned value of Θ. You should see that the training set accuracy is about 94.9% (i.e., it classifies 94.9% of the examples in the training set correctly).

_Try running your code now._

# **2 Neural Networks**

In the previous part of this exercise, you implemented multi-class logistic regression to recognize handwritten digits. However, logistic regression cannot form more complex hypotheses as it is only a linear classifier.<sup>3</sup>

In this part of the exercise, you will implement a neural network to recognize handwritten digits using the same training set as before. The neural network will be able to represent complex models that form non-linear hypotheses. For this week, you will be using parameters from a neural network that we have already trained. Your goal is to implement the feedforward propagation algorithm to use our weights for prediction. In next week’s exercise, you will write the backpropagation algorithm for learning the neural network parameters.

The provided script, `ex3 nn.m` , will help you step through this exercise.

## **2.1 Model representation**

Our neural network is shown in Figure 2. It has 3 layers – an input layer, a hidden layer and an output layer. Recall that our inputs are pixel values of digit images. Since the images are of size 20 _×_ 20, this gives us 400 input layer units (excluding the extra bias unit which always outputs +1). As before, the training data will be loaded into the variables `X` and `y` .

You have been provided with a set of network parameters (Θ<sup>(1)</sup> _,_ Θ<sup>(2)</sup> ) already trained by us. These are stored in `ex3weights.mat` and will be loaded by `ex3 nn.m` into `Theta1` and `Theta2` The parameters have dimensions that are sized for a neural network with 25 units in the second layer and 10 output units (corresponding to the 10 digit classes).

> % Load saved matrices from file load('ex3weights.mat');

> % The matrices Theta1 and Theta2 will now be in your Octave

> % environment

% Theta1 has size 25 x 401

- % Theta2 has size 10 x 26

> 3You could add more features (such as polynomial features) to logistic regression, but that can be very expensive to train.

<!-- Start of picture text -->
(ole9) @(2)<br>owe<br>NY ( \_,<br>oe @<br>YY ~ TC)<br>- Od:<br>> SOV: ~—<br>C)NoNa<br>a =e 22) = EM 23) = E2)g2)<br>(add) = 9(2®) a = g(2) = ho(2)<br>(add af”)<br>Input Layer Hidden Layer Output Layer<br><!-- End of picture text -->

Figure 2: Neural network model.

## **2.2 Feedforward Propagation and Prediction**

Now you will implement feedforward propagation for the neural network. You will need to complete the code in `predict.m` to return the neural network’s prediction.

You should implement the feedforward computation that computes _hθ_ ( _x_<sup>(</sup><sup>_i_)</sup> ) for every example _i_ and returns the associated predictions. Similar to the one-vs-all classification strategy, the prediction from the neural network will be the label that has the largest output ( _hθ_ ( _x_ )) _k_ .

**Implementation Note:** The matrix `X` contains the examples in rows. When you complete the code in `predict.m` , you will need to add the column of 1’s to the matrix. The matrices `Theta1` and `Theta2` contain the parameters for each unit in rows. Specifically, the first row of `Theta1` corresponds to the first hidden unit in the second layer. In Octave/MATLAB, when you compute _z_<sup>(2)</sup> = Θ<sup>(1)</sup> _a_<sup>(1)</sup> , be sure that you index (and if necessary, transpose) `X` correctly so that you get _a_<sup>(</sup><sup>_l_)</sup> as a column vector.

Once you are done, `ex3` ~~`n`~~ `n.m` will call your `predict` function using the loaded set of parameters for `Theta1` and `Theta2` . You should see that the

accuracy is about 97.5%. After that, an interactive sequence will launch displaying images from the training set one at a time, while the console prints out the predicted label for the displayed image. To stop the image sequence, press `Ctrl-C` .

_Try running your code now._

# **Submission and Grading**

After completing this assignment, be sure to use the `submit` function to submit your solutions to our servers. The following is a breakdown of how each part of this exercise is scored.

|**Part**|**Submitted File**|**Points**|
|---|---|---|
|Regularized Logisic Regression|`lrCostFunction.m`|30 points|
|One-vs-all classifier training|`oneVsAll.m`|20 points|
|One-vs-all classifier prediction|`predictOneVsAll.m`|20 points|
|Neural Network Prediction Function|`predict.m`|30 points|
|Total Points||100 points|

You are allowed to submit your solutions multiple times, and we will take only the highest score into consideration.
