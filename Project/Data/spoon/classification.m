fid = fopen('1503609551913.txt');
tline = fgetl(fid);
outFile = fopen('EatingData_IMU.txt','w');
%{
for c=1:4
    s = "EA";
   fprintf(outFile, "%s%d, %s\n", s, c, "OX");
   fprintf(outFile, "%s%d, %s\n", s, c, "OY");
   fprintf(outFile, "%s%d, %s\n", s, c, "OZ");
   fprintf(outFile, "%s%d, %s\n", s, c, "OZ");
   fprintf(outFile, "%s%d, %s\n", s, c, "AX");
   fprintf(outFile, "%s%d, %s\n", s, c, "AY");
   fprintf(outFile, "%s%d, %s\n", s, c, "AX");
   fprintf(outFile, "%s%d, %s\n", s, c, "GX");
   fprintf(outFile, "%s%d, %s\n", s, c, "GY");
   fprintf(outFile, "%s%d, %s\n", s, c, "GZ");
 end
 %}
fclose(outFile);
EA1OX = ["EA1" "OX"];
EA1OY = ["EA1" "OY"];
EA1OZ = ["EA1" "OZ"];
EA1OW = ["EA1" "OW"];
EA1AX = ["EA1" "AX"];
EA1AY = ["EA1" "AY"];
EA1AZ = ["EA1" "AZ"];
EA1GX = ["EA1" "GX"];
EA1GY = ["EA1" "GY"];
EA1GZ = ["EA1" "GZ"];
EA2OX = ["EA2" "OX"];
EA2OY = ["EA2" "OY"];
EA2OZ = ["EA2" "OZ"];
EA2OW = ["EA2" "OW"];
EA2AX = ["EA2" "AX"];
EA2AY = ["EA2" "AY"];
EA2AZ = ["EA2" "AZ"];
EA2GX = ["EA2" "GX"];
EA2GY = ["EA2" "GY"];
EA2GZ = ["EA2" "GZ"];
EA3OX = ["EA3" "OX"];
EA3OY = ["EA3" "OY"];
EA3OZ = ["EA3" "OZ"];
EA3OW = ["EA3" "OW"];
EA3AX = ["EA3" "AX"];
EA3AY = ["EA3" "AY"];
EA3AZ = ["EA3" "AZ"];
EA3GX = ["EA3" "GX"];
EA3GY = ["EA3" "GY"];
EA3GZ = ["EA3" "GZ"];
EA4OX = ["EA4" "OX"];
EA4OY = ["EA4" "OY"];
EA4OZ = ["EA4" "OZ"];
EA4OW = ["EA4" "OW"];
EA4AX = ["EA4" "AX"];
EA4AY = ["EA4" "AY"];
EA4AZ = ["EA4" "AZ"];
EA4GX = ["EA4" "GX"];
EA4GY = ["EA4" "GY"];
EA4GZ = ["EA4" "GZ"];
while ischar(tline)
    %disp(tline);
    data = allwords(tline);
    disp(data(1,1))
    disp(data(1,2))
    disp(data(1,3))
    ea = strcat('EA', data(1,3));
    tline = fgetl(fid);
    ts = fopen('VideoFrameToTSMapping_IMU.txt');
    tsline = fgetl(ts);
    while ischar(tsline)
        tsline = fgetl(ts);
        tslinesplit = allwords(tsline);
        if strcmpi(tslinesplit(1,1), data(1,1))
            ts1 = tslinesplit(1,2);
        elseif strcmpi(tslinesplit(1,1), data(1,2))
            ts2 = tslinesplit(1,2);
        end
    end
    fclose(ts);
    disp(ts1);
    disp(ts2);
    imu = fopen('1503609551913_IMU.txt');
    imuline = fgetl(imu);
    while ischar(imuline)
        imulinesplit = allwords(imuline);
        x = str2num(cell2mat(imulinesplit(1,1)));
        if str2num(cell2mat(imulinesplit(1,1))) >= str2num(cell2mat(ts1)) & str2num(cell2mat(imulinesplit(1,1))) <= str2num(cell2mat(ts2))
            disp(imuline);
            imusplit = strsplit(imuline, ',');
            %disp(imusplit(1,2))
            if data(1,3) == "1"
                EA1OX = [EA1OX imusplit(1,2)];
                EA1OY = [EA1OY imusplit(1,3)];
                EA1OZ = [EA1OZ imusplit(1,4)];
                EA1OW = [EA1OW imusplit(1,5)];
                EA1AX = [EA1AX imusplit(1,6)];
                EA1AY = [EA1AY imusplit(1,7)];
                EA1AZ = [EA1AZ imusplit(1,8)];
                EA1GX = [EA1GX imusplit(1,9)];
                EA1GY = [EA1GY imusplit(1,10)];
                EA1GZ = [EA1GZ imusplit(1,11)];
            elseif data(1,3) == "2"
                EA2OX = [EA2OX imusplit(1,2)];
                EA2OY = [EA2OY imusplit(1,3)];
                EA2OZ = [EA2OZ imusplit(1,4)];
                EA2OW = [EA2OW imusplit(1,5)];
                EA2AX = [EA2AX imusplit(1,6)];
                EA2AY = [EA2AY imusplit(1,7)];
                EA2AZ = [EA2AZ imusplit(1,8)];
                EA2GX = [EA2GX imusplit(1,9)];
                EA2GY = [EA2GY imusplit(1,10)];
                EA2GZ = [EA2GZ imusplit(1,11)];
            elseif data(1,3) == "3"
                EA3OX = [EA3OX imusplit(1,2)];
                EA3OY = [EA3OY imusplit(1,3)];
                EA3OZ = [EA3OZ imusplit(1,4)];
                EA3OW = [EA3OW imusplit(1,5)];
                EA3AX = [EA3AX imusplit(1,6)];
                EA3AY = [EA3AY imusplit(1,7)];
                EA3AZ = [EA3AZ imusplit(1,8)];
                EA3GX = [EA3GX imusplit(1,9)];
                EA3GY = [EA3GY imusplit(1,10)];
                EA3GZ = [EA3GZ imusplit(1,11)];
            elseif data(1,3) == "4"
                EA4OX = [EA4OX imusplit(1,2)];
                EA4OY = [EA4OY imusplit(1,3)];
                EA4OZ = [EA4OZ imusplit(1,4)];
                EA4OW = [EA4OW imusplit(1,5)];
                EA4AX = [EA4AX imusplit(1,6)];
                EA4AY = [EA4AY imusplit(1,7)];
                EA4AZ = [EA4AZ imusplit(1,8)];
                EA4GX = [EA4GX imusplit(1,9)];
                EA4GY = [EA4GY imusplit(1,10)];
                EA4GZ = [EA4GZ imusplit(1,11)];
            end
            %ea1 = [ea1 imusplit(1,2)];
            
        end
        imuline = fgetl(imu);
    end
    fclose(imu);
    %break;
