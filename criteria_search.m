function sub_data = criteria_search(data, edu_level, salMax, salMin, ...
    interest_vec)

sub_data = edu_sub(data, edu_level); % by education
if(sub_data ~= "NO DATA")
    sub_data = salary_sub(sub_data, salMax, salMin); % by salary
    if(sub_data ~= "NO DATA")
        sub_data = int_sub(sub_data, interest_vec); % by interest
    end      
end 
end