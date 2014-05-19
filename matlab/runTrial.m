w = warning ('off','all');

clear all; close all;

trainNum = 70;
testNum = 25;

labels = getLabels();

% [svm, test, labels] = trainLearner(trainNum, testNum, {labels{1:end-1}});
load svm_learner

idx  = randperm(numel(test));

C_U = zeros(numel(labels));
C_S = zeros(numel(labels));

for i=1:numel(test)
    j = idx(i);
    clc;
    displayLabels(labels);
    disp('Enter Guess...');
    % Show image for five seconds
    img = getImage(test(j).path);
    if img == -1
        continue
    end
    imshow(img);
    result = input('>> ');

    pause(0);
   
    disp(['You Guessed: ',labels{result}])
%     pause(1);
    sguess = svm_output_labels(j);
    disp(['Algorithm Guessed: ',labels{sguess}]);
%     pause(1);
    
    disp(['Correct Answer: ',test(j).label]);
    pause(0)
    
    C_U(result, find(not(cellfun('isempty', strfind(labels,test(j).label))))) = C_U(result, find(not(cellfun('isempty', strfind(labels,test(j).label))))) + 1;
    C_S(svm_output_labels(j), find(not(cellfun('isempty', strfind(labels,test(j).label))))) = C_S(svm_output_labels(j), find(not(cellfun('isempty', strfind(labels,test(j).label))))) + 1;

    accuracy = trace(C_U) / (sum(sum(C_U)))
    pause(1)
end
disp('User Conf Matrix')
C_U
disp('User Accuracy')
accuracy = trace(C_U) / (sum(sum(C_U)))
disp('SVM Conf Matrix')
C_S
disp('SVM Accuracy')
accuracy = trace(C_S) / (sum(sum(C_S)))