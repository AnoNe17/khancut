<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Dokter extends Model
{
    protected $table = 'dokter';
    protected $primaryKey = 'id';

    protected $guarded = [];

    public function User()
    {
        return $this->hasOne(User::class, 'id', 'user_id');
    }
}
