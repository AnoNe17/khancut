<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>kuisioner Srq</title>
  </head>
  <body style="background-color: #F0FFFF;">
    <div class="row">
        <div class="col-lg-3">
        </div>
                    <h3>Kuisioner kejiwaan SRQ </h3>
                    <p><strong>Petunjuk:</strong><br/> Pernyataan berikut berhubungan dengan masalah yang mungkin mengganggu anda pada 30 Hari terakhir.
                        Apabila pertanyaan itu yang anda alami pada 30 terakhir, pilihlah Jawaban <strong>"YA"</strong>. Sebaliknya, Apabila anda mengganggap pertanyaan itu tidak
                         anda alami dalam 30 hari terakhir, pilihlah Jawaban <strong> "TIDAK" </strong>. Jika anda tidak yakin dengan Jawabannya, berilah jawaban yang paling sesuai
                          diantara <strong>"YA"</strong> dan <strong>"TIDAK"</strong>. Kami Tegaskan bahwa jawaban anda bersifat Rahasia. </p>
                </div>
            </div>
            <form method="post" action="{{ route('hasil.kuisioner.srq') }}">
                @csrf
                {{-- perulangan soal dengan index --}}
                @foreach ($soal as $x => $s)
                    <div class="col-12 border border-warning rounded" style="margin-top: 20px; padding: 10px; background-color: #f5f2d6">
                        <h5>{{ $s }}</h5>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="radio[{{ $x }}]" value="{{ $nilai_1[$x] }}" required>
                            <label class="form-check-label" for="flexRadioDefault1">
                                YA
                            </label>
                        </div>
                        <div class="form-check">
                            <input class="form-check-input" type="radio" name="radio[{{ $x }}]" value="{{ $nilai_2[$x] }}" required>
                            <label class="form-check-label" for="flexRadioDefault2">
                                TIDAK
                            </label>
                        </div>
                    </div>
                @endforeach

                <div class="col-12" style="height: 150px; padding-top: 50px">
                    <div class="d-flex justify-content-center">
                        <input type="submit" class="btn-check" id="btn-check" autocomplete="off">
                        <label class="btn btn-primary" for="btn-check">Submit Jawaban</label>
                    </div>
                </div>

                <input type="hidden" name="nama" value="{{ $nama }}">
                <input type="hidden" name="umur" value="{{ $umur }}">
                <input type="hidden" name="no_hp" value="{{ $no_hp }}">
                <input type="hidden" name="alamat" value="{{ $alamat }}">
                <input type="hidden" name="pekerjaan" value="{{ $pekerjaan }}">
            </form>
        </div>
        <div class="col-lg-3" >
        </div>
    </div>


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>

    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>
