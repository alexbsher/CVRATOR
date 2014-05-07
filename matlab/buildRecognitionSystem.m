%%
% Load Filenames from traintest.mat
load('../data/images/traintest.mat');

% Change imagenames of training data to wormap names
wordmaps = strrep(train_imagenames, '.jpg', '.mat');

%%
% Load filterBank and Dictionary from Dictionary.mat
load('dictionary.mat');

%%
% Gets training histogram and labels

prefix = '../data/wordmaps/';
ex_wordmap = cat(2, prefix, wordmaps{1});
load(ex_wordmap);
ex_hist = getImageFeaturesSPM(3, wordMap, size(dictionary, 1));

train_features = zeros(size(ex_hist, 1) , length(train_imagenames));
train_temp = zeros(1, length(train_imagenames));

for i=1:length(train_imagenames)
    
    wordmap = cat(2, prefix, wordmaps{i});
    load(wordmap);
    train_features(:, i) = getImageFeaturesSPM(3, wordMap, size(dictionary, 1)); 
    train_temp(i) = train_labels(i);
    
end

train_labels = train_temp;

save('vision.mat', 'filterBank', 'dictionary', 'train_features', 'train_labels')


