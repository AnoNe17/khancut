<?php

namespace App\Http\Controllers;

use App\Models\HasilSDQ;
use App\Models\HasilSRQ;
use Illuminate\Http\Request;

class KuisionerController extends Controller
{
    public function soalSDQ(Request $request)
    {
        return view('kuisioner.soal.soal_sdq', [
            'nama' => $request->nama,
            'instansi' => $request->instansi,
            'umur' => $request->umur,
        ]);
    }

    public function soalSRQ(Request $request)
    {
        $soal = array(
            "1. Apakah Anda sering merasa sakit kepala ?",
            "2. Apakah anda kehilangan nafsu makan ?",
            "3. Apakah tidur anda tidak nyenyak ?",
            "4. Apakah Anda mudah merasa takut ?",
            "5. Apakah Anda merasa Cemas, Tegang, atau khawatir ? ",
            "6. Apakah tangan anda gemetar ?",
            "7. Apakah anda mengalami gangguan pencernaan ?",
            "8. Apakah anda merasa sulit berfikir jernih ?",
            "9. Apakah anda merasa tidak bahagia ?",
            "10. Apakah anda lebih sering menangis ?",
            "11. Apakah anda merasa sulit menikmati aktivitas sehari-hari ?",
            "12. Apakah anda mengalami kesulitan untuk mengambil keputusan ?",
            "13. Apakah ativitas/tugas sehari-hari anda terbengkalai ?",
            "14. Anda merasa tidak mampu berperan dalam kehidupan ini ?",
            "15. Apakah anda mengalami kehilangan minat terhadap banyak hal ?",
            "16. Apakah anda merasa tidak berharga ?",
            "17. Apakah anda mempunyai fikiran untuk mengakhiri hidup anda ?",
            "18. Apakah anda merasa lelah sepanjang waktu ?",
            "19. Apakah anda merasa tidak enak di perut ?",
            "20. Apakah anda mudah lelah ?",
            "21. Apakah Anda minum alkohol lebih banyak dari biasanya atau Apakah Anda menggunakan narkoba ?",
            "22. Apakah Anda yakin bahwa seseorang mencoba mencelakai Anda dengan cara tertentu ?",
            "23. Apakah ada yang mengganggu atau hal yang tidak biasa dalam pikiran Anda ?",
            "24. Apakah Anda pernah mendengar suara tanpa tahu sumbernya atau yang orang lain tidak dapat mendengar ?",
            "25. Apakah Anda mengalami mimpi yang mengganggu tentang suatu bencana/musibah atau adakah saat-saat Anda seolah mengalami kembali kejadian bencana itu ?",
            "26. Apakah Anda menghindari kegiatan, tempat, orang atau pikiran yang mengingatkan Anda akan bencana tersebut ?",
            "27. Apakah minat Anda terhadap teman dan kegiatan yang biasa Anda lakukan berkurang ?",
            "28. Apakah Anda merasa sangat terganggu jika berada dalam situasi yang mengingatkan Anda akan bencana atau jika Anda berpikir tentang bencana itu ?",
            "29. Apakah Anda kesulitan memahami atau mengekspresikan perasaan Anda ?",

        );

        $nilai_1 = array(
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        );

        $nilai_2 = array(
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        );


        return view('kuisioner.soal.soal_srq', [
            'soal'      => $soal,
            'nilai_1'   => $nilai_1,
            'nilai_2'   => $nilai_2,
            'nama'      => $request->nama,
            'umur'      => $request->umur,
            'no_hp'     => $request->no_hp,
            'alamat'    => $request->alamat,
            'pekerjaan' => $request->pekerjaan,

        ]);
    }

