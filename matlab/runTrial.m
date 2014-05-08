w = warning ('off','all');

clear all; close all;

trainNum = 70;
testNum = 25;

labels = getLabels();

[test, train, labels] = getData(trainNum, testNum, {labels{1:end-1}});

idx  = randperm(numel(test));

C = zeros(numel(labels));

for i=1:5
    j = idx(i);
    clc;
    displayLabels(labels);
    disp('Enter Guess...');
    % Show image for five seconds
    imshow(getImage(test(j).path));
    result = input('>> ');

    pause(1);
   
    disp(['You Guessed: ',labels{result}])
    pause(1);
    sguess = 1;
    disp(['SVM Guessed: ',labels{sguess}]);
    pause(1);
    
    disp(['Correct Answer: ',test(j).label]);
    pause(1)
    
    C(result, find(not(cellfun('isempty', strfind(labels,test(j).label))))) = C(result, find(not(cellfun('isempty', strfind(labels,test(j).label))))) + 1;
end

C
accuracy = trace(C) / (sum(sum(C)))