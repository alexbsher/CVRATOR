function displayLabels(labels)

    disp(' Labels are: ');

    for i = 1:numel(labels)
        disp([num2str(i),' : ',labels{i}])
    end

end