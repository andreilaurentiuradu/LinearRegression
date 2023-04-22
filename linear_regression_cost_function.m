function [Error] = linear_regression_cost_function(Theta, Y, FeatureMatrix)
  % numarul de antrenamente
  m = length(Y);

  % cream vectorul h
  h = FeatureMatrix * Theta;

  % calculam eroarea
  Error = (1/(2*m)) * sum((h - Y).^2);
endfunction
