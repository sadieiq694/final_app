function ex = get_examples(str)
    star_idx = strfind(str, "*");
    ex = 
    %ex_str = str(star_idx(1)+2:end);
    % one more job than there is *
    % MAYBE CHANGE TO BE MORE COSMETICALLY PLEASING??
    %ex = ['']; % necessary to define as string array???
    %for i = 1:length(star_idx)
    %    name = str(star_idx(i)+1:star_idx(i+1)-1);
    %    ex(i) = name; 
    %end
    ex = name_ex(star_idx+2:end)
end