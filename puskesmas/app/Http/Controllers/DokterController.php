<?php

namespace App\Http\Controllers;


use App\Models\Dokter;
use App\Models\User;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Hash;

class DokterController extends Controller
{
    public function index()
    {
        $dokter = Dokter::orderBy('created_at', 'desc')->get();
        return view('dokter.view', compact('dokter'));
    }

    public function create()
    {
        return view('dokter.create');
    }

    public function store(Request $request)
    {

        $ext_doc = $request->image->extension();
        if ($ext_doc == 'jpeg' || $ext_doc == 'png' || $ext_doc == 'jpg') {
            $docName = rand() . '.' . $ext_doc;
            $request->image->move(public_path('admin/assets/img'), $docName);
        } else {
            return back()->with('failed', 'failed');
        }

        $dokter            = new Dokter();
        $dokter->nama      = $request->nama;
        $dokter->nip       = $request->nip;
        $dokter->jabatan   = $request->jabatan;
        $dokter->image     = $docName;
        $dokter->save();


        return redirect()->route('dokter');
        // return view('kuisioner.hasil.hasil_sdq', compact('total', 'total_e', 'total_c', 'total_h', 'total_p', 'total_pro', 'hasil_kesulitan', 'hasil_e', 'hasil_c', 'hasil_h', 'hasil_p', 'hasil_pro', 'nama', 'instansi', 'umur'));
        // }
    }

    public function reset(Request $request)
    {
        // return $request;
        $dokter = Dokter::find($request->id_dokter);
        $dokter->User->update([
            'password' => Hash::make($request->password)
        ]);

        return redirect()->route('dokter');
    }

    public function edit($id)
    {
        $dokter = Dokter::find($id);
        return view('dokter.edit', compact('dokter'));
    }

    public function update(Request $request)
    {
        // return $request;

        // return $request->image_new->extension();
        if ($request->hasFile('image_new')) {
            $extension = $request->image_new->extension();
            if ($extension == 'jpeg' || $extension == 'png' || $extension == 'jpg') {
                $docName = rand() . '.' . $request->image_new->extension();
                $request->image_new->move(public_path('admin/assets/img/'), $docName);
            } else {
                $message = 'Invalid image extention format';
            }
        } else {
            $docName = $request->input('image_old');
        }

        $dokter = Dokter::where('id', $request->id_dokter)->first();
        // $dokter->User->update([
        //     'email' => $request->email
        // ]);
        $dokter->update([
            'nip' => $request->nip,
            'nama' => $request->nama,
            'jabatan' => $request->jabatan,
            'image' => $docName
        ]);

        return redirect()->route('dokter');
    }

    public function delete($id)
    {
        // menghapus data jenis berdasarkan id yang dipilih
        $dokter = Dokter::where('id', $id)->first();
        // $dokter->User->delete();
        $dokter->delete();

        return redirect()->route('dokter');
    }
}
