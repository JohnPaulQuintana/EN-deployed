<?php

namespace App\Http\Controllers;

use App\Models\DefaultFacilities;
use App\Models\FloorList;
use App\Models\Update;
use App\Models\Floorplan;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;

class FloorplanController extends Controller
{
   public function floorPlanLayout(){
      $data = DB::table('eastwoods_facilities')
      ->join('abbrevs', 'eastwoods_facilities.id', '=', 'abbrevs.facility_id')
      ->select('eastwoods_facilities.id', 'eastwoods_facilities.facilities', 'eastwoods_facilities.color' ,'eastwoods_facilities.floor', 'abbrevs.abbrev')
      ->get();

      $defaultF = DB::table('default_facilities')
         ->select('id','facilities','floor', 'color')
         ->get();
      // / Merge the results
      $mergedData = $data->merge($defaultF);
      // dd($mergedData);
      // floor
      $floorList = FloorList::select('floor', 'floor-img')->get();

      $nonExistingFloors = FloorList::whereNotIn('floor', function ($query) {
         $query->select('floor')->from('floorplans');
     })->pluck('floor')->toArray();


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

// You can now use $maleRestroomAbbreviations and $femaleRestroomAbbreviations as needed

      // dd($nonExistingFloors);
        return view('admin.contents.floorplan2')->with(['facilities'=>$mergedData, 'flist'=>$nonExistingFloors, 'male'=>$maleRestroomAbbreviations, 'female'=>$femaleRestroomAbbreviations]);
   }

   public function floorPlanLayoutSave(Request $request) {
      try {
         // dd($request->gridDetails['gridDetails']);
         // Check if the floor already exists
         $existingFloor = Floorplan::where('floor', $request->gridDetails['floor'])->first();
         // dd($existingFloor);
         if ($existingFloor) {

            $existingFloor->floor = $request->gridDetails['floor'];
            // $existingFloor->gridSize = $request->gridDetails['gridSize'];
            $existingFloor->gridDetails = $request->gridDetails['gridDetails'];
            $existingFloor->save();
            Update::create(['from' => "Floor Plan", 'list' => 'You have updated a '.$request->gridDetails['floor'].' layout.','status'=>0,'action'=>'updated']);
            return response()->json(['status' => 'success']);
         }

          $floorplan = new Floorplan();
          $floorplan->floor = $request->gridDetails['floor'];
         //  $floorplan->gridSize = $request->gridDetails['gridSize'];
          $floorplan->gridDetails = $request->gridDetails['gridDetails'];
          $floorplan->save();
          Update::create(['from' => "Floor Plan", 'list' => 'You have added a '.$request->gridDetails['floor'].' layout.','status'=>0,'action'=>'added']);
          
          return response()->json(['status' => 'success']);
      } catch (\Exception $e) {
          // Handle any exceptions that occur during the save operation
          return response()->json(['status' => 'error', 'message' => $e->getMessage()], 500);
      }
  }
  

   public function floorPlanLayoutGet(Request $request){
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

      return view('admin.contents.testfloor')->with(['details'=>$floorplans, 'male'=>$maleRestroomAbbreviations, 'female'=>$femaleRestroomAbbreviations]);
   }
}
