@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4">
        <h1 class="mt-4">Data Hasil Kuisioner SRQ</h1>
        <button type="button" class="btn btn-primary mb-2 mt-3" id="inputan_data" data-bs-toggle="modal" data-bs-target="#exampleModal" >
            Isi Kuisioner SRQ
        </button>
        
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Isi Data</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="{{ route('kuisioner.srq') }}" method="GET">
                        <div class="modal-body">
                            <div class="form-floating mb-3">
                                <input id="nama" type="text" class="form-control" name="nama" value="{{ old('nama') }}" required autocomplete="nama" autofocus>
                                <label for="">Nama</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input id="umur" type="number" class="form-control " name="umur" value="{{ old('umur') }}" required autocomplete="umur">
                                <label for="">Umur</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input id="no_hp" type="text" class="form-control" name="no_hp" value="{{ old('no_hp') }}" required autocomplete="no_hp">
                                <label for="">No Hp</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input id="alamat" type="text" class="form-control" name="alamat" value="{{ old('alamat') }}" required autocomplete="alamat">
                                <label for="">Alamat</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input id="pekerjaan" type="text" class="form-control" name="pekerjaan" value="{{ old('pekerjaan') }}" required autocomplete="pekerjaan">
                                <label for="">Pekerjaan</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="input" class="btn btn-primary">Selanjutnya</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
        <div class="card ">
            <div class="card-body">
                <table id="datatable">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>Umur</th>
                            <th>No HP</th>
                            <th>Alamat</th>
                            <th>Pekerjaan</th>
                            <th>Hasil</th>
                            <th>Dibuat Pada</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($hasil as $index => $value)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $value->nama }}</td>
                            <td>{{ $value->umur }}</td>
                            <td>{{ $value->no_hp }}</td>
                            <td>{{ $value->alamat }}</td>
                            <td>{{ $value->pekerjaan }}</td>
                            <td>{{ $value->hasil }}</td>
                            <td>{{ $value->created_at }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection