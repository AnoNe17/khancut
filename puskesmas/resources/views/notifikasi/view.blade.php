@extends('layouts.app')

@section('content')
    <div class="container-fluid px-4">
        <h1 class="mt-4">Data Notifikasi</h1>
        <button type="button" class="btn btn-primary mb-2 mt-3" id="inputan_data" data-bs-toggle="modal" data-bs-target="#exampleModal" >
            Tambah Notifikasi
        </button>
        
        <!-- Modal -->
        <div class="modal fade modal-lg" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
            <div class="modal-dialog">
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title" id="exampleModalLabel">Tambah Notifikasi</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <form action="{{ route('notifikasi.store') }}" method="POST">
                        @csrf
                        <div class="modal-body">
                            <div class=" mb-3">
                                <select class="form-select" aria-label="Default select example" name="user_id">
                                    <option selected disabled>-- Silahkan Pilih User --</option>
                                    @foreach ($user as $value)
                                        <option value="{{ $value->id }}">{{ $value->name }}</option>
                                    @endforeach
                                </select>
                            </div>
                            <div class="form-floating mb-3">
                                <textarea class="form-control" rows="15" style="height:100%;" name="isi"></textarea>
                                <label for="">Isi Notifikasi</label>
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
                            <th>User</th>
                            <th>Isi Notifikasi</th>
                            <th>Dibuat Pada</th>
                        </tr>
                    </thead>
                    <tbody>
                        @foreach ($notif as $index => $value)
                        <tr>
                            <td>{{ $index + 1 }}</td>
                            <td>{{ $value->User->name }}</td>
                            <td>{{ $value->isi }}</td>
                            <td>{{ $value->created_at }}</td>
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