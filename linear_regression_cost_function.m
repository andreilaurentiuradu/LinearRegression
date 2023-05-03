function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  m = length(Y);
  Error = 0;
  Theta = Theta(2:end);
  for i = 1:m
    Error = Error + (FeatureMatrix(i, :) * Theta - Y(i)) ^ 2;
  endfor
  Error = Error / (2 * m);
endfunction
