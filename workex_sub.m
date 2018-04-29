% function to subset array by education level 
% workex codes: 
% 1 - 5 years or more
% 2 - Less than 5 years
% 3 - ??
% 4 - None
function sub_workex_data = workex_sub(data, workex_code)
    [r,c] = size(data);
    % get row numbers of all rows of specified education level 
    if(workex_code > 4 || workex_code <= 0) 
        fprintf("Invalid education code");
        sub_workex_data = {0};
    else
        chosen_rows = 1:2; % vector that will hold row numbers for all jobs requiring the given education level
        count = 1;
        for i = 1:r
            if (data{i,9} == workex_code)
                chosen_rows(count) = i;
                count = count + 1;
            end
        end
        % get all of the rows with row numbers in chosen_rows
        % preallocate size of cell array
        sub_workex_data = cell(length(chosen_rows), c);
        count2 = 1;
        for j = 1:length(chosen_rows)
            for k = 1:c
                sub_workex_data{count2,k} = data{chosen_rows(j),k};
            end
            count2 = count2 + 1; 
            %fprintf("%d\n", data{r,8}); (used this as a test)
        end
    end
end