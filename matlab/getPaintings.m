function [ dats ] = getPaintings( label )

    artists = getLabels(['../features/',label]);
    
    dats = cell(0);
    for a = 1:numel(artists)
        worklist = dir(['../features/',label,'/',artists{a}]);
        for w = 1:numel(worklist)
            if ~worklist(w).isdir && strcmp(worklist(w).name,'desktop.ini') == 0
                dats{numel(dats)+1} = load_float_matrix(['../features/',label,'/',artists{a},'/',worklist(w).name]);
            end
        end
    end
end