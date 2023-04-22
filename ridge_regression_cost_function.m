function [Error] = ridge_regression_cost_function(Theta, Y, FeMatrix, lambda)

  % number of training examples
  m = length(Y);

  % cream vectorul h
  h = FeMatrix * Theta;

  % costul
  Error = 1/(2 * m) * sum((h - Y).^2) + lambda * sum(Theta(1:end).^2);%1:end
endfunction
