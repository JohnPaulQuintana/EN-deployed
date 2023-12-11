<?php

namespace App\Http\Controllers;

use App\Models\Frequently;
use App\Models\Teacher;
use Illuminate\Http\Request;

class Admin extends Controller
{
    public function dashboard(){
        $frequently = Frequently::paginate(5, ['*'], 'frequently_page');
        $teachers = Teacher::paginate(5, ['*'], 'teacher_page');
        return view('admin.content')->with(['frequentlies'=>$frequently, 'teachers'=>$teachers]);
    }
   
    
}
