<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class SchoolHMV extends Model
{
    use HasFactory;
    public $fillable = ['descriptions','type','path'];
}