    public function hasilSRQ(Request $request)
    {
        $total = 0;
        $total_psikologis = 0;
        $total_narkoba = 0;
        $total_psikotik = 0;
        $total_ptsd = 0;

        foreach ($request->radio as $r => $index) {
            if ($r <= 19) {
                $total_psikologis += $request->radio[$r];
            } elseif ($r === 20) {
                $total_narkoba = $request->radio[$r];
            } elseif ($r >= 21 && $r <= 23) {
                $total_psikotik += $request->radio[$r];
            } elseif ($r >= 24) {
                $total_ptsd += $request->radio[$r];
            }
            $total += $request->radio[$r];
        }


        if ($total <= 8) {
            $hasil = 'Normal';
        } elseif ($total >= 8) {
            $hasil = 'Abnormal';
        }

        if ($total_psikologis <= 15) {
            $masalah_psikologis = 'ya';
        } else {
            $masalah_psikologis = 'tidak';
        }

        if ($total_narkoba = 0) {
            $pengguna_narkoba = 'ya';
        } else {
            $pengguna_narkoba = 'tidak';
        }

        if ($total_psikotik <= 3) {
            $gangguan_psikotik = 'ya';
        } else {
            $gangguan_psikotik = 'tidak';
        }

        if ($total_ptsd <= 4) {
            $gangguan_ptsd = 'ya';
        } else {
            $gangguan_ptsd = 'tidak';
        }

        $nama       = $request->nama;
        $umur       = $request->umur;
        $no_hp      = $request->no_hp;
        $alamat     = $request->alamat;
        $pekerjaan  = $request->pekerjaan;

        $data = new HasilSRQ();
        $data->nama                 = strtoupper($nama);
        $data->umur                 = strtoupper($umur);
        $data->no_hp                = strtoupper($no_hp);
        $data->alamat               = strtoupper($alamat);
        $data->pekerjaan            = strtoupper($pekerjaan);
        $data->hasil                = strtoupper($hasil);
        $data->total                = $total;
        $data->masalah_psikologis   = $masalah_psikologis;
        $data->pengguna_narkoba     = $pengguna_narkoba;
        $data->gangguan_psikotik    = $gangguan_psikotik;
        $data->gangguan_ptsd        = $gangguan_ptsd;
        $data->save();

        if ($data->save()) {
            return view('kuisioner.hasil.hasil_srq', compact('nama', 'umur', 'no_hp', 'alamat', 'pekerjaan', 'total', 'hasil', 'masalah_psikologis', 'pengguna_narkoba', 'gangguan_psikotik', 'gangguan_ptsd'));
        }
    }


    public function hasilSDQ(Request $request)
    {
        $skor = 0;
        $skor_e = 0;
        $skor_c = 0;
        $skor_h = 0;
        $skor_p = 0;
        $skor_pro = 0;

        for ($x = 0; $x <= 24; $x++) {
            if (!empty($request->radio_e[$x])) {
                $skor_e += $request->radio_e[$x];
            }
        }

        for ($x = 0; $x <= 24; $x++) {
            if (!empty($request->radio_c[$x])) {
                $skor_c += $request->radio_c[$x];
            }
        }

        for ($x = 0; $x <= 24; $x++) {
            if (!empty($request->radio_h[$x])) {
                $skor_h += $request->radio_h[$x];
            }
        }

        for ($x = 0; $x <= 24; $x++) {
            if (!empty($request->radio_p[$x])) {
                $skor_p += $request->radio_p[$x];
            }
        }

        for ($x = 0; $x <= 24; $x++) {
            if (!empty($request->radio_pro[$x])) {
                $skor_pro += $request->radio_pro[$x];
            }
        }

        $skor_kesulitan = $skor_e + $skor_c + $skor_h + $skor_p;


        $skor_keseluruhan = $skor_kesulitan + $skor_pro;

        if ($request->umur === "4_11") {
            // skor keseluruhan
            if ($skor <= 13) {
                $hasil_kesulitan = 'Normal';
            } else if ($skor >= 14 && $skor <= 15) {
                $hasil_kesulitan = 'Borderline / Ambang';
            } else {
                $hasil_kesulitan = 'Abnormal';
            }

            // Skor e
            if ($skor_e <= 3) {
                $hasil_e = 'Normal';
            } else if ($skor_e == 4) {
                $hasil_e = 'Borderline / Ambang';
            } else {
                $hasil_e = 'Abnormal';
            }

            // Skor c
            if ($skor_c <= 2) {
                $hasil_c = 'Normal';
            } else if ($skor_c == 3) {
                $hasil_c = 'Borderline / Ambang';
            } else {
                $hasil_c = 'Abnormal';
            }

            // Skor h
            if ($skor_h <= 5) {
                $hasil_h = 'Normal';
            } else if ($skor_h == 6) {
                $hasil_h = 'Borderline / Ambang';
            } else {
                $hasil_h = 'Abnormal';
            }

            // Skor p
            if ($skor_p <= 2) {
                $hasil_p = 'Normal';
            } else if ($skor_p == 3) {
                $hasil_p = 'Borderline / Ambang';
            } else {
                $hasil_p = 'Abnormal';
            }

            // Skor Pro
            if ($skor_pro <= 4) {
                $hasil_pro = 'Normal';
            } else if ($skor_pro == 5) {
                $hasil_pro = 'Borderline / Ambang';
            } else {
                $hasil_pro = 'Abnormal';
            }
        } else {
            // skor keseluruhan
            if ($skor <= 15) {
                $hasil_kesulitan = 'Normal';
            } else if ($skor >= 16 && $skor <= 19) {
                $hasil_kesulitan = 'Borderline / Ambang';
            } else {
                $hasil_kesulitan = 'Abnormal';
            }

            // Skor e
            if ($skor_e <= 5) {
                $hasil_e = 'Normal';
            } else if ($skor_e == 6) {
                $hasil_e = 'Borderline / Ambang';
            } else {
                $hasil_e = 'Abnormal';
            }

            // Skor c
            if ($skor_c <= 3) {
                $hasil_c = 'Normal';
            } else if ($skor_c == 4) {
                $hasil_c = 'Borderline / Ambang';
            } else {
                $hasil_c = 'Abnormal';
            }

            // Skor h
            if ($skor_h <= 5) {
                $hasil_h = 'Normal';
            } else if ($skor_h == 6) {
                $hasil_h = 'Borderline / Ambang';
            } else {
                $hasil_h = 'Abnormal';
            }

            // Skor p
            if ($skor_p <= 3) {
                $hasil_p = 'Normal';
            } else if ($skor >= 4 && $skor <= 5) {
                $hasil_p = 'Borderline / Ambang';
            } else {
                $hasil_p = 'Abnormal';
            }

            // Skor Pro
            if ($skor_pro <= 4) {
                $hasil_pro = 'Normal';
            } else if ($skor_pro == 5) {
                $hasil_pro = 'Borderline / Ambang';
            } else {
                $hasil_pro = 'Abnormal';
            }
        }

        $nama       = $request->nama;
        $instansi   = $request->instansi;
        $umur       = $request->umur;

        $data = new HasilSDQ();
        $data->nama             = strtoupper($nama);
        $data->instansi         = strtoupper($instansi);
        $data->hasil_e          = strtoupper($hasil_e);
        $data->hasil_c          = strtoupper($hasil_c);
        $data->hasil_h          = strtoupper($hasil_h);
        $data->hasil_p          = strtoupper($hasil_p);
        $data->hasil_pro        = strtoupper($hasil_pro);
        $data->hasil_kesulitan  = strtoupper($hasil_kesulitan);
        $data->skor_kesulitan   = $skor_kesulitan;
        $data->skor_e           = $skor_e;
        $data->skor_c           = $skor_c;
        $data->skor_h           = $skor_h;
        $data->skor_p           = $skor_p;
        $data->skor_pro         = $skor_pro;
        $data->skor_keseluruhan = $skor_keseluruhan;
        $data->save();

        // if ($data->save()) {
        return view('kuisioner.hasil.hasil_sdq', compact(
            'nama',
            'instansi',
            'umur',
            'hasil_e',
            'hasil_c',
            'hasil_h',
            'hasil_p',
            'hasil_pro',
            'hasil_kesulitan',
            'skor_kesulitan',
            'skor_e',
            'skor_c',
            'skor_h',
            'skor_p',
            'skor_pro',
            'skor_keseluruhan',
        ));
        // }
    }

