function result = init_user_search_file()
    if exist("user_searches.txt", "file")
        result = "File already exists";
    else
        fid = fopen("user_searches.txt", "w");
        fprintf(fid, "Past user searches:\n\n");
        fclose(fid);
        result = "File initialized";
    end