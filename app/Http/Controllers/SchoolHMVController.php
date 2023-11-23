<?php

namespace App\Http\Controllers;

use App\Models\SchoolHMV;
use Illuminate\Support\Str;
use Illuminate\Http\Request;

class SchoolHMVController extends Controller
{
    public function hmv(){
        $hmn = SchoolHMV::all()->groupBy('type');
        // dd($hmn);
        return view('admin.contents.hmv')->with(['hmns' => $hmn]);
    }

    public function hymn(Request $request){
         // Validate the uploaded file
         $request->validate([
            'video' => 'required|mimes:mp4|max:10240', // 10 MB limit
        ]);

        
        $video = SchoolHMV::where('type','hymn')->first();
        
          // Get the original filename and generate a unique identifier
        $originalFilename = pathinfo($request->file('video')->getClientOriginalName(), PATHINFO_FILENAME);
        $uniqueIdentifier = Str::uuid()->toString();

        // Create a unique filename by combining the original filename and identifier
        $uniqueFilename = $originalFilename . '_' . $uniqueIdentifier;

        // Move the uploaded file to the public directory with the unique filename
        $request->file('video')->move(public_path('mp4'), $uniqueFilename . '.' . $request->file('video')->getClientOriginalExtension());

        // Update the file path in the database
        $video->update(['path' => 'mp4/' . $uniqueFilename . '.' . $request->file('video')->getClientOriginalExtension()]);

        $notification = [
            'status' => 'success',
            'message' => 'Update Successfully!',
        ];
        // Convert the notification to JSON
        $notificationJson = json_encode($notification);
        return back()->with('notification', $notificationJson);
    }

    public function vision(Request $request){
        $vision = SchoolHMV::where('type','vision')->first();

        $vision->update(['descriptions' => $request->input('vision')]);

        $notification = [
            'status' => 'success',
            'message' => 'Update Successfully!',
        ];
        // Convert the notification to JSON
        $notificationJson = json_encode($notification);
        return back()->with('notification', $notificationJson);
    }

    public function mission(Request $request){
        $mission = SchoolHMV::where('type','mission')->first();

        $mission->update(['descriptions' => $request->input('mission')]);

        $notification = [
            'status' => 'success',
            'message' => 'Update Successfully!',
        ];
        // Convert the notification to JSON
        $notificationJson = json_encode($notification);
        return back()->with('notification', $notificationJson);
    }
}