    public function getHasilSDQ()
    {
        $hasil = HasilSDQ::orderBy("id", "desc")->get();
        $judul = 'Hasil Kuisioner SDQ';

        return view('kuisioner.sdq', [
            'hasil' => $hasil,
            'judul' => $judul
        ]);
    }

    public function getHasilSRQ()
    {
        $hasil = HasilSRQ::orderBy("id", "desc")->get();
        $judul = 'Hasil Kuisioner SRQ';
        return view('kuisioner.srq', [
            'hasil' => $hasil,
            'judul' => $judul
        ]);
    }

    public function soal_4_11()
    {
        $soal['4_11'] = array(
            "1. Dapat memperdulikan perasaan orang lain.",
            "2. Gelisah, terlalu aktif, tidak dapat diam untuk waktu lama.",
            "3. Sering mengeluh sakit kepala, sakit perut atau sakit lainnya.",
            "4. Kalau mempunyai mainan, kesenangan atau pensil, anak bersedia berbagi dengan anak anak lain.",
            "5. Sering sulit mengendalikan kemarahan.",
            "6. Cenderung menyendiri lebih suka bermain seorang diri.",
            "7. Umumya bertingkah laku baik, biasanya melakukan apa yang disuruh oleh orang dewasa.",
            "8. Banyak kekhawatiran atau sering tampak khawatir.",
            "9. Suka menolong jika seseorang terluka, kecewa atau merasa sakit.",
            "10. Terus menerus bergerak dengan resah atau menggeliat-geliat",
            "11. Mempunyai satu atau lebih teman baik",
            "12. Sering berkelahi dengan anak-anak lain atau mengintimidasi mereka",
            "13. Sering merasatidak bahagia, sedih atau menangis ",
            "14. pada umumnya di sukai oleh anak anak lain.",
            "15. Mudah teralih perhatiannya, tidak dapat berkonsentrasi.",
            "16. Gugup atau sulit berpisah dengan orang tua/pengasuhnya pada situasi baru, mudah kehilangan rasa percaya diri.",
            "17. Bersikap baik terhadap anak-anak yang lebih muda.",
            "18. Sering berbohong atau berbuat curang",
            "19. Diganggu dipermainkan, dintimidasi atau diancam oleh anak-anak lain.",
            "20. Sering menawarkan diri untuk membantu orang lain (orang tua, guru, anak-anak)",
            "21. Sebelum melakukan sesuatu ia berfikir dahulu tentang akibatnya.",
            "22. Mencuri dari rumah, sekolah atau tempat lain",
            "23. Lebih mudah berteman dengan orang dewasa dari pada dengan anak anak lain.",
            "24. Banyak yang ditakuti, mudah menjadi takut",
            "25. Memiliki perhatian yang baik terhadap apapun, mampu menyelesaikan tugas atau pekerjaan rumah sampai selesai .",
        );

        $kategori['4_11'] = array(
            "pro", "h", "e", "pro", "c", "p", "c", "e", "pro", "h", "p", "c", "e", "p", "h", "e", "pro", "c", "p", "pro", "h", "c", "p", "e", "h",
        );

        $nilai_1['4_11'] = array(
            0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2,
        );

        $nilai_2['4_11'] = array(
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        );

        $nilai_3['4_11'] = array(
            2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0,
        );

        return view('kuisioner.soal.4_11', [
            'soal' => $soal,
            'kategori' => $kategori,
            'nilai_1' => $nilai_1,
            'nilai_2' => $nilai_2,
            'nilai_3' => $nilai_3
        ]);
    }

