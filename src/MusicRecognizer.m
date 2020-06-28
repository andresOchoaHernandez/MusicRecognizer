clear;
clc;
sep='=====================================================================';

%ALREADY DONE:loadDataset();

disp('Loading dataset...');
tic
load('songsDataset');
toc
disp('Dataset loaded correctly');

disp(sep);

[test,Ftest]=recordAudio();
disp(sep);
disp('playing recorded sample...');
sound(test,Ftest,16);
disp(sep);

figure;set(gcf,'name','test','IntegerHandle','off');plot(test);

%Cross-correlation between the recorded sample and the sogns in the dataset
for i=1:20
    [xc{i},lag{i}]=xcorr(dataset{i},test,'none');
end

%Picking the maximum values of the cross-correlation
for i=1:20
    maxValues{i}=max(abs(xc{i}));
end

%Casting from cell-array to matrix
maxValuesMatrix=cell2mat(maxValues);
tmp=maxValuesMatrix;

%Scaling maxValuesMatrix to 0-1
Minimum=min(maxValuesMatrix);
Maximum=max(maxValuesMatrix);
maxValuesMatrix=(maxValuesMatrix-Minimum)/(Maximum-Minimum);
matchingPercentual=maxValuesMatrix*100;

figure; set(gcf,'name','Peak values for each song','IntegerHandle','off');
stem([1:20],tmp,'--o');xlabel('songs');ylabel('xcorr max values');

figure; set(gcf,'name','Song matching','IntegerHandle','off');
plot(dataset{find(maxValuesMatrix==max(maxValuesMatrix))}); title(strcat('song-',num2str(find(maxValuesMatrix==max(maxValuesMatrix)))));

disp(sep);

for i=1:20
    fprintf('song #%d matching at - ',i);
    disp(strcat(int2str(matchingPercentual(i)),'%'));
end













