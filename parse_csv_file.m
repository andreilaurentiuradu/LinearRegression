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

    [m,n] = size(data)
    % facem castul numerelor de la string la double
    for j = 1:n
      % daca primu caracter nu e litera
      if ~isletter(data{j}(2))
        for i = 2:m
          InitialMatrix{i, j} = str2double(data{j});
        endfor
      endif
    endfor

    % extragerea matricei InitialMatrix și vectorului Y
    InitialMatrix = data(:, 2:end);
    Y = data(:, 1);
endfunction
#########DACA E NEVOIE STERGI PRIMA LINIE(ADICA CAMPUL NUME)
