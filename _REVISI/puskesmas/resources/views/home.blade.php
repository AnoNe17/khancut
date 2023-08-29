@extends('layouts.app')

@section('content')
<main>
    <div class="container-fluid px-4">
        <h1 class="mt-4">Dashboard</h1>
        <ol class="breadcrumb mb-4">
            <li class="breadcrumb-item active">Dashboard</li>
        </ol>
        <div class="row">
            <div class="col-xl-3 col-md-6">
                <div class="card bg-secondary text-white mb-4">
                    <div class="card-body d-flex align-items-center justify-content-between">
                        <h4 class="text-white stretched-link" href="#"><i class="fas fa-solid fa-user"></i>&nbsp;&nbsp; Data Pasien</h4>
                        <h4 class="text-white">{{ $pasien }}</h4>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="{{ route('pasien') }}">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-success text-white mb-4">
                    <div class="card-body d-flex align-items-center justify-content-between">
                        <h4 class="text-white stretched-link" href="#"><i class="fas fa-user-doctor"></i>&nbsp;&nbsp; Data Dokter</h4>
                        <h4 class="text-white">{{ $dokter }}</h4>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="{{ route('dokter') }}">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-primary text-white mb-4">
                    <div class="card-body d-flex align-items-center justify-content-between">
                        <h4 class="text-white stretched-link" href="#"><i class="fa-solid fa-book-open"></i>&nbsp;&nbsp; Data Kuisioner SDQ</h4>
                        <h4 class="text-white">{{ $sdq }}</h4>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="{{ route('hasil.sdq') }}">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-info text-white mb-4">
                    <div class="card-body d-flex align-items-center justify-content-between">
                        <h4 class="text-white stretched-link" href="#"><i class="fa-solid fa-book-open"></i>&nbsp;&nbsp; Data Kuisioner SRQ</h4>
                        <h4 class="text-white">{{ $srq }}</h4>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="{{ route('hasil.srq') }}">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
            <div class="col-xl-3 col-md-6">
                <div class="card bg-warning text-white mb-4">
                    <div class="card-body d-flex align-items-center justify-content-between">
                        <h4 class="text-white stretched-link" href="#"><i class="fa-solid fa-circle-exclamation"></i>&nbsp;&nbsp; Data Notifikasi</h4>
                        <h4 class="text-white">{{ $notifikasi }}</h4>
                    </div>
                    <div class="card-footer d-flex align-items-center justify-content-between">
                        <a class="small text-white stretched-link" href="{{ route('notifikasi') }}">View Details</a>
                        <div class="small text-white"><i class="fas fa-angle-right"></i></div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>
<footer class="py-4 bg-light mt-auto">
    <div class="container-fluid px-4">

        </div>
    </div>
</footer>
@endsection
