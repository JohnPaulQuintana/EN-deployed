<?php

namespace App\Http\Controllers;

use App\Models\User;
use GuzzleHttp\Client;
use App\Models\Teacher;
use App\Models\Floorplan;
use App\Models\Frequently;
use Illuminate\Http\Request;
use App\Models\Functionality;
use Illuminate\Support\Facades\DB;
use App\Models\EastwoodsFacilities;
use Symfony\Component\Process\Process;
use Illuminate\Support\Facades\Session;
use Symfony\Component\Process\Exception\ProcessFailedException;

class Navi extends Controller
{
    public function startNaviServer(Request $request)
    {
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

        $frequentlies = Frequently::get();
        $systems = Functionality::all();
        return view('navi.contents.home')->with(['frequentlies' => $frequentlies, 'systems' => $systems, 'male' => $maleRestroomAbbreviations, 'female'=>$femaleRestroomAbbreviations]);
    }

    public function naviProcess(Request $request)
    {
        // dd($request);
        $query = $request->input('query');
        $prompt = $request->input('prompt');
        $allowedPrompts = ['yes', 'just do it', 'ofcourse', 'please'];
        // get all user names
        $names = Teacher::pluck('name');
        $facilities = EastwoodsFacilities::pluck('facilities');
        // dd($names);
        $continuation = false;
        // for answer yes or no in facilities
        if (is_null($query) || !in_array($request->input('prompt'), $allowedPrompts)) {
            if ($request->input('prompt') === 'yes') {
                $floor = Session::get('floor');
                $facility = Session::get('facility');
                $continuation = true;
                $dataArray = [
                    'navi' => [
                        [
                            'flag' => 'false',
                            'query' => 'yes',
                            'entity' => false,
                            'answer' => 'yes',
                            'data' => '',
                        ],
                    ],
                ];

                Session::forget('floor');
                Session::forget('facility');

                return response()->json(['response' => $this->generateText($dataArray['navi'][0], $prompt), 'floor' => $floor, 'facility' => $facility, 'continuation' => $continuation]);
            } elseif ($request->input('prompt') === 'no') {
                $floor = 'false';
                $facility = 'false';
                $continuation = false;
                $dataArray = [
                    'navi' => [
                        [
                            'flag' => 'false',
                            'query' => 'no',
                            'entity' => false,
                            'answer' => 'no',
                            'data' => '',
                        ],
                    ],
                ];

                Session::forget('floor');
                Session::forget('facility');

                return response()->json(['response' => $this->generateText($dataArray['navi'][0], $prompt), 'floor' => $floor, 'facility' => $facility, 'continuation' => $continuation]);
            }

            if ($request->input('prompt') !== null) {
                $client = new Client();
                $response = $client->post('http://localhost:5000/nlp', [
                    'json' => [
                        'prompt' => $request->input('prompt'),
                        'persons' => $names,
                        'facilities' => $facilities,
                    ]
                ]);
                $result = json_decode($response->getBody(), true);
                $floor = '';
                $facility = '';
                // dd($result['navi'][0]);
                // for facilities question

                if (
                    isset($result['navi'][0]['data']) &&
                    isset($result['navi'][0]['data']['floor']) && isset($result['navi'][0]['entity'])
                ) {
                    // 'floor' key is present in the specified structure
                    $floor = $result['navi'][0]['data']['floor'];
                    // $floorId = $result['navi'][0]['data']['id'];
                    $facility = $result['navi'][0]['data']['facilities'];
                    // dd($floor);
                    // Store $floor and $facility in the session
                    session(['floor' => $floor, 'facility' => $facility]);
                    $facilityFound = false;
                    $floorFound = Floorplan::where('floor', $floor)->first();
                    // dd($floorFound);
                    if ($floorFound) {
                        foreach ($floorFound['gridDetails'] as $value) {
                            // dd($value);
                            if (isset($value['label']) && ($value['label'] === $facility || ($value['sublabel'] ?? null) === $facility)) {
                                // dd('found');
                                $facilityFound = true; // Set the flag to true if the facility is found
                                break; // Stop searching once found
                            }
                        }

                        if (!$facilityFound) {
                            // dd($value);
                            $response = [
                                "flag" => "false",
                                "query" => "facilities.layout.not",
                                "data" => $facility,
                            ];
                            return response()->json(['response' => $this->generateText($response, $prompt), 'floor' => $floor, 'facility' => $facility, 'continuation' => 'information']);
                        }

                        // dd($jsonData);
                    } else {
                        // dd('not found!');
                        $response = [
                            "flag" => "false",
                            "query" => "facilities.layout.not",
                            "data" => $facility,
                        ];
                        return response()->json(['response' => $this->generateText($response, $prompt), 'floor' => $floor, 'facility' => $facility, 'continuation' => 'information']);
                    }
                } else {
                    // dd($result);
                    if ($result['navi'][0]['data']) {
                        // dd('if');
                        // 'floor' key is not present in the specified structure
                        //get the facilities cred
                        if (isset($result['navi'][0]['data']['facilities_id'])) {
                            $fac = EastwoodsFacilities::where('id', $result['navi'][0]['data']['facilities_id'])->first();
                        }else{
                            $fac = EastwoodsFacilities::where('id', $result['navi'][0]['data']['facility_id'])->first();
                        }
                        
                        // dd($fac);
                        session(['floor' => $fac['floor'], 'facility' => $fac['facilities']]);
                        $floor = $fac['floor'];
                        $facility = $fac['facilities'];
                        // dd($fac['facilities']);
                        // $floor = false;
                        $continuation = 'information';
                    } elseif ($result['navi'][0]['entity']) {
                        // dd('else if');
                        //check if its a persons location question
                        switch ($result['navi'][0]['query']) {
                                //not found but has a entity
                            case 'persons.location.not':
                                //call this function naviProcessInformationSearch
                                // format a request
                                //  $t = Teacher::where('name',$result['navi'][0]['entity'])->first();
                                $t = Teacher::join('eastwoods_Facilities', 'teachers.facilities_id', '=', 'eastwoods_Facilities.id')
                                    ->where('teachers.name', $result['navi'][0]['entity'])
                                    ->first();
                                // dd($t);
                                $formatrequest = new Request([
                                    'infoId' => $t['id'],
                                    'locationFloor' => $t['floor'],
                                    'teacherLocation' => $t['facilities'],
                                    'infoModel' => 'Teacher', // Replace with the actual model name
                                    'data' => $t,
                                ]);

                                // dd($formatrequest);
                                return $this->naviProcessInformationSearch($formatrequest);
                                // break;

                            case 'facilities.not':
                                $fac = EastwoodsFacilities::where('facilities', $result['navi'][0]['entity'])->first();
                                session(['floor' => $fac['floor'], 'facility' => $fac['facilities']]);
                                $floor = $fac['floor'];
                                $facility = $fac['facilities'];
                                // dd($fac['facilities']);
                                // $floor = false;
                                $continuation = 'information';
                                // dd($result['navi'][0]);
                                return response()->json(['response' => $this->generateText($result['navi'][0], $prompt), 'floor' => $floor, 'facility' => $facility, 'continuation' => $continuation]);
                            
                            case 'persons.not':
                                // dd($result['navi'][0]);
                                //call this function naviProcessInformationSearch
                                // format a request
                                //  $t = Teacher::where('name',$result['navi'][0]['entity'])->first();
                                $t2 = Teacher::join('eastwoods_Facilities', 'teachers.facilities_id', '=', 'eastwoods_Facilities.id')
                                    ->where('teachers.name', $result['navi'][0]['entity'])
                                    ->first();
                                //dd($t2);
                                $formatrequest = new Request([
                                    'infoId' => $t2['id'],
                                    'locationFloor' => $t2['floor'],
                                    'teacherLocation' => $t2['facilities'],
                                    'infoModel' => 'Teacher', // Replace with the actual model name
                                    'data' => $t2,
                                ]);
                                // dd($formatrequest);
                                return $this->naviProcessInformationSearch($formatrequest);
                                // break;

                            case 'badwords':
                                return response()->json(['response' => $this->generateText($result['navi'][0], $prompt), 'floor' => $floor, 'facility' => $facility, 'continuation' => 'deactivate']);
                            case 'greetings':
                                return response()->json(['response' => $this->generateText($result['navi'][0], $prompt), 'floor' => $floor, 'facility' => $facility, 'continuation' => 'deactivate']);

                            case '404':
                                $formatrequest = new Request([
                                    'infoId' => null,
                                    'locationFloor' => null,
                                    'teacherLocation' => null,
                                    'infoModel' => null, // Replace with the actual model name
                                    'data' => false,
                                ]);
                                // dd($formatrequest);
                                return $this->naviProcessInformationSearch($formatrequest);
                            default:
                            return response()->json(['response' => $this->generateText($result['navi'][0], $prompt), 'floor' => $floor, 'facility' => $facility, 'continuation' => 'deactivate']);
                               
                        }
                        $fac = EastwoodsFacilities::where('facilities', $result['navi'][0]['entity'])->first();
                        session(['floor' => $fac['floor'], 'facility' => $fac['facilities']]);
                        $floor = $fac['floor'];
                        $facility = $fac['facilities'];
                        // dd($fac['facilities']);
                        // $floor = false;
                        $continuation = 'information';
                    } else {
                        $floor = null;
                        $facility = null;
                        $continuation = 'deactivate';
                    }
                }
                // dd($result['navi'][0]);
                return response()->json(['response' => $this->generateText($result['navi'][0], $prompt), 'floor' => $floor, 'facility' => $facility, 'continuation' => $continuation]);
            }else{
                $response = [
                    'flag' => 'true',
                    'answer' => 'Ooops sorry!, looks like your accidentally send a request without a question. dont be affraid to ask, im here to help.',
                    'entity' => false,
                    'data' => false,
                ];
                return response()->json(['response' => $response, 'floor' => null, 'facility' => null, 'continuation' => 'deactivate']);
            }

        } else {
            return response()->json(['error' => 'error']);
        }
    }

