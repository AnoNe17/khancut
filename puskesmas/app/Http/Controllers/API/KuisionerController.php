<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\HasilSDQ;
use App\Models\HasilSRQ;
use App\Models\Notifikasi;
use App\Models\Pasien;
use App\Models\User;
use Illuminate\Http\Request;
use PDF;

class KuisionerController extends Controller
{
    public function inputSDQ(Request $request)
    {
        // return $request;


        if ($request->hasil_e === 'Normal') {
            $keterangan_e = '1. Tidak merasakan sakit badan<br>2. Tidak ada rasa khawatir<br>3. Bahagia<br>4. Percaya diri yang tinggi<br>5. Berani';
        } else {
            $keterangan_e = '1. Sering mengeluh sakit badan ( seperti sakit kepala )<br>2. Banyak kekhawatiran<br>3. Sering tidak bahagia, menangis<br>4. Gugup atau mudah hilang percaya diri<br>5. Mudah takut';
        }

        if ($request->hasil_c === 'Normal') {
            $keterangan_c = '1. Tidak mudah marah<br>2.	Memiliki kepribadian dan perilaku yang baik, teguh pada pendirian diri sendiri<br>3. Tidak pernah melakukan perkelahian<br>4. Tidak berbohong dan tidak melakukan kecurangan dalam hal apapun<br>5. Tidak mencuri';
        } else {
            $keterangan_c = '1. Sering marah meledak-ledak<br>2. Umunya berprilaku tidak baik, tidak melakukan apa yang diminta orang dewasa<br>3. Sering berkelahi<br>4. Sering berbohong, curang<br>5. Mencuri';
        }

        if ($request->hasil_h === 'Normal') {
            $keterangan_h = '1.	Tidak merasa gelisah, dan dapat mengendalikan sikap<br>2. Dapat mengendalikan diri dan tidak mudah resah<br>3. Konsentrasi<br>4. Berpikir panjang sebelum melakukan sesuatu<br>5. Mampu menyelesaikan tugas sampai selesai';
        } else {
            $keterangan_h = '1.	Gelisah, terlalu aktif, tidak dapat diam lama.<br>2. Terus bergerak dengan resah.<br>3. Mudah teralih, konsentrasi buyar.<br>4. Tidak berpikir sebelum bertindak<br>5. Tidak mampu menyelesaikan tugas sampai selesai.';
        }

        if ($request->hasil_p === 'Normal') {
            $keterangan_p = '1.	Senang bergaul<br>2. Memiliki sahabat / teman baik<br>3. Memiliki banyak teman dan dapat bersosialisasi dengan orang banyak<br>4. Bergaul dengan anak anak yang seusia nya';
        } else {
            $keterangan_p = '1.	Cenderung menyendiri, lebih senang main sendiri.<br>2. Tidak punya 1 teman baik.<br>3. Tidak disukai anak-anak lain.<br>4.	Diganggu/digerak oleh anak lain.<br>5. Bergaul lebih baik dengan orang dewasa dari pada anak-anak';
        }

        if ($request->hasil_pro === 'Normal') {
            $keterangan_pro = '1. Tidak Dapat menjaga perasaan orang lain<br>2. Cuek<br>3. Tidak suka membantu dengan orang lain / cuek<br>4. Memliki sikap yang tidak baik';
        } else {
            $keterangan_pro = '1. Mampu mempertimbangkan perasaan orang lain.<br>2.	Bersedia berbagi dengan anak lain. - Suka Menolong.<br>3. Bersikap baik pada anak yang lebih muda.<br>4. Sering menawarkan diri membantu orang lain.';
        }

        // $data = new HasilSDQ();
        // $data->nama             = strtoupper($request->nama);
        // $data->instansi         = strtoupper($request->instansi);
        // $data->total_kesulitan  = strtoupper($request->total_kesulitan);
        // $data->hasil_e          = strtoupper($request->hasil_e);
        // $data->hasil_c          = strtoupper($request->hasil_c);
        // $data->hasil_h          = strtoupper($request->hasil_h);
        // $data->hasil_p          = strtoupper($request->hasil_p);
        // $data->hasil_pro        = strtoupper($request->hasil_pro);
        // $data->save();

        $skor_kesulitan = $request->skor_e + $request->skor_c + $request->skor_h + $request->skor_p;

        $skor_keseluruhan = $skor_kesulitan + $request->skor_pro;

        $data = new HasilSDQ();
        $data->nama             = strtoupper($request->nama);
        $data->instansi         = strtoupper($request->instansi);
        $data->hasil_e          = strtoupper($request->hasil_e);
        $data->hasil_c          = strtoupper($request->hasil_c);
        $data->hasil_h          = strtoupper($request->hasil_h);
        $data->hasil_p          = strtoupper($request->hasil_p);
        $data->hasil_pro        = strtoupper($request->hasil_pro);
        $data->hasil_kesulitan  = strtoupper($request->hasil_kesulitan);
        $data->skor_kesulitan   = $request->skor_kesulitan;
        $data->skor_e           = $request->skor_e;
        $data->skor_c           = $request->skor_c;
        $data->skor_h           = $request->skor_h;
        $data->skor_p           = $request->skor_p;
        $data->skor_pro         = $request->skor_pro;
        $data->keterangan_e     = $keterangan_e;
        $data->keterangan_c     = $keterangan_c;
        $data->keterangan_h     = $keterangan_h;
        $data->keterangan_p     = $keterangan_p;
        $data->keterangan_pro   = $keterangan_pro;
        $data->skor_keseluruhan = $skor_keseluruhan;
        $data->save();

        if ($data->save()) {
            return response()->json([
                'success' => true,
                'data' => $data->id,
                'note' => 'Data Berhasil Di Input'
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'note' => 'Data Gagal Di Input'
            ], 400);
        }
    }

