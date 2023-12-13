@extends('admin.admin-dashboard')

@section('links')
    <meta charset="utf-8" />
    <title>Dashboard | Exousia Navi</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="csrf-token" content="{{ csrf_token() }}">

    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesdesign" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="{{ asset('backend/assets/images/favicon.ico') }}">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    {{-- toast css --}}
    <link rel="stylesheet" type="text/css" href="{{ asset('backend/assets/libs/toastr/build/toastr.min.css') }}">
    <!-- jquery.vectormap css -->
    <link href="{{ asset('backend/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.css') }}"
        rel="stylesheet" type="text/css" />

    <!-- DataTables -->
    <link href="{{ asset('backend/assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css') }}" rel="stylesheet"
        type="text/css" />

    <!-- Responsive datatable examples -->
    <link href="{{ asset('backend/assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css') }}"
        rel="stylesheet" type="text/css" />

    <!-- Bootstrap Css -->
    <link href="{{ asset('backend/assets/css/bootstrap.min.css') }}" id="bootstrap-style" rel="stylesheet"
        type="text/css" />
    <!-- Icons Css -->
    <link href="{{ asset('backend/assets/css/icons.min.css') }}" rel="stylesheet" type="text/css" />

    <!-- App Css-->
    <link href="{{ asset('backend/assets/css/app.min.css') }}" id="app-style" rel="stylesheet" type="text/css" />

    {{-- edit modal --}}
    <link rel="stylesheet" href="{{ asset('css/editmodal.css') }}">
    <style>
        .col-sm-2:hover{
            transform: translateZ(10px);
        }
        /* Style for the grid container */
        .grid-container {
            padding: 10px;
            width: fit-content;
            /* Adjust the width of the floorplan */
            height: fit-content;
            /* Adjust the height of the floorplan */
            box-shadow: rgba(100, 100, 111, 0.2) 0px 7px 29px 0px;
            /* margin: 50px auto; */
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            /* Adjust the number of columns */
            grid-template-rows: repeat(14, 1fr);
            /* Adjust the number of rows */
            /* gap: 5px; */
            /* Adjust the gap between rooms */
            background-color: transparent;
            /* Background color for the floorplan */
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            /* Add a subtle shadow */
            border-radius: 10px;
            /* Add rounded corners */
            /* perspective: 1000px; */
            /* Create perspective for 3D effect */
            z-index: 1000;
        }

        /* Style for each room (grid point) */
        .grid-point {
            width: 60px;
            height: 60px;
            background-color: transparent;
            /* Light background color for rooms */
            /* border: 0.5px transparent; */

            /* Add borders */
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            /* Specify a common font */
            font-size: 14px;
            /* Adjust font size */
            color: #f3ecec;
            /* Text color */
            position: relative;
            transition: transform 0.3s ease-in-out;
            /* Add smooth transform transition */
            transform-style: preserve-3d;
            /* Preserve 3D effect */
            z-index: 1;
        }

        /* Add 3D effect on hover */
        .grid-point:hover {
            transform: translateZ(10px);
            /* Translate along the Z-axis to create elevation */
            /* box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); */
            /* Add a subtle shadow */
        }

        /* Style for the walls (blocks) */
        .blocked {
            /* background-color: transparent; */
            /* Dark background color for walls */
            /* box-shadow: rgba(10, 10, 10, 0.1) 0px 2px 4px, rgba(0, 0, 0, 0.2) 0px 7px 13px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset; */
            color: rgb(253, 253, 253);
            /* border: 1px solid transparent; */
            transform: translateZ(20px);
            cursor: pointer;
            font-weight: 700;

        }

        .grid-point.block::after {
            content: attr(data-label);
            /* Set the content to the data-label attribute */
        }

        /* Style for animation */
        .grid-point.passed:not(.targetFacilities):not(.starting-point) {
            /* background-color: transparent; */
            background-image: url('{{ asset('backend/assets/images/footmark.png') }}');
            background-position: center;
            background-repeat: no-repeat;
            background-size: 20px 20px;
            /* Width x Height in pixels */
            transform: rotate(-90deg);
            /* Dark green for passed rooms */
            color: white;

            transition: transform ease-in-out;
            /* Apply the rotation animation over 3 seconds opacity: 0; */
            /* Initially hide the background image */
        }

        .grid-point.passed.up:not(.targetFacilities):not(.starting-point) {
            transform: rotate(0);
            /* Rotate the background image 0 degrees*/
        }

        .grid-point.passed.right:not(.targetFacilities):not(.starting-point) {
            transform: rotate(90deg);
            /* Rotate the background image 90 degrees clockwise */
        }

        .grid-point.passed.down:not(.targetFacilities):not(.starting-point) {
            transform: rotate(180deg);
            /* Rotate the background image 90 degrees clockwise */
        }


        /* starting point */
        .starting-point {
            /* background-color: #4434db; */
            /* border: 1px solid rgb(14, 199, 8); */
            /* transform: translateZ(20px); */
            /* Dark background color for walls */
            /* box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 4px, rgba(0, 0, 0, 0.5) 0px 7px 13px -3px, rgba(0, 0, 0, 0.5) 0px -3px 0px inset; */
            /* color: rgb(14, 199, 8); */
        }

        /* starting point */
        .targetFacilities {
            /* border: 0.2px solid rgba(11, 93, 234, 0.384); */
            /* border: 1px solid green; */
            /* Dark background color for walls */
            /* box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 4px, rgba(0, 0, 0, 0.5) 0px 7px 13px -3px, rgba(0, 0, 0, 0.5) 0px -3px 0px inset; */
            color: #252b3b;
            transform: translateZ(20px);
            cursor: pointer;
            text-shadow: 1px 1px 2px rgba(241, 239, 239, 0.8);
            font-weight: 600;
        }
        .subTargetFacilities {
            /* border: 0.2px solid rgba(11, 93, 234, 0.384); */
            /* border: 1px solid green; */
            /* Dark background color for walls */
            /* box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 4px, rgba(0, 0, 0, 0.5) 0px 7px 13px -3px, rgba(0, 0, 0, 0.5) 0px -3px 0px inset; */
            color: #252b3b;
            transform: translateZ(20px);
            cursor: pointer;
            text-shadow: 1px 1px 2px rgba(235, 225, 225, 0.8);
            font-weight: 600;
        }


        .wall {
            /* background-color: rgba(36, 35, 35, 0.1); */
            /* Set the background color for the grid points */
            /* color: transparent; */
            /* width: 15px; */
            /* margin: auto; */
            /* height: 20px; Set the height of each grid point */
            /* display: inline-block; Display the grid points in a row */
            /* margin: 2px; */
            /* box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); */
            /* border: .6px solid transparent; */
            /* background:  transparent; */
            /* Add a border to each grid point */
            /* box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px, rgba(0, 0, 0, 0.3) 0px 1px 3px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset; */
            /* transform: translateZ(10px); */
        }
    </style>

    {{-- floor keys --}}
    <link rel="stylesheet" href="{{ asset('css/floorkeys.css') }}">
