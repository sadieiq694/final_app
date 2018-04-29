% function to subset array by interest  
% take a vector of career codes, returns all careers with those codes
function sub_int_data = int_sub(data, car_codes)
    codes = getcarcodes(car_codes);
    [r,c] = size(data);
    % get row numbers of all rows of specified education level 
    chosen_rows = [0]; % vector that will hold row numbers for all jobs requiring the given education level
    for k = 1:length(codes)
        count = 1;
        for i = 1:r
            if (data{i,2} == codes(k))
                chosen_rows(count) = i;
                count = count + 1;
            end
        end
    end
    % sort into correct order
    chosen_rows = sort(chosen_rows);
    % get all of the rows with row numbers in chosen_rows
    % preallocate size of cell array
    sub_int_data = cell(length(chosen_rows), c);
    count2 = 1;
    for j = 1:length(chosen_rows)
        for k = 1:c
            sub_int_data{count2,k} = data{chosen_rows(j),k};
        end
        count2 = count2 + 1; 
        %fprintf("%d\n", data{r,8}); (used this as a test)
    end
end