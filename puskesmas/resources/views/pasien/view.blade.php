@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4">
        <h1 class="mt-4">Data Pasien</h1>
        
        <a href="" class="mb-4 mt-3 btn btn-primary">Tambah Data pasien</a>
        <a href="" class="mb-4 mt-3 mx-3 btn btn-success">Verifikasi Pasien baru</a>
        <div class="card ">
            <div class="card-body">
                <table id="datatable">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>Umur</th>
                            <th>Instansi</th>
                            <th>No HP</th>
                            <th>Alamat</th>
                            <th>Pekerjaan</th>
                            <th>action</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($pasien as $index => $value)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $value->nama }}</td>
                            <td>{{ $value->umur }}</td>
                            <td>{{ $value->instansi }}</td>
                            <td>{{ $value->no_hp }}</td>
                            <td>{{ $value->alamat }}</td>
                            <td>{{ $value->pekerjaan }}</td>
                            <td>
                                {{-- <a href="{{ route('pasien.edit', $value->id) }}" class="btn btn-primary btn ml-2">Edit</a>
                                <a href="{{ route('pasien.delete', $value->id) }}" class="btn btn-danger btn ml-2">Hapus</a> --}}
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
                $('#datatable').DataTable( {
                    dom: 'Bfrtlp',
                    lengthMenu: [[10, 20, 100], [10, 20, 100]],
                    buttons: [
                        {
                            extend: 'csv',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3,]
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            exportOptions: {
                                
                                columns: [ 0, 1, 2, 3,]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3,]
                            }
                        },
                        {
                            extend: 'print',
                            exportOptions: {
                                stripHtml: false,
                                columns: [ 0, 1, 2, 3, 4,]
                            }
                        },
                        
                    ]
                });
            } );
        </script>
@endsection