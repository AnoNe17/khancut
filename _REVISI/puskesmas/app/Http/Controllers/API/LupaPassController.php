<?php

namespace App\Http\Controllers\API;

use App\Http\Controllers\Controller;
use App\Models\Pasien;
use App\Models\User;
use Illuminate\Http\Request as HttpRequest;
use Illuminate\Support\Facades\Password;

class LupaPassController extends Controller
{
    public function sendResetLinkEmail(HttpRequest $request)
    {
        // return $request;

        $pasien = Pasien::where('no_hp', $request->input('no_hp'))->first();

        $user = $pasien->User;

        $user->update([
            'email' => $request->email,
        ]);

        $token = Password::broker()->createToken($user);

        $user->sendPasswordResetNotification($token);

        $this->sendResetLinkResponse('Password reset email sent successfully.');

        return response()->json([
            'success' => true,
            'data' => 'Email Berhasil DIkirim'
        ], 200);
    }

    protected function sendResetLinkResponse($response)
    {
        return redirect()->route('password.request')
            ->with('status', trans($response));
    }

    public function showLinkRequestForm()
    {
        return view('auth.passwords.email');
    }
}
