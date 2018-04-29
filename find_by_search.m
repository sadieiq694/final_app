function search_results = find_by_search(data, keys)
    rows = zeros(1,4);
    [r c] = size(data); 
    count = 1;
    for i = 1:length(keys)
        rec = keys(i);
        for j = 1:r
            name = data{j,1};
            if(contains(name, rec))
                rows(count) = j;
                count = count + 1; 
            end
        end
    end
    % now we have indices of all the rows containing at least one key. Sort
    % and get rid of repeats
    rows = unique(rows); 
    search_results = cell(length(rows), c);
    count2 = 1;
    for k = 1:length(rows)
        for m = 1:c
            search_results{count2,m} = data{rows(k),m};
        end
        count2 = count2 + 1; 
        %fprintf("%d\n", data{r,8}); (used this as a test)
    end
end