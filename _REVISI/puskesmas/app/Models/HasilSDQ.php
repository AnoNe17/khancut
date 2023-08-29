<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class HasilSDQ extends Model
{
    protected $table = 'hasil_sdq';
    protected $primaryKey = 'id';

    protected $guarded = [];
}
