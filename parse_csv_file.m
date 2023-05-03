function [Y, InitialMatrix] = parse_csv_file(file_path)
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
    % luam din data elementele tabelului si le punem in Y si InitialMatrix
    InitialMatrix = data(:, 2:end);
    % facem castul elementelor din Y in double
    Y = str2double(data(:, 1));


    % scadem prima coloana
    n--;

    % facem castul numerelor de la string la double
    for j = 1:n
      % daca primu caracter nu e litera
      if InitialMatrix{1, j}(1) >= '0' && InitialMatrix{1, j}(1) <= '9'
        for i = 1:m
          InitialMatrix{i, j} = str2double(InitialMatrix{i, j});
        endfor
      endif
    endfor


endfunction
