<?php

namespace App\Http\Controllers;

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
      ->select('eastwoods_facilities.id', 'eastwoods_facilities.facilities', 'eastwoods_facilities.floor', 'abbrevs.abbrev')
      ->get();

      // floor
      $floorList = FloorList::pluck('floor');
      $nonExistingFloors = FloorList::whereNotIn('floor', function ($query) {
         $query->select('floor')->from('floorplans');
     })->pluck('floor')->toArray();
      // dd($nonExistingFloors);
        return view('admin.contents.floorplan')->with(['facilities'=>$data, 'flist'=>$nonExistingFloors]);
   }

   public function floorPlanLayoutSave(Request $request) {
      try {
         // dd($request->gridDetails['gridDetails']);
         // Check if the floor already exists
         $existingFloor = Floorplan::where('floor', $request->gridDetails['floor'])->first();
         // dd($existingFloor);
         if ($existingFloor) {

            $existingFloor->floor = $request->gridDetails['floor'];
            $existingFloor->gridSize = $request->gridDetails['gridSize'];
            $existingFloor->gridDetails = $request->gridDetails['gridDetails'];
            $existingFloor->save();
            Update::create(['from' => "Floor Plan", 'list' => 'You have updated a '.$request->gridDetails['floor'].' layout.','status'=>0,'action'=>'updated']);
            return response()->json(['status' => 'success']);
         }

          $floorplan = new Floorplan();
          $floorplan->floor = $request->gridDetails['floor'];
          $floorplan->gridSize = $request->gridDetails['gridSize'];
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
      // dd($floorplans);

      return view('admin.contents.testfloor')->with(['details'=>$floorplans]);
   }
}
