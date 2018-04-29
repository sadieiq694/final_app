function car_title = get_title(str)
    % gets the contents of the first column of the csv file (which contains
    % job titles and examples) and returns only the job title/broad
    % category
    star_idx = strfind(str, "    *");
    car_title = str(1:star_idx-1);
end