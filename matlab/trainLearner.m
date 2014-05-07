function [ svm_struct ] = trainLearner( num_train, num_test, labels )

    addpath('./libsvm-3.18/matlab/')

    [testDat, trainDat] = getData(num_train, num_test, labels);
    
    testData = [testDat.dat]';
    trainData = [trainDat.dat]';
    testLabels = {testDat.label}';
    trainLabels = {trainDat.label}';
    
    labels = [1:num_test:size(testData, 1)];
    dis_labels = testLabels(labels);
    
    test_labs = cellfun(@(x) find(ismember(dis_labels, x)), testLabels);
    train_labs = cellfun(@(x) find(ismember(dis_labels, x)), trainLabels);
    
    svm_struct = svmtrain(train_labs, trainData, '-t 2');
    
    outputs = svmpredict(test_labs, testData, svm_struct);
    
    confusion_mat = confusionmat(test_labs, outputs)
    for i=1:length(dis_labels)
        dis_labels{i}
        topClassemes(trainData(find(train_labs == i), :));
    end
end

