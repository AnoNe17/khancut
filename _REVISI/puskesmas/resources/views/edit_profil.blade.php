@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4 mb-5">
        <h1 class="mt-4">Edit Data User</h1>
        <br>
        
        <div class="container">
            <form action="{{ route('profil.update') }}" method="POST" enctype="multipart/form-data">
                @csrf
                <input type="hidden" name="id_user" value="{{ $user->id }}">
                <div class="modal-body">
                    <div class="form-floating mb-4">
                        <input id="username" type="text" class="form-control" name="username" value="{{ $user->name }}" required  >
                        <label for="">Username</label>
                    </div>
                    <div class="form-floating mb-4">
                        <input id="email" type="email" class="form-control" name="email" value="{{ $user->email }}" required  >
                        <label for="">Email</label>
                    </div>
                    <input id="password" type="hidden" class="form-control" name="old_password" value="{{ $user->password }}" readonly>
                    <div class="form-floating mb-4">
                        <input id="password" type="password" class="form-control" name="new_password" >
                        <label for="">Password Baru</label>
                    </div>
                </div>
                <div class="modal-footer">
                    <button type="input" class="btn btn-primary m-2 btn-lg">Simpan</button>
                </div>
            </form>
        </div>
    </div>
@endsection