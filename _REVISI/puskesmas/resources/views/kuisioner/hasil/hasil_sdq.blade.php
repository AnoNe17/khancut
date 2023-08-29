<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Hasil Kuisioner SDQ</title>
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
                            <h3 class="text-success">{{ $instansi }}</h3>
                        </div>
                        <div class="d-flex justify-content-center">
                            <h3 class="text-success">Umur : {{ $umur }}</h3>
                        </div>
                    </div>
                    <div class="col-2"></div>
                </div>
                
            </div>


            <div class="d-flex justify-content-center mt-4">
                <h3>Skor Keseluruhan</h3>
            </div>
            <div class="col-12 border border-warning rounded" style="margin-top: 10px; padding: 10px; background-color: #f5f2d6">
                <div class="d-flex justify-content-center">
                    <h3 class="text-success">Skor Keseluruhan</h3>
                </div>
                <div class="d-flex justify-content-center">
                    <div class="border border-success rounded-circle p-4" style="background-color: #d5f6dc;">
                        <h4>{{ $skor_keseluruhan }}</h4>
                    </div>
                </div>
            </div>
           
            <div class="d-flex justify-content-center mt-4">
                <h3>Skor Akhir Kesulitan</h3>
            </div>
            <div class="col-12 border border-warning rounded" style="margin-top: 10px; padding: 10px; background-color: #f5f2d6">
                <div class="d-flex justify-content-center">
                    <h3 class="text-success">Total Skor Kesulitan</h3>
                </div>
                <div class="d-flex justify-content-center">
                    <div class="border border-success rounded-circle p-4" style="background-color: #d5f6dc;">
                        <h4>{{ $skor_kesulitan }}</h4>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <h4 class="text-danger">{{ $hasil_kesulitan }}</h4>
                </div>
            </div>

            <div class="col-12 border border-warning rounded" style="margin-top: 20px; padding: 10px; background-color: #f5f2d6">
                <div class="d-flex justify-content-center">
                    <h3 class="text-success">Gejala Emosional</h3>
                </div>
                <div class="d-flex justify-content-center">
                    <div class="border border-success rounded-circle p-4" style="background-color: #d5f6dc;">
                        <h4>{{ $skor_e }}</h4>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <h4 class="text-danger">{{ $hasil_e }}</h4>
                </div>
            </div>

            <div class="col-12 border border-warning rounded" style="margin-top: 20px; padding: 10px; background-color: #f5f2d6">
                <div class="d-flex justify-content-center">
                    <h3 class="text-success">Masalah Perilaku</h3>
                </div>
                <div class="d-flex justify-content-center">
                    <div class="border border-success rounded-circle p-4" style="background-color: #d5f6dc;">
                        <h4>{{ $skor_c }}</h4>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <h4 class="text-danger">{{ $hasil_c }}</h4>
                </div>
            </div>

            <div class="col-12 border border-warning rounded" style="margin-top: 20px; padding: 10px; background-color: #f5f2d6">
                <div class="d-flex justify-content-center">
                    <h3 class="text-success">Hiperaktivitas</h3>
                </div>
                <div class="d-flex justify-content-center">
                    <div class="border border-success rounded-circle p-4" style="background-color: #d5f6dc;">
                        <h4>{{ $skor_h }}</h4>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <h4 class="text-danger">{{ $hasil_h }}</h4>
                </div>
            </div>

            <div class="col-12 border border-warning rounded" style="margin-top: 20px; padding: 10px; background-color: #f5f2d6">
                <div class="d-flex justify-content-center">
                    <h3 class="text-success">Masalah Teman Sebaya</h3>
                </div>
                <div class="d-flex justify-content-center">
                    <div class="border border-success rounded-circle p-4" style="background-color: #d5f6dc;">
                        <h4>{{ $skor_p }}</h4>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <h4 class="text-danger">{{ $hasil_p }}</h4>
                </div>
            </div>

            
            <div class="d-flex justify-content-center mt-4">
                <h3>Skor Akhir Kekuatan</h3>
            </div>
            <div class="col-12 border border-warning rounded" style="margin-top: 20px; padding: 10px; background-color: #f5f2d6">
                <div class="d-flex justify-content-center">
                    <h3 class="text-success">Perilaku Proposional</h3>
                </div>
                <div class="d-flex justify-content-center">
                    <div class="border border-success rounded-circle p-4" style="background-color: #d5f6dc;">
                        <h4>{{ $skor_pro }}</h4>
                    </div>
                </div>
                <div class="d-flex justify-content-center">
                    <h4 class="text-danger">{{ $hasil_pro }}</h4>
                </div>
            </div>

            

            <div class="col-12" style="height: 150px; padding-top: 50px">
                <div class="d-flex justify-content-center">
                    <a href="{{ route('hasil.sdq') }}" class="btn btn-primary btn-lg">Kembali</a>
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
    
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sweetalert/2.1.2/sweetalert.min.js"></script>
    @include('sweetalert::alert', ['cdn' => "https://cdn.jsdelivr.net/npm/sweetalert2@9"])
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>
