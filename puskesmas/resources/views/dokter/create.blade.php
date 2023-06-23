@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4 mb-5">
        <h1 class="mt-4">Tambah Data Dokter</h1>
        <br>
        
        <div class="container">
            <form action="{{ route('dokter.store') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <div class="modal-body">
                    <div class="form-floating mb-4">
                        <input id="nip" type="text" class="form-control" name="nip" value="{{ old('nip') }}" required autocomplete="nip" autofocus>
                        <label for="">Nip</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="nama" type="text" class="form-control" name="nama" value="{{ old('nama') }}" required autocomplete="nama" autofocus>
                        <label for="">Nama</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="jabatan" type="text" class="form-control" name="jabatan" value="{{ old('jabatan') }}" required autocomplete="jabatan" autofocus>
                        <label for="">Jabatan</label>
                    </div>
                    <div class="form mb-5">
                        <label for="">Gambar</label>
                        <input id="image" type="file" class="form-control" name="image" value="{{ old('image') }}" required autocomplete="image" autofocus>
                    </div>
                    {{-- <div class="form-floating mb-4">
                        <input id="email" type="email" class="form-control" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>
                        <label for="">Email</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="password" type="password" class="form-control" name="password" value="{{ old('password') }}" required autocomplete="password" autofocus>
                        <label for="">Password</label>
                    </div> --}}
                </div>
                <div class="modal-footer">
                    <button type="button" class="btn btn-secondary m-2 btn-lg" data-bs-dismiss="modal">Close</button>
                    <button type="input" class="btn btn-primary m-2 btn-lg">Simpan</button>
                </div>
            </form>
        </div>
    </div>
@endsection