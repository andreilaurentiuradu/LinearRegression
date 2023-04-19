function [FeatureMatrix] = prepare_for_regression(InitialMatrix)

  % luam dimensiunile matricei
  [m, n] = size(InitialMatrix)

  % initializam matricea cu zerouri
  FeatureMatrix = zeros(m, n);

  % parcurgem matricea pe coloane
  for j = 1:n
    % daca primul element de pe coloana este string
    if ischar(InitialMatrix{1, j})
      % daca este de tip yes/no
      if strcmp(InitialMatrix{1, j},'yes') || strcmp(InitialMatrix{1, j},'no')
        for i = 1:m
            if strcmp(InitialMatrix{i, j},'yes')
              FeatureMatrix(i, j) = 1;
            else
              FeatureMatrix(i, j) = 0;
            endif
        endfor
      else
        % daca este unfurnished/furnished/semi-furnished
        % cream o noua coloana
        for i = 1:m
            if strcmp(InitialMatrix{i, j},'unfurnished')
              FeatureMatrix(i, j) = 0;
              FeatureMatrix(i, j+1) = 1;
            endif
            if strcmp(InitialMatrix{i, j},'semi-furnished')
              FeatureMatrix(i, j) = 1;
              FeatureMatrix(i, j+1) = 0;
            endif
            if strcmp(InitialMatrix{i, j},'furnished')
              FeatureMatrix(i, j) = 0;
              FeatureMatrix(i, j+1) = 0;
            endif
        endfor
        % am creat o noua coloana
        n++;
        j++;
      endif
    else
      % daca este de numar pastram valoarea din matricea initiala
      for i = 1:m
          FeatureMatrix(i, j) = InitialMatrix{i, j};
      endfor
    endif
  endfor
endfunction
