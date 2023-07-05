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
                            <th>Skor Kesulitan</th>
                            <th>Skor E</th>
                            <th>Skor C</th>
                            <th>Skor H</th>
                            <th>Skor P</th>
                            <th>Skor Pro</th>
                            <th>Skor Keseluruhan</th>
                            <th>Dibuat Pada</th>
                            <th>Export PDF</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($hasil as $index => $value)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $value->nama }}</td>
                            <td>{{ $value->instansi }}</td>
                            <th>
                                @if ($value->hasil_kesulitan === 'NORMAL')
                                    <div class="text-success">{{ $value->skor_kesulitan }}</div>
                                @elseif($value->hasil_e === 'BORDERLINE / AMBANG')
                                    <div class="text-warning">{{ $value->skor_kesulitan }}</div>
                                @else
                                    <div class="text-danger">{{ $value->skor_kesulitan }}</div>
                                @endif
                            </td>
                            <th>
                                @if ($value->hasil_e === 'NORMAL')
                                    <div class="text-success">{{ $value->skor_e }}</div>
                                @elseif($value->hasil_e === 'BORDERLINE / AMBANG')
                                    <div class="text-warning">{{ $value->skor_e }}</div>
                                @else
                                    <div class="text-danger">{{ $value->skor_e }}</div>
                                @endif
                            </th>
                            <th>
                                @if ($value->hasil_c === 'NORMAL')
                                    <div class="text-success">{{ $value->skor_c }}</div>
                                @elseif($value->hasil_c === 'BORDERLINE / AMBANG')
                                    <div class="text-warning">{{ $value->skor_c }}</div>
                                @else
                                    <div class="text-danger">{{ $value->skor_c }}</div>
                                @endif 
                            </th>
                            <th>
                                @if ($value->hasil_h === 'NORMAL')
                                    <div class="text-success">{{ $value->skor_h }}</div>
                                @elseif($value->hasil_h === 'BORDERLINE / AMBANG')
                                    <div class="text-warning">{{ $value->skor_h }}</div>
                                @else
                                    <div class="text-danger">{{ $value->skor_h }}</div>
                                @endif 
                            </th>
                            <th>
                                @if ($value->hasil_p === 'NORMAL')
                                    <div class="text-success">{{ $value->skor_p }}</div>
                                @elseif($value->hasil_p === 'BORDERLINE / AMBANG')
                                    <div class="text-warning">{{ $value->skor_p }}</div>
                                @else
                                    <div class="text-danger">{{ $value->skor_p }}</div>
                                @endif 
                            </th>
                            <th>
                                @if ($value->hasil_pro === 'NORMAL')
                                    <div class="text-success">{{ $value->skor_pro }}</div>
                                @elseif($value->hasil_pro === 'BORDERLINE / AMBANG')
                                    <div class="text-warning">{{ $value->skor_pro }}</div>
                                @else
                                    <div class="text-danger">{{ $value->skor_pro }}</div>
                                @endif                            
                            </th>
                            <th>
                                <div class="text-primary">{{ $value->skor_keseluruhan }}</div>
                            </th>
                            <td>{{ $value->created_at }}</td>
                            <td>
                                <a href="{{ route('pdf.sdq', $value->id) }}" class="btn btn-success btn ml-2">Export</a>
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
                                columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
                            }
                        },
                        {
                            extend: 'print',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9, 10 ]
                            }
                        },
                        
                    ]
                });
            } );
        </script>
@endsection