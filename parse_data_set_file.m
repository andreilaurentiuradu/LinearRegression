function [Y, InitialMatrix] = parse_data_set_file(file_path)
  % deschide fisierul din care citim
  file = fopen(file_path, 'r');

  % citim prima linie
  dimensions = fscanf(file, '%d %d', [1, 2]);
  m = dimensions(1)
  n = dimensions(2)
  Y = 0;
  % citim restul liniilor in data
  #data = textscan(file, '%s', m, 'Delimiter', '\n');

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
      %extrage valorile si le adauga in matrice
      InitialMatrix{i, j} = values{j};
    endfor

  endfor


  % Close the file
  fclose(file);
end
