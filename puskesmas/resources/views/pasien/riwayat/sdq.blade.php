@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4">
        <h1 class="mt-4">Riwayat Kuisioner SDQ <br>{{ $pasien->nama }} ({{ $pasien->instansi }})</h1>
        
        {{-- <a href="{{ route('kuisioner.sdq') }}" class="mb-2 mt-3 btn btn-primary">Isi Kuisioner SDQ</a> --}}
            <br><br>
                <table id="datatable" class="">
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>Nama</th>
                            <th>Gejala Emosional</th>
                            <th>Gejala perilaku</th>
                            <th>Hiperaktivitas</th>
                            <th>Masalah Teman Sebaya</th>
                            <th>Perilaku Proposional</th>
                            <th>Skor Keseluruhan</th>
                            <th>Dibuat Pada</th>
                            <th>Export PDF</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($riwayat_sdq as $index => $value)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $value->nama }}</td>
                            {{-- <th>
                                @if ($value->hasil_kesulitan === 'NORMAL')
                                    <div class="text-success">{{ $value->skor_kesulitan }}</div>
                                @elseif($value->hasil_e === 'BORDERLINE / AMBANG')
                                    <div class="text-warning">{{ $value->skor_kesulitan }}</div>
                                @else
                                    <div class="text-danger">{{ $value->skor_kesulitan }}</div>
                                @endif
                            </td> --}}
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