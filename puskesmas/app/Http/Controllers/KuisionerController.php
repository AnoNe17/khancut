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
            "4. Apakah Anda mudah merasa takut? ",
            "5. Apakah Anda merasa Cemas, Tegang, atau khawatir ? ",
            "6. Apakah tangan anda gemetar ?",
            "7. Apakah anda mengalami gangguan pencernaan?",
            "8. Apakah anda merasa sulit berfikir jernih?",
            "9. Apakah anda merasa tidak bahagia?",
            "10. Apakah anda lebih sering menangis ?",
            "11. Apakah anda merasa sulit menikmati aktivitas sehari-hari?",
            "12. Apakah anda mengalami kesulitan untuk mengambil keputusan ?",
            "13. Apakah ativitas/tugas sehari-hari anda terbengkalai?",
            "14. Anda merasa tidak mampu berperan dalam kehidupan ini ?",
            "15. Apakah anda mengalami kehilangan minat terhadap banyak hal ?",
            "16. Apakah anda merasa tidak berharga ?",
            "17. Apakah anda mempunyai fikiran untuk mengakhiri hidup anda ?",
            "18. Apakah anda merasa lelah sepanjang waktu ?",
            "19. Apakah anda merasa tidak enak di perut ?",
            "20. Apakah anda mudah lelah ?",

        );

        $nilai_1 = array(
            0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0,
        );

        $nilai_2 = array(
            1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1, 1,
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

        foreach ($request->radio as $r) {
            $total += $request->radio[$r];
        }

        if ($total <= 8) {
            $hasil = 'Normal';
        } elseif ($total >= 8) {
            $hasil = 'Abnormal';
        }


        $nama       = $request->nama;
        $umur       = $request->umur;
        $no_hp      = $request->no_hp;
        $alamat     = $request->alamat;
        $pekerjaan  = $request->pekerjaan;

        $data = new HasilSRQ();
        $data->nama         = strtoupper($nama);
        $data->umur         = strtoupper($umur);
        $data->no_hp        = strtoupper($no_hp);
        $data->alamat       = strtoupper($alamat);
        $data->pekerjaan    = strtoupper($pekerjaan);
        $data->hasil        = strtoupper($hasil);
        $data->save();

        if ($data->save()) {
            return view('kuisioner.hasil.hasil_srq', compact('nama', 'umur', 'no_hp', 'alamat', 'pekerjaan', 'total', 'hasil'));
        }
    }


    public function hasilSDQ(Request $request)
    {
        $total = 0;
        $total_e = 0;
        $total_c = 0;
        $total_h = 0;
        $total_p = 0;
        $total_pro = 0;

        for ($x = 0; $x <= 24; $x++) {
            if (!empty($request->radio_e[$x])) {
                $total_e += $request->radio_e[$x];
            }
        }

        for ($x = 0; $x <= 24; $x++) {
            if (!empty($request->radio_c[$x])) {
                $total_c += $request->radio_c[$x];
            }
        }

        for ($x = 0; $x <= 24; $x++) {
            if (!empty($request->radio_h[$x])) {
                $total_h += $request->radio_h[$x];
            }
        }

        for ($x = 0; $x <= 24; $x++) {
            if (!empty($request->radio_p[$x])) {
                $total_p += $request->radio_p[$x];
            }
        }

        for ($x = 0; $x <= 24; $x++) {
            if (!empty($request->radio_pro[$x])) {
                $total_pro += $request->radio_pro[$x];
            }
        }

        $total = $total_e + $total_c + $total_h + $total_p + $total_pro;

        if ($request->umur === "4_11") {
            // skor keseluruhan
            if ($total <= 13) {
                $hasil_kesulitan = 'Normal';
            } else if ($total >= 14 && $total <= 15) {
                $hasil_kesulitan = 'Borderline / Ambang';
            } else {
                $hasil_kesulitan = 'Abnormal';
            }

            // Skor e
            if ($total_e <= 3) {
                $hasil_e = 'Normal';
            } else if ($total_e == 4) {
                $hasil_e = 'Borderline / Ambang';
            } else {
                $hasil_e = 'Abnormal';
            }

            // Skor c
            if ($total_c <= 2) {
                $hasil_c = 'Normal';
            } else if ($total_c == 3) {
                $hasil_c = 'Borderline / Ambang';
            } else {
                $hasil_c = 'Abnormal';
            }

            // Skor h
            if ($total_h <= 5) {
                $hasil_h = 'Normal';
            } else if ($total_h == 6) {
                $hasil_h = 'Borderline / Ambang';
            } else {
                $hasil_h = 'Abnormal';
            }

            // Skor p
            if ($total_p <= 2) {
                $hasil_p = 'Normal';
            } else if ($total_p == 3) {
                $hasil_p = 'Borderline / Ambang';
            } else {
                $hasil_p = 'Abnormal';
            }

            // Skor Pro
            if ($total_pro <= 4) {
                $hasil_pro = 'Normal';
            } else if ($total_pro == 5) {
                $hasil_pro = 'Borderline / Ambang';
            } else {
                $hasil_pro = 'Abnormal';
            }
        } else {
            // skor keseluruhan
            if ($total <= 15) {
                $hasil_kesulitan = 'Normal';
            } else if ($total >= 16 && $total <= 19) {
                $hasil_kesulitan = 'Borderline / Ambang';
            } else {
                $hasil_kesulitan = 'Abnormal';
            }

            // Skor e
            if ($total_e <= 5) {
                $hasil_e = 'Normal';
            } else if ($total_e == 6) {
                $hasil_e = 'Borderline / Ambang';
            } else {
                $hasil_e = 'Abnormal';
            }

            // Skor c
            if ($total_c <= 3) {
                $hasil_c = 'Normal';
            } else if ($total_c == 4) {
                $hasil_c = 'Borderline / Ambang';
            } else {
                $hasil_c = 'Abnormal';
            }

            // Skor h
            if ($total_h <= 5) {
                $hasil_h = 'Normal';
            } else if ($total_h == 6) {
                $hasil_h = 'Borderline / Ambang';
            } else {
                $hasil_h = 'Abnormal';
            }

            // Skor p
            if ($total_p <= 3) {
                $hasil_p = 'Normal';
            } else if ($total >= 4 && $total <= 5) {
                $hasil_p = 'Borderline / Ambang';
            } else {
                $hasil_p = 'Abnormal';
            }

            // Skor Pro
            if ($total_pro <= 4) {
                $hasil_pro = 'Normal';
            } else if ($total_pro == 5) {
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
        $data->total_kesulitan  = strtoupper($hasil_kesulitan);
        $data->hasil_e          = strtoupper($hasil_e);
        $data->hasil_c          = strtoupper($hasil_c);
        $data->hasil_h          = strtoupper($hasil_h);
        $data->hasil_p          = strtoupper($hasil_p);
        $data->hasil_pro        = strtoupper($hasil_pro);
        $data->save();

        if ($data->save()) {
            return view('kuisioner.hasil.hasil_sdq', compact('total', 'total_e', 'total_c', 'total_h', 'total_p', 'total_pro', 'hasil_kesulitan', 'hasil_e', 'hasil_c', 'hasil_h', 'hasil_p', 'hasil_pro', 'nama', 'instansi', 'umur'));
        }
    }

    public function inputSDQ(Request $request)
    {

        $data = new HasilSDQ();
        $data->nama             = strtoupper($request->nama);
        $data->instansi         = strtoupper($request->instansi);
        $data->total_kesulitan  = strtoupper($request->total_kesulitan);
        $data->hasil_e          = strtoupper($request->hasil_e);
        $data->hasil_c          = strtoupper($request->hasil_c);
        $data->hasil_h          = strtoupper($request->hasil_h);
        $data->hasil_p          = strtoupper($request->hasil_p);
        $data->hasil_pro        = strtoupper($request->hasil_pro);
        $data->save();

        if ($data->save()) {
            return response()->json([
                'success' => true,
                'note' => 'Data Berhasil Di Input'
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'note' => 'Data Gagal Di Input'
            ], 400);
        }
    }

    public function inputSRQ(Request $request)
    {

        $data = new HasilSRQ();
        $data->nama         = strtoupper($request->nama);
        $data->umur         = strtoupper($request->umur);
        $data->no_hp        = strtoupper($request->no_hp);
        $data->alamat       = strtoupper($request->alamat);
        $data->pekerjaan    = strtoupper($request->pekerjaan);
        $data->hasil        = strtoupper($request->hasil);
        $data->save();

        if ($data->save()) {
            return response()->json([
                'success' => true,
                'note' => 'Data Berhasil Di Input'
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'note' => 'Data Gagal Di Input'
            ], 400);
        }
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
}
