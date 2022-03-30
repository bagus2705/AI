mulai:- 
    init, 
    data_pengamatan, 
    aturan(Nomor,Alasan), 
    jawaban(Alasan,Jawab), 
    write(Jawab),nl, 
    write(Nomor),nl,nl, 
    retractall(observation(_)).
mulai:- 
    write('Maaf, penyakit tersebut tidak ada dalam database kami.'),nl,nl, 
    retractall(observation(_)).
init:- 
    write('PROGRAM SISTEM PAKAR PENDETEKSI PENYAKIT LAMBUNG'),nl, 
    judul(Judul),write(Judul),nl,nl, 
    tulis_pesan,nl. 
tulis_pesan:- 
    pesan(Pesan), 
 write(Pesan),nl,fail. 
tulis_pesan:- 
    nl. 
data_pengamatan:- 
 pertanyaan(Tanya,Obs), 
 write(Tanya),nl, 
 read(Yatidak), 
 Yatidak=y, 
 assert(observation(Obs)), 
 fail. 
data_pengamatan. 
judul('...MENGANALISA GEJALA...'). 
pesan('Jawab pertanyaan berikut dengan y atau t').
pertanyaan('Apakah perut anda terasa kembung atau tidak enak pada ulu hati?', perut). 
pertanyaan('Apakah anda kehilangan nafsu makan?', makan).
pertanyaan('Apakah anda mengalami muntah?',muntah).
pertanyaan('Apakah anda merasakan mual?',mual).
pertanyaan('Apakah anda merasakan kram di bagian perut?',kram).
pertanyaan('Apakah dada anda terasa nyeri?',nyeri).
pertanyaan('Apakah perut anda terasa panas?', panas).
pertanyaan('Apakah anda merasa asam saat menelan sesuatu?', telan).
aturan(1,maag_kronis):-
observation(perut),
observation(makan),
observation(muntah),
observation(mual),
observation(kram),
observation(nyeri),
observation(panas),
observation(telan).
aturan(2,maag_akut):-
observation(perut),
observation(makan),
observation(muntah),
observation(mual),
observation(kram),
not(observation(nyeri)),
observation(panas),
not(observation(telan)).
aturan(3,maag_ringan):-
observation(perut),
observation(makan),
not(observation(muntah)),
observation(mual),
observation(kram),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
aturan(4,maag_sedang):-
observation(perut),
observation(makan),
observation(muntah),
observation(mual),
observation(kram),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
aturan(5,gastritis):-
not(observation(perut)),
observation(makan),
observation(muntah),
observation(mual),
not(observation(kram)),
observation(nyeri),
observation(panas),
not(observation(telan)).
aturan(6,gastroparesis):-
not(observation(perut)),
observation(makan),
observation(muntah),
observation(mual),
observation(kram),
observation(nyeri),
observation(panas),
not(observation(telan)).
aturan(7,gastroenteritis):-
not(observation(perut)),
not(observation(makan)),
observation(muntah),
observation(mual),
not(observation(kram)),
observation(nyeri),
not(observation(panas)),
not(observation(telan)).
aturan(8,dispepsia):-
not(observation(perut)),
not(observation(makan)),
not(observation(muntah)),
not(observation(mual)),
not(observation(kram)),
observation(nyeri),
observation(panas),
not(observation(telan)).
aturan(9,tukak_lambung):-
not(observation(perut)),
observation(makan),
observation(muntah),
observation(mual),
observation(kram),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
aturan(10,polip_lambung):-
not(observation(perut)),
not(observation(makan)),
not(observation(muntah)),
observation(mual),
not(observation(kram)),
observation(nyeri),
not(observation(panas)),
not(observation(telan)).
aturan(11,gerd):-
observation(perut),
observation(makan),
not(observation(muntah)),
observation(mual),
observation(kram),
not(observation(nyeri)),
not(observation(panas)),
observation(telan).
aturan(12,infek_lambung):-
observation(perut),
observation(makan),
not(observation(muntah)),
observation(mual),
not(observation(kram)),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
aturan(13,asam_lambung):-
observation(perut),
observation(makan),
not(observation(muntah)),
not(observation(mual)),
not(observation(kram)),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
aturan(14,usus_buntu):-
observation(perut),
not(observation(makan)),
observation(muntah),
observation(mual),
not(observation(kram)),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
aturan(15,kolera):-
not(observation(perut)),
not(observation(makan)),
observation(muntah),
observation(mual),
not(observation(kram)),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
aturan(16,sembelit):-
observation(perut),
not(observation(makan)),
not(observation(muntah)),
not(observation(mual)),
not(observation(kram)),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
aturan(17,disentri):-
not(observation(perut)),
not(observation(makan)),
not(observation(muntah)),
not(observation(mual)),
observation(kram),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
aturan(18,masuk_angin):-
not(observation(perut),
not(observation(makan)),
not(observation(muntah)),
observation(mual),
observation(kram),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
aturan(19,divertikulitis):-
observation(perut),
not(observation(makan)),
not(observation(muntah)),
observation(mual),
not(observation(kram)),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
aturan(20,radang_usus):-
not(observation(perut)),
observation(makan),
not(observation(muntah)),
observation(mual),
not(observation(kram)),
not(observation(nyeri)),
observation(panas),
not(observation(telan)).
aturan(21,sehat):-
not(observation(perut)),
not(observation(makan)),
not(observation(muntah)),
not(observation(mual)),
not(observation(kram)),
not(observation(nyeri)),
not(observation(panas)),
not(observation(telan)).
jawaban(maag_kronis, 'Anda kemungkinan mengidap penyakit maag kronis, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(maag_akut, 'Anda kemungkinan mengidap maag akut, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(maag_ringan, 'Anda kemungkinan mengidap maag ringan, perbanyak istirahat dan makan yang teratur').
jawaban(maag_sedang, 'Anda kemungkinan mengidap penyakit maag sedang, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(gastritis, 'Anda kemungkinan mengidap penyakit gastritis, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(gastroparesis, 'Anda kemungkinan mengidap penyakit gastroparesis, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(dispepsia, 'Anda kemungkinan mengidap penyakit dispepsia, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(tukak_lambung, 'Anda kemungkinan mengidap penyakit tukak lambung, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(polip_lambung, 'Anda kemungkinan mengidap penyakit polip lambung, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(gerd, 'Anda kemungkinan mengidap penyakit gerd, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(infek_lambung, 'Anda kemungkinan mengalami infeksi pada lambung, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(asam_lambung, 'Anda kemungkinan mengalami asam lambung, perbanyak minum air hangat dan hindari makanan yang bersifat asam dan pedas').
jawaban(usus_buntu, 'Anda kemungkinan mengidap usus buntu, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(kolera, 'Anda kemungkinan mengidap penyakit kolera, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(sembelit, 'Anda mengalami sembelit').
jawaban(disentri, 'Anda kemungkinan mengalami disentri, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(masuk_angin, 'Anda mengalami masuk angin, konsumsi air hangat dan tolak angin').
jawaban(divertikulitis, 'Anda kemungkinan mengalami divertikulitis, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(radang_usus, 'Anda kemungkinan mengidap radang usus, segera periksakan ke rumah sakit terdekat untuk penanganan lebih lanjut').
jawaban(sehat, 'Anda tidak mengidap penyakit apapun, sehat bosku !').