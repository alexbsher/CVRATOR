function [ filter_response ] = extractFilterResponse( I, filterbank )
% Takes an Image and a Filterbank, iterates over all the pixels in the 
% Image and produces an Length x Width x 3F Matrix of Filter Responses
% (Three outputs per pixel (r, g, b)

    if ~isfloat(I)
        I = double(I)/255.0;
        [L_i, a_i, b_i] = RGB2Lab(I);
    else
        [L_i, a_i, b_i] = RGB2Lab(I);
    end
    
    % Pre-Allocate Response Matrix
    filter_response = zeros(size(I, 1), size(I, 2), 3*size(filterbank, 1));
    
    count = 1;
    for i=1:1:size(filterbank, 1)
                      
        filter_response(:, :, count) = imfilter(L_i, filterbank{i}, 'circular', 'same', 'conv');
        count = count + 1;
        filter_response(:, :, count) = imfilter(a_i, filterbank{i}, 'circular', 'same', 'conv');
        count = count +1;
        filter_response(:, :, count) = imfilter(b_i, filterbank{i}, 'circular', 'same', 'conv');
        count = count + 1;
        
    end
    
end

