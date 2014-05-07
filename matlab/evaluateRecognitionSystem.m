%%
% Load the Training Data
load('vision.mat');

%%
% Load the Testing Data
load('../data/images/traintest.mat');


%%
% Guess Image

% Blank Confusion Matrix
C = zeros(length(mapping), length(mapping));

for i=1:length(test_imagenames)
    prefix = '../data/images/';
    image = cat(2, prefix, test_imagenames{i});
    image_label = guessImage(image);
    
    % Get Index from string of mapping
    IndexC = strfind(mapping, image_label);
    Index = find(not(cellfun('isempty', IndexC)));
    
    % populate Confusion Matrix
    C(test_labels(i), Index) = C(test_labels(i), Index) + 1;
    
end

percent = trace(C)/sum(C(:))
    