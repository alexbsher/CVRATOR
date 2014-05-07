function [ h ] = getImageFeatures( wordMap, dictionarySize )

    % Reshape wordMap into a single vector for input into hist
    single_vec = reshape(wordMap, 1, size(wordMap, 1)*size(wordMap, 2));
    dict_vec = 1:1:dictionarySize; 
    h = hist(single_vec, dict_vec);
    % Normalize the histogram
    h = h / norm(h, 1);
    h = h';

end