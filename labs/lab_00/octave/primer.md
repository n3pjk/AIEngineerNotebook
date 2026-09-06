# Octave Primer

[[Home](../../README.md) | [Back](README.md#language-selection) | [Setup](setup.md)]

## Contents <!-- omit in toc -->

- [Octave Primer](#octave-primer)
  - [Environment](#environment)
  - [Math operations](#math-operations)
  - [Logic Operations](#logic-operations)
  - [Display](#display)
  - [Matrix Operations](#matrix-operations)
    - [Slicing](#slicing)
    - [Appending](#appending)
  - [Loading and Saving Data](#loading-and-saving-data)
  - [Plotting data](#plotting-data)
  - [Control statements](#control-statements)
  - [Defining Functions](#defining-functions)

## Environment

- Folder controls:  pwd, cd, rmdir, etc.
- Change prompt with `PS1(‘string’);`
- Placing a semicolon at the end suppresses output.
- Use ‘%’ to start a comment.
- `who` shows you what variables are defined in your workspace.
- `whos` shows you the variables with their dimensions.
- Remove a variable with the clear command.

## Math operations

- Calculator functions:  +-\*/
- Element-wise functions:  precede operation with a period, e.g.  A .* B or A ./ B will multiply or divide each element in A by the same element of B.  A .^ 2 squares each element of A.

## Logic Operations

- Comparison:  ==, ~=, >=, <=
- Boolean: &&, ||, xor(a,b)

## Display

```text
>> disp(sprint(‘2 decimals: %0.2f’, a)) %display a string
>> hist(w) %histogram
>> hist(w,n) %histogram with n steps.
```

## Matrix Operations

- Matrix: A=[1 2; 3 4; 5 6]. Can carriage return after semi.
- Stepped vector:  v = 1:0.1:2.
- ones(2,3) creates a 2x3 matrix of all ones.
- zeros(2,3) creates a 2x3 matrix of all zeroes.
- eye(3) creates a square identity matrix of rank 3.
- rand(2,3) generates a 2x3 matrix of random numbers between 0 and 1.  randn(2,3) generates a 2x3 matrix of random numbers using a normal Gaussian distribution.

### Slicing

A(3,2) returns the element on row 3, column 2.  A(2,:) returns the second row.  A(:,2) returns the second column.  So ‘:’ means all elements in that row or column.  A([1 3],:) returns the first and third rows.  A(:,2) = [10;11;12] replaces column 2 with the values 10, 11, 12.

### Appending

A=[A,[100,101,102]] appends another column with values 100, 101, 102. A(:) will turn A into a single column vector.  C = [A B] or [A, B] concatenates B to the right of A.  C = [A;B] puts B underneath A.

## Loading and Saving Data

Loading data:  load(‘featuresX.dat’) will load a data file into an array.  You would create two files, one for your input training set feature values, X, and one for your training set output values, y.
Saving data:  save filename.mat variable;  will save the variable to the file in binary format.  save filename.txt variable –ascii; will save the variable in a human readable form.

## Plotting data

```text
>> t = [0:0.01:0.98];        %Plot two graphs and save as .png
>> y1 = sin(2*pi*4*t);
>> y2 = cos(2*pi*4*t);
>> plot(t,y1);
>> hold on;
>> plot(t,y2,’r’);           %Plot y2 in red
>> xlabel(‘time’);
>> ylabel(‘value’);
>> legend(‘sin’,’cos’);
>> title(‘my plot’);
>> print –dpng ‘myplot.png’;
>> close;
>>
>> figure(1); plot(t,y1);    %Plot two figures in separate windows
>> figure(2); plot(t,y2);
>>
>> subplot(1,2,1);           %Divide plot in 1x2 grid, access first
>> plot(t,y1);
>> subplot(1,2,2);
>> plot(t,y2);
>> axis([0.5 1 -1 1]);
>> clf;                      %Clear figure
>>
>> imagesc(magic(15)), colorbar, colormap gray; %Plot 15x15 in grey
```

## Control statements

```text
>> v = zeros(10,1)
>> for i=1:10,
>    v(i) = 2^i;
>  end;
>> v
>>
>> indices=1:10;
>> for i=indices,
>    disp(i);
>  end;
>>
>> i = 1;
>> while i <= 5,
>    v(i) = 100;
>    i = i+1;
>  end;
>> v
>>
>> i = 1;
>> while true,
>    v(i) = 999;
>    i = i+1;
>    if i == 6,
>      break;
>    end;
>  end;
>> v
>>
>> v(1) = 2;
>> if v(1) == 1,
>    disp(‘The value is one’);
>  elseif v(1) == 2,
>    disp(‘The value is two’);
>  else
>    disp(‘The value is not one or two.’);
>  end;
```

## Defining Functions

Create a file called ‘functionname.m’.  Use WordPad, as Notepad messes with spacing.  Add the directory you wish to store your functions to Octave’s path by using

```text
>> addpath(‘C:\functiondir’);
```

otherwise, you need to be in the same directory as your function files.  Add a file there called ‘squarethisnumber.m’, which contains

```text
function y = squarethisnumber(x)
y = x^2;
```

Then when you type

```text
>> squarethisnumber(5)
```

Octave will print the answer, 25
Octave is able to return multiple values from a function call.  Consider ‘squareAndCube.m’

```text
function [y1,y2] = squareAndCube(x)
y1 = x^2;
y2 = x^3;
```

Then when you specify a set for the return value of the function

```octave
>> [a,b] = squareAndCube(5)
>> a
25
>> b
125
```

To create a function to calculate the cost function, , for a specified coefficient vector, , say [0;1], given a “design” matrix, X, and the class labels vector, y.  We can create the Octave function as

```octave
function J = costFunctionJ(X, y, theta)
% X is the “design matrix” containing our training examples
% y is the class labels

m = size(X,1);          % number of training examples
predictions = X*theta;  % predictions of hypothesis on all examples
sqrErrors = (predictions-y).^2;  % squared errors

J = 1/(2*m) * sum(sqrErrors);
```