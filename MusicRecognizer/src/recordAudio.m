function [Y,F]=recordAudio()
disp('Start recording...');

timeOfRecording=10;
recObj=audiorecorder(44100,16,1);
recordblocking(recObj,timeOfRecording);

disp('Stop recording');

Y=getaudiodata(recObj);
F=recObj.SampleRate;

end