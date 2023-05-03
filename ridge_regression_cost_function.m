function [Error] = ridge_regression_cost_function(Theta, Y, FeMatrix, lambda)
  m = length(Y);
  Error = 0;
  Theta = Theta(2:end);
  for i = 1:m
    Error = Error + (Y(i) - FeMatrix(i, :) * Theta) ^ 2;
  endfor
  Error = Error / (2 * m);
  n = length(Theta);
  for i = 1:n
    Error += sum(Theta(i) ^ 2) * lambda;
  endfor
endfunction