@endsection

@section('content')
    <div class="page-content">
        <div class="container-fluid">

            <!-- start page title -->
            <div class="row">
                <div class="col-12">
                    <div class="page-title-box d-sm-flex align-items-center justify-content-between">
                        <h4 class="mb-sm-0">Dashboard</h4>

                        <div class="page-title-right">
                            <ol class="breadcrumb m-0">
                                <li class="breadcrumb-item"><a href="javascript: void(0);">Exousia Navi</a></li>
                                <li class="breadcrumb-item active">Floor Plan Layouts</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">

                <div class="col-xl-3">
                    
                    <div class="card">
                        <h5 class="text-center text-success mt-2">FACILITIES</h5>
                        <div class="card-body" id="keysDisplay">
                         
                        </div>
                    </div>
                </div>

                <div class="col-xl-9">
                    <div class="card">
                        <div class="card-body">

                            <div class="row mb-2">

                                <div class="col-md-4">
                                    <h4 class="card-title mb-4 mt-2">
                                        <i
                                            class="ri-checkbox-blank-circle-fill font-size-10 text-success align-middle me-2"></i>
                                        <span class="text-success">Floor Deployed</span>
                                    </h4>
                                </div>

                                <div class="col-md-4"> <!-- Adjust the column size as needed -->
                                    <select id="target-floor" class="form-control text-center target-floor">
                                        @foreach ($details as $key => $floor)
                                            <option value="{{ $key }}" data-floor="{{ $floor->floor }}" data-f="{{ $floor->floor }}">{{ $floor->floor }}</option>
                                        @endforeach
                                    </select>
                                </div>

                                <div class="col-md-4 text-end"> <!-- Adjust the column size as needed -->
                                    <div class="dropdown">
                                        <a href="#" class="dropdown-toggle arrow-none card-drop"
                                            data-bs-toggle="dropdown" aria-expanded="false">
                                            <i class="mdi mdi-dots-vertical"></i>
                                        </a>
                                        <div class="dropdown-menu dropdown-menu-end">
                                            <a href="{{ route('dashboard') }}" class="dropdown-item">Dashboard</a>
                                            {{-- <a href="javascript:void(0);" class="dropdown-item">Teacher's</a>
                                            <a href="javascript:void(0);" class="dropdown-item">Facilities</a> --}}
                                            <a class="dropdown-item" data-bs-toggle="modal" data-bs-target="#guideModal">User Guide</a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="table-responsive row">
                                {{-- all contents --}}

                                <div class="col-sm-10 mx-auto mb-2 grid-container" id="grid-container">
                                    <!-- Points will be dynamically generated here -->
                                </div>
                                <button class="btn btn-secondary float-end" id="saveChanges">Save Changes</button>
                            </div>
                        </div><!-- end card -->
                    </div><!-- end card -->
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->


            <!-- end row -->
        </div>
        {{-- edit modal --}}
        @include('admin.modal.edit')
        @include('admin.modal.guide')
    </div>
@endsection

