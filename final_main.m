%71b6da5094ad4048aa7c53b9b8958000

% Get data from csv file in the following format
% Final cell array desired format:
%    1) Occupation Title 2) first two digits of SOC code? 3) Employment 2016
%    (thousands) 4) Employment 2026 (thousands) 5) Employment change %
%    6) Occupational openings, 2016-2026 annual average (thousands) 7)
%    2017 mean annual wage (int) 8) Education code 9) Workex code 10) TR code
data = csv_processing();

% functions to be used by app: SEARCH BY CRITERIA
sub_edu_data = edu_sub(data, 3); % by education, works!!! :))) 
sub_sal_data = salary_sub(data, 30000, 50000); % by salary, works :))))
sub_exp_data = workex_sub(data, 3); % by work experience, works, but 3 is really weird... idk whats going on with it
% sort by interest: take a vector of career codes and return all jobs
% matching one of these codes
sub_int_data = int_sub(data, [5 6]); % by interest, yay it works!!! :)) 
% note that the 5, 6 refer to the groupings we made to simplify the number
% of job categories there are 

% write function using all criteria to get the specified jobs (takes
% arguments for all of the subsetting functions (EDU, INTEREST, SAL)
criteria_search(data, 2, 100000, 10000, [1 2 3 4 5])

% write string function to just get job title (not examples)
get_title(data{400,1}) % Works!! 
% function to get list of titles
titles = find_titles(data);

% write string function to get list of example careers for a given job
% title/category
% make this general so it can be used to process the user's search input as
% well!!!
get_examples(data{400,1}) % kind of works, might wanna make it prettier

% write search function to find jobs based on keywords
search_results = find_by_search(data, ["math", "engineer"]) % works!!


%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%% API FUN TIME %%%

stuff = webread('https://api.bls.gov/publicAPI/v2/timeseries/data/LNS13000000');
% this is only for like 2 years >:( how do I get more!?!?!

values = [0];
for i = 1:length(stuff.Results.series.data)
    values(i) = str2num(stuff.Results.series.data{i}.value);
end

API_data = stuff.Results.series.data;
% data from Jan 2016 - March 2018 

months = 1:27;

plot(months, values)
xticks(months);
xticklabels({"1/16","","3/16","","5/16","","7/16","","9/16","","11/16","","1/17","","3/17","","5/17","","7/17","","9/17","","11/17","","1/18","","3/18"});
ylabel("Number of Unemployed Civilians");