    public function inputSDQPasien(Request $request)
    {
        // return $request;


        if ($request->hasil_e === 'Normal') {
            $keterangan_e = '1. Tidak merasakan sakit badan<br>2. Tidak ada rasa khawatir<br>3. Bahagia<br>4. Percaya diri yang tinggi<br>5. Berani';
        } else {
            $keterangan_e = '1. Sering mengeluh sakit badan ( seperti sakit kepala )<br>2. Banyak kekhawatiran<br>3. Sering tidak bahagia, menangis<br>4. Gugup atau mudah hilang percaya diri<br>5. Mudah takut';
        }

        if ($request->hasil_c === 'Normal') {
            $keterangan_c = '1. Tidak mudah marah<br>2.	Memiliki kepribadian dan perilaku yang baik, teguh pada pendirian diri sendiri<br>3. Tidak pernah melakukan perkelahian<br>4. Tidak berbohong dan tidak melakukan kecurangan dalam hal apapun<br>5. Tidak mencuri';
        } else {
            $keterangan_c = '1. Sering marah meledak-ledak<br>2. Umunya berprilaku tidak baik, tidak melakukan apa yang diminta orang dewasa<br>3. Sering berkelahi<br>4. Sering berbohong, curang<br>5. Mencuri';
        }

        if ($request->hasil_h === 'Normal') {
            $keterangan_h = '1.	Tidak merasa gelisah, dan dapat mengendalikan sikap<br>2. Dapat mengendalikan diri dan tidak mudah resah<br>3. Konsentrasi<br>4. Berpikir panjang sebelum melakukan sesuatu<br>5. Mampu menyelesaikan tugas sampai selesai';
        } else {
            $keterangan_h = '1.	Gelisah, terlalu aktif, tidak dapat diam lama.<br>2. Terus bergerak dengan resah.<br>3. Mudah teralih, konsentrasi buyar.<br>4. Tidak berpikir sebelum bertindak<br>5. Tidak mampu menyelesaikan tugas sampai selesai.';
        }

        if ($request->hasil_p === 'Normal') {
            $keterangan_p = '1.	Senang bergaul<br>2. Memiliki sahabat / teman baik<br>3. Memiliki banyak teman dan dapat bersosialisasi dengan orang banyak<br>4. Bergaul dengan anak anak yang seusia nya';
        } else {
            $keterangan_p = '1.	Cenderung menyendiri, lebih senang main sendiri.<br>2. Tidak punya 1 teman baik.<br>3. Tidak disukai anak-anak lain.<br>4.	Diganggu/digerak oleh anak lain.<br>5. Bergaul lebih baik dengan orang dewasa dari pada anak-anak';
        }

        if ($request->hasil_pro === 'Normal') {
            $keterangan_pro = '1. Tidak Dapat menjaga perasaan orang lain<br>2. Cuek<br>3. Tidak suka membantu dengan orang lain / cuek<br>4. Memliki sikap yang tidak baik';
        } else {
            $keterangan_pro = '1. Mampu mempertimbangkan perasaan orang lain.<br>2.	Bersedia berbagi dengan anak lain. - Suka Menolong.<br>3. Bersikap baik pada anak yang lebih muda.<br>4. Sering menawarkan diri membantu orang lain.';
        }

        $skor_kesulitan = $request->skor_e + $request->skor_c + $request->skor_h + $request->skor_p;

        $skor_keseluruhan = $skor_kesulitan + $request->skor_pro;

        $data = new HasilSDQ();
        $data->nama             = strtoupper($request->nama);
        $data->instansi         = strtoupper($request->instansi);
        $data->hasil_e          = strtoupper($request->hasil_e);
        $data->hasil_c          = strtoupper($request->hasil_c);
        $data->hasil_h          = strtoupper($request->hasil_h);
        $data->hasil_p          = strtoupper($request->hasil_p);
        $data->hasil_pro        = strtoupper($request->hasil_pro);
        $data->hasil_kesulitan  = strtoupper($request->hasil_kesulitan);
        $data->skor_kesulitan   = $request->skor_kesulitan;
        $data->skor_e           = $request->skor_e;
        $data->skor_c           = $request->skor_c;
        $data->skor_h           = $request->skor_h;
        $data->skor_p           = $request->skor_p;
        $data->skor_pro         = $request->skor_pro;
        $data->keterangan_e     = $keterangan_e;
        $data->keterangan_c     = $keterangan_c;
        $data->keterangan_h     = $keterangan_h;
        $data->keterangan_p     = $keterangan_p;
        $data->keterangan_pro   = $keterangan_pro;
        $data->skor_keseluruhan = $skor_keseluruhan;
        $data->user_id = $request->user_id;
        $data->save();

        if ($data->save()) {
            return response()->json([
                'success' => true,
                'data' => $data->id,
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
        // return $request;
        $keterangan = '';

        if ($request->hasil_psikologis === 'ya') {
            $keterangan .= '- Terdapat masalah psikologis seperti cemas dan depresi<br>';
        }
        if ($request->hasil_narkoba === 'ya') {
            $keterangan .= '- Terdapat penggunaan zat psikoaktif/narkoba<br>';
        }
        if ($request->hasil_psikotik === 'ya') {
            $keterangan .= '- Terdapat gejala gangguan psikotik (gangguan dalam penilaian realitas) yang perlu penanganan serius<br>';
        }
        if ($request->hasil_ptsd === 'ya') {
            $keterangan .= '- Terdapat gejala-gejala gangguan  PTSD (Post Traumatic Stress Disorder) / gangguan stres setelah trauma<br>';
        }
        if ($request->hasil == 'Normal') {
            $keterangan .= '- Mohon Jaga Kesehatan Anda';
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
        $data->hasil                = strtoupper($request->hasil_akhir);
        $data->total                = $request->skor_akhir;
        $data->masalah_psikologis   = $request->hasil_psikologis;
        $data->pengguna_narkoba     = $request->hasil_narkoba;
        $data->gangguan_psikotik    = $request->hasil_psikotik;
        $data->gangguan_ptsd        = $request->hasil_ptsd;
        $data->keterangan           = $keterangan;
        $data->save();

        if ($data->save()) {
            return response()->json([
                'success' => true,
                'data' => $data->id,
                'note' => 'Data Berhasil Di Input'
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'note' => 'Data Gagal Di Input'
            ], 400);
        }
    }

    public function printSDQ(Request $request)
    {
        $data = HasilSDQ::where('id', $request->id)->get();

        if ($request->pasien_baru) {

            $last_id_user = User::orderBy('id', 'desc')->first()->id + 1;

            $code_verif = 'empus' . substr(str_replace('-', "", date($data[0]->created_at)), 0, 4) . $last_id_user;

            $user                 = new User();
            $user->name           = $code_verif;
            $user->verif_code     = $code_verif;
            $user->role           = 'pasien';
            $user->status_verif   = 'false';
            $user->save();

            $data[0]->update([
                'user_id' => $user->id,
            ]);

            $data[0]->save();

            $pdf = PDF::loadview('kuisioner.pdf.sdq', ['data' => $data, 'code_verif' => $code_verif]);
            return $pdf->download('Hasil Kuisioner SDQ ' . $data[0]->nama . ' (' . $data[0]->instansi . ')' . '.pdf');
        }

        $pdf = PDF::loadview('kuisioner.pdf.sdq', ['data' => $data,]);
        return $pdf->download('Hasil Kuisioner SDQ ' . $data[0]->nama . ' (' . $data[0]->instansi . ')' . '.pdf');
    }

    public function printSRQ(Request $request)
    {
        $data = HasilSRQ::where('id', $request->id)->get();

        if ($request->pasien_baru) {

            $last_id_user = User::orderBy('id', 'desc')->first()->id + 1;

            $code_verif = 'empus' . substr(str_replace('-', "", date($data[0]->created_at)), 0, 4) . $last_id_user;

            $user                 = new User();
            $user->name           = $code_verif;
            $user->verif_code     = $code_verif;
            $user->role           = 'pasien';
            $user->status_verif   = 'false';
            $user->save();

            $data[0]->update([
                'user_id' => $user->id,
            ]);

            $data[0]->save();

            $pdf = PDF::loadview('kuisioner.pdf.srq', ['data' => $data, 'code_verif' => $code_verif]);
            return $pdf->download('Hasil Kuisioner SRQ ' . $data[0]->nama . ' (' . $data[0]->instansi . ')' . '.pdf');
        }

        $pdf = PDF::loadview('kuisioner.pdf.srq', ['data' => $data,]);
        return $pdf->download('Hasil Kuisioner SRQ ' . $data[0]->nama . ' (' . $data[0]->instansi . ')' . '.pdf');
    }
}