end
res = fopen("EatingData_IMU.txt", 'w');
fprintf(res, "%s, ", EA1OX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA1OY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA1OZ);
fprintf(res, "\n");
fprintf(res, "%s, ", EA1OW);
fprintf(res, "\n");
fprintf(res, "%s, ", EA1AX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA1AY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA1AZ);
fprintf(res, "\n");
fprintf(res, "%s, ", EA1GX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA1GY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA1GZ);
fprintf(res, "\n");

fprintf(res, "%s, ", EA2OX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA2OY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA2OZ);
fprintf(res, "\n");
fprintf(res, "%s, ", EA2OW);
fprintf(res, "\n");
fprintf(res, "%s, ", EA2AX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA2AY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA2AZ);
fprintf(res, "\n");
fprintf(res, "%s, ", EA2GX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA2GY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA2GZ);
fprintf(res, "\n");

fprintf(res, "%s, ", EA3OX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA3OY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA3OZ);
fprintf(res, "\n");
fprintf(res, "%s, ", EA3OW);
fprintf(res, "\n");
fprintf(res, "%s, ", EA3AX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA3AY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA3AZ);
fprintf(res, "\n");
fprintf(res, "%s, ", EA3GX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA3GY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA3GZ);
fprintf(res, "\n");

fprintf(res, "%s, ", EA4OX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA4OY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA4OZ);
fprintf(res, "\n");
fprintf(res, "%s, ", EA4OW);
fprintf(res, "\n");
fprintf(res, "%s, ", EA4AX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA4AY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA4AZ);
fprintf(res, "\n");
fprintf(res, "%s, ", EA4GX);
fprintf(res, "\n");
fprintf(res, "%s, ", EA4GY);
fprintf(res, "\n");
fprintf(res, "%s, ", EA4GZ);
fprintf(res, "\n");
%{
for k=1:4
   eanum = strcat('EA', num2str(k));
   eanum1 = eanum+"OX";
   fprintf(res, "%s, ", eanum1);
   fprintf(res, "\n");
   eanum2 = eanum+"OY";
   fprintf(res, "%s, ", eanum2);
   fprintf(res, "\n");
   eanum3 = eanum+"OY";
   fprintf(res, "%s, ", eanum3);
   fprintf(res, "\n");
   eanum4 = eanum+"OW";
   fprintf(res, "%s, ", eanum4);
   fprintf(res, "\n");
   eanum5 = eanum+"AX";
   fprintf(res, "%s, ", eanum5);
   fprintf(res, "\n");
   eanum6 = eanum+"AY";
   fprintf(res, "%s, ", eanum6);
   fprintf(res, "\n");
   eanum7 = eanum+"AZ";
   fprintf(res, "%s, ", eanum7);
   fprintf(res, "\n");
   eanum8 = eanum+"GX";
   fprintf(res, "%s, ", eanum8);
   fprintf(res, "\n");
   eanum9 = eanum+"GY";
   fprintf(res, "%s, ", eanum9);
   fprintf(res, "\n");
   eanum10 = eanum+"GZ";
   fprintf(res, "%s, ", eanum10);
   fprintf(res, "\n");
end
%}
fclose(res);
fclose(fid);