    // process navigation
    public function naviProcessNavigation(Request $request)
    {
        $requestedFloorLabel = $request->input('floor');
        $requestedFacilityLabel = $request->input('facility');

        // ending part
        $endingPart = [
            'How can I assist you further?',
            'What else would you like to know?',
            'How may I help you with it?',
            'What would you like to do next?',
            'How can I assist you with it?',
            'How may I assist you further?',
            'What specific information do you need?',
            'What else can I do for you today?',
            'How can I assist you today?',
            'How may I help you with it?',
            'Is there anything else on your mind?',
            'Feel free to ask any other questions.',
            'Im here to help. Whats next?',
            'What can I do to make your day better?',
            'Dont hesitate to ask if you need more information.',
            'Your satisfaction is my priority. Whats your next query?',
            'Im at your service. Whats your request?',
            'Let me know how I can be of further assistance.',
            'What other assistance do you require today?',
            'Im here to assist you. Whats your next question?',
        ];

        // Find the target floor
        $targetFloor = Floorplan::where('floor', $requestedFloorLabel)->first();

        if (!$targetFloor) {
            return response()->json(['details' => [], 'message' => 'Target floor not found.']);
        }

        // Include the ground floor in the response
        $groundFloor = Floorplan::where('floor', 'ground-floor')->first();
        $responseData = [];
        $responseGuide = [];
        $length = 0;
        if ($groundFloor) {
            $responseData[] = $groundFloor->toArray();
        }

        // Include floors leading to the target floor
        $floors = Floorplan::where('floor', '<=', $requestedFloorLabel)->get();
        // dd($groundFloor['floor']);
        if (!$floors->isEmpty()) {
            $responseGuide[] = $this->generateTextStairs($groundFloor['floor'], $requestedFacilityLabel, false);
            foreach ($floors as $floor) {
                $floorData = $floor->toArray();
                $floorData['found'] = true;
                $responseData[] = $floorData;
                // dd($floor->floor.' '.$requestedFloorLabel);
                if ($floor->floor === $requestedFloorLabel) {
                    // dd('ginagawa');
                    $length = mt_rand(0, count($endingPart) - 1);
                    $randomResponse = $endingPart[$length];

                    $responseGuide[] = $this->generateTextStairs($floor->floor, $requestedFacilityLabel, true) . ' !' . $randomResponse;
                    break;
                } else {
                    $responseGuide[] = $this->generateTextStairs($floor->floor, $requestedFacilityLabel, false);
                }
            }

            // dd($responseGuide);

        } else {
            $responseData['found'] = false;
            $responseData['message'] = 'No matching floor found';
        }

        // Remove duplicates
        // $uniqueServerResponds = array_unique($serverResponds);

        // dd($floorData); 
        return response()->json(
            [
                'details' => $responseData,
                'navigationMessage' => $responseGuide,
                'target' => $requestedFacilityLabel
            ]
        );
    }


