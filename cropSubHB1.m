
function[height, width, yindex, xindex, maxj, maxjbottom] = cropSubHB1(file, offset,count, testcount)
maindir = '/Users/bisgin/Documents/RESEARCH/NCTR/BeetleDeep';
im1=imread(file);
%im1=rgb2gray(im1);
[height, width, depth] = size(im1);
fprintf('size: %d %d', height, width);

[maxj, maxjbottom] =  edgeHB1(file);
offset = offset-1;
i=1
folder = split(file, '/');
dirlen = length(folder)
filename = folder{end};
filebase = split(filename, '.');
filebase = filebase{1};

while(i<=count)
    yindex = randi([1 height-offset]);
    xindex = randi([1 width-offset]);
    fprintf('indexes: %d %d', xindex, yindex);
    %if(yindex>=maxj(xindex) && yindex<=maxjbottom(xindex) && yindex+offset<=)
    if(yindex+offset<=maxjbottom(xindex) && yindex+offset<=maxjbottom(xindex+offset) && yindex+offset>=maxj(xindex+offset))
     fprintf('inside %d\n', i);
     %figure
     imsub = imcrop(im1, [xindex yindex offset offset]);
     subfolder = strcat(maindir,'/training/', folder{dirlen-1}, '_subs');
     if (exist(subfolder, 'dir')==0)
        mkdir(subfolder);
     end
     %fprintf(strcat(subfolder,'/', filebase, '_', int2str(i), '.tif'))
     imwrite(imsub, strcat(subfolder,'/', filebase, '_', int2str(i), '.tif'));
     i=i+1;
    end      
end
i=1;
 while(i<=testcount)
    yindex = randi([1 height-offset]);
    xindex = randi([1 width-offset]);
    fprintf('indexes: %d %d', xindex, yindex);
    %if(yindex>=maxj(xindex) && yindex<=maxjbottom(xindex) && yindex+offset<=)
    if(yindex+offset<=maxjbottom(xindex) && yindex+offset<=maxjbottom(xindex+offset) && yindex+offset>=maxj(xindex+offset))
     fprintf('inside %d\n', i);
     %figure
     imsub = imcrop(im1, [xindex yindex offset offset]);
     subfolder = strcat(maindir,'/test/', folder{dirlen-1}, '_subs');
     if (exist(subfolder, 'dir')==0)
        mkdir(subfolder);
     end
     %fprintf(strcat(subfolder,'/', filebase, '_', int2str(i), '.tif'))
     imwrite(imsub, strcat(subfolder,'/', filebase, '_', int2str(i), '.tif'));
     i=i+1;
    end
 end
 
end

