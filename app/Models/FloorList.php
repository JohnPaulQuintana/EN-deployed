<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class FloorList extends Model
{
    use HasFactory;
    public $fillable = ['floor', 'floor-img'];
}
