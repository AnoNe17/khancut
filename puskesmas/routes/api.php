<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\API\AuthController;
use App\Http\Controllers\API\DashboardController;
use App\Http\Controllers\API\KuisionerController;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider and all of them will
| be assigned to the "api" middleware group. Make something great!
|
*/

Route::post('register', [AuthController::class, 'register']);
Route::post('login', [AuthController::class, 'login']);

Route::post('input_sdq', [KuisionerController::class, 'inputSDQ']);
Route::post('input_srq', [KuisionerController::class, 'inputSRQ']);

Route::post('hasil_sdq/pdf', [KuisionerController::class, 'printSDQ']);
Route::post('hasil_srq/pdf', [KuisionerController::class, 'printSRQ']);

Route::post('riwayat_sdq', [DashboardController::class, 'riwayatSDQ']);
Route::post('riwayat_srq', [DashboardController::class, 'riwayatSRQ']);
Route::post('notifikasi', [DashboardController::class, 'notifikasi']);
Route::post('profil', [DashboardController::class, 'profil']);
Route::post('dashboard', [DashboardController::class, 'dashboard']);

Route::middleware('auth:sanctum')->get('/user', function (Request $request) {
    return $request->user();
});
