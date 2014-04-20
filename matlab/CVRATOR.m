img_root = '../data/';
feat_root = '../features/';

root_ls = dir(img_root);
labels = {root_ls.name};

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
            
        end
        
    end
    
   
    
end