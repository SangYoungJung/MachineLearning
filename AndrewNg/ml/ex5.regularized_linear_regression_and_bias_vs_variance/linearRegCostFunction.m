function [J, grad] = linearRegCostFunction(X, y, theta, lambda)
%LINEARREGCOSTFUNCTION Compute cost and gradient for regularized linear 
%regression with multiple variables
%   [J, grad] = LINEARREGCOSTFUNCTION(X, y, theta, lambda) computes the 
%   cost of using theta as the parameter for linear regression to fit the 
%   data points in X and y. Returns the cost in J and the gradient in grad

% Initialize some useful values
m = length(y); % number of training examples

% You need to return the following variables correctly 
J = 0;
grad = zeros(size(theta));

% ====================== YOUR CODE HERE ======================
% Instructions: Compute the cost and gradient of regularized linear 
%               regression for a particular choice of theta.
%
%               You should set J to the cost and grad to the gradient.
%

% brief arguments
% X     : 12 by 2 including bias 1 at first comumn
% theta :  2 by 1

h = X * theta; % (12 by 2) * (2 by 1) = 12 * 1

% using sum function with regularized
%{
J = (1/(2*m)) * ((h-y)'*(h-y)) + ...
       (lambda/(2*m)) * (theta(2:end, :)'*theta(2:end, :));
%}

% using mutiplication of matrix with regularized
J = (1/(2*m)) * sum(((h - y).^2)) + ...
      (lambda/(2*m)) * sum(theta(2:end, :).^2); 

      
% gradient descent
%{
grad(1) = (1/m) * sum((h-y).*X(:, 1));
grad(2) = (1/m) * sum((h-y).*X(:, 2)) + (lambda/m) * theta(2:end, :);
%}
% vectorized
grad = (1/m)*(X' * (h-y)) + (lambda/m)*[0; theta(2:end, :)];


% =========================================================================

grad = grad(:);

end
