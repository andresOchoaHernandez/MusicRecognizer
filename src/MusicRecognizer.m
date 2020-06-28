%ALREADY DONE:loadDataset();
clear;
clc;
sep='=====================================================================';

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

for i=1:20
    [xc{i},lag{i}]=xcorr(dataset{i},test,'none');
end

for i=1:20
    maxValues{i}=max(abs(xc{i}));
end

maxValuesMatrix=cell2mat(maxValues);
tmp=maxValuesMatrix;

Minimum=min(maxValuesMatrix);
Maximum=max(maxValuesMatrix);
maxValuesMatrix=(maxValuesMatrix-Minimum)/(Maximum-Minimum);
matchingPercentual=maxValuesMatrix*100;

figure; set(gcf,'name','Peak values for each song','IntegerHandle','off');
stem([1:20],tmp,'--o');

figure; set(gcf,'name','Song matching','IntegerHandle','off');
plot(dataset{find(maxValuesMatrix==max(maxValuesMatrix))}); title(strcat('song-',num2str(find(maxValuesMatrix==max(maxValuesMatrix)))));

disp(sep);

for i=1:20
    fprintf('song #%d matching at - ',i);
    disp(strcat(int2str(matchingPercentual(i)),'%'));
end













