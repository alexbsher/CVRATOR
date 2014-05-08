function [ img ] = getImage( path )
%UNTITLED2 Summary of this function goes here
%   Detailed explanation goes here

    extensions = {'.gif','.jpg','.jpeg','.png','.bmp','.tif'};
    

    for i = 1:numel(extensions)
        p = strrep(path, '_classemes.dat',extensions{i});
        if exist(p,'file') == 2
           img = imread(p);
           return 
        end
    end

end

