# AI GRIJA LA DENUMIRILE MATRICII FEATUREMATRIX VS FEATURESMATRIX VS FEMATRIX
function [Theta] = normal_equation(FeaturesMatrix, Y, tol, iter)
  % Calculează soluția sistemului Ax = b folosind metoda gradientului conjugat
  % FeaturesMatrix: matricea coeficienților sistemului
  % Y: vectorul termenilor liberi
  % alpha/tol: toleranța erorii
  % max_iter/iter: numărul maxim de iterații
  % x/Theta: vectorul soluție
  % Inițializarea variabilelor
  [m, n] = size(FeaturesMatrix);
  Theta = zeros(n, 1);

  A = FeaturesMatrix' * FeaturesMatrix;

  if isPositiveDefinite(A)
    b = FeaturesMatrix' * Y;
    r = b - A * Theta;
    v = r;

    tolsquared = tol^2;
    k = 1;

    while k < iter && r' * r > tolsquared
      % Calculăm coeficientul t_k
      t = (r' * r) / (v' * A * v);

      % Actualizăm soluția
      Theta = Theta + t * v;

      % Actualizăm reziduul
      r_new = r - t * A * v;

      % Calculăm coeficientul s_k
      s = (r_new' * r_new) / (r' * r);

      % Actualizăm direcția de căutare
      v = r_new + s * v;

      % Actualizăm reziduul
      r = r_new;

      % Incrementăm contorul de iterații
      k = k + 1;
    endwhile
  endif
    Theta = vertcat(0, Theta);
endfunction


#procedure conjugate_gradient(FeaturesMatrix, b, tol, max_iter)
##2: r (0) ← b
##3: v (1) ← r (0)
## 4: x ← 0
##5: tolsquared ← tol * tol
##6: k ← 1
##7: while k < maxiter and (r(k-1))T * r(k-1) > tolsquared do
##8: t_k ← (r(k-1))T * r(k-1) / ((v(k)T) FeaturesMatrix * v(k))
##9: x(k) ← x(k-1) + t_k * v(k)
##10: r (k) ← r (k-1) − t_k * FeaturesMatrix * v(k)
##11: s_k ← (r(k))T * r(k) / ((r(k-1))T * r (k-1))
##12: v (k+1) ← r(k) + s_k * v(k)
##13: k ← k + 1
##14: return x
