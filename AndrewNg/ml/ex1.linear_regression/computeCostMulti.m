function J = computeCostMulti(X, y, theta)
%COMPUTECOSTMULTI Compute cost for linear regression with multiple variables
%   J = COMPUTECOSTMULTI(X, y, theta) computes the cost of using theta as the
%   parameter for linear regression to fit the data points in X and y

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost of a particular choice of theta
%               You should set J to the cost.

% arguments of this function
% X : m * (n + 1), n is 3 features
%   : first column is 1, 2,3,4 columns is variables
% Y : m * 1, result examples
# theta : (n + 1) * 1, column vector

  % (X * theta) = m*(n+1) dot (n+1)*1 = m*1 matrix as column vector
  % m is the number of matrix
  % n is the number of feature
  (X * theta);

  % using A transpose * A, A is column vector. 
  J = (1/(2*m)) * (((X * theta)-y)'*((X * theta)-y))
  
  % using summation  
  (1/(2*m)) * sum((((X * theta) - y).^2));
  
% ============================================================

end
