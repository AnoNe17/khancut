<?php

namespace App\Models;

// use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Laravel\Sanctum\HasApiTokens;

class User extends Authenticatable
{
    use HasApiTokens, HasFactory, Notifiable;

    protected $table = 'users';
    protected $primaryKey = 'id';

    protected $guarded = [];

    public function Pasien()
    {
        return $this->hasOne(Pasien::class, 'user_id', 'id')->withDefault();
    }

    public function SDQ()
    {
        return $this->hasMany(HasilSDQ::class, 'user_id', 'id');
    }

    public function SRQ()
    {
        return $this->hasMany(HasilSRQ::class, 'user_id', 'id');
    }

    public static function auto_hapus()
    {
        $data = User::all();
        foreach ($data as $item) {
            if ($item->status_verif == 'false') {
                $created = strtotime($item->created_at) + (10000);
                if ($created < time()) {
                    $item->delete();
                }
            }
        }
    }
}
