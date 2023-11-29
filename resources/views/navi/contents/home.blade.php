@extends('navi.index')

@section('links')
    <meta name="csrf-token" content="{{ csrf_token() }}"> <!-- Add this line -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/toastr.js/2.1.4/toastr.min.css"
        integrity="sha512-6S2HWzVFxruDlZxI3sXOZZ4/eJ8AcxkQH1+JjSe/ONCEqR9L4Ysq5JdT5ipqtzU7WHalNwzwBv+iE51gNHJNqQ=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />
    <link rel="stylesheet" href="{{ asset('css/svg-style.css') }}">
    <link rel="stylesheet" href="{{ asset('css/style.css') }}">

    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css"
        integrity="sha512-z3gLpd7yknf1YoNbCzqRKc4qyor8gaKU1qmn+CShxbuBusANI9QpRohGBreCFkKxLhei6S9CQXFEbbKuqLg0DA=="
        crossorigin="anonymous" referrerpolicy="no-referrer" />

    <!-- App favicon -->
    {{-- <link rel="shortcut icon" href="{{ asset('backend/assets/images/favicon.ico') }}"> --}}

    {{-- toast css --}}
    {{-- <link rel="stylesheet" type="text/css" href="{{ asset('backend/assets/libs/toastr/build/toastr.min.css') }}"> --}}

    <!-- Bootstrap Css -->
    {{-- <link href="{{ asset('backend/assets/css/bootstrap.min.css') }}" id="bootstrap-style" rel="stylesheet" --}}
    {{-- type="text/css" /> --}}
    <!-- Icons Css -->
    <link href="{{ asset('backend/assets/css/icons.min.css') }}" rel="stylesheet" type="text/css" />
    {{-- loader css --}}
    <link rel="stylesheet" href="{{ asset('css/loader.css') }}">

    {{-- new navigation --}}
    <link rel="stylesheet" href="{{ asset('css/navigation.css') }}">
    {{-- navigation style --}}
    <style>
        /* Set the max-width to fit-content for the modal dialog */
        .modal-dialog,
        .card {
            max-width: fit-content;
            color: #fff;

        }

        .card-body {
            width: fit-content;
        }

        /* Add a background and box-shadow to the modal content */
        .modal-content,
        .card {
            width: fit-content;
            background: rgba(37, 43, 59, 0.7);
            box-shadow: rgba(37, 43, 59, 0.2) 0px 7px 29px 0px;
            /* Box shadow */
        }

        /* Position the close button on the right side of the modal header */
        .modal-header .btn-close {
            ms-auto;
            /* Push the button to the right */
        }

        /* Style for the grid container */
        .grid-container {
            padding: 10px;
            /* width: fit-content; */
            /* Adjust the width of the floorplan */
            height: fit-content;
            /* Adjust the height of the floorplan */
            box-shadow: rgba(37, 43, 59, 0.2) 0px 7px 29px 0px;
            /* margin: 50px auto; */
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            /* Adjust the number of columns */
            grid-template-rows: repeat(4, 1fr);
            /* Adjust the number of rows */
            gap: 5px;
            /* Adjust the gap between rooms */
            background-color: transparent;
            background-clip: border-box;
            border: 0 solid #2d3448;
            /* Background color for the floorplan */
            /* box-shadow: 0 0 10px rgba(0, 0, 0, 0.3); */
            /* Add a subtle shadow */
            border-radius: 10px;
            /* Add rounded corners */
            perspective: 1000px;
            /* Create perspective for 3D effect */
            z-index: 1000;
        }

        /* Style for each room (grid point) */
        .grid-point {
            width: 70px;
            height: 70px;
            background-color: transparent;
            /* Light background color for rooms */
            border: 0.5px transparent;
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
            box-shadow: rgba(10, 10, 10, 0.1) 0px 2px 4px, rgba(0, 0, 0, 0.5) 0px 7px 13px -3px, rgba(0, 0, 0, 0.5) 0px -3px 0px inset;
            color: rgb(150, 189, 139);
            font-size: 14pt;
            font-weight: 700;
            border: 1px solid transparent;
            transform: translateZ(20px);
            cursor: pointer;
        }

        .grid-point.block::after {
            content: attr(data-label);
            /* Set the content to the data-label attribute */
        }

        /* Style for animation */
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
            Apply the rotation animation over 3 seconds opacity: 0;
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

        /* Style for animation */
        /* .grid-point.passed {
                                                        background-color: transparent;
                                                       
                                                        color: white;
                                                        border: none;
                                                        animation: animatePath 4s linear infinite;
                                                        
                                                    } */

        /* starting point */
        .starting-point {
            border: 1px solid rgb(11, 93, 234);
            transform: translateZ(20px);
            /* Dark background color for walls */
            box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 4px, rgba(0, 0, 0, 0.5) 0px 7px 13px -3px, rgba(0, 0, 0, 0.5) 0px -3px 0px inset;
            color: rgb(11, 93, 234);
        }

        /* starting point */
        .targetFacilities {
            border: 1px solid rgb(11, 93, 234);
            /* border: 1px solid green; */
            /* Dark background color for walls */
            box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 4px, rgba(0, 0, 0, 0.5) 0px 7px 13px -3px, rgba(0, 0, 0, 0.5) 0px -3px 0px inset;
            color: rgb(11, 93, 234);
            transform: translateZ(20px);
            cursor: pointer;
            text-shadow: 2px 2px 3px rgba(7, 7, 7, 0.8);
            font-weight: 600;
        }

        .wall {
            background-color: transparent;
            /* Set the background color for the grid points */
            box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1);
            border: .6px solid transparent;
            /* Add a border to each grid point */
            /* box-shadow: rgba(0, 0, 0, 0.1) 0px 1px 2px, rgba(0, 0, 0, 0.3) 0px 1px 3px -3px, rgba(0, 0, 0, 0.2) 0px -3px 0px inset; */
            transform: translateZ(10px);

        }

        /* Define the animation */
        @keyframes animatePath {
            0% {
                border: none;
                color: #06df59;
                /* background-color: green; */
                /* transform: translateZ(2px); Translate along the Z-axis to create elevation */
                /* box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); */
                /* Add a subtle shadow */
            }

            25% {
                /* background-color: rgb(11, 196, 66); */
                /* transform: translateZ(20px); Translate along the Z-axis to create elevation */
                /* box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); */
                /* Add a subtle shadow */
            }

            50% {
                /* background-color: rgb(15, 226, 61); */
                /* transform: translateZ(5px); Translate along the Z-axis to create elevation */
                /* box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); */
                /* Add a subtle shadow */
            }

            75% {
                /* background-color: rgb(32, 88, 209); */
                /* transform: translateZ(15px); Translate along the Z-axis to create elevation */
                /* box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); */
                /* Add a subtle shadow */
            }

            100% {
                /* background-color: green; */
                /* transform: translateZ(10px); Translate along the Z-axis to create elevation */
                /* box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.3); */
                /* Add a subtle shadow */
            }
        }
    </style>

    {{-- updating system --}}
    <link rel="stylesheet" href="{{ asset('css/updating.css') }}">

    {{-- popup answer --}}
    <link rel="stylesheet" href="{{ asset('css/answer.css') }}">

    {{-- browsing --}}
    <link rel="stylesheet" href="{{ asset('css/browsing.css') }}">

    {{-- info --}}
    <link rel="stylesheet" href="{{ asset('css/info.css') }}">

    {{-- frequently ask --}}
    <link rel="stylesheet" href="{{ asset('css/frequently.css') }}">

    {{-- search modal --}}
    <link rel="stylesheet" href="{{ asset('css/search.css') }}">

    {{-- abbrev css --}}
    <link rel="stylesheet" href="{{ asset('css/abbrev.css') }}">

    {{-- designated teacher --}}
    <link rel="stylesheet" href="{{ asset('css/designatedTeacher.css') }}">

    {{-- continuation for teacher location --}}
    <link rel="stylesheet" href="{{ asset('css/teacher-location.css') }}">

    {{-- hymn --}}
    <link rel="stylesheet" href="{{ asset('css/mv.css') }}">

