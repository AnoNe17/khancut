@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4">
        <h1 class="mt-4">Data Dokter</h1>
        
        <a href="{{ route('dokter.create') }}" class="mb-2 mt-3 btn btn-primary">Tambah Data Dokter</a>
        <div class="card ">
            <div class="card-body">
                <table id="datatable">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>NIP Dokter</th>
                            <th>Nama</th>
                            <th>Jabatan</th>
                            <th>Gambar</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($dokter as $index => $value)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $value->nip }}</td>
                            <td>{{ $value->nama }}</td>
                            <td>{{ $value->jabatan }}</td>
                            <td><img src="{{ asset('admin/assets/img/' . $value->image) }}" style="width: 60px; height: 60px;"></td>
                            <td>
                                <a href="{{ route('dokter.edit', $value->id) }}" class="btn btn-primary btn ml-2">Edit</a>
                                <a href="{{ route('dokter.delete', $value->id) }}" class="btn btn-danger btn ml-2">Hapus</a>
                                {{-- <button type="button" class="btn btn-success btn-sm" id="inputan_data" data-bs-toggle="modal" data-bs-target="#exampleModal" >
                                    Reset Password
                                </button> --}}
                                
                                <!-- Modal -->
                                {{-- <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Reset Password</h5>
                                                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                            </div>
                                            <form action="{{ route('dokter.reset') }}" method="POST">
                                                @csrf
                                                <div class="modal-body">
                                                    <div class="form-floating mb-3">
                                                        <input type="hidden" name="id_dokter" value="{{ $value->id }}">
                                                        <input id="password" type="password" class="form-control" name="password" value="{{ old('password') }}" required autocomplete="password">
                                                        <label for="">Password Baru</label>
                                                    </div>
                                                </div>
                                                <div class="modal-footer">
                                                    <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                                                    <button type="input" class="btn btn-primary">Selanjutnya</button>
                                                </div>
                                            </form>
                                        </div>
                                    </div>
                                </div> --}}
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection