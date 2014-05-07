function [ dats ] = getImageNames( labels )

    dats = cell(0);
    for l = 1:numel(labels)
        label = labels{l};

        artists = getLabels(['../features/',label]);

        for a = 1:numel(artists)
            worklist = dir(['../data/',label,'/',artists{a}]);
            for w = 1:numel(worklist)
                if ~worklist(w).isdir && strcmp(worklist(w).name,'desktop.ini') == 0 && strcmp(worklist(w).name,'.DS_Store') == 0
                    dats{numel(dats)+1} = strcat(['../data/',label,'/',artists{a},'/',worklist(w).name]);
                end
            end
        end
    end
end