    // process information request for browsing
    public function naviProcessInformationRequest(Request $request)
    {
        try {
            // dd();
            $reqInfo = $request->input('requestInfo');
            $modelClass = 'App\Models\\' . $request->input('modelClass');

            //this is for teacher
            if ($reqInfo !== 'facilities' && $reqInfo !== 'mission' && $reqInfo !== 'vision' && $reqInfo !== 'hymn') {
                $informations = $modelClass::join('eastwoods_facilities', 'eastwoods_facilities.id', '=', 'teachers.facilities_id')
                    ->select('teachers.*', 'eastwoods_facilities.facilities as facility_name', 'eastwoods_facilities.floor')
                    ->get();
    
            }elseif($reqInfo === 'mission' || $reqInfo === 'vision' || $reqInfo === 'hymn'){ 
                $informations = $modelClass::where('type',$reqInfo)->get();
                // dd($informations);
            }else {
                $informations = $modelClass::get();
            }
            // dd($informations);
           

            return response()->json(['informations' => $informations, 'modelClass' => $request->input('modelClass')]);
        } catch (\Throwable $th) {
            throw $th;
            // dd($th);
        }
    }

    // process for searching
    public function naviProcessInformationSearch(Request $request)
    {
        // dd($request);


            $reqInfoId = $request->input('infoId');
            $modelClass = 'App\Models\\' . $request->input('infoModel');
        

        if (!$request->input('data') && $request->input('infoModel') !== null) {
            $findInformation = $modelClass::where('id', $reqInfoId)->first();
        } else {
            // all info including location also
            $findInformation = $request->input('data');
        }
        //    dd($findInformation);
        $continuation = false;
        $facilityFound = false; // Initialize a flag to track if the facility is found
        // dd($findInformation);
        switch ($request->input('infoModel')) {

            case 'EastwoodsFacilities':
                $floorFound = Floorplan::where('floor', $findInformation->floor)->first();
                // dd($floorFound['gridDetails']);
                if ($floorFound) {
                    // dd('nagtrue');
                    foreach ($floorFound['gridDetails'] as $value) {
                        // dd($value);
                        if (isset($value['label']) && $value['label'] == $findInformation->facilities) {
                            $facilityFound = true; // Set the flag to true if the facility is found
                            break; // Stop searching once found
                        }
                    }

                    if ($facilityFound) {
                        // dd($findInformation);
                        $response = [
                            "flag" => "false",
                            "query" => "facilities.found",
                            "entity" => false,
                            "data" => $findInformation,
                        ];
                        session(['floor' => $findInformation->floor, 'facility' => $findInformation->facilities]);
                        
                        return response()->json(['response' => $this->generateText($response, 'no question'), 'floor' => $findInformation->floor, 'facility' => $findInformation->facilities, 'continuation' => $continuation]);
                        // break; // Stop searching once found
                    } else {
                        // print($value['label']);

                        $response = [
                            "flag" => "false",
                            "query" => "facilities.layout.not",
                            "entity" => false,
                            "data" => $findInformation->facilities,
                        ];

                        
                        return response()->json(['response' => $this->generateText($response, 'no question'), 'floor' => $findInformation->floor, 'facility' => $findInformation->facilities, 'continuation' => 'deactivate']);
                    }
                    // dd($jsonData);
                } else {
                   
                    $response = [
                        "flag" => "false",
                        "query" => "facilities.layout.not",
                        "entity" => false,
                        "data" => $findInformation->facilities,
                    ];
                    return response()->json(['response' => $this->generateText($response, 'no question'), 'floor' => $findInformation->floor, 'facility' => $findInformation->facilities, 'continuation' => 'deactivate']);
                }

                // for teachers
            case 'Teacher':
                $response = [
                    "flag" => "false",
                    "query" => "persons.found",
                    "entity" => false,
                    "data" => $findInformation,
                ];
                session(['floor' => $request->input('locationFloor'), 'facility' => $request->input('teacherLocation')]);
                $continuation = 'information';
                return response()->json(['response' => $this->generateText($response, 'no question'), 'floor' => $request->input('locationFloor'), 'facility' => $request->input('teacherLocation'), 'continuation' => $continuation]);

            case null:
                $response = [
                    "flag" => "false",
                    "query" => "persons.not",
                    "entity" => false,
                    "data" => $findInformation,
                ];
               
                $continuation = 'deactivate';
                return response()->json(['response' => $this->generateText($response, 'no question'), 'floor' => null, 'facility' => null, 'continuation' => $continuation]);
            default:
                # code...
                break;
        }
    }
    // generating text
    public function generateText($data, $question)
    {
        // array:5 [ // app\Http\Controllers\Navi.php:509
        //     "flag" => "false"
        //     "query" => "404"
        //     "entity" => false
        //     "answer" => "Sorry my knowledge is limited, i cant help you with that!"
        //     "data" => ""
        //   ]
        // dd($data);
        if($data['query'] !== '404' && $question !== 'yes'){
            // save the question
            // dd($question);
            // Check if the question exists in a case-insensitive manner
            if (!Frequently::whereRaw('LOWER(frequently) = ?', [strtolower($question)])->exists()) {
                // The question does not exist in the database
                $input = Frequently::create(['frequently' => $question]);
            } 
            
        }
        $recomposed = $this->randomText($data['query'], $data['data'], $data['entity']);

        $response = [
            'flag' => 'true',
            'answer' => $recomposed,
            'entity' => $data['entity'],
            'data' => false,
        ];
        return $response;
    }

