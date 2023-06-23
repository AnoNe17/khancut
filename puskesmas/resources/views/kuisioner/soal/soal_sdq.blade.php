<!doctype html>
<html lang="en">
  <head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">

    <title>Kuisioner sdq</title>
  </head>
  <body style="background-color: #F0FFFF;">
    <div class="row">
        <div class="col-md-3">
        </div>
        <div class="col-md-6" style="margin-top: 30px">
            <div class="col-12 border border-success rounded-pill" style="background-color: #d5f6dc; height: 200px; padding-top: 50px">
                <div class="d-flex justify-content-center mb-2">
                    <h2>Kuisioner kejiwaan SDQ </h2>
                </div>
                <div class="d-flex justify-content-center px-5">
                    <select id="umur" class="form-select form-select-lg mb-3" aria-label=".form-select-lg example">
                        <option selected disabled>Pilih usia</option>
                        @if ($umur <= 10 )
                            <option value="4_11">4 - 10 Tahun</option>
                        @elseif($umur >=11)
                            <option value="11_18">11 - 18 Tahun</option>
                        @endif
                        
                    </select>
                </div>
            </div>
            <form method="post" action="{{ route('hasil.kuisioner.sdq') }}">
                @csrf   
                <div id="soal">

                </div>


                <input type="hidden" name="umur" value="{{ $umur }}">
                <input type="hidden" name="instansi" value="{{ $instansi }}">
                <input type="hidden" name="nama" value="{{ $nama }}">
                
            </form>
            
        </div>
        <div class="col-md-3" >
        </div>
    </div>


    <!-- Optional JavaScript; choose one of the two! -->

    <!-- Option 1: Bootstrap Bundle with Popper -->
    
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>


    <script>
        $(document).ready(function() {
            $('#umur').change(function () {
            var umur = $('#umur').val();
            if (umur === '4_11') {
                var request = $.ajax({
                    url: "{{ route('soal.4_11') }}",
                    type: "GET",
                    data: {
                        _token: '{{ csrf_token() }}',
                        _method: 'GET',
                    },
                    dataType: "html"
                });

                request.done(function(response) {
                    // console.log(response);
                    $('#soal').html(response);
                });

                request.fail(function(jqXHR, textStatus) {
                    console.log(jqXHR);
                });
            } else {
                var request = $.ajax({
                    url: "{{ route('soal.11_18') }}",
                    type: "GET",
                    data: {
                        _token: '{{ csrf_token() }}',
                        _method: 'GET',
                    },
                    dataType: "html"
                });

                request.done(function(response) {
                    $('#soal').html(response);
                });

                request.fail(function(jqXHR, textStatus) {
                    console.log(jqXHR);
                });
            }
        })
        });
    </script>
    <!-- Option 2: Separate Popper and Bootstrap JS -->
    <!--
    <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.2/dist/umd/popper.min.js" integrity="sha384-IQsoLXl5PILFhosVNubq5LC7Qb9DXgDA9i+tQ8Zj3iwWAwPtgFTxbJ8NT4GN1R8p" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.min.js" integrity="sha384-cVKIPhGWiC2Al4u+LWgxfKTRIcfu0JTxR+EQDz/bgldoEyl4H0zUF0QKbrJ0EcQF" crossorigin="anonymous"></script>
    -->
  </body>
</html>
