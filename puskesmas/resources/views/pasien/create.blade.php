@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4 mb-5">
        <h1 class="mt-4">Tambah Data Pasien</h1>
        <br>
        
        <div class="container">
            <form action="{{ route('pasien.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">
                    @isset($user)
                        <div class="form-floating mb-4">
                            <input type="text" class="form-control" name="" value="{{ $user->verif_code }}" required autocomplete="nip" disabled>
                            <input type="hidden" class="form-control" name="user_id" value="{{ $user->id }}" required autocomplete="nip" >
                            <label for="">Code Verifikasi</label>
                        </div>
                    @endisset
                    
                    <div class="form-floating mb-4">
                        <input id="nama" type="text" class="form-control" name="nama" value="{{ old('nama') }}" required autocomplete="nama" autofocus>
                        <label for="">Nama</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="umur" type="number" class="form-control" name="umur" value="{{ old('umur') }}" required autocomplete="umur" autofocus>
                        <label for="">Umur</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="instansi" type="text" class="form-control" name="instansi" value="{{ old('instansi') }}" required autocomplete="instansi" autofocus>
                        <label for="">Instansi</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="no_hp" type="number" class="form-control" name="no_hp" value="{{ old('no_hp') }}" required autocomplete="no_hp" autofocus>
                        <label for="">No HP</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="alamat" type="text" class="form-control" name="alamat" value="{{ old('alamat') }}" required autocomplete="alamat" autofocus>
                        <label for="">Alamat</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="pekerjaan" type="text" class="form-control" name="pekerjaan" value="{{ old('pekerjaan') }}" required autocomplete="pekerjaan" autofocus>
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