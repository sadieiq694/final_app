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

% write string function to just get job title (not examples)
get_title(data{400,1}) % Works!! 

% write string function to get list of example careers for a given job
% title/category
% make this general so it can be used to process the user's search input as
% well!!!
get_examples(data{400,1}) % kind of works, might wanna make it prettier

% write search function to find jobs based on keywords




































% set key and URL
url = 'http://api.bls.gov/publicAPI/v2/timeseries/data/';
key = '71b6da5094ad4048aa7c53b9b8958000';

b = bls([], '71b6da5094ad4048aa7c53b9b8958000');

%data = fetch(b, 'PRS85006092', 'catalog', 'true');
c = b;
s = 'PRS85006092';

% this is literally just setting constant values
BLS_RESPONSE_SUCCESS = 'REQUEST_SUCCEEDED';
BLS_RESPONSE_CATALOG_FAIL = 'unable to get catalog data';
% this creates a cell array of four words why do we need this
validCatalogTrue = {'true','on'};
validCatalogFalse = {'false','off'};
validCatalog = {validCatalogTrue{:}, validCatalogFalse{:}};
% these lines set the default to the past 10 years 
defaultCatalog = 0;
defaultEndYear = datestr(now(), 'yyyy');
defaultStartYear = num2str(str2double(defaultEndYear)-9);
% this is a function that checks if a year entered by the user is valid
validationYear = ...
  @(x) (ischar(x) && regexp(x, '\d\d\d\d')) || ...
       (isnumeric(x) && isscalar(x) && (x>=1900)); 
% function that checks if a catalog is valid (1 or 0)
validationCatalog = ...
    @(x) (ischar(x) && any(strcmpi(x, validCatalog))) || ...
         (isnumeric(x) && isscalar(x));
% function that checks if a series is valid :P
validationSeries = ...
  @(x) ischar(x) || iscellstr(x);
% creates an inputParser object
p = inputParser();
addRequired(p, 's', validationSeries); % adds parameter s to parsers 
addOptional(p, 'startyear', defaultStartYear, validationYear); %adds year params
addOptional(p, 'endyear', defaultEndYear, validationYear);
addParameter(p, 'catalog', defaultCatalog, validationCatalog); % adds catalog params
parse(p, s, 'catalog', 'true'); %parses stuff??? Not sure
%sets start year and end year
startYear = p.Results.startyear;
endYear = p.Results.endyear;
% not really sure what this does... looks like it is checking for a valid
% catalog
if ischar(p.Results.catalog) && ...
  any(strcmpi(p.Results.catalog, validCatalogTrue))
  catalog = 1;
elseif isnumeric(p.Results.catalog) && p.Results.catalog > 0
  catalog = 1;
else
  catalog = 0;
end

% BLS specifies uppercase series.
if ischar(s)
s = cellstr(s);
end
s = upper(s);

% Stup request and payload.
url = c.url;
options = weboptions('MediaType','application/json');
dates = {'startyear', startYear, 'endyear', endYear};
params = {'catalog', catalog};

% Try registration key
if ~isempty(c.key)
  auth = {'registrationKey',c.key};
else
  auth = {};
end

% so.... we would just add more series ids? modify code to do this!?!?!
% write a damn function 
data = struct('seriesid',{s}, ...
            dates{:}, ...
            params{:}, ...
            auth{:});

% Submit POST request to BLS.
  try
    response = webwrite(url, data, options);
  catch err
    error('Error connecting to BLS servers.');
  end

  % Response okay?
  if ~strcmpi(response.status,BLS_RESPONSE_SUCCESS)
    warning('Request failed with message ''%s''',response.message{:});
    d.SeriesID = [];
    d.Data = [];
    return;
  end















% set web options, dates??
options = weboptions('MediaType','application/json'); % set mediatype to application/json
options = weboptions('MediaType','application/x-www-form-urlencoded'); % set mediatype to application/json
% maybe specify dates later? figure out how to access data first :P
% dates = {'startyear', startYear, 'endyear', endYear}; % startYear, endYear variables

% get data??? I hope???
response = webread(url, 'seriesid','LAUCN040010000000005', options);



%Set up request and payload.
  
  params = {'catalog', catalog};
  
  data = struct('seriesid',{s}, ...
                dates{:}, ...
                params{:}, ...
                auth{:});
            
  % Submit POST request to BLS.
  try
    response = webwrite(url, data, options);
  catch err
    error('Error connecting to BLS servers.');
  end