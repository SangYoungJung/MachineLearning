function [theta, J_history] = gradientDescentMulti(X, y, theta, alpha, num_iters)
%GRADIENTDESCENTMULTI Performs gradient descent to learn theta
%   theta = GRADIENTDESCENTMULTI(x, y, theta, alpha, num_iters) updates theta by
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
    %       of the cost function (computeCostMulti) and gradient here.
    %


    temp = zeros(length(theta), 1);
    for j = 1 : m
      temp = temp + ((X(j, : ) * theta) - y(j))*X(j, :)';
      
      %{
      h = X(j, : ) * theta;
      temp(1) = temp(1) + (h - y(j)) * X(:,1)(j);
      temp(2) = temp(2) + (h - y(j)) * X(:,2)(j);
      temp(3) = temp(3) + (h - y(j)) * X(:,3)(j);
      temp(4) = temp(4) + (h - y(j)) * X(:,4)(j);
      %}
    end
    theta = theta - temp.*((1/m)*alpha);

    % ============================================================

    % Save the cost J in every iteration    
    J_history(iter) = computeCostMulti(X, y, theta);

end

end
