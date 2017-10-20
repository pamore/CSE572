fid = fopen('1503609551913_label.csv');
%# Get file size.
fseek(fid, 0, 'eof');
fileSize = ftell(fid);
frewind(fid);
%# Read the whole file.
data = fread(fid, fileSize, 'uint8');
%# Count number of line-feeds and increase by one.
VidnumLines = sum(data == 10) + 1;
fclose(fid);

fid = fopen('1503609551913_IMU.txt');
%# Get file size.
fseek(fid, 0, 'eof');
fileSize = ftell(fid);
frewind(fid);
%# Read the whole file.
data = fread(fid, fileSize, 'uint8');
%# Count number of line-feeds and increase by one.
IMUnumLines = sum(data == 10) + 1;
fclose(fid);



%disp(numLines)

vidFile = csvread("1503609551913_label.csv");
i=1;
j = 1;
v=vidFile(1,:);
outFile = fopen('IMUMapping.txt','w');
while i < VidnumLines 
    imuFile = csvread("1503609551913_IMU.txt");
    while j < IMUnumLines 
        if imuFile(j,1) > vidFile(i,1) && imuFile(j,1) < vidFile(i+1,1)
            fprintf(outFile, "%d,", i);
            fprintf(outFile, '%d,', imuFile(j,1));
            fprintf(outFile, '%f,', imuFile(j,2));
            fprintf(outFile, '%f,', imuFile(j,3));
            fprintf(outFile, '%f,', imuFile(j,4));
            fprintf(outFile, '%f,', imuFile(j,5));
            fprintf(outFile, '%f,', imuFile(j,6));
            fprintf(outFile, '%f,', imuFile(j,7));
            fprintf(outFile, '%f,', imuFile(j,8));
            fprintf(outFile, '%f,', imuFile(j,9));
            fprintf(outFile, '%f,', imuFile(j,10));
            fprintf(outFile, '%f', imuFile(j,11));
        end
        if imuFile(j,1) > vidFile(i+1,1)
            break;
        end
        j=j+1;
        fprintf(outFile, '\n');
    end
    i=i+1;
end
fclose(outFile);