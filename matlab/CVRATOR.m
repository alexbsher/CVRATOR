img_root = '../data/';
feat_root = '../features/';

root_ls = dir(img_root);
labels = {root_ls.name};

names = cell(100000, 1);
data = zeros(10000, 2659);
out_labels = cell(100000, 1);

count = 1;

% Start at 3, as first two entries are '.' and '..'
for i=3:length(labels)-1
    
    label_path = strcat(root, labels{i});
    artists = dir(label_path);
    artists = {artists.name};
    label = labels{i};
    
    for j=3:length(artists)
        
        art_path = strcat(label_path, '/', artists{j}, '/');
        paintings = dir(art_path);
        paintings = {paintings.name};
        
        for k=3:length(paintings)
            % Get Name of Painting
            paint_name = strsplit(paintings{k}, '.');
            if strcmp(paint_name(2), 'ini')
                continue
            end
            paint_name = paint_name(1);
            feature_loc = strcat(feat_root, labels{i}, '/', artists{j}, '/', paint_name, '_classemes', '.dat');
            vec = load_float_matrix(feature_loc{1});
            
            names(count) = strcat(artists{j}, '/', paint_name);
            data(count, :) = vec';
            out_labels(count) = {labels{i}};
            
            count = count + 1;
            
        end
        
    end
    
end

[last_name, ~] = ind2sub(size(data), find(data, 1, 'last'));

names = names(1:last_name);
data = data(1:last_name, :);
out_labels = out_labels(1:last_name);



