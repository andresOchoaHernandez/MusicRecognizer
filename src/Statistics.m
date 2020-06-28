%%Una collezione di dati statistici sulle condizioni di acquisizione e di
%%accuratezza dell'algoritmo

%% Normal tests - recording from microphone,maximum volume from the smartphone,10 s of recording at 44100 Hz

%test song diana : FAILURE
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
%test song moonRiver: FAILURE
%test song never: SUCCESS
%test song rockTheCasbah: SUCCESS
%test song somebodyToLove: FAILURE
%test song someWhereIBelong: SUCCESS
%test song t69: SUCCESS
%test song theRealSlimShady: SUCCESS
%test song tinyDancer: FAILURE
%test song wishYouWhereHere: FAILURE

%SUCCESS RATE=15/20 -> 75% 
%NOTES: 
% -essendo una registrazione effettuata col microfono di una cuffia il segnale non è mai pulito (quando si riproduce la registrazione è percepibile)
% -è probabile che il microfono delle cuffie sia tarato per le frequenze tipiche della voce umana e dunque esegua in automatico delle operazioni sul
%  segnale audio

%% Normal test - Taking first 10 seconds of each song in the dataset

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

%% Normal test - Taking middle 2 seconds of each song in the dataset

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

%% Normal test - Taking initial 2 seconds of each song in the dataset

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
% -acquisire la registrazione da più probabilità di avere risultati sbagliati a causa delle problematiche legate alla registrazione
% -prendere la parte iniziale di una canzone per riconoscerla puo portare a risultati sbagliati
% -è meglio prendere da 2 a 10 secondi di una canzone in una parte 'mediana' per aumentare le chance di match 