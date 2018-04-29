% function to subset array by education level 
function sub_sal_data = salary_sub(data, min, max)
    [r,c] = size(data);
    % get row numbers of all rows of specified education level 
    if(min > max) 
        fprintf("Invalid bounds");
        sub_sal_data = {0};
    else
        chosen_rows = 1:2; % vector that will hold row numbers for all jobs requiring the given education level
        count = 1;
        for i = 1:r
            if (isnan(data{i,7}))
                chosen_rows(count) = i;
                count = count + 1;
            else
                if (data{i,7} > min && data{i,7} < max)
                    chosen_rows(count) = i;
                    count = count + 1;
                end
            end
        end
        % get all of the rows with row numbers in chosen_rows
        % preallocate size of cell array
        if (chosen_rows(1) == 0)
            sub_sal_data = "NO DATA"; 
        else
            sub_sal_data = cell(length(chosen_rows), c);
            count2 = 1;
            for j = 1:length(chosen_rows)
                for k = 1:c
                    sub_sal_data{count2,k} = data{chosen_rows(j),k};
                end
                count2 = count2 + 1; 
                %fprintf("%d\n", data{r,8}); (used this as a test)
            end
        end
    end
end