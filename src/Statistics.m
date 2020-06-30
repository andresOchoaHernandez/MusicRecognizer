%%Una collezione di dati statistici sulle condizioni di acquisizione e di
%%accuratezza dell'algoritmo

%% 1 Normal tests - recording from microphone,maximum volume from the smartphone,10 s of recording at 44100 Hz

%test song diana : FAILURE*
%test song freebird : SUCCESS
%test song freestyler : SUCCESS
%test song funky : SUCCESS
%test song heyjoe: SUCCESS
%test song holdTheLine: SUCCESS
%test song hotelCalifornia: SUCCESS
%test song iLoveRockAndRoll: SUCCESS
%test song internetFriends: SUCCESS
%test song iWantToKnowWhatLoveIs: SUCCESS
%test song lost: SUCCESS
%test song moonRiver: FAILURE*
%test song never: SUCCESS
%test song rockTheCasbah: SUCCESS
%test song somebodyToLove: FAILURE*
%test song someWhereIBelong: SUCCESS
%test song t69: SUCCESS
%test song theRealSlimShady: SUCCESS
%test song tinyDancer: FAILURE*
%test song wishYouWhereHere: FAILURE

%SUCCESS RATE=15/20 -> 75% 
%NOTES: 
% -essendo una registrazione effettuata col microfono di una cuffia il segnale non è mai pulito (quando si riproduce la registrazione è percepibile)
% -è probabile che il microfono delle cuffie sia tarato per le frequenze tipiche della voce umana e dunque esegua in automatico delle operazioni sul
%  segnale audio
% -*diana: come si vede dal workspace, diana è campionata a 32000 Hz e
%  dunque non viene riconosciuta quando viene fatta una sua registrazione a
%  44100 Hz perche si probabilmente si verifica dell'aliasing. Registrando
%  10 secondi di canzone, campionando a 32000 Hz la canzone viene
%  riconosciuta senza problemi.
% -*moonRiver,someBodyToLove,tinyDancer: come si vede dal workspace, sono campionate a 48000 Hz
%  e dunque campionando a 44100 Hz non vengono riconosciute. Effettuando 10
%  secondi di registrazione a 48000 Hz le canzoni vengono riconosciute senza
%  problemi.
%% 1.2 Normal tests - recording from microphone,medium volume from the smartphone at 0.6 m from
%%the microphone,10 s of recording at varying frequency (based on the mp3 freq)

%test song diana : 32k Hz -> SUCCESS
%test song freebird : 44.1 k Hz -> FAILURE
%test song freestyler : 44.1 k Hz -> SUCCESS
%test song funky : 44.1 k Hz -> SUCCESS
%test song heyjoe: 44.1 k Hz -> SUCCESS
%test song holdTheLine: 44.1 k Hz -> SUCCESS
%test song hotelCalifornia: 44.1 k Hz -> SUCCESS
%test song iLoveRockAndRoll: 44.1 k Hz -> SUCCESS
%test song internetFriends: 44.1 k Hz -> SUCCESS
%test song iWantToKnowWhatLoveIs: 44.1 k Hz -> SUCCESS
%test song lost: 44.1 k Hz -> SUCCESS
%test song moonRiver: 48 k Hz -> SUCCESS
%test song never: 44.1 k Hz -> SUCCESS
%test song rockTheCasbah: 44.1 k Hz -> SUCCESS
%test song somebodyToLove: 48 k Hz -> SUCCESS
%test song someWhereIBelong: 44.1 k Hz -> SUCCESS
%test song t69: 44.1 k Hz -> SUCCESS
%test song theRealSlimShady: 44.1 k Hz -> SUCCESS
%test song tinyDancer: 48 k Hz -> SUCCESS
%test song wishYouWhereHere: 44.1 k Hz -> FAILURE

%SUCCESS RATE=18/20 -> 90%
%NOTES: 
% -freeBird e wishyouWhereHere sono molto silenziose all'inizio ed è
%  probabilmente questo il motivo per cui non vengono riconosciute a
%  quell'intensità di volume ed a quella distanza.
%% 2 Normal test - Taking first 10 seconds of each song in the dataset

%test song diana : SUCCESS
%test song freebird : SUCCESS
%test song freestyler : SUCCESS
%test song funky : SUCCESS
%test song heyjoe: SUCCESS
%test song holdTheLine: SUCCESS
%test song hotelCalifornia: SUCCESS
%test song iLoveRockAndRoll: SUCCESS
%test song internetFriends: SUCCESS
%test song iWantToKnowWhatLoveIs: SUCCESS
%test song lost: SUCCESS
%test song moonRiver: SUCCESS
%test song never: SUCCESS
%test song rockTheCasbah: SUCCESS
%test song somebodyToLove: SUCCESS
%test song someWhereIBelong: SUCCESS
%test song t69:SUCCESS
%test song theRealSlimShady: SUCCESS 
%test song tinyDancer: SUCCESS
%test song wishYouWhereHere: FAILURE

