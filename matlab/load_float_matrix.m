function M = load_float_matrix(fileName)

fid = fopen(fileName);
if fid < 0
    error(['Error during opening the file ' fileName]);
end

rows = fread(fid, 1, 'uint');
cols = fread(fid, 1, 'uint');
data = fread(fid, inf, 'float');

M = reshape(data, [cols rows])';

fclose(fid);

end