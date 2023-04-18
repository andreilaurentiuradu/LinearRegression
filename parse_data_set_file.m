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
  InitialMatrix = cell(m, n+1);

  %scapam de enter
  fgets(file);

  % stocam in matrice predicatorii si vectorul de iesire
  for i = 1:m

    % citim linia
    line = fgets(file);
    values = strsplit(line, ' ');
    for j = 1:n+1
      %extrage valorile
      InitialMatrix{i, j} = values{j};
    endfor

  endfor



  % Loop through each line and parse the values
##  for i = 1:m
##    values = strsplit(data{1}{i}, ' ');
##    for j = 1:n+1
##      InitialMatrix{i,j} = values{j};
##    end
##  end

  % Extract Y and x values from InitialMatrix
##  Y = cellfun(@str2num, InitialMatrix(:,1));
##  X = cellfun(@str2num, InitialMatrix(:,2:end));

  % Close the file
  fclose(file);
end
