<?php

namespace App\Http\Controllers;

use App\Models\Pasien;
use Illuminate\Http\Request;
use Alert;
use App\Models\User;
use Hash;

class PasienController extends Controller
{
    public function index()
    {
        $pasien = Pasien::orderBy('created_at', 'desc')->get();
        return view('pasien.view', compact('pasien'));
    }

    public function cek(Request $request)
    {
        $user = User::where('verif_code', $request->code)->where('status_verif', 'false')->first();
        // return $user;
        if (!empty($user)) {
            Alert::success('Kode Verifikasi ditemukan');
            return view('pasien.create', compact('user'));
        } else {
            Alert::error('Kode Verifikasi Tidak Ditemukan');
            return redirect()->route('pasien');
        }
    }

    public function create()
    {
        return view('pasien.create');
    }

    public function store(Request $request)
    {
        if ($request->user_id) {
            $user = User::where('id', $request->user_id)->first();
            $user->update([
                'password' => Hash::make('@' . $user->verif_code),
                'status_verif' => 'true',
            ]);

            $pasien             = new Pasien();
            $pasien->user_id    = $request->user_id;
            $pasien->nama       = $request->nama;
            $pasien->umur       = $request->umur;
            $pasien->instansi   = $request->instansi;
            $pasien->no_hp      = $request->no_hp;
            $pasien->alamat     = $request->alamat;
            $pasien->pekerjaan  = $request->pekerjaan;
            $pasien->save();
        } else {
            $last_id_user = User::orderBy('id', 'desc')->first()->id + 1;

            $code_verif = 'empus' . date('Y') . $last_id_user;

            $user                 = new User();
            $user->name           = $code_verif;
            $user->verif_code     = $code_verif;
            $user->role           = 'pasien';
            $user->status_verif   = 'true';
            $user->password       = Hash::make('@' . $user->verif_code);
            $user->save();


            $pasien             = new Pasien();
            $pasien->user_id    = $user->id;
            $pasien->nama       = $request->nama;
            $pasien->umur       = $request->umur;
            $pasien->instansi   = $request->instansi;
            $pasien->no_hp      = $request->no_hp;
            $pasien->alamat     = $request->alamat;
            $pasien->pekerjaan  = $request->pekerjaan;
            $pasien->save();
        }
        Alert::success('Data Berhasil Ditambahkan');
        return redirect()->route('pasien');
    }

    public function edit($id)
    {
        $pasien = Pasien::find($id);
        return view('pasien.edit', compact('pasien'));
    }

    public function update(Request $request)
    {
        $pasien = Pasien::where('id', $request->pasien_id)->first();
        $pasien->update([
            'nama' => $request->nama,
            'umur' => $request->umur,
            'instansi' => $request->instansi,
            'no_hp' => $request->no_hp,
            'alamat' => $request->alamat,
            'pekerjaan' => $request->pekerjaan,
        ]);

        Alert::success('Data Berhasil Diedit');
        return redirect()->route('pasien');
    }

    public function delete($id)
    {
        // menghapus data jenis berdasarkan id yang dipilih
        $pasien = Pasien::where('id', $id)->first();

        $pasien->delete();

        Alert::success('Data Berhasil Dihapus');
        return redirect()->route('pasien');
    }
}
