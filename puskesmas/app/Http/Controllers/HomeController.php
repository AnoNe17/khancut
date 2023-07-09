<?php

namespace App\Http\Controllers;

use App\Models\Dokter;
use App\Models\HasilSDQ;
use App\Models\HasilSRQ;
use App\Models\Notifikasi;
use App\Models\Pasien;
use Illuminate\Http\Request;

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
}
