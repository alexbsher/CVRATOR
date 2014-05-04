function [ top_classes ] = topClassemes( data )

    classemes = textread('classemes.txt', '%s', 'delimiter', '\n');
    
    [x, i] = sort(sum(data));
    top_classes = i(1:5);
    classemes(top_classes)
    
end

