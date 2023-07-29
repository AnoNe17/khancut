<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pasien extends Model
{
    protected $table = 'pasien';
    protected $primaryKey = 'id';

    protected $guarded = [];

    public function User()
    {
        return $this->hasOne(User::class, 'id', 'user_id')->withDefault();
    }
}
