<?php

namespace App\Http\Controllers\API;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use App\Models\HasilSDQ;
use App\Models\HasilSRQ;
use App\Models\Notifikasi;
use App\Models\Pasien;

class DashboardController extends Controller
{

    public function dashboard(Request $request)
    {
        $pasien = Pasien::where('user_id', $request->user_id)->first();

        // return count($pasien->User->SRQ);
        $data['banyak_sdq'] = count($pasien->User->SDQ);
        $data['banyak_srq'] = count($pasien->User->SRQ);

        if (!empty($data)) {
            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);
        } else {
            return response()->json([
                'success' => false,
            ], 400);
        }
    }

    public function riwayatSDQ(Request $request)
    {

        $data = HasilSDQ::where('user_id', $request->user_id)->get();

        foreach ($data as $key => $value) {
            $data[$key]["tanggal"] = date($value->created_at);
        }

        if (count($data) !== 0) {
            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);
        } else {
            return response()->json([
                'success' => false,
                'data' => $data
            ], 400);
        }
    }

    public function riwayatSRQ(Request $request)
    {
        $data = HasilSRQ::where('user_id', $request->user_id)->get();

        if (count($data) !== 0) {
            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);
        } else {
            return response()->json([
                'success' => false,
            ], 400);
        }
    }

    public function notifikasi(Request $request)
    {
        $data = Notifikasi::where('user_id', $request->user_id)->get();

        if (count($data) !== 0) {
            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);
        } else {
            return response()->json([
                'success' => false,
            ], 400);
        }
    }

    public function profil(Request $request)
    {
        $data = Pasien::where('user_id', $request->user_id)->first();
        $data["kode_verif"] = $data->User->verif_code;

        if (!empty($data)) {
            return response()->json([
                'success' => true,
                'data' => $data
            ], 200);
        } else {
            return response()->json([
                'success' => false,
            ], 400);
        }
    }
}
