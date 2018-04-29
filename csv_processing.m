function data_org = cvs_processing()
    data = csv2cell('employment_projections.csv', 'fromfile');
    % Cols: 1) Occupation Title 2) SOC Code 3) Employment 2016 (thousands) 4) Employment 2026 (thousands) 
    %       5) Employment Change 2016 - 2026 (thousands) 6) Employment change 2016-2026 (%)
    %       7) Occupational openings, 2016-2026 annual average (thousands)
    %       8) 2017 median annual wage 9) Typical Entry level education
    %       10) Education code 11) Work related experience 12) Workex code
    %       13) typical on the job training 14) TR code
    % Final cell array desired format:
    %       1) Occupation Title 2) first two digits of SOC code? 3) Employment 2016
    %       (thousands) 4) Employment 2026 (thousands) 5) Employment change %
    %       6) Occupational openings, 2016-2026 annual average (thousands) 7)
    %       2017 mean annual wage (int) 8) Education code 9) Workex code 10) TR
    %       code
    [r, c] = size(data);
    col_names = cell(1, c);
    for i = 1:c
        col_names{1,i} = data{1,i};
    end

    %job_titles = cell(r-1,1);
    %SOC_codes = cell(r-1,1);
    %emp_16 = cell(r-1,1);
    %emp_26 = cell(r-1,1);
    %emp_change_perc = cell(r-1,1);
    %occ_opens = cell(r-1,1); 
    %mean_wage = cell(r-1,1);
    %edu_code = cell(r-1,1);
    %workex_code = cell(r-1,1);
    %tr_code = cell(r-1,1);
    data_org = cell(r-1,10);
    for j = 2:r
        %job_titles{j-1,1} = data{j,1};
        %SOC_codes{j-1,1} = str2double(data{j,2}(3:4));
        %emp_16{j-1,1} = str2double(data{j,3});
        %emp_26{j-1,1} = str2double(data{j,4});
        %emp_change_perc{j-1,1} = str2double(data{j,6});
        %occ_opens{j-1,1} = str2double(data{j,7});
        %mean_wage{j-1,1} = str2double(data{j,8});
        %edu_code{j-1,1} = str2double(data{j,10});
        %workex_code{j-1,1} = str2double(data{j,12});
        %tr_code{j-1,1} = str2double(data{j,14});

        data_org{j-1,1} = data{j,1};
        data_org{j-1,2} = str2double(data{j,2}(3:4));
        data_org{j-1,3} = str2double(data{j,3});
        data_org{j-1,4} = str2double(data{j,4});
        data_org{j-1,5} = str2double(data{j,6});
        data_org{j-1,6} = str2double(data{j,7});
        data_org{j-1,7} = str2double(data{j,8});
        data_org{j-1,8} = str2double(data{j,10});
        data_org{j-1,9} = str2double(data{j,12});
        data_org{j-1,10} = str2double(data{j,14});
end



    % SOC Key:
    % 11 - Management occupations
    % 13 - Business and Financial Operations Occupations
    % 15 - Computer and Mathematical Operations
    % 17 - Architecture and Engineering Occupations
    % 19 - Life, Physical, and Social Science Occupations
    % 21 - Community and Social Service Occupations
    % 23 - Legal Occupations
    % 25 - Educational Instruction and Library Occupation
    % 27 - Arts, Design, Entertainment, Sports, and Media Occupations
    % 29 - Healthcare Practitioners and Technical Occupations
    % 31 - Healthcare Support Occupations
    % 33 - Protective Service Occupations
    % 35 - Food Preparation and Serving Related Occupations
    % 37 - Building and Grounds Cleaning and Maintenance Occupations
    % 39 - Personal Care and Service Occupations
    % 41 - Sales and Related Occupations
    % 43 - Office and Administrative Support Occupations
    % 45 - Farming, Fishing, and Forestry Occupations
    % 47 - Construction and Extraction Occupations
    % 49 - Installation, Maintenance, and Repair Occupations
    % 51 - Production Occupations
    % 53 - Transportation and Material Moving Occupations
    % 55 - Military Specific Occupations

    % Education Code Key: 
    % 1 - Doctoral/Professional Degree
    % 2 - Master's Degree
    % 3 - Bachelor's Degree
    % 4 - Associate's Degree
    % 5 - Postsecondary nondegree award
    % 6 - Some college, no degree
    % 7 - High school diploma or equivalent
    % 8 - No formal education requirements

    % Work experience: 
    % 1 - 5 years or more
    % 2 - Less than 5 years
    % 3 - ??
    % 4 - None

    % on the job experience
    % 1 Internship/residency
    % 2 Apprenticeship
    % 3 Long term on the job training 
    % 4 Moderate on the job training 
    % 5 Short-term on the job training
    % 6 None
end

