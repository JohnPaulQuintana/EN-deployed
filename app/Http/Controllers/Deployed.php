<?php

namespace App\Http\Controllers;

use App\Models\Floorplan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class Deployed extends Controller
{
    // display deployed
    public function deployed()
    {
        $floorplans = Floorplan::get();

        $result = DB::table('eastwoods_facilities')
            ->join('abbrevs', 'eastwoods_facilities.id', '=', 'abbrevs.facility_id')
            ->select('eastwoods_facilities.facilities', 'abbrevs.abbrev')
            ->whereIn('facilities', ['male restroom', 'female restroom'])
            ->get();

        // Group the results by facility
        $groupedResult = $result->groupBy('facilities');

        // Create an associative array where the keys are the facilities and the values are arrays of abbreviations
        $groupedAbbreviations = $groupedResult->map(function ($items) {
            return $items->pluck('abbrev')->toArray();
        });

        // Access male restroom abbreviations
        $maleRestroomAbbreviations = $groupedAbbreviations['male restroom'] ?? [];

        // Access female restroom abbreviations
        $femaleRestroomAbbreviations = $groupedAbbreviations['female restroom'] ?? [];
        // dd($floorplans);

        $data = DB::table('eastwoods_facilities')
            ->join('abbrevs', 'eastwoods_facilities.id', '=', 'abbrevs.facility_id')
            ->select('eastwoods_facilities.id', 'eastwoods_facilities.facilities', 'eastwoods_facilities.color', 'eastwoods_facilities.floor', 'abbrevs.abbrev')
            ->get();

        $defaultF = DB::table('default_facilities')
            ->select('id', 'facilities', 'floor', 'color')
            ->get();
        // / Merge the results
        $mergedData = $data->merge($defaultF);

        return view('admin.contents.deployed')->with(['facilities'=>$mergedData,'details' => $floorplans, 'male' => $maleRestroomAbbreviations, 'female' => $femaleRestroomAbbreviations]);
    }
}
