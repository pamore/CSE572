vidObj = VideoReader('1503609551913.mp4');
numFrames = ceil(vidObj.FrameRate*vidObj.Duration); %number of frames
vidDuration = vidObj.Duration * 1000; %duration in millisecond
NumMsPerFrame = floor(vidDuration/numFrames); 
outFile = fopen('VideoFrameToTSMapping_EMG.txt','w'); % No of millisecodns per Frame
lastFrameTS =  1503609785514; %TS of last video frame in IMU file

while numFrames > 0
    fprintf(outFile, "%d, %d", numFrames, lastFrameTS);
    numFrames = numFrames - 1;
    lastFrameTS = lastFrameTS - NumMsPerFrame;
    fprintf(outFile, "\n");
end

fclose(outFile);