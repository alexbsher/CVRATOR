function [test, train, keptlabels] = getData(train_num, test_num, labels)
% Get X training images from each label
% Get Y testing images from each label
% to do: convert labels to numbers!
% 
f1 = 'label';
f2 = 'dat';
f3 = 'path';
testlbl = {};
testdat = {};
testpath = {};
trainlbl = {};
traindat = {};
trainpath = {};
path = '../data';

keptlabels = {};

% Get top level movement labels
if nargin < 3
    labels = getLabels(path);
end

% Iterate through selected movements
for i = 1:numel(labels)
    [paintings, paths] = getPaintings(labels{i});
    idx = randperm(numel(paintings));
    paintings = paintings(idx);
    paths = paths(idx);
    
    if numel(paintings) < train_num + test_num
       disp(['Label ',labels{i},' does not have enough images, discarding...']); 
    else

       keptlabels{numel(keptlabels)+1} = labels{i};
        
       for p = 1:(test_num)
           testlbl{numel(testlbl)+1} = labels{i};
           testdat{numel(testdat)+1} = paintings{p};
           testpath{numel(testpath)+1} = paths{p};
       end
       for p = test_num+1:(test_num + train_num)
           trainlbl{numel(trainlbl)+1} = labels{i};
           traindat{numel(traindat)+1} = paintings{p};
           trainpath{numel(trainpath)+1} = paths{p};
       end
       
    end
    
end



test = struct(f1, testlbl, f2, testdat, f3, testpath);
train = struct(f1, trainlbl, f2, traindat, f3, trainpath);

end