function [ wordMap ] = getVisualWords( I, filterBank, dictionary )

    [rows, cols] = size(I(:, :, 1));
    wordMap = zeros(rows, cols);
    responses = extractFilterResponse(I, filterBank);
    
    % Iterate over each pixel in the response
    for i = 1:size(responses, 1)
        d = pdist2(squeeze(responses(i, :, :)), dictionary);
        [~, index] = min(d, [], 2);
        wordMap(i, :) = index';
    end

end

