% function to write to a file
function writetofile(job_cell)
    jobname = get_title(job_cell{1,1});
    fid = fopen("user_searches.txt", "a");
    fprintf(fid, "Job title: %s\n", jobname);
    fprintf(fid, "Projected Employment change from 2016 to 2026 (percentage): %s percent \n", num2str(job_cell{1,5}));
    fprintf(fid, "2017 mean annual wage: $%s \n\n", num2str(job_cell{1,7}));
    fclose(fid);
end

% 1) Occupation Title 2) first two digits of SOC code? 3) Employment 2016
% (thousands) 4) Employment 2026 (thousands) 5) Employment change %
% 6) Occupational openings, 2016-2026 annual average (thousands) 7)
% 2017 mean annual wage (int) 8) Education code 9) Workex code 10) TR code

% PUT THIS IN APP (GET BUTTONS FOR IT)