@endsection

@section('contents')
    <div class="version">
        <span>Epcst-v1.0.1</span>
    </div>

    <header>
        <div class="en"><b>E-N</b></div>
    </header>

    <div class="" id="con-circle">
        @include('navi.contents.resources.circle-core')
    </div>

    {{-- svg icons on right --}}
    <main>
        @include('navi.contents.resources.main-icons')
    </main>

    @php
        if (isset($systems[1])) {
            $auth = $systems[1]->status;
            if ($auth) {
                $className = '';
            } else {
                $className = 'hidden';
            }
        }
    @endphp
    {{-- input --}}
    <main-form id="in">
        @include('navi.contents.resources.input')
    </main-form>

    <section>
        <!-- frrequently ask -->
        @include('navi.contents.popups.frequently')
        <!-- Designated -->
        @include('navi.contents.popups.designated')

        <!-- location popups -->
        {{-- @include('navi.contents.popups.location') --}}

        {{-- updated navigation --}}
        @include('navi.contents.popups.navigation')

        <!-- updating systems popups -->
        @include('navi.contents.popups.updates')

        <!-- waiting for answer systems popups -->
        @include('navi.contents.popups.continuation')

        <!-- waiting for answer systems popups for teachers-->
        @include('navi.contents.popups.teacher-location')

        <!-- searching popups options-->
        @include('navi.contents.popups.options')

        <!-- searching popups info -->
        @include('navi.contents.popups.information')

        <!-- waiting for answer systems popups for speech recognition -->
        @include('navi.contents.popups.answer')

        {{-- new search popups --}}
        @include('navi.contents.popups.search-popups')

        {{-- abbrev --}}
        @include('navi.contents.popups.abbrev')

        {{-- designated --}}
        @include('navi.contents.popups.designatedTeacher')

        {{-- Eastwoods Hymn --}}
        @include('navi.contents.popups.hymn')
        {{-- Eastwoods mv --}}
        @include('navi.contents.popups.mv')

    </section>

    <footer>
        <span>Capstone2</span>
    </footer>

    <!-- Modal -->
    {{-- <div id="AssistantModal" class="modal">
        <div class="modal-content">
            <span class="close">&times;</span>
            <div class="py-12">
                <div class="max-w-7xl mx-auto sm:px-6 lg:px-8">
                    <div class="bg-white dark:bg-gray-800 overflow-hidden shadow-sm sm:rounded-lg">
                        <div class="p-6 text-gray-900 dark:text-gray-100" id="reader">

                            <!-- <h1>Place your QR Code in here!</h1>
                            <div id="reader" class="card" style="width: 500px;">

                            </div> -->
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div> --}}
@endsection

