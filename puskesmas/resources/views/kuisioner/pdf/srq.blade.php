<!DOCTYPE html>
<html>
<head>
	<title>Hasil SDQ</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
	<style type="text/css">
		table tr td,
		table tr th{
			font-size: 9pt;
		}
	</style>
	<center>
		<h4>Puskesmas Kertasemaya</h4>
            <br><br>
        <h6>Hasil Kuisioner SRQ : </h6>
		<h5>{{ $data[0]->nama }} ({{ $data[0]->no_hp }})</h5>
        <br>
	</center>
 
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
	<br><br><br><br>
    @if (isset($code_verif))
        <center>
            <h5>Kode Verifikasi :</h5>
            <h2>{{ $code_verif }}</h2>
        </center>
    @endif
 
</body>
</html>
