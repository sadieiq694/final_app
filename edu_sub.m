% function to subset array by education level 
% education codes: 
% 1 - Doctoral/Professional Degree
% 2 - Master's Degree
% 3 - Bachelor's Degree
% 4 - Associate's Degree
% 5 - Postsecondary nondegree award
% 6 - Some college, no degree
% 7 - High school diploma or equivalent
% 8 - No formal education requirements
function sub_edu_data = edu_sub(data, edu_code)
    [r,c] = size(data);
    % get row numbers of all rows of specified education level 
    if(edu_code > 8 || edu_code <= 0) 
        fprintf("Invalid education code");
        sub_edu_data = {0};
    else
        chosen_rows = 1:2; % vector that will hold row numbers for all jobs requiring the given education level
        count = 1;
        for i = 1:r
            if (data{i,8} == edu_code)
                chosen_rows(count) = i;
                count = count + 1;
            end
        end
        % get all of the rows with row numbers in chosen_rows
        % preallocate size of cell array
        if(chosen_rows(1) == 0)
            sub_edu_data = "NO DATA";
        else
            sub_edu_data = cell(length(chosen_rows), c);
            count2 = 1;
            for j = 1:length(chosen_rows)
                for k = 1:c
                    sub_edu_data{count2,k} = data{chosen_rows(j),k};
                end
                count2 = count2 + 1; 
                %fprintf("%d\n", data{r,8}); (used this as a test)
            end
        end
    end
end