<?php

namespace App\Http\Controllers;

use App\Models\Dokter;
use Illuminate\Http\Request;

class LandingController extends Controller
{
    public function index()
    {
        $dokter = Dokter::orderBy('created_at', 'desc')->get();
        // return "asd";
        return view('index', compact('dokter'));
    }
}
