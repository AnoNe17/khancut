@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4 mb-5">
        <h1 class="mt-4">Tambah Data Pasien</h1>
        <br>
        
        <div class="container">
            <form action="{{ route('pasien.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">
                    <div class="form-floating mb-4">
                        <input id="nama" type="text" class="form-control" name="" value="{{ $pasien->User->verif_code }}" disabled>
                        <label for="">Code Verifikasi</label>
                        <input type="hidden" name="pasien_id" value="{{ $pasien->id }}">
                    </div>
                    <div class="form-floating mb-4">
                        <input id="nama" type="text" class="form-control" name="nama" value="{{ $pasien->nama }}" required autocomplete="nama" autofocus>
                        <label for="">Nama</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="umur" type="number" class="form-control" name="umur" value="{{ $pasien->umur }}" required autocomplete="umur" autofocus>
                        <label for="">Umur</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="instansi" type="text" class="form-control" name="instansi" value="{{ $pasien->instansi }}" required autocomplete="instansi" autofocus>
                        <label for="">Instansi</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="no_hp" type="number" class="form-control" name="no_hp" value="{{ $pasien->no_hp }}" required autocomplete="no_hp" autofocus>
                        <label for="">No HP</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="alamat" type="text" class="form-control" name="alamat" value="{{ $pasien->alamat }}" required autocomplete="alamat" autofocus>
                        <label for="">Alamat</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="pekerjaan" type="text" class="form-control" name="pekerjaan" value="{{ $pasien->pekerjaan }}" required autocomplete="pekerjaan" autofocus>
                        <label for="">Pekerjaan</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary m-2 btn-lg" data-bs-dismiss="modal">Close</button>
                    <button type="input" class="btn btn-primary m-2 btn-lg">Simpan</button>
                </div>
            </form>
        </div>
    </div>
@endsection