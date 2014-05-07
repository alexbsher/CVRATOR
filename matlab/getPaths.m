function [text_path] = getPaths(labels)
% Get X training images from each label
% Get Y testing images from each label
% to do: convert labels to numbers!
% 

% Get top level movement labels
if nargin < 1
    labels = getLabels(path);
end

textstring = '';

% Iterate through selected movements
for i = 1:numel(labels)
    label = labels{i};

    worklist = dir(['../classemes/images/',label]);
    for w = 1:numel(worklist)
        if ~worklist(w).isdir && strcmp(worklist(w).name,'desktop.ini') == 0
            textstring = strcat(textstring,['./',label,'/',worklist(w).name,'\n']);
        end
    end
end

fileID = fopen('paintingpaths.txt','wt');
fprintf(fileID,textstring);
fclose(fileID);

text_path = 'paintingpaths.txt';


end