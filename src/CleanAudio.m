%%Experiment -> not applied
clc;
clear;

%% Signal
[signal,frequency]=recordAudio();
figure;set(gcf,'name','Recorded audio');plot(signal);
%% Frequency analysis
N=length(signal);
f_bins=[0:N-1];
f_Hz=f_bins*frequency/N;
SpecSig=abs(fft(signal));
figure;set(gcf,'name','Spectrum of recorded audio');plot(f_Hz,SpecSig);

%% Normalized Frequency -First half of DTF - Matlab rappresentation
f_normal=0:1/(N/2-1):1;
vals=SpecSig(1:N/2);
figure;set(gcf,'name','Normalized Spectrum');plot(f_normal,vals);

%% Filtering bandpass
order=2;
[b,a]=butter(order,[0.003 0.08],'bandpass');
filtered_signal=filter(b,a,signal);
figure;set(gcf,'name','Filtered signal');plot(filtered_signal);

%% Sounding audio
sound(signal,frequency,16);

%% Sounding filtered audio
sound(filtered_signal,frequency,16);