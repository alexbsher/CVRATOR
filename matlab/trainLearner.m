function [ svm_struct, testDat, dis_labels, outputs ] = trainLearner( num_train, num_test, labels )

    addpath('./libsvm-3.18/matlab/')
    load dict_and_filt
    
    [testDat, trainDat, labels] = getData(num_train, num_test, labels);
    
    testData = [testDat.dat]';
    testData = [testData, zeros(size(testData, 1), 600)];
    trainData = [trainDat.dat]';
    trainData = [trainData, zeros(size(trainData, 1), 600)];
    testLabels = {testDat.label}';
    trainLabels = {trainDat.label}';
    
    for i=1:numel(trainDat)
        disp(['proccesing image ... ', trainDat(i).path]);
        wordmap = getVisualWords(getImage(trainDat(i).path), filterbank, dictionary);
        feats = getImageFeatures(wordmap, 600);
        trainData(i, end-599:end) = feats;
    end
    
    for i=1:numel(testDat)
        disp(['proccesing image ... ', trainDat(i).path]);
        wordmap = getVisualWords(getImage(testDat(i).path), filterbank, dictionary);
        feats = getImageFeatures(wordmap, 600);
        testData(i, end-599:end) = feats;
    end
    
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

