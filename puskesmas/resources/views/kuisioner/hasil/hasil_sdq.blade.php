<!DOCTYPE html>
<html>
<head>
	<title>Hasil SDQ</title>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>

    <style type="text/css">
		table tr th{
			width: 25%
		}
	</style>

	<center>
		<h4>Puskesmas Kertasemaya</h4>
            <br><br>
        <h6>Hasil Kuisioner SDQ : </h6>
		<h5>{{ $data[0]->nama }} ({{ $data[0]->instansi }})</h5>
        <br>
	</center>

    <center>
        <h4>Skor keseluruhan</h4>
        <h1>{{ $data[0]->skor_keseluruhan }}</h1>
        <br>
    </center>

    {{-- Gejala Emosional --}}
    <div class="container">
        
    <h6>Gejala Emmosional</h6>
	<table class='table table-bordered'>
        <tr>
            <th>Skor</th>
            <td>
                @if ($data[0]->hasil_e === 'NORMAL')
                    <div class="text-success">{{ $data[0]->skor_e }}</div>
                @elseif($data[0]->hasil_e === 'BORDERLINE / AMBANG')
                    <div class="text-warning">{{ $data[0]->skor_e }}</div>
                @else
                    <div class="text-danger">{{ $data[0]->skor_e }}</div>
                @endif
            </td>
        </tr>
        <tr>
            <th>Hasil</th>
            <td>
                @if ($data[0]->hasil_e === 'NORMAL')
                    <div class="text-success">{{ $data[0]->hasil_e }}</div>
                @elseif($data[0]->hasil_e === 'BORDERLINE / AMBANG')
                    <div class="text-warning">{{ $data[0]->hasil_e }}</div>
                @else
                    <div class="text-danger">{{ $data[0]->hasil_e }}</div>
                @endif
            </td>
        </tr>
        <tr>
            <th>Keterangan</th>
            <td>
                {!! $data[0]->keterangan_e !!}
            </td>
        </tr>
	</table>

    <h6>Gejala Perilaku</h6>
	<table class='table table-bordered'>
        <tr>
            <th>Skor</th>
            <td>
                @if ($data[0]->hasil_c === 'NORMAL')
                    <div class="text-success">{{ $data[0]->skor_c }}</div>
                @elseif($data[0]->hasil_e === 'BORDERLINE / AMBANG')
                    <div class="text-warning">{{ $data[0]->skor_c }}</div>
                @else
                    <div class="text-danger">{{ $data[0]->skor_c }}</div>
                @endif
            </td>
        </tr>
        <tr>
            <th>Hasil</th>
            <td>
                @if ($data[0]->hasil_c === 'NORMAL')
                    <div class="text-success">{{ $data[0]->hasil_c }}</div>
                @elseif($data[0]->hasil_e === 'BORDERLINE / AMBANG')
                    <div class="text-warning">{{ $data[0]->hasil_c }}</div>
                @else
                    <div class="text-danger">{{ $data[0]->hasil_c }}</div>
                @endif
            </td>
        </tr>
        <tr>
            <th>Keterangan</th>
            <td>
                {!! $data[0]->keterangan_c !!}
            </td>
        </tr>
	</table>

    <h6>Hiperaktivitas</h6>
	<table class='table table-bordered'>
        <tr>
            <th>Skor</th>
            <td>
                @if ($data[0]->hasil_h === 'NORMAL')
                    <div class="text-success">{{ $data[0]->skor_h }}</div>
                @elseif($data[0]->hasil_h === 'BORDERLINE / AMBANG')
                    <div class="text-warning">{{ $data[0]->skor_h }}</div>
                @else
                    <div class="text-danger">{{ $data[0]->skor_h }}</div>
                @endif
            </td>
        </tr>
        <tr>
            <th>Hasil</th>
            <td>
                @if ($data[0]->hasil_h === 'NORMAL')
                    <div class="text-success">{{ $data[0]->hasil_h }}</div>
                @elseif($data[0]->hasil_h === 'BORDERLINE / AMBANG')
                    <div class="text-warning">{{ $data[0]->hasil_h }}</div>
                @else
                    <div class="text-danger">{{ $data[0]->hasil_h }}</div>
                @endif
            </td>
        </tr>
        <tr>
            <th>Keterangan</th>
            <td>
                {!! $data[0]->keterangan_h !!}
            </td>
        </tr>
	</table>

    <h6>Masalah Teman Sebaya</h6>
	<table class='table table-bordered'>
        <tr>
            <th>Skor</th>
            <td>
                @if ($data[0]->hasil_p === 'NORMAL')
                    <div class="text-success">{{ $data[0]->skor_p }}</div>
                @elseif($data[0]->hasil_p === 'BORDERLINE / AMBANG')
                    <div class="text-warning">{{ $data[0]->skor_p }}</div>
                @else
                    <div class="text-danger">{{ $data[0]->skor_p }}</div>
                @endif
            </td>
        </tr>
        <tr>
            <th>Hasil</th>
            <td>
                @if ($data[0]->hasil_p === 'NORMAL')
                    <div class="text-success">{{ $data[0]->hasil_p }}</div>
                @elseif($data[0]->hasil_p === 'BORDERLINE / AMBANG')
                    <div class="text-warning">{{ $data[0]->hasil_p }}</div>
                @else
                    <div class="text-danger">{{ $data[0]->hasil_p }}</div>
                @endif
            </td>
        </tr>
        <tr>
            <th>Keterangan</th>
            <td>
                {!! $data[0]->keterangan_p !!}
            </td>
        </tr>
	</table>

    <h6>Perilaku Proposional</h6>
	<table class='table table-bordered'>
        <tr>
            <th>Skor</th>
            <td>
                @if ($data[0]->hasil_pro === 'NORMAL')
                    <div class="text-success">{{ $data[0]->skor_pro }}</div>
                @elseif($data[0]->hasil_pro === 'BORDERLINE / AMBANG')
                    <div class="text-warning">{{ $data[0]->skor_pro }}</div>
                @else
                    <div class="text-danger">{{ $data[0]->skor_pro }}</div>
                @endif
            </td>
        </tr>
        <tr>
            <th>Hasil</th>
            <td>
                @if ($data[0]->hasil_pro === 'NORMAL')
                    <div class="text-success">{{ $data[0]->hasil_pro }}</div>
                @elseif($data[0]->hasil_pro === 'BORDERLINE / AMBANG')
                    <div class="text-warning">{{ $data[0]->hasil_pro }}</div>
                @else
                    <div class="text-danger">{{ $data[0]->hasil_pro }}</div>
                @endif
            </td>
        </tr>
        <tr>
            <th>Keterangan</th>
            <td>
                {!! $data[0]->keterangan_pro !!}
            </td>
        </tr>
	</table>
    
    </div>

    <br><br><br><br>
    <div class="col-12" style="height: 150px; padding-top: 50px">
                <div class="d-flex justify-content-center">
                    <a href="{{ route('hasil.sdq') }}" class="btn btn-primary btn-lg">Kembali</a>
                </div>
            </div>
 
</body>
</html>
