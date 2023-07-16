@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4 mb-5">
        <h1 class="mt-4">Edit Data Dokter</h1>
        <br>
        
        <div class="container">
            <form action="{{ route('dokter.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id_dokter" value="{{ $dokter->id }}">
                <div class="modal-body">
                    <div class="form-floating mb-4">
                        <input id="nip" type="text" class="form-control" name="nip" value="{{ $dokter->nip }}" required  >
                        <label for="">Nip</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="nama" type="text" class="form-control" name="nama" value="{{ $dokter->nama }}" required autocomplete="nama" >
                        <label for="">Nama</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="jabatan" type="text" class="form-control" name="jabatan" value="{{ $dokter->jabatan }}" required autocomplete="jabatan" >
                        <label for="">Jabatan</label>
                    </div>
                    <div class="form mb-5">
                        <div class="row">
                            <div class="col-md-2">
                                <img class="img-fluid" src="{{ asset('admin/assets/img/' . $dokter->image) }}">
                                <input type="hidden" value="{{ $dokter->image }}" name="image_old">
                            </div>
                            <div class="col-md-10">
                                <label for="">Gambar</label>
                                <input id="image" type="file" class="form-control" name="image_new" autocomplete="image" >
                            </div>
                        </div>
                    </div>
                    {{-- <div class="form-floating mb-4">
                        <input id="email" type="email" class="form-control" name="email" value="{{ $dokter->User->email }}" required autocomplete="email" >
                        <label for="">Email</label>
                    </div> --}}
                </div>
                <div class="modal-footer">
                    <button type="input" class="btn btn-primary m-2 btn-lg">Simpan</button>
                </div>
            </form>
        </div>
    </div>
@endsection