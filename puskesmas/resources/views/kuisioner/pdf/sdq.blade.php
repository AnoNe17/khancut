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
        <h6>Hasil Kuisioner SDQ : </h6>
		<h5>{{ $data[0]->nama }} ({{ $data[0]->instansi }})</h5>
        <br>
	</center>
 
	<table class='table table-bordered'>
		<thead>
			<tr>
                {{-- <th>Hasil Kesulitan</th> --}}
                <th>Gejala Emosional</th>
                <th>Gejala Perilaku</th>
                <th>Hiperaktivitas</th>
                <th>Masalah Teman Sebaya</th>
                <th>Perilaku Proposional</th>
                <th>Dibuat Pada</th>
            </tr>
		</thead>
		<tbody>
			<tr>
				{{-- <td>{{$data[0]->hasil_kesulitan}}</td> --}}
				<td>
                    @if ($data[0]->hasil_e === 'NORMAL')
                        <div class="text-success">{{ $data[0]->hasil_e }}</div>
                    @elseif($data[0]->hasil_e === 'BORDERLINE / AMBANG')
                        <div class="text-warning">{{ $data[0]->hasil_e }}</div>
                    @else
                        <div class="text-danger">{{ $data[0]->hasil_e }}</div>
                    @endif
                </td>
				<td>
                    @if ($data[0]->hasil_c === 'NORMAL')
                        <div class="text-success">{{ $data[0]->hasil_c }}</div>
                    @elseif($data[0]->hasil_c === 'BORDERLINE / AMBANG')
                        <div class="text-warning">{{ $data[0]->hasil_c }}</div>
                    @else
                        <div class="text-danger">{{ $data[0]->hasil_c }}</div>
                    @endif
                </td>
				<td>
                    @if ($data[0]->hasil_h === 'NORMAL')
                        <div class="text-success">{{ $data[0]->hasil_h }}</div>
                    @elseif($data[0]->hasil_h === 'BORDERLINE / AMBANG')
                        <div class="text-warning">{{ $data[0]->hasil_h }}</div>
                    @else
                        <div class="text-danger">{{ $data[0]->hasil_h }}</div>
                    @endif
                </td>
				<td>
                    @if ($data[0]->hasil_p === 'NORMAL')
                        <div class="text-success">{{ $data[0]->hasil_p }}</div>
                    @elseif($data[0]->hasil_p === 'BORDERLINE / AMBANG')
                        <div class="text-warning">{{ $data[0]->hasil_p }}</div>
                    @else
                        <div class="text-danger">{{ $data[0]->hasil_p }}</div>
                    @endif
                </td>
				<td>
                    @if ($data[0]->hasil_pro === 'NORMAL')
                        <div class="text-success">{{ $data[0]->hasil_pro }}</div>
                    @elseif($data[0]->hasil_pro === 'BORDERLINE / AMBANG')
                        <div class="text-warning">{{ $data[0]->hasil_pro }}</div>
                    @else
                        <div class="text-danger">{{ $data[0]->hasil_pro }}</div>
                    @endif
                </td>
				<td>
                    {{ $data[0]->created_at }}
                </td>
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
