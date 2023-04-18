function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % deschide fisierul din care citim
  file = fopen(file_path, 'r');

  % citim prima linie
  dimensions = fscanf(file, '%d %d', [1, 2]);
  m = dimensions(1)
  n = dimensions(2)

  % declaram o matrice de cell(sa putem retine si stringuri si numere
  InitialMatrix = cell(m, n);

  % initializam vectorul coloana
  Y = zeros(m, 1)

  %scapam de enter
  fgets(file);

  % stocam in matrice predicatorii si vectorul de iesire
  for i = 1:m

    % citim elementul din vectorul de iesire
    Y(i, 1) = fscanf(file, '%d');

    % citim restul liniei
    line = fgets(file);
    % luam valorile din line si le punem in values avand ' ' separator
    values = strsplit(line, ' ');

    for j = 1:n
      %extrage valorile si le adauga in matrice in functie de tipul lor
      if isletter(values{j}(1))
        InitialMatrix{i, j} = strtrim(values{j});
      else
        InitialMatrix{i, j} = str2double(values{j});
      endif

    endfor

  endfor


  % Close the file
  fclose(file);
end
