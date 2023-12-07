<?php

namespace App\Http\Controllers;

use App\Models\Abbrev;
use App\Models\Update;
use App\Models\Floorplan;
use App\Events\UpdateSystem;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Models\EastwoodsFacilities;
use Carbon\Carbon;

class FacilityController extends Controller
{
    // public function facilties
    public function facilities(Request $request)
    {
        $facilities = EastwoodsFacilities::get();
        return view('admin.contents.facilities')->with(['facilities' => $facilities]);
    }

    public function facilitiesManage(Request $request)
    {
        // dd($request);
        $facilities = array_map('strtolower', $request->input('facilities', []));
        $operation_hours = array_map('strtolower', $request->input('operation_hours', []));
        $selected_floor = array_map('strtolower', $request->input('selected_floor', []));

        $ids = $request->input('ids', []);
        $req = $request->input('action');
        // dd($req);
        $insertedNotif = []; // Initialize an array to store inserted products
        $actionText = '';
        $actionType = '';
        $actionName = '';
        $tableUpdates = [];

        if ($facilities) {
            // dd('true');
            for ($i = 0; $i < count($facilities); $i++) {
                switch ($req) {
                    case 'add':
                        $existingFacilitiesData = $this->loadExistingFacilitys();
                        // Check if the combination of "facilities" and "floor" already exists
                        $exists = collect($existingFacilitiesData)->contains(function ($existingFacility) use ($facilities, $selected_floor, $i) {
                            return $existingFacility['facilities'] == $facilities[$i] && $existingFacility['floor'] == $selected_floor[$i];
                        });

                        if(!$exists) {
                            $input = EastwoodsFacilities::create(['facilities' => $facilities[$i], 'operation_time' => Carbon::now(), 'floor' => $selected_floor[$i]]);
                            $abbrevModel = Abbrev::create(['facility_id' => $input->id, 'abbrev' => $this->generateUniqueAbbreviation($facilities[$i])]);
                            $insertedNotif[] = $input;
                            $actionText = 'Successfully Added';
                            $actionType = 'success';
                            $actionName = "Facilities";
                            // Update::create(['from' => "Facilities", 'list' => 'You have added a new Facilities.', 'status' => 0, 'action' => 'added']);
                        }else{
                            $actionText = 'Already Exists';
                            $actionType = 'error';
                            $actionName = "Facilities";
                        }
                        // $insertedNotif[] ;
                        

                        
                        break;
                    case 'update':
                        $input = EastwoodsFacilities::where('id', $ids[$i])->first();
                        // dd($input);
                        $changeF = $input->facilities;
                        if ($input) {
                            if ($input->facilities !== $facilities[$i]) {
                                $input->facilities = $facilities[$i];
                            }
                            if ($input->operation_time !== Carbon::now()) {
                                $input->operation_time = Carbon::now();
                            }
                            if ($input->floor !== $selected_floor[$i]) {
                                $input->floor = $selected_floor[$i];
                            }
                            if ($input->isDirty()) {
                                $input->save();
                                // dd($input);
                                 // abbrevs updates
                                $abbrev = Abbrev::where('facility_id', $input->id)->first();
                                $abbrev->abbrev = $this->generateUniqueAbbreviation($facilities[$i]);
                                $abbrev->save();

                                //floorplan updates
                                $fl = Floorplan::where('floor', $input->floor)->first();
                                // dd($changeF);
                                if($fl){
                                    // Get the current JSON data
                                    $jsonData = $fl->gridDetails;
                                    $changesMade = false;
                                    
                                    foreach ($jsonData as $key => $value) {
                                        if ($value['sublabel'] === $changeF) {
                                            $jsonData[$key]['label'] = $abbrev['abbrev'];
                                            $jsonData[$key]['sublabel'] = $input->facilities;
                                            $changesMade = true;
                                        }
                                    }
                                    
                                    // Save the model to persist changes
                                    if ($changesMade) {
                                        $fl->gridDetails = $jsonData;
                                        $fl->save();
                                    }
                                    
                                }

                                $insertedNotif[] = $input;
                                $actionText = 'Successfully Updated';
                                $actionType = 'success';
                                $actionName = "Facilities";
                                // Update::create(['from' => "Facilities", 'list' => 'You have updated a Facilities.', 'status' => 0, 'action' => 'updated']);
                            }
                        }
                        break;

                        // case 'destroy_t':
                        //     // dd('true');
                        //     // Convert the "ids" string into an array
                        //     $idsArray = explode(",", $ids[0]);
                        //     // Use Eloquent to delete records based on the IDs
                        //     EastwoodsFacilities::whereIn('id', $idsArray)->delete();
                        //     $insertedNotif[] = $idsArray;
                        //     $actionText = 'Deleted';
                        //     $actionType = 'success';
                        //     $actionName = "Teacher";
                        //     break;


                    default:
                        # code...
                        break;
                }
            }
        }
        // Build the success message
        $message = $actionText . ' ' . count($insertedNotif) . ' ' . $actionName . ' record(s)!';
        // Prepare the toast notification data
        $notification = [
            'status' => $actionType,
            'message' => $message,
        ];
        // Convert the notification to JSON
        $notificationJson = json_encode($notification);

        // $tableUpdates = "Maintenance Notice!.The system will be temporarily unavailable for improvements!!. Sorry for any inconvenience.! Thank you for your patience! Countdown!!! 3.! 2.! 1.!. 
        // ";
        // for static response only 
        // event(new UpdateSystem($tableUpdates));
        // Redirect back with a success message and the inserted products
        return back()->with('notification', $notificationJson);
    }

