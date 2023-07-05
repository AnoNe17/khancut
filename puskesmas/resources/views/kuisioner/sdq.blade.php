@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4">
        <h1 class="mt-4">Data Hasil Kuisioner SDQ</h1>
        <button type="button" class="btn btn-primary mb-2 mt-3" id="inputan_data" data-bs-toggle="modal" data-bs-target="#exampleModal" >
            Isi Kuisioner SDQ
        </button>
        
        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Isi Data</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="{{ route('kuisioner.sdq') }}" method="GET">
                        <div class="modal-body">
                            <div class="form-floating mb-3">
                                <input id="nama" type="text" class="form-control" name="nama" value="{{ old('nama') }}" required autocomplete="nama" autofocus>
                                <label for="">Nama</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input id="instansi" type="text" class="form-control" name="instansi" value="{{ old('email') }}" required autocomplete="instansi">
                                <label for="">Instansi</label>
                            </div>
                            <div class="form-floating mb-3">
                                <input id="umur" type="number" class="form-control " name="umur" value="{{ old('umur') }}" required autocomplete="umur">
                                <label for="">Umur</label>
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
        {{-- <a href="{{ route('kuisioner.sdq') }}" class="mb-2 mt-3 btn btn-primary">Isi Kuisioner SDQ</a> --}}
        <div class="card ">
            <div class="card-body">
                <table id="datatable">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>Instansi</th>
                            <th>Total Skor Kesulitan</th>
                            <th>Skor E</th>
                            <th>Hasil E</th>
                            <th>Skor C</th>
                            <th>Hasil C</th>
                            <th>Skor H</th>
                            <th>Hasil H</th>
                            <th>Skor P</th>
                            <th>Hasil P</th>
                            <th>Skor Pro</th>
                            <th>Hasil Pro</th>
                            <th>Skor Keseluruhan</th>
                            <th>Dibuat Pada</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($hasil as $index => $value)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $value->nama }}</td>
                            <td>{{ $value->instansi }}</td>
                            <td>{{ $value->skor_kesulitan }}</td>
                            <td>{{ $value->skor_e }}</td>
                            <td>{{ $value->hasil_e }}</td>
                            <td>{{ $value->skor_c }}</td>
                            <td>{{ $value->hasil_c }}</td>
                            <td>{{ $value->skor_h }}</td>
                            <td>{{ $value->hasil_h }}</td>
                            <td>{{ $value->skor_p }}</td>
                            <td>{{ $value->hasil_p }}</td>
                            <td>{{ $value->skor_pro }}</td>
                            <td>{{ $value->hasil_pro }}</td>
                            <td>{{ $value->skor_keseluruhan }}</td>
                            <td>{{ $value->created_at }}</td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection