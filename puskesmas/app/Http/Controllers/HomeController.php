<?php

namespace App\Http\Controllers;

use App\Models\Dokter;
use App\Models\HasilSDQ;
use App\Models\HasilSRQ;
use App\Models\Notifikasi;
use App\Models\Pasien;
use App\Models\User;
use Illuminate\Http\Request;
use Alert;

class HomeController extends Controller
{
    /**
     * Create a new controller instance.
     *
     * @return void
     */
    public function __construct()
    {
        $this->middleware('auth');
    }

    /**
     * Show the application dashboard.
     *
     * @return \Illuminate\Contracts\Support\Renderable
     */
    public function index()
    {
        $pasien = Pasien::count();
        $dokter = Dokter::count();
        $sdq = HasilSDQ::count();
        $srq = HasilSRQ::count();
        $notifikasi = Notifikasi::count();


        return view('home', compact('pasien', 'dokter', 'sdq', 'srq', 'notifikasi'));
    }

    public function edit_profil($id)
    {
        $user = User::find($id);
        return view('edit_profil', compact('user'));
    }

    public function update(Request $request)
    {

        $user = User::where('id', $request->id_user)->first();
        // $dokter->User->update([
        //     'email' => $request->email
        // ]);

        if (!empty($new_password)) {
            $password = $new_password;
        } else {
            $password = $request->old_password;
        }
        $user->update([
            'name' => $request->username,
            'email' => $request->email,
            'password' => $password
        ]);

        Alert::success('Data Berhasil Diedit');
        return redirect()->route('home');
        // return $request;
        // $user = User::find($id);
        // return view('edit_profil', compact('user'));
    }
}