    // get random text response

    public $openingForFalsePerson = [
        'I couldn\'t find any information about that person. Is there anything else I can assist you with?',
        'Im sorry, but I couldnt locate any details for that individual. How else can I help you?',
        'It seems I don\'t have any information on that person. Please provide more details or try another query.',
        'Unfortunately, I couldn\'t find any information on the person you mentioned. Can I assist you with something else?',
        'I couldn\'t find any records for that person. Please double-check the name or provide additional information.',
        'I apologize, but there are no records matching that person in my database. Can I assist you with something else?',
        'I couldn\'t locate any information for the person you specified. Is there another request youd like to make?',
        'Im sorry, but I couldnt find any information about that person. How else can I assist you?',
        'Unfortunately, I don\'t have any data on that person. Please provide more details or try a different query.',
        'It appears there are no records for that person. Can I help you with a different request?',
        'I couldn\'t retrieve any information about the specified individual. Is there anything else I can assist you with? Can you edit your question?',
        'I apologize, but I couldn\'t locate any details for that person. How else may I be of service? Can you edit your question?',
        'It seems I don\'t have any information on the individual you mentioned. Please provide more details or try another query. Can you edit your question?',
        'Unfortunately, I couldn\'t find any information on the person you specified. Can I assist you with something else? Can you edit your question?',
        'I couldn\'t find any records for that person. Please double-check the name or provide additional information. Can you edit your question?',
        'I apologize, but there are no records matching that person in my database. Can I assist you with something else? Can you edit your question?',
        'I couldn\'t locate any information for the person you specified. Is there another request youd like to make? Can you edit your question?',
        'Im sorry, but I couldnt find any information about that person. How else can I assist you? Can you edit your question?',
        'Unfortunately, I don\t have any data on that person. Please provide more details or try a different query. Can you edit your question?',
        'It appears there are no records for that person. Can I help you with a different request? Can you edit your question?',
    ];

    // Person Found
    public $openingForFoundPerson = [
        'Excellent news! Ive successfully retrieved information about [name] in their location is [position].',
        'Im pleased to inform you that Ive located detailed records for [name] in their location is [position].',
        'Youre in good hands! I possess comprehensive information on [name] in their location is [position].',
        'Im delighted to share that Ive found the information you requested regarding [name] in their location is [position].',
        'Ive successfully retrieved detailed information for [name] in their location is [position].',
        'Rest assured, I have in-depth information about [name] in their location is [position].',
        'Ive successfully located [name] in their location is [position]. What specific details are you seeking?',
        'Youre in luck! Ive found comprehensive information about [name] in their location is [position].',
        'Ive diligently gathered extensive details for [name] in their location is [position].',
        'I possess thorough information on [name] in their location is [position]. How may I further assist you?',
    ];

    // facilities
    public $openingForFalseFacility = [
        'I couldn\'t find any information about that facility. Is there anything else I can assist you with?',
        'Im sorry, but I couldnt locate any details for that facility. How else can I help you?',
        'It seems I don\'t have any information on that facility. Please provide more details or try another query.',
        'Unfortunately, I couldn\'t find any information on the facility you mentioned. Can I assist you with something else?',
        'I couldn\'t find any records for that facility. Please double-check the name or provide additional information.',
        'I apologize, but there are no records matching that facility in my database. Can I assist you with something else?',
        'I couldn\'t locate any information for the facility you specified. Is there another request youd like to make?',
        'Im sorry, but I couldnt find any information about that facility. How else can I assist you?',
        'Unfortunately, I don\'t have any data on that facility. Please provide more details or try a different query.',
        'It appears there are no records for that facility. Can I help you with a different request?',
    ];

    public $openingForFoundFacilityStart = [
        'Found [facilities] on [floor].',
        'Located [facilities] on [floor].',
        'Info: [facilities] on [floor].',
        "Details for [facilities] on [floor].",
        "Facility: [facilities] on [floor].",
        "Info: [facilities] on [floor].",
        "Found [facilities] on [floor].",
        "Located [facilities] on [floor].",
        "Info: [facilities] on [floor].",
        "Details for [facilities] on [floor].",
    ];



    // person location found
    // $openingForFoundPersonLocation = [
    //     'Great news! I found information on navigating to [facilities] where you can find [persons]. The operation time is [operation_time].',
    //     'Good news! I located details for reaching [facilities] where you can find [persons]. The operation time is [operation_time].',
    //     'You\'re in luck! I have directions for [facilities] where you can locate [persons]. The operation time is [operation_time].',
    //     'I found navigation instructions for accessing [facilities] where you can find [persons]. The operation time is [operation_time].',
    //     'I\'ve found guidance on reaching [facilities] where you can discover [persons]. The operation time is [operation_time].',
    //     'You\'re in the right place! I have directions to [facilities] where you can locate [persons]. The operation time is [operation_time].',
    //     'I found the route to [facilities] where you can find [persons]. The operation time is [operation_time].',
    //     'You\'re in luck! I located information on how to get to [facilities] where you can find [persons]. The operation time is [operation_time].',
    //     'I\'ve successfully provided navigation details for [facilities] where you can find [persons]. The operation time is [operation_time].',
    //     'Good news! I have navigation instructions for reaching [facilities] where you can find [persons]. The operation time is [operation_time].',
    // ];

