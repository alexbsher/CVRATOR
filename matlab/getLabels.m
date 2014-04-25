function [ labels ] = getLabels( dir_name )
    if nargin < 1
        dir_name = '../data';
    end
    
    listing = dir(dir_name);
    labels = cell(0);
    
    for i = 1:numel(listing)
        if listing(i).isdir && (strcmp(listing(i).name,'.') == 0 && strcmp(listing(i).name,'..') == 0 )                       
            labels{numel(labels)+1} = listing(i).name;
        end
    end
end

