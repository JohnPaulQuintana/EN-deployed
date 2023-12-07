<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Carbon;
use Illuminate\Support\Facades\DB;

class TableController extends Controller
{
    public function tables(Request $request){
        $tableName = $request->query('parameter');
        $actions = $request->query('actions');
        $going = $request->query('routes');

        $allColumns = DB::getSchemaBuilder()->getColumnListing($tableName);
        // Columns to exclude (e.g., 'created_at', 'column_to_exclude', 'another_column_to_exclude')
        $columnsToExclude = ['updated_at', 'operation_time'];
        // Filter the column names to exclude the specified columns
        $columns = array_diff($allColumns, $columnsToExclude);

        if($tableName == 'teachers'){
            $data = DB::table($tableName)
            ->join('eastwoods_facilities',$tableName.'.facilities_id', '=', 'eastwoods_facilities.id')
            ->select($tableName.'.id',$tableName.'.name',$tableName.'.position',$tableName.'.created_at',
                $tableName.'.gender',
                'eastwoods_facilities.facilities as facilities_id')
            ->get();
        }else{
            $data = DB::table($tableName)->get();
        }
        
        // dd($data);

        // Modify the created_at column format
        foreach ($data as $item) {
            $item->created_at = Carbon::parse($item->created_at)->format('Y-m-d');
        }
        // dd($data);
        return view('admin.contents.table')->with(['columns'=>$columns, 'datas'=>$data, 'title'=>$tableName, 'actions'=>$actions, 'going'=>$going]);
    }

    public function getCreatedAtAttribute($value)
    {
        // Convert the created_at value to the desired format
        return Carbon::parse($value)->format('Y-m-d H:i:s');
    }
    
}
