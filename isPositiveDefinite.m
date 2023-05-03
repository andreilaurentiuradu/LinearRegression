function [isPositiveDef] = isPositiveDefinite(matrix)
  % Verifică dacă o matrice este pozitiv definită sau nu
  % Returnează o valoare booleană: true dacă matricea este pozitiv definită, false altfel
  % Verificăm dacă matricea este simetrică
  if ~isequal(matrix, matrix')
    isPositiveDef = false;
    return;
  endif

  % Calculăm valorile proprii ale matricei
  eigenvalues = eig(matrix);

  % Verificăm dacă toate valorile proprii sunt pozitive
  if all(eigenvalues > 0)
    isPositiveDef = true;
  else
    isPositiveDef = false;
  endif
endfunction
