@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4">
        <h1 class="mt-4">Riwayat Kuisioner SRQ <br>{{ $pasien->nama }} ({{ $pasien->instansi }})</h1>
        
        {{-- <a href="{{ route('kuisioner.sdq') }}" class="mb-2 mt-3 btn btn-primary">Isi Kuisioner SDQ</a> --}}
            <br><br>
                <table id="datatable" class="m-2">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>Masalah Psikologis</th>
                            <th>Pengguna Narkoba</th>
                            <th>Gangguan Psikotik</th>
                            <th>Gangguan PTSD</th>
                            <th>Hasil</th>
                            <th>Dibuat Pada</th>
                            <th>Export PDF</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($riwayat_srq as $index => $value)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $value->nama }}</td>
                            <th>
                                @if ($value->masalah_psikologis === 'ya')
                                    <div class="text-danger">{{ $value->masalah_psikologis }}</div>
                                @else
                                    <div class="text-success">{{ $value->masalah_psikologis }}</div>
                                @endif
                            </th>
                            <th>
                                @if ($value->pengguna_narkoba === 'ya')
                                    <div class="text-danger">{{ $value->pengguna_narkoba }}</div>
                                @else
                                    <div class="text-success">{{ $value->pengguna_narkoba }}</div>
                                @endif
                            </th>
                            <th>
                                @if ($value->gangguan_psikotik === 'ya')
                                    <div class="text-danger">{{ $value->gangguan_psikotik }}</div>
                                @else
                                    <div class="text-success">{{ $value->gangguan_psikotik }}</div>
                                @endif    
                            </th>
                            <th>
                                @if ($value->gangguan_ptsd === 'ya')
                                    <div class="text-danger">{{ $value->gangguan_ptsd }}</div>
                                @else
                                    <div class="text-success">{{ $value->gangguan_ptsd }}</div>
                                @endif
                            </th>
                            <th>
                                @if ($value->hasil === 'ABNORMAL')
                                    <div class="text-danger">{{ $value->hasil }}</div>
                                @else
                                    <div class="text-success">{{ $value->hasil }}</div>
                                @endif
                            </th>
                            <td>{{ $value->created_at }}</td>
                            <td>
                                <a href="{{ route('pdf.srq', $value->id) }}" class="btn btn-success btn ml-2">Export</a>
                            </td>
                        </tr>
                        @endforeach
                    </tbody>
                </table>
    </div>
    <br><br><br>
@endsection

@section('script')
     <script>
            $(document).ready(function() {
                $('#datatable').DataTable( {
                    responsive: true,
                    dom: 'Bfrtlp',
                    lengthMenu: [[10, 20, 100], [10, 20, 100]],
                    buttons: [
                        {
                            extend: 'csv',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
                            }
                        },
                        {
                            extend: 'excelHtml5',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
                            }
                        },
                        {
                            extend: 'pdfHtml5',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
                            }
                        },
                        {
                            extend: 'print',
                            exportOptions: {
                                columns: [ 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 ]
                            }
                        },
                        
                    ]
                });
            } );
        </script>
@endsection