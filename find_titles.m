function title_list = find_titles(data_list)
    [r c] = size(data_list);
    title_list = cell(1, r);
    for i = 1:r
        title_list{1,i} = get_title(data_list{i, 1});
    end
end