    // persons position at eastwoods
    public $personsPositionAtEastwoods = [
        'The principal at Eastwoods is [name].',
        'At Eastwoods, the principal is [name].',
        'You are inquiring about the principal at Eastwoods, and that would be [name].',
        'The person in charge of the principal role at Eastwoods is [name].',
        'The current principal at Eastwoods is [name].',
        'Youll find [name] as the principal at Eastwoods.',
        'The role of principal at Eastwoods is held by [name].',
        'Eastwoods School is led by [name] as the principal.',
        'The principal at Eastwoods goes by the name of [name].',
        'At Eastwoods, [name] serves as the principal.'
    ];

    //person located response message
    public $openingForFoundPersonLocation = [
        'Great news! Directions to [facilities] where you can find [persons] are available.',
        'Good news! Details on [facilities] where you can find [persons] are ready.',
        'Directions to [facilities] for locating [persons] are at your service.',
        'Find your way to [facilities] to discover [persons].',
        'Guidance to [facilities] for discovering [persons] is here.',
        'Youre in the right place! Directions to [facilities] for finding [persons] are provided.',
        'The route to [facilities] where you can locate [persons] is available.',
        'Youre in luck! Information on reaching [facilities] to find [persons] is here.',
        'Navigation details for [facilities] to locate [persons] are ready.',
        'Discover directions to [facilities] for finding [persons].',
    ];

    public $positiveResponses = [
        "Get ready to explore.!",
        "Discover the area!",
        "Your map is coming up.!",
        "Exciting!",
        "Enjoy!",
        "Ready!",
        "Brace yourself for the map!",
        "Your map is ready.",
        "Map coming up!",
        "Map coming up!"
    ];


    // negative response for no
    public $negativeResponses = [
        "No problem! If you change your mind or have any more questions, feel free to ask. I'm here to help!",
        "That's alright! If you have any other questions or need assistance with something else, just let me know.",
        "Sure thing! If you ever decide to explore further or need assistance later, don't hesitate to reach out.",
        "Understood! If you have more questions or need assistance in the future, feel free to come back anytime.",
        "Alright! If you ever want to see the map or have any other inquiries, I'm here to assist you.",
        "No worries! If you change your mind or need assistance with anything else, don't hesitate to ask.",
        "Okay! If you have any more questions or need assistance later, don't hesitate to reach out to me.",
        "Certainly! If you ever decide to view the map or have any other questions, I'm here to assist you.",
        "Got it! If you change your mind or need help with anything else, feel free to get in touch.",
        "That's perfectly fine! If you have any more questions or need assistance in the future, I'm here to help."
    ];

    //layout not found
    public $layoutNotFoundMessages = [
        "I apologize, but it seems we don't currently have the layout information for this facility's location.",
        "We understand your request for the layout, but at this moment, the layout for this facility's location is unavailable.",
        "Regrettably, the layout details for this facility's location are not present in our database.",
        "We're sorry to inform you that we couldn't locate the layout for this facility's location.",
        "Unfortunately, the layout for this facility's location is not currently accessible in our records.",
        "Apologies, but we're currently missing the layout information for this facility's location.",
        "The layout for this facility's location is regrettably absent from our database.",
        "I regret to inform you that we are unable to provide the layout for this facility's location at this time.",
        "We've conducted a search, but the layout for this facility's location is nowhere to be found.",
        "We're actively working on obtaining the layout for this facility's location, but it's not yet available.",
        "The layout for this facility's location is currently undergoing updates, and we don't have the latest version.",
        "Layout data for this facility's location is temporarily out of reach. We apologize for any inconvenience.",
        "Our team is diligently searching for the layout of this facility's location, but it has proven elusive.",
        "The layout for this facility's location is in a pending state and hasn't been finalized yet.",
        "Please check back later for the layout details of this facility's location as we continue our efforts to obtain it.",
        "We sincerely apologize, but the layout information for this facility's location is currently unavailable.",
        "We understand your desire for the layout, but we're unable to provide it as of now.",
        "The layout for this facility's location is still in the process of being updated, and we don't have the latest version.",
        "We're sorry for the inconvenience, but the layout is currently not accessible to us.",
        "We're doing our best to acquire the layout for this facility's location, but it's not yet ready for retrieval.",
    ];

    public $endingPartLoc = [
        'To continue the conversation, press yes.',
        'Press yes to proceed further.',
        'To move forward, simply press yes.',
        'To continue, press yes anytime.',
        'Feel free to press yes to continue.',
        'You can press yes to keep going.',
        'To proceed, press yes whenever youre ready.',
        'When youre ready to continue, press yes.',
        'Press yes if youd like to continue.',
        'To continue, press yes whenever youre ready.',
    ];

    // ending part
    public $endingPart = [
        'How can I assist you further?',
        'What else would you like to know?',
        'How may I help you with it?',
        'What would you like to do next?',
        'How can I assist you with it?',
        'How may I assist you further?',
        'What specific information do you need?',
        'What else can I do for you today?',
        'How can I assist you today?',
        'How may I help you with it?',
        'Is there anything else on your mind?',
        'Feel free to ask any other questions.',
        'Im here to help. Whats next?',
        'What can I do to make your day better?',
        'Dont hesitate to ask if you need more information.',
        'Your satisfaction is my priority. Whats your next query?',
        'Im at your service. Whats your request?',
        'Let me know how I can be of further assistance.',
        'What other assistance do you require today?',
        'Im here to assist you. Whats your next question?',
    ];

    // greetings
    public $greetings = [
        "Hello there! Welcome to Eastwoods Guide, your dedicated resource for all things Eastwoods. How may I assist you today?",
        "Greetings! Eastwoods Guide is here to assist you with any questions or information related to Eastwoods. What can I do for you?",
        "Good day! Eastwoods Guide is your trusted companion for Eastwoods-related information and support. How can I enhance your day?",
        "Hi! Welcome to Eastwoods Guide, your friendly source for all things Eastwoods. How can I be of service to you?",
        "Hello! Eastwoods Guide is here to serve you. How can I assist you during your time at Eastwoods?",
        "Hey! I'm Eastwoods Guide, dedicated to making your Eastwoods experience smoother. How can I assist you today?",
        "Howdy! It's great to see you on campus. Eastwoods Guide is here to help. What can I do for you today?",
        "Hi there! Eastwoods Guide is ready to provide Eastwoods-related support. How can I make your day more productive?",
        "Hey there! Welcome to Eastwoods Guide. How can I assist you in navigating Eastwoods?",
        "Good to see you! Eastwoods Guide is here to provide Eastwoods-related information and assistance. What's on your mind?"
    ];

