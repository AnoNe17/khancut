<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Hasil Kuisioner SRQ</title>
  </head>
  <body style="background-color: #F0FFFF;">
    <div class="row">
        <div class="col-lg-3">
        </div>
        <div class="col-lg-6" style="margin-top: 30px">
            <div class="col-12 border border-success rounded-pill" style="background-color: #d5f6dc;">
                <div class="d-flex justify-content-center mt-2">
                    <h2>Hasil Kuisioner SDQ</h2>
                </div>
                <div class="row mt-4">
                    <div class="col-2"></div>
                    <div class="col-8 border border-danger rounded" style="background-color: #fdcef5">
                        <div class="d-flex justify-content-center">
                            <h3 class="text-success">{{ $nama }}</h3>
                        </div>
                        <div class="d-flex justify-content-center">
                            <h3 class="text-success">Umur : {{ $umur }}</h3>
                        </div>
                        <div class="d-flex justify-content-center">
                            <h3 class="text-success">{{ $no_hp }}</h3>
                        </div>
                        <div class="d-flex justify-content-center">
                            <h3 class="text-success">{{ $alamat }}</h3>
                        </div>
                        <div class="d-flex justify-content-center">
                            <h3 class="text-success">{{ $pekerjaan }}</h3>
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                
            </div>
           
            <div class="d-flex justify-content-center mt-4">
                <h3>Skor Akhir</h3>
            </div>
            <div class="col-12 border border-warning rounded" style="margin-top: 10px; padding: 10px; background-color: #f5f2d6">
                <div class="d-flex justify-content-center">
                    <h3 class="text-success">Total Skor</h3>
                </div>
                <div class="d-flex justify-content-center">
                    <div class="border border-success rounded-circle p-4" style="background-color: #d5f6dc;">
                        <h4>{{ $total }}</h4>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <h4 class="text-danger">{{ $hasil }}</h4>
                </div>
            </div>

            <div class="col-12 border border-warning rounded mt-5" style="margin-top: 10px; padding: 10px; background-color: #f5f2d6">
                <div class="d-flex justify-content-center">
                    <h3 class="text-success">Keterangan</h3>
                </div>
                    <div class="d-flex justify-content-center mt-2">
                        <h4>{!! $keterangan !!}</h4>
                    </div>
                
            </div>


            <div class="col-12" style="height: 150px; padding-top: 50px">
                <div class="d-flex justify-content-center">
                    <a href="{{ route('hasil.srq') }}" class="btn btn-primary btn-lg">Kembali</a>
                </div>
            </div>

            {{-- </form> --}}
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
