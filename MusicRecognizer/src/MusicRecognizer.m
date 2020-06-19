clear;
clc;

%%Load songs in database
range=[1, 96000*45];

[Y1,F1]=audioread('..\songsCollection\funky.mp3',range);
[Y2,F2]=audioread('..\songsCollection\diana.mp3',range);
[Y3,F3]=audioread('..\songsCollection\never.mp3',range);
[Y4,F4]=audioread('..\songsCollection\freestyler.mp3',range);
[Y5,F5]=audioread('..\songsCollection\freeBird.mp3',range);
[Y6,F6]=audioread('..\songsCollection\heyJoe.mp3',range);
[Y7,F7]=audioread('..\songsCollection\holdTheLine.mp3',range);
[Y8,F8]=audioread('..\songsCollection\hotelCalifornia.mp3',range);
[Y9,F9]=audioread('..\songsCollection\iLoveRockAndRoll.mp3',range);
[Y10,F10]=audioread('..\songsCollection\internetFriends.mp3',range);
[Y11,F11]=audioread('..\songsCollection\iWantToKnowWhatLoveIs.mp3',range);
[Y12,F12]=audioread('..\songsCollection\lost.mp3',range);
[Y13,F13]=audioread('..\songsCollection\moonRiver.mp3',range);
[Y14,F14]=audioread('..\songsCollection\rockTheCasbah.mp3',range);
[Y15,F15]=audioread('..\songsCollection\somebodyToLove.mp3',range);
[Y16,F16]=audioread('..\songsCollection\someWhereIBelong.mp3',range);
[Y17,F17]=audioread('..\songsCollection\t69.mp3',range);
[Y18,F18]=audioread('..\songsCollection\theRealSlimShady.mp3',range);
[Y19,F19]=audioread('..\songsCollection\tinyDancer.mp3',range);
[Y20,F20]=audioread('..\songsCollection\wishYouWhereHere.mp3',range);

%%Store the songs in a gallery
dataset{1}=Y1(:,1);
dataset{2}=Y2(:,1);
dataset{3}=Y3(:,1);
dataset{4}=Y4(:,1);
dataset{5}=Y5(:,1);
dataset{6}=Y6(:,1);
dataset{7}=Y7(:,1);
dataset{8}=Y8(:,1);
dataset{9}=Y9(:,1);
dataset{10}=Y10(:,1);
dataset{11}=Y11(:,1);
dataset{12}=Y12(:,1);
dataset{13}=Y13(:,1);
dataset{14}=Y14(:,1);
dataset{15}=Y15(:,1);
dataset{16}=Y16(:,1);
dataset{17}=Y17(:,1);
dataset{18}=Y18(:,1);
dataset{19}=Y19(:,1);
dataset{20}=Y20(:,1);

%%Plot songs in database
figure; set(gcf,'name','Dataset','IntegerHandle','off');
for i=1:20
   subplot(4,5,i);plot(dataset{i}(1:96000*2));title(strcat('song-',int2str(i))); 
end

%%Load audio test to confront with the sogns in database
test=Y11(96000*10:96000*15,1);

%%Confront to with the stored songs with cross-correlation
for i=1:20
    [xc{i},lag{i}]=xcorr(dataset{i},test);
end

%%Plot the results of the confrontation
figure; set(gcf,'name','Correlation','IntegerHandle','off');
for i=1:20
   subplot(4,5,i);plot(lag{i},xc{i});title(strcat('Correlation-',int2str(i))); 
end

%%Calculate/Print percentage of equality


%%Display the song that matches