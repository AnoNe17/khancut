<?php

namespace App\Http\Controllers;

use App\Models\Pasien;
use Illuminate\Http\Request;

class PasienController extends Controller
{
    public function index()
    {
        $pasien = Pasien::orderBy('created_at', 'desc')->get();
        // return $pasien;
        return view('pasien.view', compact('pasien'));
    }
}
