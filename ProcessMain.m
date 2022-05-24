maindir='/Users/bisgin/Documents/RESEARCH/NCTR/BeetleDeep/Beetle images_Transmitted light_100x/';
D = dir('/Users/bisgin/Documents/RESEARCH/NCTR/BeetleDeep/Beetle images_Transmitted light_100x/');
for k = 3:length(D)
    currD = strcat(maindir, D(k).name);
    if(isfolder(currD))
        %cd(currD);
        fList = dir(currD);
        for j=3:length(fList)
            if(regexp(fList(j).name, '_B_')>0)
            fprintf(fList(j).name)
            fprintf('\n')
            filename = strcat(currD, '/', fList(j).name);
            cropSubHB1(filename, 448, 8, 2);
            end
        end
    end
end