    // thanks
    public $thanks = [
        "You're welcome! If you have any more questions, feel free to ask.",
        "No problem at all! If there's anything else I can assist you with, just let me know.",
        "You got it! If you need further assistance, don't hesitate to reach out.",
        "Glad I could help! If you have more inquiries, I'm here to assist.",
        "Anytime! If you have additional questions, feel free to ask.",
        "You're welcome! If there's anything else on your mind, don't hesitate to ask.",
        "No worries! If you require further assistance, feel free to reach out.",
        "It was my pleasure assisting you! If you have more questions later, I'll be here.",
        "You're welcome! If there's anything specific you'd like to know, just ask.",
        "Happy to help! If you ever need assistance in the future, don't hesitate to ask me."
    ];

    // bad words
    public $badWordResponses = [
        "I'm here to provide useful information and assistance. Please refrain from using offensive language.",
        "Let's keep the conversation respectful and appropriate. How can I assist you further?",
        "I appreciate a polite and respectful conversation. How can I help you today?",
        "Using respectful language makes communication more effective. What can I assist you with?",
        "I'm here to help with your questions. Please keep the conversation civil and respectful.",
        "Respectful communication leads to better outcomes. How can I assist you today?",
        "Thank you for maintaining a courteous tone in our conversation. How can I assist you further?",
        "Your polite language is appreciated. How can I be of assistance to you?",
        "Let's keep our conversation respectful and focused on your needs. How can I assist you today?",
        "Politeness and respect go a long way in our conversation. How can I help you further?"
    ];

    public $defaultAnswers = [
        "I'm sorry, I couldn't find an answer to that question. Is there anything else I can help you with? If you're looking for specific options, I can navigate you to them.",
        "It seems like I don't have the information you're looking for. If you have another question, feel free to ask. I can also guide you to available options if needed.",
        "I apologize, but I'm unable to provide an answer to that question. Please let me know if there's anything else I can assist you with, or if you'd like me to navigate you to available options.",
        "Unfortunately, I don't have the information you need at the moment. If you have a different question, I'm here to help. I can also guide you to available options if that would be helpful.",
        "I'm sorry if I can't answer that question. Feel free to ask anything else you might be curious about. Additionally, I can navigate you to available options if you'd like.",
        "It looks like I don't have the answer you're seeking. Is there another question you'd like assistance with? I can also guide you to available options based on your preferences.",
        "I appreciate your question, but I don't have the answer right now. If you have other inquiries, I'm here to assist. Additionally, I can navigate you to available options if that would be helpful.",
        "I'm sorry, but I can't provide a response to that question. If you have additional questions, feel free to ask. I can also guide you to available options if you're interested.",
        "I apologize if I can't answer your question. Is there something else I can help you with, or would you like me to navigate you to available options?",
        "Unfortunately, I don't have the information you're looking for. If you have another question, I'm here to assist you. I can also guide you to available options if that suits your needs."
    ];
    public function randomText($query, $data, $entity)
    {
        $length = 0;
        switch ($query) {

            case 'greetings':
                $length = mt_rand(0, count($this->greetings) - 1);
                $randomResponse = $this->greetings[$length];
                break;

            case 'persons.not':
                if ($entity) {
                    $randomResponse = $this->entityHelper('person', $entity);
                } else {
                    $length = mt_rand(0, count($this->openingForFalsePerson) - 1);
                    // Get the random response
                    $randomResponse = $this->openingForFalsePerson[$length];
                }


                break;

            case 'persons.found':
                $data = Teacher::join('eastwoods_Facilities', 'teachers.facilities_id', '=', 'eastwoods_Facilities.id')
                    ->where('teachers.name', $data['name'])
                    ->first();
                // dd($facility);
                $length = mt_rand(0, count($this->openingForFoundPerson) - 1);
                // Get the random response
                $randomResponse = str_replace(
                    ['[name]', '[position]'],
                    [$data['name'], $data['facilities'] . ' on ' . $data['floor']],
                    $this->openingForFoundPerson[$length]
                ) .
                    '! ';
                break;

            case 'persons.position.found':
                $length = mt_rand(0, count($this->personsPositionAtEastwoods) - 1);
                // Get the random response
                $randomResponse = str_replace(
                    ['[name]'],
                    [$data['name']],
                    $this->personsPositionAtEastwoods[$length]
                ) .
                    '! ' . $this->endingPart[$length];
                break;

            case 'persons.position.not':
                if ($entity) {
                    $randomResponse = $this->entityHelper('person.position', $entity);
                } else {
                    $length = mt_rand(0, count($this->openingForFalsePerson) - 1);
                    // Get the random response
                    $randomResponse = $this->openingForFalsePerson[$length];
                }
                break;

                //person location question
            case 'persons.location.found':
                // dd($data);
                $name = $data['name'] ?? null;
                $facility = $data['facility_id'] ?? null;
                if($name !== null){
                    $length = mt_rand(0, count($this->openingForFoundPersonLocation) - 1);
                    // Get the random response
                    $randomResponse = str_replace(
                        ['[persons]'],
                        [$data['name']],
                        $this->openingForFoundPersonLocation[$length]
                    ) .
                        '! ';
                }else{
                    if($facility !== null){
                        $data2 = EastwoodsFacilities::where('id', $facility)->first();
                        $length = mt_rand(0, count($this->openingForFoundFacilityStart) - 1);
                        $randomResponse = str_replace(
                            ['[facilities]', '[floor]'],
                            [$data2['facilities'], $data2['floor']],
                            $this->openingForFoundFacilityStart[$length]
                        ) .
                        '! ';
                    }else{
                        $length = mt_rand(0, count($this->openingForFoundFacilityStart) - 1);
                        $randomResponse = str_replace(
                            ['[facilities]', '[floor]'],
                            [$data['facilities'], $data['floor']],
                            $this->openingForFoundFacilityStart[$length]
                        ) .
                        '! ';
                    }
                    
                }

                
                break;

            case 'persons.location.not':
                if ($entity) {
                    $randomResponse = $this->entityHelper('person.location', $entity);
                } else {
                    $length = mt_rand(0, count($this->openingForFalsePerson) - 1);
                    // Get the random response
                    $randomResponse = $this->openingForFalsePerson[$length];
                }
                break;

            case 'facilities.not':
                if ($entity) {
                    $randomResponse = $this->entityHelper('facilities', $entity);
                    // dd($randomResponse);
                } else {
                    $length = mt_rand(0, count($this->openingForFalseFacility) - 1);
                    $randomResponse = $this->openingForFalseFacility[$length];
                }
                break;

            case 'facilities.found':
                // dd($data);
                if($entity){
                    $f = EastwoodsFacilities::where('facilities', $entity)->first();
                }else{
                    $facility = $data['facility_id'] ?? null;
                    if($facility !== null){
                        $f = EastwoodsFacilities::where('id', $facility)->first();
                    }else{
                        $f = $data;
                    }
                   
                }
                
                $length = mt_rand(0, count($this->openingForFoundFacilityStart) - 1);
                $randomResponse = str_replace(
                    ['[facilities]', '[floor]'],
                    [$f['facilities'], $f['floor']],
                    $this->openingForFoundFacilityStart[$length]
                ) .
                    '! ';
                break;

            case 'facilities.layout.not':
                if ($entity) {
                    $randomResponse = $this->entityHelper('layout', $entity);
                } else {
                    $length = mt_rand(0, count($this->layoutNotFoundMessages) - 1);
                    $randomResponse = $this->layoutNotFoundMessages[$length] . '! ' . $this->endingPart[$length];
                }
                break;


            case 'badwords':
                $length = mt_rand(0, count($this->badWordResponses) - 1);
                $randomResponse = $this->badWordResponses[$length];
                break;

            case 'goodbye':
                $length = mt_rand(0, count($this->thanks) - 1);
                $randomResponse = $this->thanks[$length];
                break;

            case 'yes':
                // dd(Session::get('floor'));
                $length = mt_rand(0, count($this->positiveResponses) - 1);
                $randomResponse = $this->positiveResponses[$length] . '! ';
                // $randomResponse = str_replace(
                //     ['[floor]'],
                //     [$data['floor']],
                //     $positiveResponses[$length]
                // ) . '! '. $endingPart[$length];
                break;

            case 'no':
                $length = mt_rand(0, count($this->negativeResponses) - 1);
                $randomResponse = $this->negativeResponses[$length] . '! ' . $this->endingPart[$length];
                break;

            default:
                $length = mt_rand(0, count($this->defaultAnswers) - 1);
                $randomResponse = $this->defaultAnswers[$length];
                break;
        }

        return $randomResponse;
    }

