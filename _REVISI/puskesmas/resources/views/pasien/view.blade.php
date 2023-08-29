@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4">
        <h1 class="mt-4">Data Pasien</h1>

        <a href="{{ route('pasien.create') }}" class="mb-4 mt-4 btn btn-primary">Tambah Data pasien</a> &nbsp;&nbsp;
        <button type="button" class="btn btn-success mb-4 mt-4" id="inputan_data" data-bs-toggle="modal" data-bs-target="#exampleModal" >
            Verifikasi Kode Pasien
        </button>

        <!-- Modal -->
        <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Verifikasi Kode Pasien</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="{{ route('pasien.cek') }}" method="POST">
                        @csrf
                        <div class="modal-body">
                            <div class="form-floating mb-3">
                                <input id="code" type="text" class="form-control" name="code" value="{{ old('code') }}" required autocomplete="code" autofocus>
                                <label for="">Kode Veifikasi</label>
                            </div>
                        </div>
                        <div class="modal-footer">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                            <button type="input" class="btn btn-primary">Cek</button>
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
                            <th>Username</th>
                            <th>Nama</th>
                            <th>Umur</th>
                            <th>Instansi</th>
                            <th>No HP</th>
                            <th>Alamat</th>
                            <th>Pekerjaan</th>
                            <th>Riwayat SDQ</th>
                            <th>Riwayat SRQ</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($pasien as $index => $value)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <th>{{ $value->User->verif_code }}</th>
                            <td>{{ $value->nama }}</td>
                            <td>{{ $value->umur }}</td>
                            <td>{{ $value->instansi }}</td>
                            <td>{{ $value->no_hp }}</td>
                            <td>{{ $value->alamat }}</td>
                            <td>{{ $value->pekerjaan }}</td>
                            <td>
                                @if (!$value->User->SDQ->isEmpty())
                                    <a href="{{ route('pasien.sdq', $value->id) }}" class="btn btn-success btn ml-2">Riwayat SDQ</a>
                                @else
                                    -
                                @endif
                            </td>
                            <td>
                                @if (!$value->User->SRQ->isEmpty())
                                    <a href="{{ route('pasien.srq', $value->id) }}" class="btn btn-warning btn ml-2">Riwayat SRQ</a>
                                @else
                                    -
                                @endif
                            </td>
                            <td>
                                <a href="{{ route('pasien.edit', $value->id) }}" class="btn btn-primary btn ml-2">Edit</a>
                                <a href="{{ route('pasien.delete', $value->id) }}" class="btn btn-danger btn ml-2">Hapus</a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
            </div>
        </div>
    </div>
@endsection

@section('script')
     <script>
            $(document).ready(function() {
                // Pembuatan datatable
                $('#datatable').DataTable( {
                    dom: 'Bfrtlp',
                    lengthMenu: [[10, 20, 100], [10, 20, 100]],
                    buttons: [
                        {
                            extend: 'csv',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3,4,5,6,7]
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3,4,5,6,7]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3,4,5,6,7]
                            }
                        },
                        {
                            extend: 'print',
                            exportOptions: {
                                stripHtml: false,
                                columns: [ 0, 1, 2, 3,4,5,6,7]
                            }
                        },

                    ]
                });
            } );
        </script>
@endsection
