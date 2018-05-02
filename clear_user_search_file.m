function result = clear_user_search_file()
    %file_name = "user_searches.txt";
    if exist("user_searches.txt", "file")
        delete user_searches.txt; 
        result = "File deleted";
    else
        result = "File did not exist";
    end
end