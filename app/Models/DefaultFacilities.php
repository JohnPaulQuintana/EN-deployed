<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class DefaultFacilities extends Model
{
    use HasFactory;
    public $fillable = ['facilities','floor', 'color'];
}