    public function soal_11_18()
    {
        $soal['11_18'] = array(
            "1. Saya berusaha baik kepada orang lain. Saya peduli dengan perasaan mereka",
            "2. Saya gelisah. saya tidak dapat diam untuk waktu lama",
            "3. Saya sering sakit kepala, sakit perut atau macam-macam sakit lainnya",
            "4. Kalau saya memiliki mainan, CD, atau makanan, Saya biasanya berbagi dengan orang lain",
            "5. Saya menjadi sangat marah dan sering tidak dapat mengendalikan kemarahan saya",
            "6. Saya lebih suka sendiri daripada bersama dengan orang yang seusiaku",
            "7. Saya biasanya melakukan apa yang diperintahkan oleh orang lain.",
            "8. Saya banyak merasa cemas atau khawatir terhadap apapun",
            "9. Saya selalu siap menolong jika seseorang terluka, kecewa atau merasa sakit",
            "10. Bila sedang gelisah atau cemas badan saya sering bergerak –gerask tanpa saya sadari",
            "11. Saya mempunyai satu orang teman baik atau lebih",
            "12. Saya sering bertengkar dengan orang lain. Saya dapat memaksa orang lain melakukan apa  yang saya inginkan",
            "13. Saya sering merasa tidak bahagia, sedih atau menangis",
            "14. Orang lain seusia saya umumnya menyukai saya",
            "15. Perhatian saya mudah teralih, saya sulit untuk memusatkan perhatian pada apapun",
            "16. Saya merasa gugup dalam situasi baru, saya mudah kehilangan rasa percaya Diri",
            "17. Saya bersikap baik terhadap anak-anak yang lebih muda dari saya",
            "18. Saya sering dituduh berbohong atau berbuat curang",
            "19. Saya sering diganggu atau dipermainkan oleh anak-anak atau remaja lainnya",
            "20. Saya sering menawarkan diri untuk membantu orang lain (orang tua, guru, anak-anak )",
            "21. Saya berpikir terlebih dulu akibat yang akan terjadi, sebelum berbuat atau melakukan sesuatu",
            "22. Saya mengambil barang yang bukan milik saya dari rumah, sekolah atau dari mana saja",
            "23. Saya lebih mudah berteman dengan orang dewasa daripada dengan orang seusia Saya",
            "24. Banyak yang saya takuti, saya mudah menjadi takut",
            "25. Saya menyelesaikan pekerjaan yang sedang saya lakukan. Saya mempunyai perhatian  yang baik terhadap apapun.",
        );

        $kategori['11_18'] = array(
            "pro", "h", "e", "pro", "c", "p", "c", "e", "pro", "h", "p", "c", "e", "p", "h", "e", "pro", "c", "p", "pro", "h", "c", "p", "e", "h",
        );

        $nilai_1['11_18'] = array(
            0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 2,
        );

        $nilai_2['11_18'] = array(
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
        );

        $nilai_3['11_18'] = array(
            2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0, 2, 2, 0, 2, 2, 2, 2, 2, 2, 0, 2, 2, 2, 0,
        );

        return view('kuisioner.soal.11_18', [
            'soal' => $soal,
            'kategori' => $kategori,
            'nilai_1' => $nilai_1,
            'nilai_2' => $nilai_2,
            'nilai_3' => $nilai_3
        ]);
    }

    public function pdfSDQ($id)
    {
        return $id;
    }
}
