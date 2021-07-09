function [theta, J_history] = gradientDescent(X, y, theta, alpha, num_iters)
%GRADIENTDESCENT Performs gradient descent to learn theta
%   theta = GRADIENTDESCENT(X, y, theta, alpha, num_iters) updates theta by 
%   taking num_iters gradient steps with learning rate alpha

% Initialize some useful values
m = length(y); % number of training examples
J_history = zeros(num_iters, 1);

for iter = 1:num_iters

    % ====================== YOUR CODE HERE ======================
    % Instructions: Perform a single gradient step on the parameter vector
    %               theta. 
    %
    % Hint: While debugging, it can be useful to print out the values
    %       of the cost function (computeCost) and gradient here.
    %
    
    
    % using for loop    
    %{
    sum0 = 0; sum1 = 0;
    for j = 1 : m
      sum0 = sum0 + ((theta(1) * X(:,1)(j) + theta(2) * X(:,2)(j)) - y(j)) * X(:,1)(j);
      sum1 = sum1 + ((theta(1) * X(:,1)(j) + theta(2) * X(:,2)(j)) - y(j)) * X(:,2)(j);
    end
    temp0 = theta(1) - (1/m)*alpha*sum0;
    temp1 = theta(2) - (1/m)*alpha*sum1;
    theta = [temp0; temp1]
    %}  
    
    % using vectorization : ((X*theta)-y); % m*1
    theta = theta - ((1/m)*alpha*(((X*theta)-y)'*X))';
    
    % using summation
    %theta = theta - (1/m)*alpha*sum((X*theta-y).*X)';
    
    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCost(X, y, theta);

end

end
