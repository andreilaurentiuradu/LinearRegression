function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
  % nr de antrenamente
  m = length(Y);

  % cream vectorul h
  h = FeMatrix * Theta;

  % costul
  Error = (1/m) * sum((Y - h).^2) + lambda * sum(abs(Theta(1:end))); %2:end
endfunction
