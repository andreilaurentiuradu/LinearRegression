function [Theta] = gradient_descent(FeatureMatrix, Y, n, m, alpha, iter)


##  FeatureMatrix
##  Y
##  n
##  m
##  alpha
##  iter

  % Inițializarea vectorului de coeficienți
  Theta = zeros(n,1);

  % Calcularea gradientului
  % actualizarea vectorului de coeficienți în fiecare iterație
  for i = 1:iter
      gradient = (1/m) * FeatureMatrix' * (FeatureMatrix*Theta - Y);
      Theta = Theta - alpha * gradient;
  endfor

  Theta = vertcat(0, Theta);
  #POSIBIL SA TREBUIASCA SA IESI DIN FOR LA O ANUMITA DIFERENTA INTRE REZULTATEs
endfunction
