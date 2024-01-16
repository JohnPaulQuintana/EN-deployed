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
    {{-- <style>
        .col-sm-2:hover{
            transform: translateZ(10px);
        }
       
        .grid-container {
            padding: 10px;
            width: fit-content;
            height: fit-content;
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            grid-template-rows: repeat(14, 1fr);
            background-color: transparent;
            z-index: 1000;
        }
        .grid-point {
            width: 60px;
            height: 60px;
            background-color: transparent;
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            font-size: 14px;
            color: #f3ecec;
            position: relative;
            transition: transform 0.3s ease-in-out;
            transform-style: preserve-3d;
            z-index: 1;
        }

        .grid-point:hover {
            transform: translateZ(10px);
        }

        .blocked {
            color: rgb(253, 253, 253);
            transform: translateZ(20px);
            cursor: pointer;
            font-weight: 700;

        }

        .grid-point.block::after {
            content: attr(data-label);
        }

        .grid-point.passed:not(.targetFacilities):not(.starting-point) {
            background-image: url('{{ asset('backend/assets/images/footmark.png') }}');
            background-position: center;
            background-repeat: no-repeat;
            background-size: 20px 20px;
            transform: rotate(-90deg);
            color: white;

            transition: transform ease-in-out;
        }

        .grid-point.passed.up:not(.targetFacilities):not(.starting-point) {
            transform: rotate(0);
        }

        .grid-point.passed.right:not(.targetFacilities):not(.starting-point) {
            transform: rotate(90deg);
        }

        .grid-point.passed.down:not(.targetFacilities):not(.starting-point) {
            transform: rotate(180deg);
        }

        .targetFacilities {
            color: #252b3b;
            transform: translateZ(20px);
            cursor: pointer;
            text-shadow: 1px 1px 2px rgba(241, 239, 239, 0.8);
            font-weight: 600;
        }
        .subTargetFacilities {
            color: #252b3b;
            transform: translateZ(20px);
            cursor: pointer;
            text-shadow: 1px 1px 2px rgba(235, 225, 225, 0.8);
            font-weight: 600;
        }

    </style> --}}

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
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.795);
            /* Customize the shadow style */
            /* transform: scale(1.1); */
            cursor: pointer;


        }



        .blocked {
            /* border: 0px solid transparent; */
            background-color: #080808fb;

            box-sizing: border-box;
            padding: 0;
            margin: 0;

        }

        .passed {
            /* background-image: url('foot.png'); */
            /* background-repeat: no-repeat; */
            /* background-size: cover; */
            box-shadow: 0 0 10px rgba(28, 5, 238, 0.3);
            /* Customize the shadow style */
            /* transform: scale(1.5); */
            /* position: absolute; */
            /* z-index: 1; */
            background: blue;


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
                <div class="col-xl-12">
                    <div class="card">
                        <div class="card-body">

                            <div class="row mb-2">

                                <div class="col-md-4">
                                    <h4 class="card-title mt-2">
                                        <i
                                            class="ri-checkbox-blank-circle-fill font-size-10 text-success align-middle me-2"></i>
                                        <span class="text-success">Deployed Floor</span>
                                    </h4>

                                </div>

                            </div>

                            <div class="table-responsive row">
                                {{-- all contents --}}

                                <div class="col-xl-2">

                                    <div class="card">
                                        <h5 class="text-center text-success mt-2">Controls</h5>
                                        <select id="target-floor" class="form-control text-center target-floor">
                                            @foreach ($details as $key => $floor)
                                                <option value="{{ $floor->floor }}" data-key="{{ $key }}" data-floor="{{ $floor->floor }}"
                                                    data-f="{{ $floor->floor }}">{{ $floor->floor }}</option>
                                            @endforeach
                                        </select>
                                        <div class="tags p-2 mb-2"
                                            style="max-height:450px;overflow:auto;text-transform:capitalize;">

                                        </div>
                                        <button type="button" class="btn btn-info mb-2" data-bs-toggle="modal"
                                            data-bs-target="#guideModal">User Guide</button>
                                        <button type="button" class="btn btn-success start mb-2">start</button>
                                        <button class="btn btn-secondary" id="save-floor">Save Changes</button>
                                    </div>
                                </div>

                                <div class="col-sm-10 mx-auto mb-2 grid" id="grid-container">
                                    <!-- Points will be dynamically generated here -->
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

    {{-- custom --}}
    <script>
        var detailInServer = @json($details); // Convert PHP array to JavaScript object
        console.log(detailInServer)
        var tags = @json($facilities);
        console.log(tags);
        $(document).ready(function() {

            // populate tags
            function populateTags() {
                var renderTags = ``
                tags.forEach(tag => {
                    renderTags += `
                                        
                                        <div class="form-check h5 tags-content" data-floor="${tag.floor}" style="color:${tag.color}">
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
            filterFacilitiesByFloor($('#target-floor').val());

            //render the images 
            var slc = $('#target-floor').val()
            //render the images 
            $('.grid').css({
                'background-image': `url("{{ asset('backend/assets/deployed/${slc}.jpg') }}")`,
                'background-position': 'center',
                'background-size': 'cover'
            })

            // Handle floor selection change
            $('#target-floor').change(function() {
                var selectedFloor = $(this).val();
                var selectedOption = $(this).find("option:selected");
                var dataKey = selectedOption.data("key");
                // alert(dataId)
                filterFacilitiesByFloor(selectedFloor)
                $('.grid').css({
                    'background-image': `url("{{ asset('backend/assets/deployed/${selectedFloor}.jpg') }}")`,
                    'background-position': 'center',
                    'background-size': 'cover'
                })
                // $('#grid-container').empty()
                createGrid(dataKey)
            });

            let highestX = -Infinity; // Start with negative infinity as the initial value
            let highestY = -Infinity;
            // Initialize grid dimensions
            const gridWidth = 100;
            const gridHeight = 100;

            var subcellCount = 1;
            var topCount = 1;
            var target = {}
            var starting = {}
            var bottomCount = 11; // Initialize bottom count
            function createGrid(key) {

                $("#grid-container").empty()
                // Create a 2D array to store subcells
                var subcellGrid = new Array(gridWidth);
                for (var i = 0; i < gridWidth; i++) {
                    subcellGrid[i] = new Array(gridHeight);
                }

                for (var i = 0; i < gridWidth; i++) {
                    for (var j = 0; j < gridHeight; j++) {
                        subcellGrid[i][j] = [];
                        // Initialize cell outside the inner loop
                        var cell = $(`<div data-x='${i}' data-y='${j}'>${i}</div>`).addClass("cell");


                        // Check the x and y to populate
                        // detailInServer[key].forEach(details => {
                            detailInServer[key].gridDetails.forEach(detail => {
                                // if (detail.floor === floor) {
                                    if (i === parseInt(detail.x) && j === parseInt(detail.y)) {
                                        // Update cell properties based on conditions
                                        if (detail.abbrev !== 'undefined' && detail.abbrev !==
                                            undefined) {
                                            cell.addClass("facility")
                                                .css({
                                                    "backgroundColor": detail.color
                                                })
                                                .attr("data-label", detail.label)
                                                .attr("data-abbrev", detail.abbrev)
                                                .attr("data-color", detail.color)
                                                .append(
                                                    `<i class="fa-solid fa-location-dot fa-2xl fa-bounce" style="color:${detail.color};z-index:1;position:absolute;" data-bs-toggle="tooltip" data-bs-placement="top" title="${detail.label}"></i>`
                                                );
                                        }

                                        if (detail.label === target.l) {
                                            cell.removeClass('blocked facility').addClass('target')
                                                .css({
                                                    "backgroundColor": detail.color
                                                })
                                                .attr("data-label", detail.label)
                                                .attr("data-abbrev", detail.abbrev)
                                                .attr("data-color", detail.color)
                                                .append(
                                                    `<i class="fa-solid fa-location-dot fa-2xl" style="color:blue;z-index:1;position:absolute;" data-bs-toggle="tooltip" data-bs-placement="top" title="${detail.label}"></i>`
                                                );
                                            target = {
                                                x: parseInt(detail.x),
                                                y: parseInt(detail.y),
                                                l: detail.label,
                                            }
                                        }

                                        if (detail.label === "front") {
                                            cell.removeClass('blocked facility').addClass(
                                                    'starting-point')
                                                .css({
                                                    "backgroundColor": detail.color
                                                })
                                                .attr("data-label", detail.label)
                                                .attr("data-abbrev", detail.abbrev)
                                                .attr("data-color", detail.color)
                                                .append(
                                                    `<i class="fa-solid fa-street-view fa-2xl fa-bounce" style="color:${detail.color};z-index:1;position:absolute;" data-bs-toggle="tooltip" data-bs-placement="top" title="${detail.label}"></i>`
                                                );
                                            starting = {
                                                x: parseInt(detail.x),
                                                y: parseInt(detail.y)
                                            }
                                        }

                                        if (detail.label === "male") {
                                            cell.removeClass('blocked facility').addClass(
                                                    'starting-point')
                                                .css({
                                                    "backgroundColor": detail.color
                                                })
                                                .attr("data-label", detail.label)
                                                .attr("data-abbrev", detail.abbrev)
                                                .attr("data-color", detail.color)
                                                .append(
                                                    `<i class="fa-solid fa-person fa-2xl fa-bounce" style="color:${detail.color};z-index:1;position:absolute;" data-bs-toggle="tooltip" data-bs-placement="top" title="${detail.label}"></i>`
                                                );
                                            starting = {
                                                x: parseInt(detail.x),
                                                y: parseInt(detail.y)
                                            }
                                        }

                                        if (detail.label === "female restroom") {
                                            cell.removeClass('blocked facility').addClass(
                                                    'starting-point')
                                                .css({
                                                    "backgroundColor": detail.color
                                                })
                                                .attr("data-label", detail.label)
                                                .attr("data-abbrev", detail.abbrev)
                                                .attr("data-color", detail.color)
                                                .append(
                                                    `<i class="fa-solid fa-person-dress fa-2xl fa-bounce" style="color:${detail.color};z-index:1;position:absolute;" data-bs-toggle="tooltip" data-bs-placement="top" title="${detail.label}"></i>`
                                                );
                                            starting = {
                                                x: parseInt(detail.x),
                                                y: parseInt(detail.y)
                                            }
                                        }

                                        if (detail.label === "stair-in") {
                                            cell.removeClass('blocked facility').addClass(
                                                    'starting-point')
                                                .css({
                                                    "backgroundColor": detail.color
                                                })
                                                .attr("data-label", detail.label)
                                                .attr("data-abbrev", detail.abbrev)
                                                .attr("data-color", detail.color)
                                                .append(
                                                    `<i class="fa-solid fa-signal fa-2xl fa-bounce" style="color:${detail.color};z-index:1;position:absolute;" data-bs-toggle="tooltip" data-bs-placement="top" title="${detail.label}"></i>`
                                                );
                                            starting = {
                                                x: parseInt(detail.x),
                                                y: parseInt(detail.y)
                                            }
                                        }

                                        if (detail.label === "wall") {
                                            cell.addClass('blocked')
                                                .attr("data-label", detail.label)
                                                .attr("data-abbrev", detail.abbrev)
                                                .attr("data-color", detail.color);

                                        }

                                    }
                                // }



                            });
                        // });



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
                    // Increment top and bottom counts for the next row
                    topCount += 10;
                    bottomCount += 10;

                }
            }

            var selectedOptionDef = $('#target-floor').find("option:selected");
            var dataKeyDef = selectedOptionDef.data("key");
                
            createGrid(dataKeyDef)
            // // Highlight the shortest path in the grid
            async function animateShortestPath(grid, shortestPath) {
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
                            await new Promise((resolve) => setTimeout(resolve, 50));

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

            // Function to animate all paths
            async function animateAllPaths(grid, allPaths) {
                for (const path of allPaths) {
                    await animateShortestPath(grid, path);
                    // Optionally, you can add a delay between paths
                    // await new Promise(resolve => setTimeout(resolve, 500));
                }
            }


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

                    // Array to store all paths
                    const allPaths = [];

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

                    // Store the current path in the array of all paths
                    allPaths.push(shortestPath);

                    // Start the animation of all paths
                    await animateAllPaths(grid, allPaths);


                    // // Initialize a flag to track if animation is running
                    // let isAnimationRunning = false;
                    // // Run animation recursively with a delay
                    // async function runAnimation() {
                    //     await animateShortestPath(shortestPath);
                    //     console.log("Animation is complete");

                    //     dijkstra(startingX, startingY, targetX, targetY);
                    // }

                    // // Start the animation
                    // runAnimation();





                } catch (error) {

                }
            }



            $(document).on('click', '.start', function() {
                // alert(target.x)
                $('.cell').removeClass('passed');
                var selectedOption = $('#target-floor').find("option:selected");
                var dataKey = selectedOption.data("key");
                
                createGrid(dataKey)
                dijkstra(starting.x, starting.y, target.x, target.y)

            })

            // $(document).on('dblclick', '.cell', function(){
            //     $(this).removeClass('blocked')
            //     dijkstra(45, 67, parseInt($(this).data('x')),parseInt($(this).data('y')))
            // })

            let isMouseDown = false;



            // Contextmenu event on cell (for right-click)
            $(document).on('contextmenu', '.cell', function(event) {
                event.preventDefault(); // Prevent default right-click context menu
                $(this).empty()
                .removeClass() // Remove all classes
                .removeAttr("style") // Remove inline styles
                .removeAttr("data-label")
                .removeAttr("data-abbrev")
                .removeAttr("data-color")
                $(this).css({
                    border: '0px solid #000'
                }).removeClass('blocked facility');
            });



            // Function to update cell on mouse events
            function updateCell(cell, id, label, abbrev, color) {
                let border = '';
                let className = '';
                cell.empty()
                
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

                    $('.cell').removeClass('passed');
                    
                // var selectedOption = $('#target-floor').find("option:selected");
                // var dataKey = selectedOption.data("key");
                //     createGrid(dataKey)
            }

            // Function to handle radio button click
            function handleRadioButtonClick() {
                $('.cell').removeClass('passed');
                // Clear any existing events for other cases
                // $(document).off('click', '.cell');
                // $(document).off('mousemove', '.cell');
                // Get the value of the selected radio button
                const selectedValue = $('input[name="flexRadioDefault"]:checked').val();
                const label = $('input[name="flexRadioDefault"]:checked').data('tags');
                const abbrev = $('input[name="flexRadioDefault"]:checked').data('abbrev');
                const id = $('input[name="flexRadioDefault"]:checked').data('id');
                const color = $('input[name="flexRadioDefault"]:checked').data('color');

                if (label !== 'wall') {
                    // createGrid()
                    // initialize the target
                    target = {
                        x: parseInt($(this).data('x')),
                        y: parseInt($(this).data('y')),
                        l: label,
                    }
                }
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
                const gridPoints = $(".blocked, .facility, .starting-point, .target");


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
                    floor = $('#target-floor').val();

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
                console.log(gridDetails)
            });

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

                        window.location.reload()
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

        });
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