    // generate response message on taking stairs
    public function generateTextStairs($floor, $facility, $found)
    {

        // dd($facility);
        $length = 0;
        $floorguide = [
            "Here is your navigation guide in [floor], pointing towards the stairs to reach your destination.",
            "Your navigation guide for [floor] is ready, showing the way to the stairs to reach your desired location.",
            "In [floor], your navigation guide directs you towards the stairs for access.",
            "Welcome to [floor]! Your navigation guide is set to lead you to the stairs for your destination.",
            "For [floor], follow your navigation guide; it's indicating the stairs as the way to go.",
            "Your [floor] navigation guide has your path marked to the stairs; follow its directions.",
            "In [floor], your navigation guide highlights the stairs as your route.",
            "Upon arriving at [floor], trust your navigation guide to guide you to the stairs.",
            "To reach your goal on [floor], follow your navigation guide's path to the stairs.",
            "Your navigation guide for [floor] is ready to lead you to the stairs as the next step.",
            "Welcome to [floor]! Your navigation guide highlights the stairs on the map.",
            "In [floor], your navigation guide points towards the stairs; follow it.",
            "For [floor], the quickest route involves using the stairs, as shown by your navigation guide.",
            "In [floor], the stairs are your next step; let your navigation guide show you the way.",
            "At [floor], head to the stairs; your navigation guide has them marked for you.",
            "Upon reaching [floor], trust your navigation guide; it's leading you straight to the stairs.",
            "For [floor], follow your navigation guide to find the stairs on your way.",
            "Your navigation guide for [floor] has the stairs clearly marked for your convenience.",
            "In [floor], your destination is just a staircase away; your navigation guide knows the way.",
            "In [floor], use the stairs as guided by your navigation guide to reach your destination."
        ];

        $messagesGroundFloor = [
            "Here is your navigation guide on the ground floor to reach [facilities]. Follow the path indicated by the guide.",
            "To find [facilities] on the ground floor, trust your navigation guide's directions; it will lead you there.",
            "Your navigation guide on the ground floor is set to take you to [facilities]. Follow its route to reach your destination.",
            "For the ground floor, your navigation guide will guide you to [facilities]. Follow its instructions to get there.",
            "Welcome to the ground floor! Your navigation guide is ready to lead you to [facilities].",
            "On the ground floor, your navigation guide points you to [facilities]. Follow its directions to reach your destination.",
            "To reach [facilities] on the ground floor, follow the path highlighted by your navigation guide.",
            "Your navigation guide on the ground floor will direct you to [facilities]. Trust its instructions to find your way.",
            "On the ground floor, follow your navigation guide to reach [facilities]. It knows the best route.",
            "Your navigation guide for the ground floor is set to assist you in reaching [facilities]. Follow its guidance.",
            "Welcome to the ground floor! Your navigation guide is here to help you find [facilities].",
            "On the ground floor, your navigation guide points you in the right direction to locate [facilities].",
            "For the ground floor, the quickest route to [facilities] is shown by your navigation guide.",
            "On the ground floor, [facilities] is just a step away; let your navigation guide show you the way.",
            "At the ground floor, trust your navigation guide to lead you to [facilities].",
            "For the ground floor, follow your navigation guide to find [facilities].",
            "Your navigation guide for the ground floor has the location of [facilities] clearly marked for your convenience.",
            "On the ground floor, [facilities] is within reach; your navigation guide knows the way.",
            "On the ground floor, discovering [facilities] is easy; your navigation guide is here to assist you.",
            "On the ground floor, [facilities] is just moments away; your navigation guide is here to guide you."
        ];

        $foundfloorguide = [
            "Your guide to [floor] is ready. Follow the guide to reach [facility].",
            "Welcome to [floor]! Your guide is set to lead you to [facility].",
            "In [floor], your guide directs you towards [facility] as your destination.",
            "For [floor], follow your guide; it's indicating [facility] as the way to go.",
            "Your [floor] guide has your path marked to [facility]; follow its directions.",
            "In [floor], your guide highlights [facility] as your route to success.",
            "To reach your goal on [floor], follow your guide's path to [facility].",
            "Your guide for [floor] is ready to lead you to [facility] as the next step.",
            "Welcome to [floor]! Your guide highlights [facility] on the map.",
            "In [floor], your guide points you towards [facility]; follow it.",
            "For [floor], the quickest route involves using [facility], as shown by your guide.",
            "In [floor], [facility] is your next step; let your guide show you the way.",
            "At [floor], head to [facility]; your guide has it marked for you.",
            "Upon reaching [floor], trust your guide; it's leading you straight to [facility].",
            "For [floor], follow your guide to find [facility] on your way.",
            "Your guide for [floor] has [facility] clearly marked for your convenience.",
            "In [floor], your destination is just a [facility] away; your guide knows the way.",
            "In [floor], use [facility] as guided by your guide to reach your destination.",
            "Your guide to [facility] on [floor] is ready. Follow the guide to reach [facility].",
            "For [floor], your guide is your trusted companion to find [facility].",
        ];

        if ($floor === 'ground-floor') {
            $length = mt_rand(0, count($messagesGroundFloor) - 1);
            $randomResponse = str_replace('[facilities]', $facility, $messagesGroundFloor[$length]);
        } elseif ($floor !== 'ground-floor' && !$found) {
            $length = mt_rand(0, count($floorguide) - 1);
            $randomResponse = str_replace('[floor]', $floor, $floorguide[$length]);
        }

        if ($found) {
            $length = mt_rand(0, count($foundfloorguide) - 1);
            $randomResponse = str_replace(['[facility]', '[floor]'], [$facility, $floor], $foundfloorguide[$length]) . '! ';
        }

        return $randomResponse;
    }

