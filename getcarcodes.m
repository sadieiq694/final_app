function carcodes = getcarcodes(vec)
% convert a vector of 1-8 to a vector of the codes in the BLS data
% education codes: 
% 1 - Business (11, 43, 13)
% 2 - Sales (41)
% 3 - Law (23)
% 4 - Military (55)
% 5 - Education/service (21, 25)
% 6 - healthcare (19, 29, 31)
% 7 - food/personal care (35, 39)
% 8 - protective services (33)
% 9 - engineering, math, computers (15, 17)
% 10 - FFF (45)
% 11 - CMM (47, 49, 53, 37, 51)
% 12 - AESetc (27)
carcodes = [0];
idx = 1;
for i = 1:length(vec)
    code = vec(i);
    switch code
        case 1
            carcodes(idx:idx+2) = [11 13 43];
            idx = idx + 3;
        case 2
            carcodes(idx) = [41];
            idx = idx + 1;
        case 3
            carcodes(idx) = [23];
            idx = idx + 1;
        case 4
            carcodes(idx) = [55];
            idx = idx + 1;
        case 5
            carcodes(idx:idx+1) = [21 25];
            idx = idx + 2;
        case 6
            carcodes(idx:idx+2) = [19 29 31];
            idx = idx + 3;
        case 7 
            carcodes(idx:idx+1) = [35 39];
            idx = idx + 2;
        case 8
            carcodes(idx) = [33];
            idx = idx + 1;
        case 9
            carcodes(idx:idx+1) = [15 17];
            idx = idx + 2;
        case 10
            carcodes(idx) = [45];
            idx = idx + 1;
        case 11
            carcodes(idx:idx+4) = [47 49 53 37 51];
            idx = idx + 5;
        case 12
            carcodes(idx) = [27];
            idx = idx + 1;
        otherwise
            fprintf("error!")
    end
end
end