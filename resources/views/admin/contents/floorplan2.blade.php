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
    <style>
        .grid {
            max-width: 900px;
            height: 700px;
            /* margin: 100px auto; */
            display: grid;
            grid-template-columns: repeat(100, 1fr);
            grid-template-rows: repeat(100, 1fr);
            gap: 0px;

            /* background-image: url('third.jpg');
                               
                                background-position: center;
                                background-size:cover; */
            overflow: hidden;
        }

        .cell {
            /* border: 1px solid red; */
            display: grid;
            color: transparent;
            width: 11px;
            height: 8px;
        }

        .cell:hover {
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.3);
            /* Customize the shadow style */
            /* transform: scale(1.1); */
            cursor: pointer;


        }



        .blocked {
            /* border: 0px solid transparent; */
            background-color: #000;

            box-sizing: border-box;
            padding: 0;
            margin: 0;

        }

        .passed {
            /* background-image: url('foot.png'); */
            /* background-repeat: no-repeat; */
            /* background-size: cover; */
            background-color: #11c00b;
        }

        .facility {
            background-color: blue;
            /* color: #f0eded; */
        }
    </style>
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

                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">

                            <div class="dropdown float-end">

                            </div>

                            <div class="row">
                                <div class="col-xl-2">
                                    <h4 class="card-title mb-4">
                                        <i
                                            class="ri-checkbox-blank-circle-fill font-size-10 text-success align-middle me-2"></i>
                                        Floor Plan Layout
                                        <button type="button" class="btn btn-secondary btn-sm text-white"
                                            data-bs-toggle="modal" data-bs-target="#guideModal">Guide</button>
                                        <h6 class="font-size-13">
                                            <div class="input-group d-flex align-items-center text-success">
                                                <select id="floor-selected" class="form-control mt-2">
                                                    {{-- <option value="ground-floor">Ground Floor</option> --}}
                                                    @php
                                                        // for ($i = 0; $i < count($flist)-1; $i++) {
                                                        //     echo "<option value=".$flist[$i].">".$i+1 . ($i == 0 ? "st" : ($i == 1 ? "nd" : ($i == 2 ? "rd" : "th"))) . " Floor</option>";
                                                        // }
                                                        foreach ($flist as $key => $floor) {
                                                            $ordinal = $key == 0 ? 'st' : ($key == 1 ? 'nd' : ($key == 2 ? 'rd' : 'th'));
                                                            echo '<option value=' . $floor . '>' . $floor . '</option>';
                                                        }
                                                    @endphp
                                                </select>
                                            </div>
                                        </h6>

                                    </h4>
                                    <hr>
                                    <div class="tags p-2"
                                        style="border: 1px solid white; max-height:550px;overflow:auto;text-transform:capitalize;">

                                    </div>
                                </div>


                                <div class="col-xl-10">
                                    <div class="table-responsive row align-items-center" id="con">

                                        <div class="col-sm-12 mx-auto mb-2 grid" id="grid-container">
                                            <!-- Points will be dynamically generated here -->
                                        </div>
                                        <button class="btn btn-secondary float-end" id="save-floor">Save Floor
                                            Plan</button>


                                    </div>
                                </div>
                            </div>

                        </div><!-- end card -->
                    </div><!-- end card -->
                </div>
                <!-- end col -->
            </div>
            <!-- end row -->


            <!-- end row -->
        </div>

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

    <script src="https://cdn.jsdelivr.net/npm/interactjs@1.10.10/dist/interact.min.js"></script>
    {{-- custom --}}
    <script>
        var tags = @json($facilities);
        console.log(tags);
        $(document).ready(function() {
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');

            

            // populate tags
            function populateTags() {
                var renderTags = ``
                tags.forEach(tag => {
                    renderTags += `
                                        
                                        <div class="form-check h5 tags-content" style="color:${tag.color}" data-floor="${tag.floor}">
                                            <hr>
                                            <input class="form-check-input p-2" data-tags="${tag.facilities}" data-abbrev="${tag.abbrev}" data-color="${tag.color}" data-id="${tag.id}" type="radio" name="flexRadioDefault"
                                                id="flexRadioDefault2" value="labels">
                                            <i class="fa-solid fa-tags text-success fa-lg"></i>
                                            <label class="form-check-label" for="flexRadioDefault2">
                                                ${tag.facilities}
                                            </label>
                                        </div>`


                });

                $('.tags').html(renderTags)
            }

            populateTags()
            filterFacilitiesByFloor($('#floor-selected').val());

            let highestX = -Infinity; // Start with negative infinity as the initial value
            let highestY = -Infinity;
            // Initialize grid dimensions
            const gridWidth = 100;
            const gridHeight = 100;

            // Create a 2D array to store subcells
            var subcellGrid = new Array(gridWidth);

            // create grid
            function createGridPoints() {
                for (var i = 0; i < gridWidth; i++) {
                    subcellGrid[i] = new Array(gridHeight);
                }

                for (var i = 0; i < gridWidth; i++) {
                    for (var j = 0; j < gridHeight; j++) {
                        subcellGrid[i][j] = [];
                        var cell = $(`<div data-x='${i}' data-y='${j}'>${i}</div>`).addClass("cell");
                        var x = i;
                        var y = j;


                        if (i > highestX) {
                            highestX = i;

                        }

                        if (y > highestY) {
                            highestY = y;
                        }

                        $("#grid-container").append(cell);

                    }


                }
            }

            createGridPoints()
            //render the images 
            var slc = $('#floor-selected').val()
            $('.grid').css({
                'background-image': `url("{{ asset('backend/assets/deployed/${slc}.jpg') }}")`,
                'background-position': 'center',
                'background-size': 'cover'
            })



            // Handle floor selection change
            $('#floor-selected').change(function() {
                var selectedFloor = $(this).val();
                filterFacilitiesByFloor(selectedFloor)
                $('.grid').css({
                    'background-image': `url("{{ asset('backend/assets/deployed/${selectedFloor}.jpg') }}")`,
                    'background-position': 'center',
                    'background-size': 'cover'
                })
                $('#grid-container').empty()
                createGridPoints()
            });


            // $(document).on('dblclick', '.cell', function(){
            //     $(this).removeClass('blocked')
            //     dijkstra(45, 67, parseInt($(this).data('x')),parseInt($(this).data('y')))
            // })

            let isMouseDown = false;



            // Contextmenu event on cell (for right-click)
            $(document).on('contextmenu', '.cell', function(event) {
                event.preventDefault(); // Prevent default right-click context menu
                $(this).css({
                    border: '0px solid #000'
                }).removeClass('blocked facility');
            });



            // Function to update cell on mouse events
            function updateCell(cell, id, label, abbrev, color) {
                let border = '';
                let className = '';

                if (label !== 'wall') {
                    // border = `1px solid ${color}`;
                    className = 'blocked facility';
                } else {
                    // border = '1px solid #000';
                    className = 'blocked'
                    cell.removeClass('facility');
                }



                cell.css({
                        border: border,
                    }).addClass(className)
                    .attr('dat-id', id)
                    .attr('data-label', label)
                    .attr('data-abbrev', abbrev)
                    .attr('data-color', color);
            }

            // Function to handle radio button click
            function handleRadioButtonClick() {
                // Get the value of the selected radio button
                const selectedValue = $('input[name="flexRadioDefault"]:checked').val();
                const label = $('input[name="flexRadioDefault"]:checked').data('tags');
                const abbrev = $('input[name="flexRadioDefault"]:checked').data('abbrev');
                const id = $('input[name="flexRadioDefault"]:checked').data('id');
                const color = $('input[name="flexRadioDefault"]:checked').data('color');

                // Show a message with the selected value
                // alert('Selected Value: ' + selectedValue);

                // Handle different cases based on the selected radio button value
                switch (selectedValue) {
                    case 'labels':
                        // Mouse click event on cell to toggle drawing
                        $(document).on('click', '.cell', function() {
                            isMouseDown = !isMouseDown;
                            if (isMouseDown) {
                                // If drawing is enabled, add the "blocked" class to the clicked cell
                                updateCell($(this), id, label, abbrev, color);
                            }
                        });

                        // Mouse move event on cell (to follow the cursor)
                        $(document).on('mousemove', '.cell', function() {
                            if (isMouseDown) {
                                // Only update the cell if drawing is enabled
                                updateCell($(this), id, label, abbrev, color);
                            }
                        });
                        break;

                    default:
                        // Clear any existing events for other cases
                        $(document).off('click', '.cell');
                        $(document).off('mousemove', '.cell');
                        break;
                }
            }

            function collectGridDetails() {
                const gridPoints = $(".blocked, .facility");


                const gridDetails = [];
                let floor = '';

                gridPoints.each(function() {
                    const rect = this.getBoundingClientRect();
                    const x = parseInt($(this).data("x"), 10);
                    const y = parseInt($(this).data("y"), 10);
                    const isBlock = $(this).hasClass("blocked");
                    const label = $(this).data("label");
                    // const sublabel = $(this).data("sublabel");
                    const abbrev = $(this).data("abbrev");
                    // const door = $(this).data("door");
                    const color = $(this).data("color");
                    const id = $(this).data("id");

                    // static for now
                    floor = $('#floor-selected').val();

                    gridDetails.push({
                        x,
                        y,
                        isBlock,
                        label,
                        abbrev,
                        color,
                        id,
                    });
                });

                return {
                    floor,
                    gridDetails,
                };
            }


            // Button click event to run Dijkstra's Algorithm
            $("#save-floor").on("click", function() {
                //    alert('yes')
                // Call the function to collect data
                var gridDetails = collectGridDetails();
                sendCoordinates(gridDetails);
                // console.log(gridDetails)
            });

            // function to send coordinates to a server
            function sendCoordinates(coordinates){
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
                    },
                    error: function(xhr, status, error) {
                        // Handle any errors that occur during the AJAX request
                        console.error('Error:', status, error);
                    }
                });
            }

            async function filterFacilitiesByFloor(floor) {
                console.log(floor)
                $('.tags-content').fadeOut(300); // Hide all facilities with a fade-out animation
                if (floor === 'ground-floor') {
                    // Show only ground floor facilities
                    $('.tags-content[data-floor="ground-floor"]').fadeIn(300);
                    $('.tags-content[data-floor="all"]').fadeIn(300);
                } else {
                    // Show facilities for the selected floor
                    $('.tags-content[data-floor="' + floor + '"]').fadeIn(300);
                    $('.tags-content[data-floor="all"]').fadeIn(300);
                }

                const response = await fetch('/floorplan-edit', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    body: JSON.stringify({
                        floor: floor,
                    }),

                });
                // const responseData = await response.json();
                // handleResponse(response)
                const responseData = await response.json();
                // console.log(responseData.floorplan[0])
                // createGridPoints(10,14,responseData.floorplan[0].gridDetails)
            }

            // Attach radio button click event
            $('input[type="radio"]').on('click', handleRadioButtonClick);
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