%SUCCESS RATE=19/20 -> 95% 
%NOTES:
% -test=dataset{song#}(32000 * 1 : 32000* 10);
% -L'ultimo test non è andato bene probabilmente perchè la canzone è molto
%  silenziosa di suo soprattutto nella parte iniziale. Difatti prendendo
%  test=dataset{20}(32000 * 110 : 32000* 120) la canzone viene riconosciuta
%  senza problemi

%% 3 Normal test - Taking middle 2 seconds of each song in the dataset

%test song diana : SUCCESS
%test song freebird : SUCCESS
%test song freestyler : SUCCESS
%test song funky : SUCCESS
%test song heyjoe: SUCCESS
%test song holdTheLine: FAILURE (song 17)
%test song hotelCalifornia: SUCCESS
%test song iLoveRockAndRoll: SUCCESS
%test song internetFriends: SUCCESS
%test song iWantToKnowWhatLoveIs: SUCCESS
%test song lost: SUCCESS
%test song moonRiver: SUCCESS
%test song never: SUCCESS
%test song rockTheCasbah: SUCCESS
%test song somebodyToLove: SUCCESS
%test song someWhereIBelong: SUCCESS
%test song t69:SUCCESS
%test song theRealSlimShady: SUCCESS 
%test song tinyDancer: SUCCESS
%test song wishYouWhereHere: SUCCESS

%SUCCESS RATE=19/20 -> 95%;
%NOTES:
% -test=dataset{song#}(32000 * 110 : 32000* 112);
% -il test per holdTheLine ha dato come match t69 perche in
%  quel frangente la cross correlazione dava un valore piu alto.
%  Probabilmente è dovuto al fatto che t69 è una canzone con un segnale
%  molto forte e questo potrebbe aver influito nel risultato della cross
%  correlazione.
%  Nel grafico dei picchi si può comunque notare che il secondo picco piu 
%  alto era quello in corrsipondenza della canzone giusta.

%% 4 Normal test - Taking initial 2 seconds of each song in the dataset

%test song diana : SUCCESS
%test song freebird : FAILURE
%test song freestyler : SUCCESS
%test song funky : FAILURE
%test song heyjoe: SUCCESS
%test song holdTheLine: FAILURE
%test song hotelCalifornia: SUCCESS
%test song iLoveRockAndRoll: FAILURE
%test song internetFriends: SUCCESS
%test song iWantToKnowWhatLoveIs: SUCCESS
%test song lost: SUCCESS
%test song moonRiver: FAILURE
%test song never: SUCCESS
%test song rockTheCasbah: SUCCESS
%test song somebodyToLove:SUCCESS
%test song someWhereIBelong:SUCCESS
%test song t69:SUCCESS
%test song theRealSlimShady:FAILURE
%test song tinyDancer: SUCCESS
%test song wishYouWhereHere: FAILURE

%SUCCESS RATE= 13/20 -> 65%
%NOTES:
% -test=dataset{song#}(32000 * 1 : 32000* 3)
%% CONCLUSIONS
% -In esperimenti ulteriori ho provato a registrare 10 secondi di freeBird
%  campionando a [44100 +- 10] Hz ottenendo risultati sbagliati. Ho
%  osservato però che campionando a [44100 +- 5] Hz ottenevo un match.
%  Questa osservazione ed il tes #1 mi portano a concludere che sarebbe ideale avere un dataset con
%  file mp3 alla stessa frequenza in modo da aumentare le probabilità di
%  match(in modo da sapere a priori a quale frequenza registrare).
%
% -I test #2,#3,#4 mi portano a concludere che una registrazione mediamente
%  lunga (dai 2 ai 10 secondi) che contenga una parte non inziale di una
%  canzone sono le modalità migliori di acquisizione di una registrazione per
%  il riconoscimento di una canzone.
%
% -Il test #1.2 ed alcune osservazioni mi portano a concludere che:
%   -Più è distante lo smartphone -> più bisogna aumentare il volume del
%    suono e viceversa
%   -La situazione ideale di acquisizione sarebbe quella in cui il telefono
%   dista circa 25-30 cm dal microfono ad un volume medio
%   -