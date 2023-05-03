function [Error] = lasso_regression_cost_function(Theta, Y, FeMatrix, lambda)
  m = length(Y);
  Error = 0;
  Theta = Theta(2:end);
  for i = 1:m
    Error = Error + (Y(i) - FeMatrix(i, :) * Theta) ^ 2;
  endfor
  Error = Error / m;
  Error += lambda * sum(abs(Theta(1:end)));
endfunction
