clear all;
clc;

%%Codice riconoscitore visto a lezione

%Leggo le canzoni
[Y1,fs1] = audioread('funky.mp3',[1,96000*50]);
[Y2,fs2] = audioread('lost.mp3',[1,96000*50]);
[Y3,fs3] = audioread('Diana.mp3',[1,44100*50]);
[Y4,fs4] = audioread('never.mp3',[1,96000*50]);
[Y5,fs5] = audioread('T69.mp3',[1,96000*50]);

%%Mostro il grafico delle canzoni
figure; set(gcf,'name','Dataset canzoni','IntegerHandle','off');
subplot(2,3,1); plot(Y1(1:96000*1,1)); title('funky.mp3');
subplot(2,3,2); plot(Y2(1:96000*1,1)); title('lost.mp3');
subplot(2,3,3); plot(Y3(1:96000*1,1)); title('Diana.mp3');
subplot(2,3,4); plot(Y4(1:96000*1,1)); title('never.mp3');
subplot(2,3,5); plot(Y5(1:96000*1,1)); title('T69.mp3');

%%Array di celle: un metodo piu'veloce per raccogliere sequenze di
%%lunghezza diversa.
% Questa notazione Yx(:,1) indica di prendere solo i valori della prima colonna
gallery{1}=Y1(:,1); 
gallery{2}=Y2(:,1);
gallery{3}=Y3(:,1);
gallery{4}=Y4(:,1);
gallery{5}=Y5(:,1);

test=Y2(96000*2:96000*7,:);

for g=1:5
    [xc{g},lagc{g}]= xcorr(gallery{g},test(:,1),'none');
end

figure; set(gcf,'name','Risultati di matching','IntegerHandle','off');
for g=1:5
subplot(2,3,g); plot(lagc{g},xc{g});
end

[maxcorr,maxli]=max(xc{2});

sound(Y2(lagc{2}(maxli):lagc{2}(maxli)+44100*10,:),fs2);
sound(test,fs2);
