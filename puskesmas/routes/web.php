<?php

use App\Http\Controllers\DashboardController;
use App\Http\Controllers\DashboardUserController;
use App\Http\Controllers\DokterController;
use App\Http\Controllers\KuisionerController;
use App\Http\Controllers\LoginController;
use App\Http\Controllers\kuisionerSrqController;
use App\Http\Controllers\LandingController;
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


Route::get('/data_dokter', [DokterController::class, 'index'])->name('dokter');
Route::post('/dokter/reset', [dokterController::class, 'reset'])->name('dokter.reset');
Route::get('/dokter/create', [dokterController::class, 'create'])->name('dokter.create');
Route::post('/dokter/store', [dokterController::class, 'store'])->name('dokter.store');
Route::get('/dokter/edit/{id}', [dokterController::class, 'edit'])->name('dokter.edit');
Route::post('/dokter/update', [dokterController::class, 'update'])->name('dokter.update');
Route::get('/dokter/delete/{id}', [dokterController::class, 'delete'])->name('dokter.delete');


Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');
