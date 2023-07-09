<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DashboardUserController;
use App\Http\Controllers\DokterController;
use App\Http\Controllers\KuisionerController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\kuisionerSrqController;
use App\Http\Controllers\LandingController;
use App\Http\Controllers\NotifikasiController;
use App\Http\Controllers\PasienController;
use App\Http\Controllers\RegisterController;
use Illuminate\Support\Facades\Route;


/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "web" middleware group. Make something great!
|
*/


Route::get('/', [LandingController::class, 'index'])->name('index');

Auth::routes();

// Route::get('dashboard', [DashboardController::class, 'index']);
// Route::get('login', [LoginController::class, 'index']);

Route::get('kuisioner_sdq', [KuisionerController::class, 'soalSDQ'])->name('kuisioner.sdq');
Route::get('kuisioner_srq', [KuisionerController::class, 'soalSRQ'])->name('kuisioner.srq');
Route::post('hasil_sdq', [KuisionerController::class, 'hasilSDQ'])->name('hasil.kuisioner.sdq');
Route::post('hasil_srq', [KuisionerController::class, 'hasilSRQ'])->name('hasil.kuisioner.srq');

Route::get('soal_4_11', [KuisionerController::class, 'soal_4_11'])->name('soal.4_11');
Route::get('soal_11_18', [KuisionerController::class, 'soal_11_18'])->name('soal.11_18');

Route::get('data_sdq', [KuisionerController::class, 'getHasilSDQ'])->name('hasil.sdq');
Route::get('data_srq', [KuisionerController::class, 'getHasilSRQ'])->name('hasil.srq');

Route::get('/kuisioner/sdq/pdf/{id}', [KuisionerController::class, 'pdfSDQ'])->name('pdf.sdq');
Route::get('/kuisioner/srq/pdf/{id}', [KuisionerController::class, 'pdfSRQ'])->name('pdf.srq');

Route::get('/data_dokter', [DokterController::class, 'index'])->name('dokter');
Route::post('/dokter/reset', [DokterController::class, 'reset'])->name('dokter.reset');
Route::get('/dokter/create', [DokterController::class, 'create'])->name('dokter.create');
Route::post('/dokter/store', [DokterController::class, 'store'])->name('dokter.store');
Route::get('/dokter/edit/{id}', [DokterController::class, 'edit'])->name('dokter.edit');
Route::post('/dokter/update', [DokterController::class, 'update'])->name('dokter.update');
Route::get('/dokter/delete/{id}', [DokterController::class, 'delete'])->name('dokter.delete');

Route::get('/data_pasien', [PasienController::class, 'index'])->name('pasien');
Route::post('/cek_code', [PasienController::class, 'cek'])->name('pasien.cek');
Route::get('/pasien/create', [PasienController::class, 'create'])->name('pasien.create');
Route::post('/pasien/store', [PasienController::class, 'store'])->name('pasien.store');
Route::get('/pasien/edit/{id}', [PasienController::class, 'edit'])->name('pasien.edit');
Route::post('/pasien/update', [PasienController::class, 'update'])->name('pasien.update');
Route::get('/pasien/delete/{id}', [PasienController::class, 'delete'])->name('pasien.delete');

Route::get('/data_notifikasi', [NotifikasiController::class, 'index'])->name('notifikasi');
Route::post('/notifikasi/store', [NotifikasiController::class, 'store'])->name('notifikasi.store');

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