@section('scripts')
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous">
    </script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.7.0/jquery.min.js"
        integrity="sha512-3gJwYpMe3QewGELv8k/BX9vcqhryRdzRMxVfq6ngyWXwo03GFEzjsUm8Q7RZcHPHksttq7/GFoxjCVUjkjvPdw=="
        crossorigin="anonymous" referrerpolicy="no-referrer"></script>
    <script src="{{ asset('js/events.js') }}"></script>
    {{-- <script src="{{ asset('js/home.js') }}"></script> --}}

    {{-- pusher events --}}
    <script src="{{ asset('js/pusher.min.js') }}"></script>
    <script src="https://unpkg.com/boxicons@2.1.4/dist/boxicons.js"></script>
    <script src="https://cdn.lordicon.com/lordicon.js"></script>

    <!-- materialdesign icon js-->
    {{-- <script src="{{ asset('backend/assets/js/pages/materialdesign.init.js') }}"></script> --}}
    @if (session('message'))
        <script>
            var message = @json(session('message'));
            // const initialUtterance = new SpeechSynthesisUtterance(message);
            // const synth = window.speechSynthesis;
            // synth.speak(initialUtterance);
        </script>
    @endif

    {{-- handle events --}}
    <script>
        $(document).ready(function() {

            // debug
            // $('#navigationPopup').css({"display":'flex'});
            // $('#abbrevPopup').css({"display":'flex'});
            // $('#designatedPopup').css({'display':'flex'})
            // $('#popup-continuation').css({'display':'flex'})
            // $('#popup-continuation-teacher').css({'display':'flex'})
            const csrfToken = document.querySelector('meta[name="csrf-token"]').getAttribute('content');
            const form = $('form');
            const chatContainer = $('#chat_container');
            let circle = $('.circle');
            let searchCirlce = $('.search-circle')
            const afterElement = $('<div></div>');
            const en = $('header');
            const conC = $('#con-circle');
            const conT = $('#title');
            const location = $('#popuplocation');
            const input = $('#input')
            const subBTN = $(`box-icon[name='up-arrow-square']`)
            const search2Pops = $('#searchModal')
            const popConti = $('#popup-continuation')
            var boxes = $('.box');
            let currentUtterance = null; // Store the current utterance
            let loadInterval;
            let updates = localStorage.getItem('updates') || false;
            let abbrevDatas = []
            let abbrevMeans = []
            const abbrevPeriodicTable = $('.abbrev-periodic-table')
            // Enable pusher logging - don't include this in production
            Pusher.logToConsole = true;

            var pusher = new Pusher('4ef07d09e997c8b8f24b', {
                cluster: 'ap1'
            });

            var channel = pusher.subscribe('update-system');
            channel.bind('initialize-updates', function(data) {
                // Parse the JSON data
                // var eventData = JSON.parse(data);
                console.log(data.message)
                var message = data.message
                input.hide();
                subBTN.hide();
                startToSpeak(message)
                    .then((finished) => {
                        if (finished) {
                            // Speech finished
                            console.log(finished)
                            $('#overlay-updates').toggleClass('active');
                            $('#popup').toggleClass('active');
                            // Call the animateCube function to start the animation
                            animateCube();

                            setTimeout(() => {
                                // Display the overlay and popup
                                $('#overlay-updates').removeClass('active');
                                $('#popup').removeClass('active');
                                // Refresh the page
                                var currentURL = window.location.href;
                                window.location.href = currentURL;
                                localStorage.setItem('updates', true);
                            }, 20000);

                        } else {
                            console.log('not fineshed')

                            // Speech synthesis not supported
                            // Handle accordingly
                        }
                    });
            });

            //auto fullscreen
            // function toggleFullscreen() {
            // // Check if the browser supports the Fullscreen API
            //     if (document.fullscreenEnabled) {
            //         // Toggle fullscreen mode
            //         if (!document.fullscreenElement) {
            //         document.documentElement.requestFullscreen();
            //         } else {
            //         document.exitFullscreen();
            //         }
            //     } else {
            //         console.log("Fullscreen not supported by this browser.");
            //     }
            // }

            // // Automatically trigger fullscreen when the page loads
            // window.onload = function() {
            // toggleFullscreen();
            // };
            // loader
            $('.loader').hide()
            const handleSubmit = async (e) => {
                e.preventDefault();
                // hide input
                input.hide()
                subBTN.hide()
                const data = new FormData(form[0]);
                // to clear the textarea input
                form[0].reset();
                // to focus scroll to the bottom
                chatContainer.scrollTop(chatContainer[0].scrollHeight);
                // const localData = localStorage.getItem('data') || [];
                // console.log(localData)
                const response = await fetch('/navi/process', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    body: JSON.stringify({
                        prompt: `${data.get('prompt')}`.toLowerCase()
                    }),

                });

                // Clear the loading indicator
                clearInterval(loadInterval);
                console.log(response)
                handleResponse(response)
            };

            form.on('submit', handleSubmit);

            $(document).on('click', '#submit-button', function(e) {
                handleSubmit(e);
                var blur = $('#popupask');
                blur.removeClass('active');
            })

            form.on('keyup', (e) => {
                if (e.keyCode === 13) {
                    handleSubmit(e);
                    var blur = $('#popupask');
                    blur.removeClass('active');
                }
            });

            // frequently ask
            $(document).on('click', '#frequently-question', async function() {
                var q = $(this).data('id')
                console.log(q)
                const response = await fetch('/navi/process', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    body: JSON.stringify({
                        prompt: `${q}`,
                    }),

                });
                // const responseData = await response.json();
                handleResponse(response)
            })

            // answer by yes or no
            $(document).on('click', '.answerbtn', async function() {
                var a = $(this).data('value')
                const response = await fetch('/navi/process', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    body: JSON.stringify({
                        prompt: `${a}`,
                    }),

                });
                // $('#overlay-updates').toggleClass('active');\
                $('#popup-continuation-teacher').fadeOut(400);
                $('#popup-continuation').fadeOut(400)
                // const responseData = await response.json();
                handleResponse(response)
            })
            // answer by yes or no for teachers
            $(document).on('click', '.answerbtnT', async function() {
                var a = $(this).data('value')
                const response = await fetch('/navi/process', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    body: JSON.stringify({
                        prompt: `${a}`,
                    }),

                });
                $('#overlay-updates').removeClass('active');
                $('#popup-continuation').fadeOut(400)

                $('#popup-continuation-teacher').fadeOut(400);
                // const responseData = await response.json();
                handleResponse(response)
            })

            // svg clicked handler
            $(document).on('click', 'svg', function() {
                var svg = $(this).data('id')
                console.log(svg)
                switch (svg) {
                    // frequently ask
                    case 'ask':
                        $('#popup-ask').toggleClass('active');
                        $('#popup-searching').removeClass('active');
                        break;
                        // browsing
                    case 'search':
                        $('#popup-ask').removeClass('active');
                        $('#popup-searching').toggleClass('active');
                        break;
                    case 'search2':
                        $('#popup-ask').removeClass('active');

                        boxes.show(); // Ensure boxes are visible before fading in
                        // searchCirlce.toggleClass('circle-after')
                        stopSpeaking()
                        startToSpeak(
                            'Hello There. These are the available options that you can choose. Just Pressed what your looking for.'
                            )

                        search2Pops.css({
                            'display': 'flex'
                        }).hide().fadeIn(200);
                        // modal.style.display = 'flex';
                        break;
                    case 'speech':
                        if ($(this).hasClass('disabled')) {
                            var mess =
                                "We apologize, but our speech recognition service is currently temporary unavailable. The icons have been highlighted in red to indicate this issue. Please try again at a later time. Thank you for your understanding.";
                            startToSpeak(mess)
                                .then((finished) => {
                                    if (finished) {
                                        // Speech finished
                                        console.log(finished)
                                    }
                                });
                        } else {
                            var mess =
                                "Speak Recognition Initialized!. What can i do for you?";
                            const recognition = new webkitSpeechRecognition() || new SpeechRecognition();
                            recognition.continuous = true;
                            // recognition.interimResults = true;
                            // recognition.maxAlternatives = 5;

                            let isListening = false;

                            function wishMe() {
                                var day = new Date();
                                var hour = day.getHours();

                                if (hour >= 0 && hour < 12) {
                                    startToSpeak("Good Morning..." + mess)
                                        .then((s) => {
                                            if (s) {
                                                console.log('done speaking...')
                                                recognition.start();
                                            }
                                        })
                                } else if (hour > 12 && hour < 17) {
                                    startToSpeak("Good Afternoon..." + mess)
                                        .then((s) => {
                                            if (s) {
                                                console.log('done speaking...')
                                                recognition.start();
                                            }
                                        })
                                } else {
                                    startToSpeak("Good Evening..." + mess)
                                        .then((s) => {
                                            if (s) {
                                                console.log('done speaking...')
                                                recognition.start();
                                            }
                                        })
                                }
                            }

                            wishMe();

                            recognition.onresult = function(event) {
                                const currentIndex = event.resultIndex;
                                const transcript = event.results[currentIndex][0].transcript;
                                // console.log(transcript);//we need to display the text to input later with modal show
                                // if (!isListening) {
                                // recognition.stop(); // Stop recognition if not listening
                                takeCommand(transcript.toLowerCase());
                                // }
                            };

                            recognition.onspeechstart = () => {
                                console.log("Speech has been detected");
                                isListening = true;
                            };

                            recognition.onspeechend = () => {
                                console.log("Speech has stopped being detected");
                                isListening = false;
                            };

                            async function takeCommand(message) {
                                try {
                                    console.log(message);
                                    $('#popup-continuation-speech').removeClass('active');
                                    if (message.includes('yes')) {
                                        recognition.stop();
                                        stopSpeaking();

                                        const response = await fetch('/navi/process', {
                                            method: 'POST',
                                            headers: {
                                                'Content-Type': 'application/json',
                                                'X-CSRF-TOKEN': csrfToken,
                                            },
                                            body: JSON.stringify({
                                                prompt: $('#speech-input').val(),
                                            }),
                                        });

                                        if (!response.ok) {
                                            throw new Error(`Fetch error: ${response.statusText}`);
                                        }

                                        // Clear the loading indicator
                                        clearInterval(loadInterval);
                                        // console.log(response)
                                        handleResponse(response)

                                        $('#popup-continuation-speech').removeClass('active');
                                        $('#speech-input').val('');
                                        // Handle the data as needed
                                        console.log('its a yes');
                                    } else if (message.includes('no')) {
                                        // Handle 'no' case
                                        $('#popup-continuation-speech').toggleClass('active');
                                        startToSpeak(
                                            'Oh, sorry! can speak again or manually type your question!'
                                        );
                                    } else {

                                        $('#popup-continuation-speech').toggleClass('active');
                                        $('#speech-input').val(message + ' ?');
                                        startToSpeak(message + 'I am right?');
                                    }


                                    // recognition.start(); // Resume recognition after responding
                                } catch (error) {
                                    console.error('An error occurred:', error);
                                    // Handle the error as needed
                                }
                            }

                        }

                    case 'scanner':
                        if ($(this).hasClass('disabled')) {
                            var scannerMess =
                                "We apologize, but there is currently a scanner issue. Scanning functionality is temporarily unavailable. The icons have been highlighted in red to indicate this issue. Please try again at a later time. Thank you for your understanding.";

                            startToSpeak(scannerMess)
                                .then((finished) => {
                                    if (finished) {
                                        // Speech finished
                                        console.log(finished)
                                    }
                                });
                        }
                    default:
                        break;
                }

            })

            // box-icons old
            $(document).on('click', '.browseCard', async function() {
                var bxi = $(this).data('value')
                var bxiModel = $(this).data('model')
                // alert(bxi)
                const response = await fetch('/navi/process/information', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    body: JSON.stringify({
                        requestInfo: `${bxi}`,
                        modelClass: bxiModel,
                    }),

                });
                handleResponseInfo(response)
            })

            // handle response
            const handleResponse = async (response) => {
                // console.log(response.ok)
                if (response.ok) {
                    const responseData = await response.json();
                    const parsedData = responseData.response;
                    console.log(responseData)
                    if (parsedData.data) {
                        // nothing to add if true for now
                    } else {

                        $('#popup-ask').removeClass('active')
                        // startToSpeak(parsedData.answer)

                        startToSpeak(parsedData.answer)
                            .then((finished) => {
                                if (finished) {
                                    // Speech finished
                                    console.log(finished)
                                    // subBTN.show()
                                    // $('#overlay-updates').removeClass('active');
                                    $('#popup-continuation').fadeOut(400)
                                    $('#searchModal').css({"display":'flex'})
                                    if (responseData.floor !== "false") {
                                        console.log(responseData.continuation)
                                        boxes.show(); // Ensure boxes are visible before fading in
                                        switch (responseData.continuation) {
                                            case false:
                                                // alert('false response')
                                                console.log('false response')
                                                // Handle the case when continuation is false
                                                // $('#overlay-updates').toggleClass('active');
                                                $('#searchModal').fadeOut(400)
                                                $('#popup-continuation').css({"display":"flex"})
                                                break;

                                            case 'information':
                                            console.log('information response')
                                                // Handle the case when continuation is 'information'
                                                $('#searchModal').fadeOut(400)
                                                $('#popup-continuation-teacher').css({"display":"flex"});
                                                break;

                                            case 'deactivate':
                                                // Handle the case when continuation is 'deactivate'
                                                // alert('yes');
                                                // $('#overlay-updates').removeClass('active');
                                                console.log('deactivate response')
                                                $('#searchModal').fadeOut(400)
                                                $('#popup-continuation').fadeOut(400);
                                                break;

                                            default:
                                            console.log('default response')
                                                // Handle the case when continuation is not 'information' or 'deactivate'
                                                processFacilitiesNavigation(responseData.floor,
                                                    responseData.facility);
                                                $('#searchModal').fadeOut(500);
                                                $("#navigationPopup").css({
                                                    "display": "flex"
                                                });
                                                break;
                                        }

                                    }
                                } else {
                                    console.log('not fineshed')
                                    // Speech synthesis not supported
                                    // Handle accordingly
                                }
                            });
                    }
                } else {
                    const err = await response.text();
                    // messageDiv.html("Something went wrong");
                    alert(err);
                }
            }

            // handle response for information
            const handleResponseInfo = async (response) => {
                if (response.ok) {
                    const responseData = await response.json();
                    $('#popup-searching').removeClass('active');
                    if(responseData.modelClass !== 'SchoolHMV'){
                        $('#popup-searchingInfo').toggleClass('active');
                        // console.log(responseData)
                        $('.info-title').text(`Available's Information on ${responseData.modelClass}`)
                    }
                    var html = ''
                    responseData.informations.forEach((info, key) => {
                        // console.log(info)
                        switch (responseData.modelClass) {
                            case "EastwoodsFacilities":
                                html += `
                                    <span class="grid-item" data-info-model="${responseData.modelClass}" data-info-id="${info.id}" data-info-search="${info.facilities}">${info.facilities.toUpperCase()}</span>
                                `
                                break;
                            case "Teacher":
                                html += `
                                    <span class="grid-item" data-info-model="${responseData.modelClass}" data-flo="${info.floor}" data-faci="${info.facility_name}" data-info-id="${info.id}" data-info-search="${info.name}">${info.name.toUpperCase()}</span>
                                `
                                break;
                            case "SchoolHMV":
                                    $('#searchModal').fadeOut(400)
                                    if(info.type === 'hymn'){
                                        startToSpeak(`Here is the ${info.type} of Eastwoods.`)
                                        .then((finished) => {
                                            
                                            $('#east-play').append(
                                                `<source src="${info.path}" type="video/mp4">
                                                Your browser does not support the video tag.`
                                            )
                                            // Load the new video source
                                            $('#east-play')[0].load();
                                            $('#east-play')[0].play();

                                            afterElement.addClass('circle-after');
                                            circle.append(afterElement);
                                            $('#hymnPopup').css({"display":'flex'}).hide().fadeIn(500);

                                            // Attach an event listener to the 'ended' event of the video
                                            $('#east-play').on('ended', function() {
                                                // Close the modal, replace this with your actual modal closing logic
                                                startToSpeak(`Thank you for Watching Eastwoods Hymns. Have a nice day.`)
                                                .then((finished) => {
                                                    // Pause the video
                                                    $('#east-play')[0].pause();
                                                    // Remove the existing <source> element
                                                    $('#east-play source').remove();

                                                    
                                                    $('#hymnPopup').fadeOut(400);
                                                })
                                                
                                            });
                                        })
                                    }else{
                                        let index = 0;
                                        const textToType = info.descriptions;

                                        function typeText() {
                                            $('#mv-text-title').text(info.type);
                                            $('.mv-text').html(`<span class="typing-text">"${textToType.substring(0, index)}"</span>`);

                                            index++;

                                            if (index <= textToType.length) {
                                                setTimeout(typeText, 60); // Adjust the delay as needed
                                            }
                                        }

                                        typeText();
                            
                                        
                                        $('#mvPopup').css({"display":'flex'}).hide().fadeIn(500);
                                        startToSpeak(`Here is the ${info.type} of Eastwoods. ${info.descriptions.replace(/,/g, '.')}`)
                                        .then((finished) => {
                                            
                                        })
                                        
                                    }
                                
                                break;
                            default:
                                break;
                        }
                    })
                    $('.information-container').html(html)

                    // search functionality
                    $('#search-input').on('input', function() {
                        const searchQuery = $(this).val().toLowerCase();

                        // Filter grid items based on the search query
                        $('.grid-item').each(function() {
                            const itemText = $(this).text().toLowerCase();
                            if (itemText.includes(searchQuery)) {
                                $(this).show(); // Display matching items
                            } else {
                                $(this).hide(); // Hide non-matching items
                            }
                        });
                    });

                    // click handler on grid-item
                    $(document).off('click', '.grid-item').on('click', '.grid-item', async function() {
                        var infoModel = $(this).data('info-model')
                        var infoId = $(this).data('info-id')
                        var dataFaci = $(this).data('faci')
                        var dataFlo = $(this).data('flo')
                        // just for now
                        var prompt = $(this).data('info-search')

                        $('#popup-searching').removeClass('active');
                        $('#popup-searchingInfo').toggleClass('active');

                        const response = await fetch('/navi/process/search', {
                            method: 'POST',
                            headers: {
                                'Content-Type': 'application/json',
                                'X-CSRF-TOKEN': csrfToken,
                            },
                            body: JSON.stringify({
                                infoModel: `${infoModel}`,
                                infoId: `${infoId}`,
                                prompt: `${prompt}`,
                                teacherLocation: dataFaci,
                                locationFloor: dataFlo,
                            }),

                        });
                        // $('#overlay-updates').removeClass('active');
                        $('#popup-searchingInfo').removeClass('active');

                        $('#popup-continuation').fadeOut(400);
                        // const responseData = await response.json();
                        handleResponse(response)
                    })

                    $(document).off('click', '#searchingInfo-Cancel').on('click', '#searchingInfo-Cancel',
                        function() {
                            $('#popup-searchingInfo').removeClass('active');
                            boxes.show(); // Ensure boxes are visible before fading in
                            search2Pops.css({
                                'display': 'flex'
                            });
                        });

                } else {
                    const err = await response.text();
                    // messageDiv.html("Something went wrong");
                    alert(err);
                }
            }

            // Function to stop the current speech synthesis
            const stopSpeaking = () => {
                if (currentUtterance) {
                    speechSynthesis.cancel(); // Cancel the current utterance
                    currentUtterance = null; // Clear the current utterance reference
                }
            };
            // speak
            const startToSpeak = async (sentence) => {
                // Stop any ongoing speech before starting a new one
                stopSpeaking();
                // speak
                input.hide()
                subBTN.hide()
                if ('speechSynthesis' in window) {
                    return new Promise((resolve, reject) => {
                        const utterance = new SpeechSynthesisUtterance();
                        utterance.volume = 1;
                        utterance.rate = 0.9;
                        utterance.pitch = 1;
                        utterance.text = sentence;

                        // Store the current utterance
                        currentUtterance = utterance;
                        var index = 1;
                        for (index; index < window.speechSynthesis.getVoices().length; index++) {
                            if (window.speechSynthesis.getVoices()[index].voiceURI.search(
                                    'Zeera') != -1) {
                                utterance.voice = window.speechSynthesis.getVoices()[index];
                            }
                        }
                        utterance.voice = window.speechSynthesis.getVoices()[index];

                        setTimeout(() => {
                            utterance.voice = window.speechSynthesis.getVoices()[1];
                        }, 1000);

                        utterance.addEventListener('end', () => {
                            console.log('Speech finished');
                            currentUtterance =
                                null; // Clear the current utterance reference when speech finishes
                            // loader
                            $('.loader').hide();
                            const afterElement = circle.find('.circle-after');

                            if (afterElement.length) {
                                circle.remove(afterElement);

                                setTimeout(() => {
                                    afterElement.removeClass('circle-after');
                                    conC.removeClass('container-circle');
                                    conT.removeClass('container-title');
                                    en.removeClass('inside');
                                    location.removeClass('active');

                                    // show input
                                    input.show();
                                    subBTN.show();

                                    resolve(
                                        true
                                    ); // Resolve the Promise when speech finishes
                                }, 1000);
                            }
                        });

                        // start talked
                        setTimeout(() => {
                            afterElement.addClass('circle-after');
                            $('.loader').show();
                            circle.append(afterElement);
                            speechSynthesis.speak(utterance);
                        }, 1000);
                    });
                } else {
                    console.log('Speech synthesis not supported in this browser');
                    return false; // Return false if speech synthesis is not supported
                }
            };

            // process facilities navigation
            const processFacilitiesNavigation = async (floor, facility) => {
                $('#next-floor-button').hide();
                $('#back-floor-button').hide();
                const response = await fetch('/navi/process/navigation', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    body: JSON.stringify({
                        floor: `${floor}`,
                        facility: `${facility}`,
                    }),

                });
                // const responseData = await response.json();
                // handleResponse(response)
                const responseData = await response.json();

                // console.log(responseData.details)
                // Assuming responseData.details is an array of objects with an 'id' property
                const uniqueDetails = Array.from(new Set(responseData.details.map(detail => detail.id))).map(id => {
                    return responseData.details.find(detail => detail.id === id);
                });

                console.log(uniqueDetails);

                var serverResponds = uniqueDetails;
                const gridContainer = $("#grid-container");
                
                let gridPoints = [];
                let floorIndex = 0;
                let len = serverResponds.length;
                let startingPoint;
                let isTargetFound = false;
                let highestX = -Infinity; // Start with negative infinity as the initial value
                let highestY = -Infinity;

                var targetFacilities;
                var targetSelection = '';
                var targetX;
                var targetY;
                // default starting point
                var startingX;
                var startingY;

                const validLabelsMale = ['male','MR', 'MRX','MRN','MRF']; // Add more labels as needed for abbrev
                const validLabelsFemale = ['female','FR', 'FRU','FRF','FRZ']; // Add more labels as needed for abbrev

                let uniqueEntries = new Set();

                function createGridPoints(target, prevBool) {
                    if (floorIndex < len) {
                        
                        // $('#next-floor-button').hide();
                        // $('#back-floor-button').hide();
                        // console.log('count', floorIndex, '<', len)
                        // console.log(serverResponds[floorIndex]['gridDetails'])
                        $('.floor-title').text(serverResponds[floorIndex]['floor'])
                        // console.log(serverResponds[floorIndex]['floor'])
                        targetFacilities = target;
                       
                        gridContainer.empty(); // Clear the existing grid using jQuery
                        // && serverResponds['gridDetails'] && Array.isArray(serverResponds['gridDetails'])
                        if (serverResponds && serverResponds[floorIndex]['gridDetails'] && Array.isArray(
                                serverResponds[floorIndex]['gridDetails'])) {
                            // serverResponds.forEach(floor => {
                            // console.log(floor)
                            serverResponds[floorIndex]['gridDetails'].forEach(coordinates => {
                                if (!isNaN(parseInt(coordinates.x)) && parseInt(coordinates.x) >
                                    highestX) {
                                    highestX = parseInt(coordinates.x);

                                }

                                if (!isNaN(parseInt(coordinates.y)) && parseInt(coordinates.y) >
                                    highestY) {
                                    highestY = parseInt(coordinates.y);
                                }

                                if (highestX < highestY) {
                                    // Set the width and height of gridContainer to fit-content
                                    $("#grid-container").css({
                                        'height': "fit-content",
                                        'grid-template-rows': `repeat(${highestX+1}, 1fr)`,
                                        'grid-template-columns': `repeat(${highestY+1}, 1fr)`,
                                    });
                                } else {
                                    // Set the width and height of gridContainer to fit-content
                                    $("#grid-container").css({
                                        'height': "fit-content",
                                        'grid-template-rows': `repeat(${highestX+1}, 1fr)`,
                                        'grid-template-columns': `repeat(${highestY+1}, 1fr)`,
                                    });
                                }

                                // console.log(coordinates)
                                const point = $(
                                    "<div></div>"); // Create a new div element using jQuery
                                point.addClass("grid-point");
                                point.attr("data-x", parseInt(coordinates
                                    .x)); // Set x-coordinate as a data attribute
                                point.attr("data-y", parseInt(coordinates
                                    .y)); // Set y-coordinate as a data attribute
                                point.attr("data-label", coordinates.sublabel);
                                // point.text(`${parseInt(coordinates.x)},${parseInt(coordinates.y)}`); // Optionally, you can label points with their coordinates
                                // Use a ternary operator to set the text based on coordinates.label
                                point.text(coordinates.label !== null ? truncateText(coordinates
                                    .label, 7) : '');
                                gridContainer.append(point).fadeIn(
                                    'slow'); // Append the point to the grid container using jQuery
                                // point.addClass(coordinates.isBlock === 'true' ? 'blocked' : '');

                                let currentEntry = coordinates;
                                // Check if the combination of label and sublabel is unique
                                let entryKey = currentEntry.label + currentEntry.sublabel;
                                if(coordinates.label !== null && coordinates.sublabel !== null && !uniqueEntries.has(entryKey)){
                                    // Add the combination to the set to mark it as encountered
                                    uniqueEntries.add(entryKey);
                                    populatesAbbrev(currentEntry.label, currentEntry.sublabel)
                                }
                                // console.log(coordinates.label ,targetFacilities ,coordinates.sublabel ,targetFacilities)
                                if (coordinates.isBlock === 'true' && coordinates.sublabel !==
                                    targetFacilities && coordinates.label !== 'front' && coordinates
                                    .label !== 'wall') {
                                    point.addClass('blocked');
                                    // targetSelection += `<option value="${coordinates.label}">${coordinates.label}</option>`
                                } else if (coordinates.label == targetFacilities || coordinates
                                    .sublabel == targetFacilities) {
                                         // Remove the class 'targetFacilities' from all elements
                                    // $('.st').removeClass('targetFacilities');
                                    point.addClass('targetFacilities');
                                    targetX = parseInt(coordinates.x);
                                    targetY = parseInt(coordinates.y);
                                    // targetSelection += `<option value="${coordinates.label}">${coordinates.label}</option>`
                                    // Set the flag to true when the target is found
                                    isTargetFound = true;
                                    console.log("nag true mna",isTargetFound)
                                } else if (coordinates.label === 'front') {
                                    startingX = parseInt(coordinates.x);
                                    startingY = parseInt(coordinates.y);
                                    point.addClass('starting-point');
                                    point.text('')
                                    point.append(`<i class="fa-solid fa-street-view fa-2xl"></i>`)
                                } else if (coordinates.label === 'wall') {
                                    point.addClass('blocked wall');
                                   
                                } 

                                

                                if (coordinates.label === 'wall') {
                                    point.addClass('blocked wall');
                                    point.text('')
                                    point.append(
                                        `<i class="fa-regular fa-rectangle-xmark fa-lg" style="color: #511f24;"></i>`
                                    )
                                }
                                if (validLabelsMale.includes(coordinates.label)) {
                                    console.log('yes')
                                    point.text('')
                                    point.append(
                                        `<i class="fa-solid fa-person fa-2xl" style="color: #0f56d2;"></i>`
                                    )
                                }
                                if (validLabelsFemale.includes(coordinates.label)) {
                                    point.text('')
                                    point.append(
                                        `<i class="fa-solid fa-person-dress fa-2xl" style="color: #eb05c1;"></i>`
                                    )
                                }
                                if (coordinates.label === 'stair-in') {
                                    point.text('')
                                    point.append(
                                        `<i class="fa-solid fa-stairs fa-2xl" style="color: #0f56d2;"></i>`
                                    )
                                }
                                if (coordinates.label === 'guard') {
                                    point.text('')
                                    point.append(
                                        `<i class="fa-solid fa-person-military-pointing fa-2xl"></i>`
                                    )
                                }

                                if (coordinates.label === 'stair-in' && floorIndex < len-1) {
                                    // console.log(floorIndex , len)
            
                                    point.addClass('targetFacilities st');
                                    point.removeClass('blocked')
                                    targetX = parseInt(coordinates.x);
                                    targetY = parseInt(coordinates.y);
                                    // console.log(coordinates.label,targetX, targetY)
                                    // targetSelection += `<option value="${coordinates.label}">${coordinates.label}</option>`
                                }

                                // Add the point to the gridPoints array
                                gridPoints.push(point);
                                // $('#target-selection').html(targetSelection);

                                if (target != 'n/a' && startingX != 0 && startingY != 0) {
                                    console.log(startingX, startingY, targetX, targetY)
                                    dijkstra(startingX, startingY, targetX, targetY);
                               
                                    
                                }
                               if(floorIndex < len-1){
                                    console.log("ito yun")
                                    startingX = 0;
                                    startingY = 0;
                               }

                            });
                            // console.log()
                            // starting point x, y  target x,y
                            
                           



                            // speak the guidelines
                            startToSpeak(responseData.navigationMessage[floorIndex])

                            if (!prevBool) {
                                floorIndex++; // Move to the next floor
                                setTimeout(() => createGridPoints(facility, false),
                                    10000); // Display the next floor after 10 seconds
                            }


                        }
                    } else {
                        $('#next-floor-button').fadeIn('slow');
                        $('#back-floor-button').fadeIn('slow');
                    }
                }

                // Back button preview
                $(document).on('click', '#back-floor-button', function() {
                    if (floorIndex > 0) {
                        console.log(floorIndex);
                        floorIndex--; // Decrement floorIndex
                        const gridContainer = $("#grid-container");
                        // Clear the grid points and reset variables
                        gridContainer.empty();
                        gridPoints = [];
                        highestX = -Infinity;
                        highestY = -Infinity;
                        isTargetFound = false;
                        targetFacilities = '';
                        targetX = 0;
                        targetY = 0;
                        startingX = 0;
                        startingY = 0;
                        createGridPoints(facility, true);
                    } else {
                        $(this).prop("disabled", true).addClass('btn btn-secondary');
                        $('#next-floor-button').prop("disabled", false);
                    }
                });

                // Next button preview
                $(document).on('click', '#next-floor-button', function() {
                    if (floorIndex < 1) {
                        console.log(floorIndex);
                        floorIndex++; // Increment floorIndex
                        const gridContainer = $("#grid-container");
                        // Clear the grid points and reset variables
                        gridContainer.empty();
                        gridPoints = [];
                        highestX = -Infinity;
                        highestY = -Infinity;
                        isTargetFound = false;
                        targetFacilities = '';
                        targetX = 0;
                        targetY = 0;
                        startingX = 0;
                        startingY = 0;
                        createGridPoints(facility, true);
                    } else {
                        $(this).prop("disabled", true).addClass('btn btn-secondary');
                        $('#back-floor-button').prop("disabled", false);
                    }
                });


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
                createGridPoints(facility, false);




                // Dijkstra's Algorithm
                async function dijkstra(startX, startY, endX, endY) {
                    // console.log(startX, startY, endX, endY)
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
                            if (node1 && node2 && node1.dataset && node2.dataset) {
                                const dx = Math.abs(node1.dataset.x - node2.dataset.x);
                                const dy = Math.abs(node1.dataset.y - node2.dataset.y);
                                return Math.sqrt(dx * dx + dy * dy);
                            } else {
                                // Handle the case where either node1 or node2 (or their datasets) is null or undefined
                                // console.log('Invalid nodes or datasets.');
                                return Infinity; // or any other appropriate value
                            }
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
                                    if (neighborNode !== null && neighborNode !== undefined) {
                                        if (!neighborNode.classList.contains("blocked")) {
                                            const distanceToNeighbor = calculateDistance(
                                                grid[currentY][currentX],
                                                neighborNode
                                            );

                                            // Update the distance if a shorter path is found
                                            if (
                                                !visited[y][x] &&
                                                distances[currentY][currentX] + distanceToNeighbor < distances[y][x]
                                            ) {
                                                distances[y][x] =
                                                    distances[currentY][currentX] + distanceToNeighbor;
                                            }
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
                    }

                        // Initialize a flag to track if animation is running
                        let isAnimationRunning = false;
                        // Run animation recursively with a delay
                        async function runAnimation() {
                            await animateShortestPath(shortestPath);
                            // console.log("Animation is complete");

                            dijkstra(startingX, startingY, targetX, targetY);
                        }

                        // Start the animation
                        runAnimation();

                        //original
                        // Highlight the shortest path in the grid
                        // async function animateShortestPath(shortestPath) {
                        //     for (let i = 1; i < shortestPath.length; i++) {

                        //         const {
                        //             x: currentX,
                        //             y: currentY
                        //         } = shortestPath[i - 1];
                        //         const {
                        //             x: nextX,
                        //             y: nextY
                        //         } = shortestPath[i];

                        //         const node = grid[currentY][currentX];
                        //         node.classList.add(
                        //             "passed"); // Highlight the current node as passed

                        //         // Determine the direction (up or down)
                        //         let directionClass = "";
                        //         // if (nextY < currentY) {
                        //         //     // alert('yes')
                        //         //     directionClass = "left";
                        //         // } else {
                        //         //     directionClass = "up";
                        //         // }
                        //         if (nextY < currentY) {
                        //             directionClass = "left";
                        //         } else if (nextY > currentY) {
                        //             directionClass = "right";
                        //         } else if (nextX < currentX) {
                        //             directionClass = "up";
                        //         } else if (nextX > currentX) {
                        //             directionClass = "down";
                        //         }

                        //         // Check if directionClass is not empty before adding it as a class
                        //         if (directionClass !== "") {
                        //             // Create the ball element with the direction class
                        //             // const ball = document.createElement("div");
                        //             // ball.classList.add("ball", directionClass);
                        //             node.classList.add(directionClass);

                        //             // Append the ball to the grid container
                        //             // node.append(ball);

                        //             // Wait for 200 milliseconds (remove the ball after 200ms)
                        //             await new Promise((resolve) => setTimeout(resolve, 400));

                        //             // Remove the ball element
                        //             // ball.remove();
                        //         }
                        //     }

                        //     // Repeat the animation infinitely
                        //     animateShortestPath(shortestPath);
                        // }

                        // Start the animation
                        // animateShortestPath(shortestPath);
                    } catch (error) {
                        // console.log(error)
                    }
                }

                // Helper function to add a delay for animation
                function sleep(ms) {
                    return new Promise((resolve) => setTimeout(resolve, ms));
                }

            }

            // Function to generate random hex color
            function getRandomColor() {
                const letters = '0123456789ABCDEF';
                let color = '#';
                for (let i = 0; i < 6; i++) {
                    color += letters[Math.floor(Math.random() * 16)];
                }
                return color;
            }

            // Function to update cube face colors
            function updateCubeColors() {
                const cubeFaces = document.querySelectorAll('.loading-face');
                cubeFaces.forEach(face => {
                    face.style.color = getRandomColor();
                });
            }

            // Update loading text
            function updateLoadingText() {
                const loadingText = document.getElementById('loadingText');
                loadingText.textContent = 'Updating System...';
            }

            // Assemble and disassemble the cube continuously
            function animateCube() {
                const loadingCube = document.getElementById('loadingCube');
                loadingCube.classList.add('loaded');

                updateLoadingText(); // Update text initially

                // Update cube face colors in an interval
                setInterval(updateCubeColors, 500);

                setTimeout(() => {
                    loadingCube.classList.remove('loaded');
                    updateLoadingText(); // Update text after disassembling
                    setTimeout(animateCube, 2000); // Adjust the delay duration (milliseconds) as needed
                }, 1000); // Adjust the delay duration (milliseconds) as needed
            }

            // updates completed
            console.log(updates)
            // checks for updates
            if (updates !== 'false') {
                input.hide();
                subBTN.hide();
                var updatesCompleted =
                    "Updates Completed! Maintenance for the  system is done. We've made improvements and added new data. The system is now fully operational. Thank you for your understanding!"
                startToSpeak(updatesCompleted)
                    .then((finished) => {
                        if (finished) {
                            console.log(finished)
                            localStorage.setItem('updates', false)
                        } else {
                            console.log('not finished')
                        }
                    })
            } else {
                console.log('nothing to say')
            }

            $(document).on('click', '.targetFacilities', async function() {
                // Inside this function, 'this' refers to the clicked element
                var clickedElement = $(this).data('label');

                const responses = await fetch('/available', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    body: JSON.stringify({
                        designated: `${clickedElement}`,
                    }),

                });

                const designatedTeachers = await responses.json();
                // console.log(designatedTeachers)
                $('#navigationPopup').fadeOut(500);

                $('.at').text(designatedTeachers.result.facility.facilities);
                var teach = ''
                if (designatedTeachers.result.teachers.length > 0) {
                    designatedTeachers.result.teachers.forEach(ts => {

                        teach += `
                                <div class="abbrev-element designated-teacher">
                                    <box-icon name='user' type='solid' ></box-icon><br>
                                    <span class="abbr designated-teacher-t">${ts.name}</span><br>
                                    <hr>
                                    <span class="abbr-m">${ts.position}</span>
                                </div>
                                `;

                    });
                }else{
                    teach = `<h4 class="text-center no-record">There's is no record on this facilities</h4>  
                    `
                    // <lord-icon
                    //     src="https://cdn.lordicon.com/amjaykqd.json"
                    //     trigger="hover"
                    //     colors="primary:#0a5c15,secondary:#66ee78"
                    //     style="width:350px;height:350px">
                    // </lord-icon>
                }

                $('.l-des').html(teach)
                $('#designatedPopup').css({'display':'flex'})

            });

            $('#preview-Cancel').on('click', function() {
                $("#myModal").modal("show");
                $('#popup-designated').removeClass('active')
            })

            //random response for exit
            function ranExit(){
                  // Array of possible responses
                const responses = [
                    "Sure, how can I assist you?",
                    "Absolutely! What do you need help with?",
                    "Of course! Let me know what I can do for you.",
                    "I'm here to help! What can I do for you?",
                    "No problem! Feel free to ask for any assistance.",
                    "Sure thing! Let me know how I can support you.",
                    "Certainly! Your request is my command.",
                    "Absolutely! I'm ready to assist.",
                    "No worries! I'm at your service.",
                    "You got it! What can I do for you?",
                    // Add more responses as needed
                ];

                // Randomly select a response
                const randomIndex = Math.floor(Math.random() * responses.length);
                const randomResponse = responses[randomIndex];

                // Return the random response and the original message
                return randomResponse;
            }

            //clicked exit inside of a circle
            $(document).on('click', '.exit', function() {
                var boxes = $('.box');
                boxes.each(function(index) {
                    var box = $(this);
                    var totalBoxes = boxes.length;
                    setTimeout(function() {
                        box.fadeOut(500);

                    }, (totalBoxes - index - 1) * 200);
                });
                stopSpeaking()
                startToSpeak(ranExit());
                setTimeout(function() {
                    $('#searchModal').fadeOut(500);
                    $('#popup-continuation').fadeOut(500);
                }, boxes.length * 500);
            });

            $(document).on('click', '.box-content', async function() {
                var bxi = $(this).data('value')
                var bxiModel = $(this).data('model')
                // alert(bxi)
                const response = await fetch('/navi/process/information', {
                    method: 'POST',
                    headers: {
                        'Content-Type': 'application/json',
                        'X-CSRF-TOKEN': csrfToken,
                    },
                    body: JSON.stringify({
                        requestInfo: `${bxi}`,
                        modelClass: bxiModel,
                    }),

                });
                handleResponseInfo(response)
            })

            //navigation exit
            $(document).on('click', '.navi-exit', function() {
                abbrevPeriodicTable.empty()
                stopSpeaking()
                startToSpeak(
                ranExit());
                $('#navigationPopup').fadeOut(500);
                 // Remove the existing <source> element
                    // Pause the video
                $('#east-play')[0].pause();
                $('#east-play source').remove();
                $('#hymnPopup').fadeOut(400);
                $('#mvPopup').fadeOut(400);
                $('#designatedPopup').fadeOut(500);
                search2Pops.css({
                    'display': 'flex'
                });
            })

            //back
            $(document).on('click', '.mv-back', function(){
                $('#navigationPopup').fadeOut(500);
                 // Remove the existing <source> element
                    // Pause the video
                $('#east-play')[0].pause();
                $('#east-play source').remove();
                $('#hymnPopup').fadeOut(400);
                $('#mvPopup').fadeOut(400);
                $('#designatedPopup').fadeOut(500);
                search2Pops.css({
                    'display': 'flex'
                });
            })
            //navigation exit
            $(document).on('click', '.conti-exit', function() {
                stopSpeaking()
                abbrevPeriodicTable.empty()
                startToSpeak(
                ranExit());
                $('#popup-continuation').fadeOut(500);
                $('#searchModal').css({"display":'flex'}).hide().fadeIn(500);;
                search2Pops.css({
                    'display': 'flex'
                });
            })

            // open abbrev popups
            $(document).on('click', '.abbrev-means', function(){
                // $('#navigationPopup').fadeOut(500);
                $('#abbrevPopup').css({"display":'flex'}).hide().fadeIn(500);
            })
            $(document).on('click', '.abbrev-means-back', function(){
                // abbrevPeriodicTable.empty()
                $('#navigationPopup').css({"display":'flex'}).hide().fadeIn(50);
                $('#abbrevPopup').fadeOut(500);
                $('#designatedPopup').fadeOut(500);
            })
            $(document).on('click','.des-back-home', function(){
                $('#navigationPopup').css({"display":'flex'}).hide().fadeIn(50);
                $('#designatedPopup').fadeOut(500);
            })

            //populates abbrev
            function populatesAbbrev(ab,abm){
                
                abbrevPeriodicTable.append(`
                    <div class="abbrev-element"><span class="abbr">${ab}</span><br><span class="abbr-m">${abm}</span></div>
                `)
            }

        });
    </script>
@endsection