    //valiable
    public function designatedTeacher(Request $request)
    {
        // dd($request);
        $faci = $request->input('designated');
        $result = EastwoodsFacilities::where('facilities', $faci)->first();

        $resultAll = Teacher::where('facilities_id', $result->id)->get();

        $response = [
            'facility' => $result,
            'teachers' => $resultAll,
        ];
        // dd($resultAll);
        return response()->json(['result' => $response]);
    }


    //sub helper for entity
    public function entityHelper($types, $entity)
    {
        $length = 0;
        // dd($type);
        switch ($types) {
            case 'person':
                $p = Teacher::where('name', $entity)->first();
                $length = mt_rand(0, count($this->openingForFoundPerson) - 1);
                // Get the random response
                $randomResponse = str_replace(
                    ['[name]', '[position]'],
                    [$p['name'], $p['position']],
                    $this->openingForFoundPerson[$length]
                ) .
                    '! ' . $this->endingPart[$length];
                break;
            case 'person.position':
                $p = Teacher::where('name', $entity)->first();
                $length = mt_rand(0, count($this->personsPositionAtEastwoods) - 1);
                // Get the random response
                $randomResponse = str_replace(
                    ['[name]'],
                    [$p['name']],
                    $this->personsPositionAtEastwoods[$length]
                ) .
                    '! ' . $this->endingPart[$length];

                break;

            case 'persons.location':
                $p = Teacher::where('name', $entity)->first();
                $length = mt_rand(0, count($this->openingForFoundPersonLocation) - 1);
                // Get the random response
                $randomResponse = str_replace(
                    ['[persons]'],
                    [$p['name']],
                    $this->openingForFoundPersonLocation[$length]
                ) .
                    '! ' . $this->endingPartLoc[$length];
                break;

            case 'facilities':
                $f = EastwoodsFacilities::where('facilities', $entity)->first();
                // dd($f);
                $length = mt_rand(0, count($this->openingForFoundFacilityStart) - 1);
                $randomResponse = str_replace(
                    ['[facilities]', '[operation_time]', '[floor]'],
                    [$f['facilities'], $f['operation_time'], $f['floor']],
                    $this->openingForFoundFacilityStart[$length]
                ) .
                    '! ';

                session(['floor' => $f['floor'], 'facility' => $f['facilities']]);
                break;
            case 'layout':
                $f = EastwoodsFacilities::where('facilities', $entity)->first();
                $length = mt_rand(0, count($this->openingForFoundFacilityStart) - 1);
                $randomResponse = str_replace(
                    ['[facilities]', '[operation_time]', '[floor]'],
                    [$f['facilities'], $f['operation_time'], $f['floor']],
                    $this->openingForFoundFacilityStart[$length]
                ) .
                    '! ';
                session(['floor' => $f['floor'], 'facility' => $f['facilities']]);
                break;

            default:
                $length = mt_rand(0, count($this->defaultAnswers) - 1);
                $randomResponse = $this->defaultAnswers[$length];
                break;
        }
        return $randomResponse;
    }
}
