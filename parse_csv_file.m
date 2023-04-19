function [InitialMatrix, Y] = parse_csv_file(file_path)
    % citirea datelor din fișierul CSV
    fid = fopen(file_path);

    % citim toate liniile din fisier
    data = textscan(fid, '%s', 'Delimiter', '\n');

    % inchidem fisierul
    fclose(fid);

    % mutam datele din pozitia 1 in vectorul coloana in sine
    data = data{1};

    % punem fiecare coloana in cate o pozitie in data
    data = cellfun(@(x) strsplit(x, ','), data, 'UniformOutput', false);

    % punem fiecare element din coloane in cate o pozitie din data
    data = vertcat(data{:});

    % stergem linia cu numele
    data(1, :) = [];
    [m,n] = size(data)
    % luam din data elementele tabelului
    InitialMatrix = data(:, 2:end);
    Y = data(:, 1);

    % facem castul elementelor din Y in double
    for i = 1:m
      Y(i, 1)= str2double(Y(i,1));
    endfor

    % scadem prima coloana
    n--;

    % facem castul numerelor de la string la double
    for j = 1:n
      % daca primu caracter nu e litera
      if InitialMatrix{1, j} >= '0' && InitialMatrix{1, j} <= '9'
        for i = 1:m
          InitialMatrix{i, j} = str2double(InitialMatrix{i, j});
        endfor
      endif
    endfor

endfunction
