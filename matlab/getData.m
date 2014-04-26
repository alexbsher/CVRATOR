function [test, train] = getData(train_num, test_num, labels)
% Get X training images from each label
% Get Y testing images from each label

f1 = 'label';
f2 = 'dat';
testlbl = {};
testdat = {};
trainlbl = {};
traindat = {};
path = '../data';

% Get top level movement labels
if nargin < 3
    labels = getLabels(path);
end



% Iterate through selected movements
for i = 1:numel(labels)
    paintings = getPaintings(labels{i});
    paintings = paintings(randperm(numel(paintings)));
    
    if numel(paintings) < train_num + test_num
       disp(['Label ',labels{i},' does not have enough images, discarding...']); 
    else

       for p = 1:(test_num)
           testlbl{numel(testlbl)+1} = labels{i};
           testdat{numel(testdat)+1} = paintings{p};
       end
       for p = test_num+1:(test_num + train_num)
           trainlbl{numel(trainlbl)+1} = labels{i};
           traindat{numel(traindat)+1} = paintings{p};
       end
       
    end
    
end

test = struct(f1, testlbl, f2, testdat);
train = struct(f1, trainlbl, f2, testdat);

end