@section('scripts')
    <!-- JAVASCRIPT -->

    <script src="{{ asset('backend/assets/libs/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('backend/assets/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('backend/assets/libs/metismenu/metisMenu.min.js') }}"></script>
    <script src="{{ asset('backend/assets/libs/simplebar/simplebar.min.js') }}"></script>
    <script src="{{ asset('backend/assets/libs/node-waves/waves.min.js') }}"></script>


    <!-- apexcharts -->
    {{-- <script src="{{ asset('backend/assets/libs/apexcharts/apexcharts.min.js') }}"></script> --}}

    <!-- jquery.vectormap map -->
    <script src="{{ asset('backend/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js') }}">
    </script>
    <script src="{{ asset('backend/assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-us-merc-en.js') }}">
    </script>

    <!-- Required datatable js -->
    <script src="{{ asset('backend/assets/libs/datatables.net/js/jquery.dataTables.min.js') }}"></script>
    <script src="{{ asset('backend/assets/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js') }}"></script>

    <!-- Responsive examples -->
    <script src="{{ asset('backend/assets/libs/datatables.net-responsive/js/dataTables.responsive.min.js') }}"></script>
    <script src="{{ asset('backend/assets/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js') }}">
    </script>

    {{-- <script src="{{ asset('backend/assets/js/pages/dashboard.init.js') }}"></script> --}}

    <!-- toastr plugin -->
    <script src="{{ asset('backend/assets/libs/toastr/build/toastr.min.js') }}"></script>
    <!-- toastr init -->
    <script src="{{ asset('backend/assets/js/pages/toastr.init.js') }}"></script>
    <!-- App js -->
    <script src="{{ asset('backend/assets/js/app.js') }}"></script>

    {{-- <script src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/js/fontawesome.min.js" integrity="sha512-64O4TSvYybbO2u06YzKDmZfLj/Tcr9+oorWhxzE3yDnmBRf7wvDgQweCzUf5pm2xYTgHMMyk5tW8kWU92JENng==" crossorigin="anonymous" referrerpolicy="no-referrer"></script> --}}

    <script src="https://cdn.jsdelivr.net/npm/interactjs@1.10.10/dist/interact.min.js"></script>
    {{-- custom --}}
    <script>
        $(document).ready(function() {
            //debug modal
            // $('#editModal').modal('show')
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            var detailInServer = @json($details); // Convert PHP array to JavaScript object
            var detailInMaleCr = @json($male); // Convert PHP array to JavaScript object
            var detailInFemaleCr = @json($female); // Convert PHP array to JavaScript object
            // console.log(detailInMaleCr)
            // Now you have access to the details array, you can manipulate and use it
            var serverResponds = detailInServer;
            const gridContainer = $("#grid-container");
            let gridPoints = [];
            let startingPoint;
            let highestX = -Infinity; // Start with negative infinity as the initial value
            let highestY = -Infinity;
            var targetX;
            var targetY;
            // default starting point
            var startingX;
            var startingY;
           
            
            // Function to create and append points to the grid
            // width and hieght is the row and columns
            // x = horizontal, y = vertical line 
            function createGridPoints(target, key) {
                // console.log(target, key)
                var targetFacilities = target;
                var targetSelection = '';
                // var targetX;
                // var targetY;
                // // default starting point
                // var startingX;
                // var startingY;

                gridContainer.empty(); // Clear the existing grid using jQuery
                // console.log(serverResponds[key]['gridDetails'])
                

                serverResponds[key]['gridDetails'].forEach(coordinates => {

                    if (!isNaN(parseInt(coordinates.x)) && parseInt(coordinates.x) > highestX) {
                        highestX = parseInt(coordinates.x);

                    }

                    if (!isNaN(parseInt(coordinates.y)) && parseInt(coordinates.y) > highestY) {
                        highestY = parseInt(coordinates.y);
                    }

                    
                    if (highestX < highestY) {
                        // Set the width and height of gridContainer to fit-content
                        $("#grid-container").css({
                            'width': "fit-content",
                            'height': "fit-content",
                            'grid-template-rows': `repeat(${highestX+1}, 1fr)`,
                            'grid-template-columns': `repeat(${highestY+1}, 1fr)`,
                        });
                    } else {
                        // Set the width and height of gridContainer to fit-content
                        $("#grid-container").css({
                            'width': "fit-content",
                            'height': "fit-content",
                            'grid-template-rows': `repeat(${highestX+1}, 1fr)`,
                            'grid-template-columns': `repeat(${highestY+1}, 1fr)`,
                        });
                    }

                    // console.log(coordinates)
                    const point = $("<div></div>"); // Create a new div element using jQuery
                    point.addClass("grid-point");
                    point.attr('data-bs-toggle', 'tooltip')
                    point.attr('data-bs-placement', 'top')
                    point.attr('title', coordinates.sublabel)
                    point.attr("data-x", parseInt(coordinates.x)); // Set x-coordinate as a data attribute
                    point.attr("data-y", parseInt(coordinates.y)); // Set y-coordinate as a data attribute
                    point.attr("data-door", coordinates.door)
                    point.attr("data-color", coordinates.bgcolor)
                    // css
                    point.css({"background":coordinates.bgcolor})
                    console.log(coordinates.door)
                    // point.attr("data-door", coordinates.door)
                    // point.attr("data-l", coordinates.label !== "wall" ? coordinates.label : '');
                    point.attr("data-l", coordinates.label !== "wall" ? coordinates.label : coordinates.label === "wall" ? "wall" : "");

                    // if(coordinates.label !== "wall" && coordinates.label !== nu){
                    //     point.addClass('blocked')
                    // }
                    point.attr("data-sublabel", coordinates.label !== null ? coordinates.sublabel : '');
                    // point.attr("data-label", coordinates.label !== null ? coordinates.label : '');
                    // point.text(`${parseInt(coordinates.x)},${parseInt(coordinates.y)}`); // Optionally, you can label points with their coordinates
                    // Use a ternary operator to set the text based on coordinates.label
                    // point.text(coordinates.label !== null ? truncateText(coordinates.label, 10) : '');//original
                    point.text(coordinates.label !== null ? coordinates.label : '')
                    gridContainer.append(point); // Append the point to the grid container using jQuery
                    // point.addClass(coordinates.isBlock === 'true' ? 'blocked' : '');
                    if (coordinates.isBlock === 'true' && coordinates.label !== targetFacilities &&
                        coordinates.label !== 'front' && coordinates.label !== 'wall' && coordinates.label !== null) {
                        point.addClass('blocked');
                        targetSelection +=
                            `<option value="${coordinates.label}">${coordinates.label}</option>`
                    } else if (coordinates.label === targetFacilities) {
                        if(coordinates.door === 'true'){
                            point.addClass('targetFacilities');
                            targetX = parseInt(coordinates.x);
                            targetY = parseInt(coordinates.y);
                            targetSelection +=
                                `<option value="${coordinates.label}">${coordinates.label}</option>`
                        
                        }else{
                            point.addClass('subTargetFacilities');
                            point.addClass('blocked')
                        }
                        
                    } else if (coordinates.label === 'front') {
                        startingX = parseInt(coordinates.x);
                        startingY = parseInt(coordinates.y);
                        point.addClass('starting-point');
                        point.text('')
                        point.append(`<i class="fa-solid fa-street-view fa-2xl" style="color:${coordinates.color};"></i>`)


                        // Create the ball element
                        // const ball = $("<div></div>");
                        // ball.addClass("ball");                 
                        // // Append the ball to the grid container
                        // point.append(ball);
                    } else if (coordinates.label === 'wall') {
                        point.addClass('blocked wall').css({'background':'none'})
                        point.text('')
                    
                        // point.append(
                        //     `<i class="fa-regular fa-rectangle-xmark fa-lg" style="color: #511f24;"></i>`
                        //     )
                    }

                    if (detailInMaleCr.includes(coordinates.label)) {
                        // console.log('yes')
                        point.text('')
                        point.append(`<i class="fa-solid fa-person fa-2xl" style="color: #0f56d2;"></i>`)
                    }
                    if (detailInFemaleCr.includes(coordinates.label)) {
                        point.text('')
                        point.append(
                            `<i class="fa-solid fa-person-dress fa-2xl" style="color: #eb05c1;"></i>`)
                    }
                    if (coordinates.label === 'stair-in') {
                        point.text('')
                        point.append(`<i class="fa-solid fa-stairs fa-2xl" style="color: #0f56d2;background:${coordinates.bgcolor}"></i>`)
                    }
                    if (coordinates.label === 'guard') {
                        point.text('')
                        point.append(`<i class="fa-solid fa-person-military-pointing fa-2xl"></i>`)
                    }
                    // console.log(coordinates.label)
                    // Add the point to the gridPoints array
                    gridPoints.push(point);
                    $('#target-selection').html(targetSelection);
                    // starting point x, y  target x,y
                    if (target != 'n/a') {
                        dijkstra(startingX, startingY, targetX, targetY);
                    }

                });

                // Create a new variable to store the filtered gridDetails
                var filteredServerResponds = {};

                // for (var key in serverResponds) {
                    if (serverResponds.hasOwnProperty(key)) {
                        var gridDetails = serverResponds[key]['gridDetails'];

                        // Create a Set to track unique labels
                        var seenLabels = new Set();

                        // Filter duplicates based on the label property within the forEach loop
                        var filteredGridDetails = gridDetails.filter(function (item) {
                            var label = item['label'];

                            // Check if label is non-null and unique
                            if (label !== null && !seenLabels.has(label) && label !== 'wall') {
                                seenLabels.add(label);
                                return true;
                            }
                            return false;
                        });

                        // Create a new object with the filtered gridDetails
                        filteredServerResponds[key] = {
                            ...serverResponds[key],
                            gridDetails: filteredGridDetails,
                        };
                    }
                // }

                // Log the filteredServerResponds variable
                // console.log(filteredServerResponds);
                //populate the keys
                populateKeys(key,filteredServerResponds)
            }

            
            // console.log(getMaleAbbrev)
            // populates the keys
           async function populateKeys(key,filteredServerRespondsData){
                var keysDisplay = ''
                var icons = ''
                var bg = ''
                var iconText = ''

                // const response = await fetch('/facilities-cr', {
                //     method: 'POST',
                //     headers: {
                //         'Content-Type': 'application/json',
                //         'X-CSRF-TOKEN': csrfToken,
                //     },
                //     body: JSON.stringify({
                //         restroom: `restroom`,
                //     }),

                // });
                // // const responseData = await response.json();
                // // handleResponse(response)
                // const responseData = await response.json();
                // console.log(responseData)
                // const male = ['male', 'MR', 'MRX', 'MRN',
                // 'MRF']; // Add more labels as needed for abbrev
                // const female = ['female', 'FR', 'FRU', 'FRF',
                // 'FRZ']; // Add more labels as needed for abbrev
                filteredServerRespondsData[key]['gridDetails'].forEach(data => {
                    // console.log(data)
                    switch (data.label) {
                        
                        case 'front':
                            icons = `<i class="fa-solid fa-street-view fa-2xl"></i>`
                            iconText = `Your Location`
                            bg = data.bgcolor;
                            break;
                        case 'stair-in':
                            icons = `<i class="fa-solid fa-stairs fa-2xl" style="color: #0f56d2;"></i>`
                            iconText = `Stairs`
                            bg = data.bgcolor;
                            break;
                        // case 'stair-in':
                        //     icons = `<i class="fa-solid fa-stairs fa-2xl" style="color: #0f56d2;"></i>`
                        //     iconText = `Stairs`
                        //     break;
                        
                        default:
                            icons = data.label
                            iconText = data.sublabel
                            bg = data.bgcolor;
                            break;
                    }

                    // for rest room
                    if (detailInFemaleCr.female.includes(data.label)) {
                        icons = `<i class="fa-solid fa-person-dress fa-2xl" style="color: #eb05c1;"></i>`
                    }
                    if (detailInMaleCr.male.includes(data.label)) {
                        icons = `<i class="fa-solid fa-person fa-2xl" style="color: #0f56d2;"></i>`
                    }

                    keysDisplay += `
                    <div class="keys mb-2">
                        <i class="ri-checkbox-blank-circle-fill font-size-10 text-success align-middle me-2"></i>
                        <span class="floor-keys text-white" style="background:${bg}">${icons}</span>
                        <span class="floor-mean">${iconText}</span>
                    </div>
                    `
                })

                $('#keysDisplay').html(keysDisplay)
            }

            // Function to truncate text if it exceeds a specified length
            function truncateText(text, maxLength) {
                const withoutSpaces = text.replace(/\s/g, ''); // Remove spaces from the text
                if (withoutSpaces.length > maxLength) {
                    let truncatedText = '';
                    let charCount = 0;
                    for (const char of text) {
                        if (char !== ' ' || charCount < maxLength) {
                            truncatedText += char;
                            if (char !== ' ') {
                                charCount++;
                            }
                        }
                        if (charCount >= maxLength) {
                            break;
                        }
                    }
                    if (charCount < text.length) {
                        // truncatedText += '...'; // Add ellipsis if text is truncated
                    }
                    return truncatedText;
                }
                return text; // Text is within the maxLength limit
            }


            // Call the function to create a 10x10 grid of points
            createGridPoints('cashier', 0);
            // console.log(highestX, highestY)
            // Dijkstra's Algorithm
            async function dijkstra(startX, startY, endX, endY) {
                try {
                    const startNode = document.querySelector(
                        `[data-x="${startX}"][data-y="${startY}"]`
                    );
                    const endNode = document.querySelector(
                        `[data-x="${endX}"][data-y="${endY}"]`
                    );

                    const width = highestX + 1; // Adjust to match the width of the grid
                    const height = highestY + 1; // Adjust to match the height of the grid

                    // Create a 2D array to represent the grid
                    const grid = new Array(height);
                    for (let y = 0; y < height; y++) {
                        grid[y] = new Array(width);
                        for (let x = 0; x < width; x++) {
                            grid[y][x] = document.querySelector(
                                `[data-x="${x}"][data-y="${y}"]`
                            );
                        }
                    }

                    // Helper function to calculate the distance between two grid points
                    function calculateDistance(node1, node2) {
                        const dx = Math.abs(node1.dataset.x - node2.dataset.x);
                        const dy = Math.abs(node1.dataset.y - node2.dataset.y);
                        return Math.sqrt(dx * dx + dy * dy);
                    }

                    // Initialize distance array with Infinity and visited array with false
                    const distances = new Array(height)
                        .fill(null)
                        .map(() => new Array(width).fill(Infinity));
                    const visited = new Array(height)
                        .fill(null)
                        .map(() => new Array(width).fill(false));

                    // Set the distance of the starting point to 0
                    distances[startY][startX] = 0;

                    // Dijkstra's algorithm
                    while (!visited[endY][endX]) {
                        let currentMinDistance = Infinity;
                        let currentX = null;
                        let currentY = null;

                        // Find the unvisited node with the smallest distance
                        for (let y = 0; y < height; y++) {
                            for (let x = 0; x < width; x++) {
                                if (!visited[y][x] && distances[y][x] < currentMinDistance) {
                                    currentMinDistance = distances[y][x];
                                    currentX = x;
                                    currentY = y;
                                }
                            }
                        }

                        // Mark the current node as visited
                        visited[currentY][currentX] = true;

                        // Explore neighbors
                        const neighbors = [{
                                x: currentX - 1,
                                y: currentY
                            },
                            {
                                x: currentX + 1,
                                y: currentY
                            },
                            {
                                x: currentX,
                                y: currentY - 1
                            },
                            {
                                x: currentX,
                                y: currentY + 1
                            },
                        ];

                        for (const neighbor of neighbors) {
                            const {
                                x,
                                y
                            } = neighbor;

                            // Check if the neighbor is within the grid
                            if (x >= 0 && x < width && y >= 0 && y < height) {
                                const neighborNode = grid[y][x];

                                // Check if the neighbor is not a block
                                //working add to if to enabled option path && !neighborNode.classList.contains("passed")
                                if (!neighborNode.classList.contains("blocked")) {
                                    const distanceToNeighbor = calculateDistance(
                                        grid[currentY][currentX],
                                        neighborNode
                                    );

                                    // Update the distance if a shorter path is found
                                    if (
                                        !visited[y][x] &&
                                        distances[currentY][currentX] + distanceToNeighbor <
                                        distances[y][x]
                                    ) {
                                        distances[y][x] =
                                            distances[currentY][currentX] + distanceToNeighbor;
                                    }
                                }
                            }
                        }
                    }

                    // Backtrack to find the shortest path
                    const shortestPath = [];
                    let currentX = endX;
                    let currentY = endY;

                    while (currentX !== startX || currentY !== startY) {
                        shortestPath.unshift({
                            x: currentX,
                            y: currentY
                        });
                        const neighbors = [{
                                x: currentX - 1,
                                y: currentY
                            },
                            {
                                x: currentX + 1,
                                y: currentY
                            },
                            {
                                x: currentX,
                                y: currentY - 1
                            },
                            {
                                x: currentX,
                                y: currentY + 1
                            },
                        ];

                        for (const neighbor of neighbors) {
                            const {
                                x,
                                y
                            } = neighbor;

                            // Check if the neighbor is within the grid
                            if (x >= 0 && x < width && y >= 0 && y < height) {
                                const neighborNode = grid[y][x];
                                const distanceToNeighbor = calculateDistance(
                                    grid[currentY][currentX],
                                    neighborNode
                                );

                                if (
                                    distances[y][x] + distanceToNeighbor ===
                                    distances[currentY][currentX]
                                ) {
                                    currentX = x;
                                    currentY = y;
                                    break;
                                }
                            }
                        }
                    }

                    // Add the starting point to the shortest path
                    shortestPath.unshift({
                        x: startX,
                        y: startY
                    });

                    // Highlight the shortest path in the grid
                    async function animateShortestPath(shortestPath) {
                        return new Promise(async (resolve) => {
                            for (let i = 1; i < shortestPath.length; i++) {

                                const {
                                    x: currentX,
                                    y: currentY
                                } = shortestPath[i - 1];
                                const {
                                    x: nextX,
                                    y: nextY
                                } = shortestPath[i];

                                const node = grid[currentY][currentX];
                                node.classList.add(
                                "passed"); // Highlight the current node as passed

                                // Determine the direction (up or down)
                                let directionClass = "";
                                // if (nextY < currentY) {
                                //     // alert('yes')
                                //     directionClass = "left";
                                // } else {
                                //     directionClass = "up";
                                // }
                                if (nextY < currentY) {
                                    directionClass = "left";
                                } else if (nextY > currentY) {
                                    directionClass = "right";
                                } else if (nextX < currentX) {
                                    directionClass = "up";
                                } else if (nextX > currentX) {
                                    directionClass = "down";
                                }

                                // Check if directionClass is not empty before adding it as a class
                                if (directionClass !== "") {
                                    // Create the ball element with the direction class
                                    // const ball = document.createElement("div");
                                    // ball.classList.add("ball", directionClass);
                                    node.classList.add(directionClass);

                                    // Append the ball to the grid container
                                    // node.append(ball);

                                    // Wait for 200 milliseconds (remove the ball after 200ms)
                                    await new Promise((resolve) => setTimeout(resolve, 400));

                                    // Remove the added class
                                    // node.classList.remove(directionClass);
                                }
                            }
                            // Animation is complete, resolve the promise
                            // resolve();
                        })

                        // Repeat the animation infinitely
                        // animateShortestPath(shortestPath);
                    }
                    // Initialize a flag to track if animation is running
                    let isAnimationRunning = false;
                    // Run animation recursively with a delay
                    async function runAnimation() {
                        await animateShortestPath(shortestPath);
                        console.log("Animation is complete");

                        dijkstra(startingX, startingY, targetX, targetY);
                    }

                    // Start the animation
                    runAnimation();

                } catch (error) {

                }
            }

            // Helper function to add a delay for animation
            function sleep(ms) {
                return new Promise((resolve) => setTimeout(resolve, ms));
            }

            //floor change
            $(document).on("change", "#target-floor", function() {
                const selectedFloorKey = parseInt($(this).val());
                // alert(selectedFloorKey)
                const gridContainer = $("#grid-container");
                // Clear the grid points and reset variables
                gridContainer.empty();
                gridPoints = [];
                highestX = -Infinity;
                highestY = -Infinity;
                createGridPoints('n/a', selectedFloorKey);
            })

            // Use event delegation to handle clicks on elements with classes "blocked" or "targetFacilities"
            $(document).on('click', '.blocked, .targetFacilities', function() {
                // Inside this function, 'this' refers to the clicked element
                if (!$(this).hasClass('wall')) {
                    var clickedElement = $(this).data('l');
                    const selectedFloorKey = parseInt($("#target-floor").val());
                    const gridContainer = $("#grid-container");
                    // Clear the grid points and reset variables
                    gridContainer.empty();
                    gridPoints = [];
                    highestX = -Infinity;
                    highestY = -Infinity;
                    createGridPoints(clickedElement, selectedFloorKey);
                    // alert(clickedElement);
                }
            });

            //handle right click events
            $(document).on('contextmenu', '.grid-point', async function(e) {
                e.preventDefault();
                const gridPoint = $(this);

                if (!gridPoint.hasClass('blocked')) {
                    gridPoint.addClass('blocked')
                }
                // alert($(this).data("l"))
                const l = $(this).data("l")
                const tf = $('#target-floor').val()

                // alert(serverResponds[tf].floor)
                const response = await fetch('/facilities-edit', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    body: JSON.stringify({
                        abbrev: `${l}`,
                        floor: serverResponds[tf].floor,
                    }),

                });
                // const responseData = await response.json();
                // handleResponse(response)
                const responseData = await response.json();
                // console.log(responseData)
                var fc = ''
                var w = ''
                responseData.fac.forEach(data => {
                    fc += `
                        <div class="col-sm-2 p-2">
                            <div class="card edit-col">
                                
                                <h5 class="card-title" data-door="true" data-color="${data.color}" data-sublabel="${data.facilities}" 
                                    data-bs-toggle="tooltip" data-bs-placement="top" title="${data.facilities}" style="background:${data.color}; padding:10px; cursor:pointer;text-align:center;"
                                    data-bs-toggle="tooltip" data-bs-placement="top" title="${data.facilities}">
                                    ${data.abbrev !== undefined ? data.abbrev : data.facilities}
                                </h5>
                               
                            </div>
                        </div>
                        `
                });
                // fc += `
                //         <div class="col-sm-2 p-2">
                //             <div class="card edit-col">
                               
                //                 <h5 class="card-title border wall ct" data-door="true" data-color="${data.color}" data-sublabel="stair-in" data-bs-toggle="tooltip" data-bs-placement="top" title="Stairs">Stair</h5>
                               
                //             </div>
                //         </div>
                // `
                // fc += `<div class="col-sm-2 p-2">
                //             <div class="card edit-col">
                               
                //                 <h5 class="card-title border wall cw" data-door="true" data-color="${data.color}" data-sublabel="wall" data-bs-toggle="tooltip" data-bs-placement="top" title="wall block path">wall</h5>
                               
                //             </div>
                //         </div>`

                $('.editing-fac').html(fc)
                $('#editModal').modal({
                    backdrop: 'static'
                });

                $('#editModal').modal('show')

                // Unbind click event handlers before binding again
                $('.editing-fac').off('click', '.card');
                $('#editModal').off('click', '.remove-facility');
                $('#editModal').off('click', '.exit-edit');

                // Triggered when a card inside the modal is clicked
                $('.editing-fac').on('click', '.card', function() {
                    // Get the value of the clicked content
                    const clickedValue = $(this).find('.card-title').text();
                    // Get the value of the data-sublabel attribute
                    const sublabelValue = $(this).find('.card-title').data('sublabel');
                    const floor = $(this).find('.card-title').data('floor');
                    const bgcolor = $(this).find('.card-title').data('color');
                    // Update the data-l attribute value of the original grid point
                    
                    if(sublabelValue == 'wall'){
                        // alert('yes')
                        gridPoint.text('');
                        gridPoint.attr("data-l", clickedValue);
                        gridPoint.attr("data-sublabel", '')
                        gridPoint.attr("data-floor", floor)
                       
                        // gridPoint.attr("data-sublabel", sublabelValue)
                        gridPoint.addClass('wall')
                        gridPoint.append(`<i class="fa-regular fa-rectangle-xmark fa-lg" style="color: #511f24;"></i>`)
                    }else{
                        gridPoint.attr("data-color",bgcolor )
                        gridPoint.attr("data-door", 'true' )
                        gridPoint.css({"background": bgcolor} )
                        gridPoint.addClass('blocked')
                        gridPoint.removeClass('wall')
                        gridPoint.attr("data-l", clickedValue);
                        gridPoint.attr("data-sublabel", sublabelValue)
                        gridPoint.attr("data-floor", floor)
                        // Optionally, update the visual representation of the grid point with the new value
                        // Replace this with your code to update the visual representation
                        gridPoint.text(clickedValue);
                    }
                    

                    
                    // Close the modal
                    $('#editModal').modal('hide');
                });

                //remove facilities
                $('#editModal').on('click', '.remove-facility', function() {
                    // Identify the facility element you want to remove and remove it
                    gridPoint.text('')
                    gridPoint.removeAttr('data-sublabel');
                    gridPoint.removeAttr('data-floor');
                    gridPoint.removeAttr('data-door');
                    gridPoint.removeAttr('data-bgcolor');
                    gridPoint.css({'background':'none'})
                    gridPoint.removeClass('blocked')
                    gridPoint.removeClass('wall')
                    gridPoint.removeAttr('data-l');
                     // Close the modal
                     $('#editModal').modal('hide');
                    // facilityToRemove.removeClass('blocked')
                    // facilityToRemove.remove();
                });

                //exit edit
                $('#editModal').on('click', '.exit-edit', function() {
                    $('#editModal').modal('hide');
                    $('.editing-fac').html('')
                    gridPoint.removeClass('blocked')
                })


            })

            function collectGridDetails() {
                const gridPoints = document.querySelectorAll(".grid-point");
                const gridContainer = document.getElementById("grid-container"); // Get the grid container
                const computedStyle = getComputedStyle(gridContainer);
                const gridColumnCount = parseInt(computedStyle.getPropertyValue("grid-template-columns").split(" ")
                    .length);
                const gridRowCount = parseInt(computedStyle.getPropertyValue("grid-template-rows").split(" ")
                    .length);
                const gridSize = gridColumnCount * gridRowCount;
                const gridDetails = [];
                let floor = '';
                gridPoints.forEach((gridPoint) => {
                    const rect = gridPoint.getBoundingClientRect();
                    const x = parseInt(gridPoint.dataset.x, 10);
                    const y = parseInt(gridPoint.dataset.y, 10);
                    const width = rect.width;
                    const height = rect.height;
                    const row = y + 1; // Add 1 to convert from 0-based index to 1-based
                    const column = x + 1; // Add 1 to convert from 0-based index to 1-based
                    const isBlock = gridPoint.classList.contains("blocked");
                    console.log(isBlock)
                    const label = gridPoint.getAttribute("data-l"); //abbrev
                    const sublabel = gridPoint.getAttribute("data-sublabel"); //meaning
                    const abbrev = gridPoint.getAttribute("data-abbrev");
                    const fl = gridPoint.getAttribute("data-floor");
                    const door = gridPoint.getAttribute("data-door");
                    const bgcolor = gridPoint.getAttribute("data-color");
                    console.log(sublabel)
                    // static for now
                     // Get the selected option on page load
                    const selectedOption = $('.target-floor').find('option:selected');
                    // Get the value of the data-floor attribute from the selected option
                    floor = selectedOption.data('floor');

                    gridDetails.push({
                        x,
                        y,
                        width,
                        height,
                        row,
                        column,
                        isBlock,
                        label,
                        sublabel,
                        abbrev,
                        door,
                        bgcolor,
                    });
                });

                return {
                    floor,
                    gridSize,
                    gridDetails,
                };
            }

            // function to send coordinates to a server
            function sendCoordinates(coordinates) {
                // Get the CSRF token from the meta tag
                var csrfToken = $('meta[name="csrf-token"]').attr('content');
                $.ajax({
                    url: '/building-layouts/coordinates', // Replace with your server endpoint URL
                    method: 'POST', // Use POST or other HTTP method as needed
                    data: {
                        gridDetails: coordinates
                    },
                    headers: {
                        'X-CSRF-TOKEN': csrfToken // Include the CSRF token in the headers
                    },
                    success: function(response) {
                        // Handle the server's response here
                        console.log('Data sent successfully:', response);
                        toastr.options = {
                            "closeButton": false,
                            "debug": false,
                            "newestOnTop": false,
                            "progressBar": false,
                            "positionClass": "toast-top-right",
                            "preventDuplicates": false,
                            "onclick": null,
                            "showDuration": 300,
                            "hideDuration": 1000,
                            "timeOut": 5000,
                            "extendedTimeOut": 1000,
                            "showEasing": "swing",
                            "hideEasing": "linear",
                            "showMethod": "fadeIn",
                            "hideMethod": "fadeOut"
                        };
                        toastr['success']('Your Floor Plan is ready to used!');

                        setTimeout(() => {
                            location.reload();
                        }, 2000);
                        
                        
                    },
                    error: function(xhr, status, error) {
                        // Handle any errors that occur during the AJAX request
                        console.error('Error:', status, error);
                    }
                });
            }

            //save changes
            $(document).on('click', '#saveChanges', function() {
                var gridDetails = collectGridDetails();
                console.log(gridDetails)
                sendCoordinates(gridDetails);
            })

        })
    </script>

    {{-- // notification --}}
    @if (session()->has('notification'))
        <script>
            $(document).ready(function() {
                // Set Toastr options
                toastr.options = {
                    "closeButton": false,
                    "debug": false,
                    "newestOnTop": false,
                    "progressBar": false,
                    "positionClass": "toast-top-right",
                    "preventDuplicates": false,
                    "onclick": null,
                    "showDuration": 300,
                    "hideDuration": 1000,
                    "timeOut": 5000,
                    "extendedTimeOut": 1000,
                    "showEasing": "swing",
                    "hideEasing": "linear",
                    "showMethod": "fadeIn",
                    "hideMethod": "fadeOut"
                };
                var notificationJson = {!! json_encode(session('notification')) !!};
                var notification = JSON.parse(notificationJson);
                console.log(notification)
                toastr[notification.status](notification.message);
            });
        </script>
    @endif
@endsection
