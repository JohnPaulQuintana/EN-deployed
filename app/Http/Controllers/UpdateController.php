<?php

namespace App\Http\Controllers;

use App\Models\Update;
use App\Events\UpdateSystem;
use Illuminate\Http\Request;

class UpdateController extends Controller
{
    public function getUpdates(Request $request){
        $updates = Update::where('status',0)->orderBy('created_at', 'desc')->get();
        return response()->json(['updates'=>$updates]);
    }

    public function updatedSystem(Request $request){
        $updates = Update::where('status', 0)->orderBy('created_at', 'desc')->get();

        foreach ($updates as $update) {
            $update->status = 1;
            $update->save();
        }
        $tableUpdates = "Maintenance Notice!.The system will be temporarily unavailable for improvements!!. Sorry for any inconvenience.! Thank you for your patience! Countdown!!! 3.! 2.! 1.!. 
        ";
        // for static response only 
        event(new UpdateSystem($tableUpdates));
       // Prepare the toast notification data
       $notification = [
        'status' => 'info',
        'message' => "System Updates on process",
    ];
    // Convert the notification to JSON
    $notificationJson = json_encode($notification);

    
    // Redirect back with a success message and the inserted products
    return back()->with('notification', $notificationJson);
    }

    public function Retraining(){
        // Specify the file name or path relative to the base path of your Laravel application
        $fileName = 'model.nlp';

        // Get the full path to the file
        $filePath = base_path($fileName);

        // Check if the file exists before attempting to delete it
        if (file_exists($filePath)) {
            // Delete the file
            unlink($filePath);
            return response()->json(['status'=>'Successfully Deleted']);
        } else {
            return response()->json(['status'=>'Failed to Deleted']);
        }
    }
}
