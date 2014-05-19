function [ filter_bank, dictionary ] = getFilterBankAndDictionary( image_names )
%GETFILTERBANKANDDICTIONARY Summary of this function goes here
%   Detailed explanation goes here

% Get Filter Bank
filter_bank = createFilterBank();

% Params for use in this function:
alpha = 150;
K = 600;

% alpha*T x 3*F matrix for storing output
filter_responses = zeros(alpha*length(image_names), 3*length(filter_bank));

for i=1:length(image_names)
    
    % Read Image
    I = imread(image_names{i});
    if length(size(I)) < 3
        continue
    end
    disp(strcat('Proccessing Image ', image_names{i}))
    
    % Generate Random indices
    p = randperm(numel(I(:, :, 1)), alpha);
    [r, c] = ind2sub(size(I(:, :, 1)), p);
    
    % Get filter responses
    filt_response = extractFilterResponse(I, filter_bank);
    
    for j = 1:alpha
        filter_responses(alpha*(i-1)+j, :) = squeeze(filt_response(r(j), c(j), :));
    end
end

    [~, dictionary] = kmeans(filter_responses, K, 'EmptyAction', 'drop');
    
    
end