    function generateUniqueAbbreviation($facility)
    {
        // Load existing abbreviations from a persistent storage
        $existingAbbreviations = $this->loadExistingAbbreviations();

        // Split the facility into words
        $words = preg_split('/\s+/', $facility);

        // Create an abbreviation based on the initial letters of each word
        $abbreviation = '';
        foreach ($words as $word) {
            $abbreviation .= strtoupper(mb_substr($word, 0, 1));
        }

        // Ensure uniqueness
        $uniqueAbbreviation = $abbreviation;

        while (in_array($uniqueAbbreviation, $existingAbbreviations)) {
            // If the abbreviation is not unique, add a random letter to make it unique
            $uniqueAbbreviation = $abbreviation . chr(rand(65, 90)); // Append a random uppercase letter
        }
        // dd($uniqueAbbreviation);
        return $uniqueAbbreviation;
    }

    function loadExistingAbbreviations()
    {
        // Return an array of existing abbreviations
        $existingAbbrevModels = Abbrev::all();

        // Extract the abbreviation values from the Eloquent models
        $existingAbbreviations = $existingAbbrevModels->pluck('abbrev')->toArray();

        return $existingAbbreviations;
    }

    function loadExistingFacilitys()
    {
        $existingFacilityModel = EastwoodsFacilities::all();

        // Extract the values of 'facilities' and 'floor' columns
        $existingFacilities = $existingFacilityModel->pluck('facilities')->toArray();
        $existingFloors = $existingFacilityModel->pluck('floor')->toArray();

        // Combine 'facilities' and 'floor' values into a single array
        $existingFacilitiesData = array_map(
            function ($facility, $floor) {
                return ['facilities' => $facility, 'floor' => $floor];
            },
            $existingFacilities,
            $existingFloors
        );

        return $existingFacilitiesData;
    }

    //edit facilities in floor plan
    function facilitiesManageEdit(Request $request){
        $excludeAbbrev = $request->input('abbrev');
        $floor = $request->input('floor');

        $query = DB::table('eastwoods_facilities')
            // ->join('')
            ->join('abbrevs', 'eastwoods_facilities.id', '=', 'abbrevs.facility_id')
            ->where('floor', '=', $floor)
            ->select('eastwoods_facilities.*', 'abbrevs.abbrev');

        // Conditionally add the where clause if $excludeAbbrev is defined
        if ($excludeAbbrev !== null) {
            $query->where('abbrevs.abbrev', '!=', $excludeAbbrev);
        }

        $allFac = $query->get();
        return response()->json(['fac'=>$allFac]);
       
    }

    //edit floor plan by floor
    function editFloorPlan(Request $request){
        $responseData = [];
        $floors = Floorplan::where('floor', '=', $request->input('floor'))->get();
        foreach ($floors as $floor) {
            $floorData = $floor->toArray();
            $responseData[] = $floorData;
            // dd($floor->floor.' '.$requestedFloorLabel);
        
        }
        return response()->json(['floorplan'=>$responseData]);
    }
}
