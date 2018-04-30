% NOW WORKS FOR ENTERING EXACT NAME ONLY!!!!
function search_results = find_by_search(data, key)
    rows = [0];
    [r, c] = size(data); 
    count = 1;
    fprintf("%d\n",r);
    fprintf("%s\n", key);
    for i = 1:r
        name = get_title(data{i,1});
        %fprintf("%s\n",name);
        if(strcmp(name, key))
            rows(count) = i;
            fprintf("%s\n", name);
            count = count + 1; 
        end
    end
    fprintf("%d\n",length(rows));
    fprintf("%d\n",rows);
    % now we have indices of the row containing the key. Sort
    % and get rid of repeats
    if(rows(1)~=0)
        %rows = unique(rows); 
        search_results = cell(1, c);
        %count2 = 1;
        %for k = 1:length(rows)
            for m = 1:c
                search_results{1,m} = data{rows,m};
            end
            %count2 = count2 + 1; 
            %fprintf("%d\n", data{r,8}); (used this as a test)
        %end
    else
        search_results = "No Matches";
    end
end