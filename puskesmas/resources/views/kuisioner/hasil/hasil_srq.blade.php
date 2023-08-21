<!DOCTYPE html>
<html>
<head>
	<title>Hasil SRQ</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>	
	<center>
		<h4>Puskesmas Kertasemaya</h4>
            <br><br>
        <h6>Hasil Kuisioner SRQ : </h6>
		<h5>{{ $data[0]->nama }} ({{ $data[0]->no_hp }})</h5>
        <br>
	</center>

	<div class="container">
		
 
	<table class='table table-bordered'>
		<thead>
			<tr>
                <th>Nama</th>
                <th>Umur</th>
                <th>Pekerjaan</th>
                <th>Hasil</th>
                <th>Keterangan</th>
                <th>Dibuat Pada</th>
            </tr>
		</thead>
		<tbody>
			<tr>
				<td>{{$data[0]->nama}}</td>
				<td>{{$data[0]->umur}}</td>
				<td>{{$data[0]->pekerjaan}}</td>
				<td>
                    @if ($data[0]->hasil_e === 'NORMAL')
                        <div class="text-success">{{ $data[0]->hasil }}</div>
                    @else
                        <div class="text-danger">{{ $data[0]->hasil }}</div>
                    @endif
                </td>
				<td>{!! $data[0]->keterangan !!}</td>
                <td>{{ $data[0]->created_at }}</td>
			</tr>
		</tbody>
	</table>
	
	</div>
	<br><br><br><br>
    <div class="col-12" style="height: 150px; padding-top: 50px">
                <div class="d-flex justify-content-center">
                    <a href="{{ route('hasil.srq') }}" class="btn btn-primary btn-lg">Kembali</a>
                </div>
            </div>
 
</body>
</html>
