function [api_data,xtlabs] = get_graph_data()
    stuff = webread('https://api.bls.gov/publicAPI/v2/timeseries/data/LNS13000000');
    % this is only for like 2 years >:( how do I get more!?!?!

    api_data = [0];
    for i = 1:length(stuff.Results.series.data)
        api_data(i) = str2num(stuff.Results.series.data{i}.value);
    end

    % data from Jan 2016 - March 2018 

    %months = 1:27;

    %plot(months, values)
    %xticks(months);
    xtlabs = {"1/16","","3/16","","5/16","","7/16","","9/16","","11/16","","1/17","","3/17","","5/17","","7/17","","9/17","","11/17","","1/18","","3/18"};

    %xticklabels({"1/16","","3/16","","5/16","","7/16","","9/16","","11/16","","1/17","","3/17","","5/17","","7/17","","9/17","","11/17","","1/18","","3/18"});
    %ylabel("Number of Unemployed Civilians");
end