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
    {{-- <link rel="stylesheet" href="{{ asset('css/loader.css') }}"> --}}

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
            overflow-x: auto;


            /* padding: 10px; */
            /* width: fit-content; */
            margin-top: 0;
            margin-left: 170px;
            /* Adjust the width of the floorplan */
            height: 670px;
            /* Adjust the height of the floorplan */
            box-shadow: rgba(37, 43, 59, 0.2) 0px 7px 29px 0px;
            /* margin: 50px auto; */
            display: grid;
            grid-template-columns: repeat(10, 1fr);
            /* Adjust the number of columns */
            grid-template-rows: repeat(4, 1fr);
            /* Adjust the number of rows */
            /* gap: -5px; */
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

        /* Define scrollbar styles */
        ::-webkit-scrollbar {
            width: 5px;
            /* Adjust as needed */
        }

        /* Track styles */
        ::-webkit-scrollbar-track {
            background: transparent;
        }

        /* Handle styles */
        ::-webkit-scrollbar-thumb {
            background: rgba(11, 93, 234, 0.747);
            /* Handle color */
        }

        /* Handle on hover */
        ::-webkit-scrollbar-thumb:hover {
            background: rgba(22, 53, 107, 0.747);
            /* Hover color */
        }

        /* .grid-container::-webkit-scrollbar{
                                width: 0;
                            } */
        /* Style for each room (grid point) */
        .grid-point {
            width: 65px;
            height: 65px;
            /* background-color: transparent; */
            /* Light background color for rooms */
            /* border: 0.5px transparent; */
            /* Add borders */
            display: flex;
            justify-content: center;
            align-items: center;
            font-family: Arial, sans-serif;
            /* Specify a common font */
            font-size: 13px;
            /* Adjust font size */
            color: #f3ecec;
            /* Text color */
            position: relative;
            transition: transform 0.3s ease-in-out;
            /* Add smooth transform transition */
            /* transform-style: preserve-3d; */
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
            /* box-shadow: rgba(10, 10, 10, 0.1) 0px 2px 4px, rgba(0, 0, 0, 0.5) 0px 7px 13px -3px, rgba(0, 0, 0, 0.5) 0px -3px 0px inset; */
            color: rgb(150, 189, 139);
            font-size: 14pt;
            font-weight: 700;
            background: rgba(10, 10, 10, 0.2);
            /* border: 1px solid transparent; */
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
            background: rgba(11, 93, 234, 0.747);
            /* width: 75px; */
            /* border: 1px solid green; */
            /* Dark background color for walls */
            /* box-shadow: rgba(0, 0, 0, 0.1) 0px 2px 4px, rgba(0, 0, 0, 0.5) 0px 7px 13px -3px, rgba(0, 0, 0, 0.5) 0px -3px 0px inset; */
            color: rgb(246, 247, 250);
            /* transform: translateZ(20px); */
            cursor: pointer;
            text-shadow: 2px 2px 3px rgba(7, 7, 7, 0.8);
            font-weight: 600;
            z-index: 1000;
        }

        .wall {
            background-color: transparent;
            /* Set the background color for the grid points */
            /* box-shadow: 0px 0px 10px rgba(0, 0, 0, 0.1); */
            /* border: .6px solid transparent; */
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

    {{-- scanner --}}
    <link rel="stylesheet" href="{{ asset('css/scanner.css') }}">

    {{-- count --}}
    <link rel="stylesheet" href="{{ asset('css/count.css') }}">

    {{-- indicator speech --}}
    <link rel="stylesheet" href="{{ asset('css/indicator.css') }}">

    {{-- speaking --}}
    <link rel="stylesheet" href="{{ asset('css/speaking.css') }}">
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
        if (isset($systems[2])) {
            $auth = $systems[2]->status;
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
        {{-- @include('navi.contents.popups.information') --}}

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
        {{-- facility information popup --}}
        @include('navi.contents.popups.information2')
        {{-- scanner --}}
        @include('navi.contents.popups.scanner')
        {{-- count down --}}
        @include('navi.contents.popups.countdown')
        {{-- indicator speech --}}
        @include('navi.contents.popups.indicator')
        {{-- indicator of speacking --}}
        @include('navi.contents.popups.speaking')
        {{-- <button type="button" id="autoClicker"></button> --}}
    </section>

    <footer>
        <span>Capstone2</span>
    </footer>
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

    <script src="{{ asset('html5-qrcodes/html5-qrcode.min.js') }}"></script>
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
            // $('#popup-count').addClass('active')
            // $('#popup-scanner').toggleClass('active')
            // $('#navigationPopup').css({
            //     "display": 'flex'
            // });
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
            let mvTimeout;
            let index = 0;

            const sessionTimeout = 60000; // 30 seconds for testing, adjust as needed
            let timeoutId;
            let countdownInterval;

            const abbrevPeriodicTable = $('.abbrev-periodic-table')
            // Enable pusher logging - don't include this in production
            // Pusher.logToConsole = true;

            var pusher = new Pusher('4ef07d09e997c8b8f24b', {
                cluster: 'ap1'
            });

            var channel = pusher.subscribe('update-system');
            channel.bind('initialize-updates', function(data) {
                // Parse the JSON data
                // var eventData = JSON.parse(data);
                // console.log(data.message)
                var message = data.message
                input.hide();
                subBTN.hide();
                startToSpeak(message)
                    .then((finished) => {
                        if (finished) {
                            // Speech finished
                            // console.log(finished)
                            hideIndicatorSpeaking()
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

            // loader
            // $('.loader').hide()
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
                        stopSpeaking()
                        $('#popup-ask').toggleClass('active');
                        $('#popup-searching').removeClass('active');
                        break;
                        // browsing
                    case 'search':
                        stopSpeaking()
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
                            .then((done) => {
                                if (done) {
                                    hideIndicatorSpeaking()
                                }

                            })

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
                                        hideIndicatorSpeaking()
                                        console.log(finished)
                                    }
                                });
                        } else {
                            var mess =
                                "Speak Recognition Initialized!";
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
                                                hideIndicatorSpeaking()
                                                console.log('done speaking...')
                                                recognition.start();

                                                // indicator speech
                                                showIndicator();

                                                input.hide();
                                                subBTN.hide();
                                            }
                                        })
                                } else if (hour > 12 && hour < 17) {
                                    startToSpeak("Good Afternoon..." + mess)
                                        .then((s) => {
                                            if (s) {
                                                hideIndicatorSpeaking()
                                                console.log('done speaking...')
                                                recognition.start();

                                                showIndicator();
                                                input.hide();
                                                subBTN.hide();
                                            }
                                        })
                                } else {
                                    startToSpeak("Good Evening..." + mess)
                                        .then((s) => {
                                            if (s) {
                                                console.log('done speaking...')
                                                recognition.start();

                                                // indicator speech
                                                showIndicator();
                                                input.hide();
                                                subBTN.hide();
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
                                hideIndicator()
                                input.show();
                                subBTN.show();
                                isListening = false;
                            };

                            async function takeCommand(message) {
                                try {
                                    // console.log(message);
                                    $('#popup-continuation-speech').removeClass('active');

                                     // List of valid commands
                                    const validCommandsCancel = ['exit', 'close', 'stop', 'cancel'];
                                    const validCommandsYes = ['yes', 'exactly', 'doit', 'yup','next', 'ofcourse','yep','do it', 'perfect'];
                                    const validCommandsNo = ['no', 'nope', 'wrong', 'bobo', 'not exactly'];

                                    if (validCommandsYes.some(commands => message.includes(commands))) {
                                        recognition.stop();
                                        stopSpeaking();
                                        startSessionTimer()
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
                                    } else if (validCommandsNo.some(command => message.includes(command))) {
                                        // Handle 'no' case
                                        $('#popup-continuation-speech').toggleClass('active');
                                        startSessionTimer()
                                        startToSpeak(
                                                'Oh, sorry! can speak again or manually type your question!'
                                            )
                                            .then((done) => {
                                                if (done) {
                                                    hideIndicatorSpeaking()
                                                }
                                            })
                                    } else if (validCommandsCancel.some(command => message.includes(command))) {
                                        startSessionTimer()
                                        startToSpeak(
                                                'got it!'
                                            )
                                            .then((done) => {
                                                if (done) {
                                                    $('#popup-continuation-speech').removeClass('active');
                                                    hideIndicatorSpeaking()
                                                }

                                            })
                                        recognition.stop();
                                        stopSpeaking();
                                    } else {
                                        // alert(message)
                                        if(message !== null && message !== ''){
                                            startSessionTimer()
                                            $('#popup-continuation-speech').toggleClass('active');
                                            $('#speech-input').val(message + ' ?');
                                            startToSpeak(message + 'I am right?')
                                                .then((done) => {
                                                    if (done) {
                                                        hideIndicatorSpeaking()
                                                    }
                                                })
                                        }
                                        
                                    }


                                    // recognition.start(); // Resume recognition after responding
                                } catch (error) {
                                    console.error('An error occurred:', error);
                                    // Handle the error as needed
                                }
                            }

                        }
                        break;

                    case 'scanner':
                        if ($(this).hasClass('disabled')) {
                            var scannerMess =
                                "We apologize, but there is currently a scanner issue. Scanning functionality is temporarily unavailable. The icons have been highlighted in red to indicate this issue. Please try again at a later time. Thank you for your understanding.";

                            startToSpeak(scannerMess)
                                .then((finished) => {
                                    if (finished) {
                                        hideIndicatorSpeaking()
                                        // Speech finished
                                        console.log(finished)
                                    }
                                });
                        } else {
                            startToSpeak(
                                    "Kindly Placed your qrcodes on the camera to start authentication process. thank you!"
                                )
                                .then((finished) => {
                                    if (finished) {
                                        hideIndicatorSpeaking()
                                        // Speech finished
                                        console.log(finished)
                                    }
                                });

                            $('#popup-scanner').css({
                                'display': 'flex'
                            })
                        }
                        break;
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
                            .then(async (finished) => {
                                if (finished) {
                                    hideIndicatorSpeaking()
                                    // Speech finished
                                    // console.log(finished)
                                    // subBTN.show()
                                    // $('#overlay-updates').removeClass('active');
                                    $('#popup-continuation').fadeOut(400)
                                    $('#searchModal').css({
                                        "display": 'flex'
                                    })
                                    if (responseData.floor !== "false") {
                                        console.log(responseData.continuation)
                                        boxes.show(); // Ensure boxes are visible before fading in
                                        switch (responseData.continuation) {
                                            case false:
                                                // alert('false response')
                                                console.log('false response')
                                                // Handle the case when continuation is false
                                                //submit auto yes
                                                const response = await fetch('/navi/process', {
                                                    method: 'POST',
                                                    headers: {
                                                        'Content-Type': 'application/json',
                                                        'X-CSRF-TOKEN': csrfToken,
                                                    },
                                                    body: JSON.stringify({
                                                        prompt: `yes`,
                                                    }),

                                                });
                                                //call its own
                                                handleResponse(response)
                                                $('#searchModal').fadeOut(400)
                                                // $('#popup-continuation').css({
                                                //     "display": "flex"
                                                // })
                                                break;

                                            case 'information':
                                                console.log('information response')
                                                // Handle the case when continuation is 'information'
                                                $('#searchModal').fadeOut(400)
                                                const responseT = await fetch('/navi/process', {
                                                    method: 'POST',
                                                    headers: {
                                                        'Content-Type': 'application/json',
                                                        'X-CSRF-TOKEN': csrfToken,
                                                    },
                                                    body: JSON.stringify({
                                                        prompt: `yes`,
                                                    }),

                                                });
                                                //call its own
                                                handleResponse(responseT)
                                                // $('#popup-continuation-teacher').css({
                                                //     "display": "flex"
                                                // });
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
                    if (responseData.modelClass !== 'SchoolHMV') {
                        //original
                        // $('#popup-searchingInfo').toggleClass('active');
                        // updated
                        search2Pops.fadeOut(400)
                        $('#facilityInformationPopup').css({
                            'display': 'flex'
                        });

                        // console.log(responseData)
                        $('.info-title').text(`Available's Information on ${responseData.modelClass}`)
                    }
                    var html = ''
                    var genderColor = ''
                    var genderBackColor = ''
                    responseData.informations.forEach((info, key) => {
                        // console.log(info)
                        switch (responseData.modelClass) {

                            case "EastwoodsFacilities":
                                stopSpeaking()
                                $('.ft').text(`available facilitie's`)
                                $('.fg').text(`list of facilities`)
                                // html += `
                            //     <span class="grid-item" data-info-model="${responseData.modelClass}" data-info-id="${info.id}" data-info-search="${info.facilities}">${info.facilities.toUpperCase()}</span>
                            // `
                                html += `
                                    <div class="abbrev-element designated-teacher mb-3 grid-item-con">
                                        <box-icon name='building-house' type='solid' style="position:absolute;top:-30px;left:45px;fill:#fff;width:80px;height:50px;border-radius:10px;margin-top:15px;background:rgb(3,68,3);"></box-icon><br>
                                        <span class="abbr designated-teacher-t">${info.facilities.toUpperCase()}</span><br>
                                        <hr>
                                        <span class="abbr-m">${info.floor.toUpperCase()}</span> <br/>
                                        <div style="padding:10px;"></div>
                                        <div style="position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); display: flex; align-items: center; justify-content: center;">
                                            <span class="abbr-m btn btn-success grid-item" data-info-model="${responseData.modelClass}" data-info-id="${info.id}" data-info-search="${info.facilities}">Go now?</span>
                                        </div>

                                        
                                    </div>
                                 `
                                break;
                            case "Teacher":
                                stopSpeaking()
                                $('.ft').text(`available teacher's`)
                                $('.fg').text(`list of teachers`)
                                // html += `
                            //     <span class="grid-item" data-info-model="${responseData.modelClass}" data-flo="${info.floor}" data-faci="${info.facility_name}" data-info-id="${info.id}" data-info-search="${info.name}">${info.name.toUpperCase()}</span>
                            // `
                                if (info.gender != 'male') {
                                    genderColor = 'rgb(223, 9, 223)'
                                    // genderBackColor = ''
                                } else {
                                    genderBackColor = 'rgb(3,68,3)'
                                    genderColor = '#fff'
                                }
                                html += `
                                    <div class="abbrev-element designated-teacher mb-3 grid-item-con">
                                        <box-icon name='user' type='solid' style="position:absolute;top:-30px;left:45px;fill:${genderColor};width:80px;height:50px;border-radius:10px;margin-top:15px;background:${genderBackColor};"></box-icon><br>
                                        <span class="abbr designated-teacher-t">${info.name.toUpperCase()}</span><br>
                                        <hr>
                                        <span class="abbr-m">${info.position.toUpperCase()}</span> <br/>
                                        <div style="padding:10px;"></div>
                                        <div style="position: absolute; bottom: 0; left: 50%; transform: translateX(-50%); display: flex; align-items: center; justify-content: center;">
                                            <span class="abbr-m btn btn-success grid-item" data-info-model="${responseData.modelClass}" data-flo="${info.floor}" data-faci="${info.facility_name}" data-info-id="${info.id}" data-info-search="${info.name}">Locate ?</span>
                                        </div>

                                        
                                    </div>
                                 `
                                break;
                            case "SchoolHMV":
                                stopSpeaking()
                                $('#searchModal').fadeOut(400)
                                if (info.type === 'hymn') {
                                    startToSpeak(`Here is the ${info.type} of Eastwoods.`)
                                        .then((finished) => {
                                            hideIndicatorSpeaking()
                                            $('#east-play').append(
                                                `<source src="${info.path}" type="video/mp4">
                                                Your browser does not support the video tag.`
                                            )
                                            // Load the new video source
                                            $('#east-play')[0].load();
                                            $('#east-play')[0].play();

                                            afterElement.addClass('circle-after');
                                            circle.append(afterElement);
                                            $('#hymnPopup').css({
                                                "display": 'flex'
                                            }).hide().fadeIn(500);

                                            // Attach an event listener to the 'ended' event of the video
                                            $('#east-play').on('ended', function() {
                                                // Close the modal, replace this with your actual modal closing logic
                                                startToSpeak(
                                                        `Thank you for Watching Eastwoods Hymns. Have a nice day.`
                                                    )
                                                    .then((finished) => {
                                                        if (finished) {
                                                            hideIndicatorSpeaking()
                                                        }
                                                        // Pause the video
                                                        $('#east-play')[0].pause();
                                                        // Remove the existing <source> element
                                                        $('#east-play source')
                                                            .remove();


                                                        $('#hymnPopup').fadeOut(
                                                            400);
                                                    })

                                            });
                                        })
                                } else {
                                    // let index = 0;
                                    const textToType = info.descriptions;

                                    function typeText() {
                                        $('#mv-text-title').text(info.type);
                                        $('.mv-text').html(
                                            `<span class="typing-text">"${textToType.substring(0, index)}"</span>`
                                        );

                                        index++;

                                        if (index <= textToType.length) {
                                            mvTimeout = setTimeout(typeText,
                                                60); // Adjust the delay as needed
                                        }
                                    }

                                    typeText();


                                    $('#mvPopup').css({
                                        "display": 'flex'
                                    }).hide().fadeIn(400);
                                    startToSpeak(
                                            `Here is the ${info.type} of Eastwoods. ${info.descriptions.replace(/,/g, '.')}`
                                        )
                                        .then((done) => {
                                            if (done) {
                                                hideIndicatorSpeaking()
                                            }
                                        })


                                }

                                break;
                            default:
                                break;
                        }
                    })



                    $('.information-container-fac').html(html)

                    // search functionality
                    $('#search-input').on('input', function() {
                        const searchQuery = $(this).val().toLowerCase();
                        // alert(searchQuery)
                        // Filter grid items based on the search query
                        $('.grid-item-con').each(function() {
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
                        //stop talk
                        stopSpeaking()
                        var infoModel = $(this).data('info-model')
                        var infoId = $(this).data('info-id')
                        var dataFaci = $(this).data('faci')
                        var dataFlo = $(this).data('flo')
                        // just for now
                        var prompt = $(this).data('info-search')

                        $('#popup-searching').removeClass('active');
                        // old
                        // $('#popup-searchingInfo').toggleClass('active');
                        $('#facilityInformationPopup').css({
                            'display': 'flex'
                        });
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
                        // $('#popup-searchingInfo').removeClass('active');
                        $('#facilityInformationPopup').fadeOut(400);
                        $('#popup-continuation').fadeOut(400);
                        // const responseData = await response.json();
                        handleResponse(response)
                    })

                    $(document).off('click', '#searchingInfo-Cancel').on('click', '#searchingInfo-Cancel',
                        function() {
                            $('#facilityInformationPopup').fadeOut(400);
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

            // reset typing text
            function resetTyping() {
                const afterElement = circle.find('.circle-after');
                afterElement.removeClass("circle-after")
                clearTimeout(mvTimeout);
                index = 0;
                $('.mv-text').html('');
            }

            // Function to stop the current speech synthesis
            const stopSpeaking = () => {
                if (currentUtterance) {
                    hideIndicatorSpeaking()
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
                            hideIndicatorSpeaking()
                            // $('.loader').hide();
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
                            // $('.loader').show();
                            //show indicator
                            simulateSpeaking()
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

                // console.log(responseData)
                // Assuming responseData.details is an array of objects with an 'id' property
                const uniqueDetails = Array.from(new Set(responseData.details.map(detail => detail.id)))
                    .map(id => {
                        return responseData.details.find(detail => detail.id === id);
                    });

                // console.log(uniqueDetails);

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

                const validLabelsMale = ['male', 'MR', 'MRX', 'MRN', 'MRE',
                    'MRF', "MRO"
                ]; // Add more labels as needed for abbrev
                const validLabelsFemale = ['female', 'FR', 'FRU', 'FRF',
                    'FRZ'
                ]; // Add more labels as needed for abbrev

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
                                // point.text(coordinates.label !== null ? truncateText(coordinates
                                //     .label, 7) : '');
                                // Check if an element with the same label already exists
                                const existingElement = $('.grid-point[data-label="' + coordinates.sublabel + '"]');
                                if (existingElement.length > 0) {
                                    // If an element with the same label exists, set the text of the new element to blank
                                    point.text('');
                                } else {
                                    // If no element with the same label exists, set the text based on coordinates.label
                                    point.text(coordinates.label !== null ? truncateText(coordinates.label, 7) : '');
                                }
                                gridContainer.append(point).fadeIn(
                                    'slow'); // Append the point to the grid container using jQuery
                                // point.addClass(coordinates.isBlock === 'true' ? 'blocked' : '');

                                let currentEntry = coordinates;
                                // Check if the combination of label and sublabel is unique
                                let entryKey = currentEntry.label + currentEntry.sublabel;
                                if (coordinates.label !== null && coordinates.sublabel !== null && !
                                    uniqueEntries.has(entryKey)) {
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
                                    // console.log("nag true mna", isTargetFound)
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

                                if (coordinates.label === 'stair-in' && floorIndex < len - 1) {
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
                                    // console.log(startingX, startingY, targetX, targetY)
                                    dijkstra(startingX, startingY, targetX, targetY);


                                }
                                if (floorIndex < len - 1) {
                                    // console.log("ito yun")
                                    startingX = 0;
                                    startingY = 0;
                                }

                            });

                            // Create a new variable to store the filtered gridDetails
                            var filteredServerResponds = {};

                            // for (var key in serverResponds) {
                            if (serverResponds.hasOwnProperty(floorIndex)) {

                                var gridDetails = serverResponds[floorIndex]['gridDetails'];
                                // console.log('gridDetails')
                                // console.log(serverResponds[floorIndex]['gridDetails'])
                                // Create a Set to track unique labels
                                var seenLabels = new Set();

                                // Filter duplicates based on the label property within the forEach loop
                                var filteredGridDetails = gridDetails.filter(function(item) {
                                    var label = item['label'];

                                    // Check if label is non-null and unique
                                    if (label !== null && !seenLabels.has(label)) {
                                        seenLabels.add(label);
                                        return true;
                                    }
                                    return false;
                                });

                                // Create a new object with the filtered gridDetails
                                filteredServerResponds[floorIndex] = {
                                    ...serverResponds[floorIndex],
                                    gridDetails: filteredGridDetails,
                                };
                            }
                            // }


                            //populate the keys
                            populateKeys(floorIndex, filteredServerResponds)

                            // populates the keys
                            function populateKeys(key, filteredServerRespondsData) {
                                var keysDisplay = ''
                                var icons = ''
                                var iconText = ''
                                const male = ['male', 'MR', 'MRX', 'MRN', 'MRE', "MRO",
                                    'MRF'
                                ]; // Add more labels as needed for abbrev
                                const female = ['female', 'FR', 'FRU', 'FRF',
                                    'FRZ'
                                ]; // Add more labels as needed for abbrev
                                filteredServerRespondsData[key]['gridDetails'].forEach(data => {
                                    switch (data.label) {
                                        case 'wall':
                                            icons =
                                                `<i class="fa-regular fa-rectangle-xmark fa-lg" style="color: #511f24;"></i>`
                                            iconText = `Blocked Cell`
                                            break;
                                        case 'front':
                                            icons = `<i class="fa-solid fa-street-view fa-lg"></i>`
                                            iconText = `Student Lounge`
                                            break;
                                        case 'stair-in':
                                            icons =
                                                `<i class="fa-solid fa-stairs fa-lg" style="color: #0f56d2;"></i>`
                                            iconText = `Stairs`
                                            break;
                                        case 'guard house':
                                            icons =
                                                `<i class="fa-solid fa-person-military-pointing fa-lg"></i>`
                                            iconText = data.sublabel
                                            break;

                                        case 'front':
                                            icons =
                                                `<i class="fa-solid fa-street-view fa-lg"></i>`
                                            iconText = `Your location`
                                            break;

                                        default:
                                            icons = data.label
                                            iconText = data.sublabel
                                            break;
                                    }

                                    // for rest room
                                    if (female.includes(data.label)) {
                                        icons =
                                            `<i class="fa-solid fa-person-dress fa-lg" style="color: #eb05c1;"></i>`
                                    }
                                    if (male.includes(data.label)) {
                                        icons =
                                            `<i class="fa-solid fa-person fa-lg" style="color: #0f56d2;"></i>`
                                    }



                                    keysDisplay += `
                                        <div class="keys mb-2">
                                            <span class="floor-keys">${icons}</span>
                                            <span class="floor-mean">${iconText}</span>
                                        </div>
                                        `
                                })

                                $('#keysDisplay').html(keysDisplay)
                            }
                            // console.log()
                            // starting point x, y  target x,y

                            // working problem is the color combination

                            var labelCounts = {};

                            // Function to generate a random color
                            function getRandomColor() {
                                // Convert the background color to HSL
                                var baseHSL = rgbToHsl(0, 3, 3.9); // RGB values for #263024

                                // Generate a random color with a similar hue and lighter lightness
                                var hue = (baseHSL[0] + Math.random() * 30) % 360; // Adjust 30 as needed
                                var saturation = 50 + Math.random() * 10; // Adjust as needed
                                var lightness = 60 + Math.random() * 40; // Adjust for a lighter range

                                // Convert HSL back to RGB
                                var rgbColor = hslToRgb(hue, saturation, lightness);

                                // Format RGB values to a CSS color string
                                return "rgb(" + rgbColor.join(", ") + ")";
                            }

                            // Convert RGB to HSL
                            function rgbToHsl(r, g, b) {
                                r /= 255;
                                g /= 255;
                                b /= 255;

                                var max = Math.max(r, g, b),
                                    min = Math.min(r, g, b);

                                var h,
                                    s,
                                    l = (max + min) / 2;

                                if (max == min) {
                                    h = s = 0; // achromatic
                                } else {
                                    var d = max - min;
                                    s = l > 0.5 ? d / (2 - max - min) : d / (max + min);

                                    switch (max) {
                                        case r:
                                            h = (g - b) / d + (g < b ? 6 : 0);
                                            break;
                                        case g:
                                            h = (b - r) / d + 2;
                                            break;
                                        case b:
                                            h = (r - g) / d + 4;
                                            break;
                                    }

                                    h /= 6;
                                }

                                return [h * 360, s * 100, l * 100];
                            }

                            // Convert HSL to RGB
                            function hslToRgb(h, s, l) {
                                h /= 360;
                                s /= 100;
                                l /= 100;

                                var r, g, b;

                                if (s === 0) {
                                    r = g = b = l; // achromatic
                                } else {
                                    function hue2rgb(p, q, t) {
                                        if (t < 0) t += 1;
                                        if (t > 1) t -= 1;
                                        if (t < 1 / 6) return p + (q - p) * 6 * t;
                                        if (t < 1 / 2) return q;
                                        if (t < 2 / 3) return p + (q - p) * (2 / 3 - t) * 6;
                                        return p;
                                    }

                                    var q = l < 0.5 ? l * (1 + s) : l + s - l * s;
                                    var p = 2 * l - q;

                                    r = hue2rgb(p, q, h + 1 / 3);
                                    g = hue2rgb(p, q, h);
                                    b = hue2rgb(p, q, h - 1 / 3);
                                }

                                return [
                                    Math.round(r * 255),
                                    Math.round(g * 255),
                                    Math.round(b * 255),
                                ];
                            }

                            // Iterate through each element with data-label attribute
                            $(".grid-point").each(function() {
                                var dataLabel = $(this).text();
                                // console.log('ginagawa')
                                console.log(dataLabel)
                                // Count occurrences of each data-label
                                labelCounts[dataLabel] = (labelCounts[dataLabel] || 0) + 1;
                                // Add a class based on the data label
                                if (labelCounts[dataLabel] > 1) {
                                    $(this).addClass('group-' + dataLabel);
                                }
                            });

                            // Display the counts and set a random background color for elements with more than one occurrence
                            // for (var label in labelCounts) {
                            //     console.log(label)
                            //     if (
                            //         labelCounts.hasOwnProperty(label) &&
                            //         labelCounts[label] > 0 && label.trim() !== ""
                            //     ) {
                            //         console.log(
                            //             "Data Label:",
                            //             label,
                            //             "Count:",
                            //             labelCounts[label]
                            //         );

                            //         // Set a random background color for all elements with the specific data-label
                            //         var randomColor = getRandomColor();
                            //        // Filter the elements based on the text content
                            //         $(".grid-point").filter(function() {
                            //             return $(this).text().trim() === label;
                            //         }).css("background-color", randomColor);
                            //     }
                            // }
                            // working problem is the color combination



                            // speak the guidelines
                            startToSpeak(responseData.navigationMessage[floorIndex])
                                .then((done) => {
                                    if (done) {
                                        hideIndicatorSpeaking()
                                    }
                                })
                            if (!prevBool) {
                                floorIndex++; // Move to the next floor
                                setTimeout(() => createGridPoints(facility, false),
                                    6000); // Display the next floor after 10 seconds
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
                        // console.log(floorIndex);
                        
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
                        floorIndex--; // Decrement floorIndex
                    } else {
                        $(this).prop("disabled", true).addClass('btn btn-secondary').hide();
                        $('#next-floor-button').prop("disabled", false).show();
                    }
                });

                // Next button preview
                $(document).on('click', '#next-floor-button', function() {
                    if (floorIndex < len) {
                        console.log(floorIndex);
                        
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
                        floorIndex++; // Increment floorIndex
                    } else {
                        $(this).prop("disabled", true).addClass('btn btn-secondary').hide();
                        $('#back-floor-button').prop("disabled", false).show();
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
                                        "passed"
                                    ); // Highlight the current node as passed

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
                                        await new Promise((resolve) => setTimeout(
                                            resolve, 400));

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
                            hideIndicatorSpeaking()
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
                } else {
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
                $('#designatedPopup').css({
                    'display': 'flex'
                })

            });

            $('#preview-Cancel').on('click', function() {
                $("#myModal").modal("show");
                $('#popup-designated').removeClass('active')
            })

            //random response for exit
            function ranExit() {
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
                startToSpeak(ranExit())
                    .then((done) => {
                        if (done) {
                            hideIndicatorSpeaking()
                        }
                    })
                setTimeout(function() {
                    $('#searchModal').fadeOut(500);
                    $('#popup-continuation').fadeOut(500);
                }, boxes.length * 500);
            });

            $(document).on('click', '.box-content', async function() {
                stopSpeaking()
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
                resetTyping()
                abbrevPeriodicTable.empty()
                stopSpeaking()
                startToSpeak(ranExit())
                    .then((done) => {
                        if (done) {
                            hideIndicatorSpeaking()
                        }
                    })
                $('#navigationPopup').fadeOut(500);
                // Remove the existing <source> element
                // Pause the video
                $('#east-play')[0].pause();
                $('#east-play source').remove();
                $('#hymnPopup').fadeOut(400);
                $('#mvPopup').fadeOut(400);
                $('#facilityInformationPopup').fadeOut(400);
                $('#designatedPopup').fadeOut(500);
                search2Pops.css({
                    'display': 'flex'
                });
            })

            //back
            $(document).on('click', '.mv-back', function() {
                resetTyping()
                stopSpeaking()
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
                resetTyping()
                stopSpeaking()
                abbrevPeriodicTable.empty()
                startToSpeak(
                        ranExit())
                    .then((done) => {
                        if (done) {
                            hideIndicatorSpeaking()
                        }
                    })
                $('#popup-continuation').fadeOut(500);
                $('#searchModal').css({
                    "display": 'flex'
                }).hide().fadeIn(500);;
                search2Pops.css({
                    'display': 'flex'
                });
            })

            // open abbrev popups
            $(document).on('click', '.abbrev-means', function() {
                resetTyping()
                stopSpeaking()
                // $('#navigationPopup').fadeOut(500);
                $('#abbrevPopup').css({
                    "display": 'flex'
                }).hide().fadeIn(500);
            })
            $(document).on('click', '.abbrev-means-back', function() {
                resetTyping()
                stopSpeaking()
                // abbrevPeriodicTable.empty()
                $('#navigationPopup').css({
                    "display": 'flex'
                }).hide().fadeIn(50);
                $('#abbrevPopup').fadeOut(500);
                $('#designatedPopup').fadeOut(500);
            })
            $(document).on('click', '.des-back-home', function() {
                resetTyping()
                stopSpeaking()
                $('#navigationPopup').css({
                    "display": 'flex'
                }).hide().fadeIn(50);
                $('#designatedPopup').fadeOut(500);
            })

            //populates abbrev
            function populatesAbbrev(ab, abm) {

                abbrevPeriodicTable.append(`
                    <div class="abbrev-element"><span class="abbr">${ab}</span><br><span class="abbr-m">${abm}</span></div>
                `)
            }

            // This method will trigger user permissions
            const availableCamera = () => {
                return Html5Qrcode.getCameras()
                    .then((devices) => {
                        /**
                         * devices would be an array of objects of type:
                         * { id: "id", label: "label" }
                         */
                        if (devices && devices.length) {
                            // i want to return only the first one camera
                            var availableCamera = devices[0];
                            return availableCamera;
                        }
                    })
                    .catch((err) => {
                        // handle err
                        throw err; // Re-throw the error to be caught later
                    });
            };

            const html5QrCode = new Html5Qrcode( /* element id */ "reader");
            let scannerIsRunning = false;

            async function startScanner(camera) {
                try {
                    await html5QrCode.start(
                        camera.id, {
                            fps: 20,
                            qrbox: {
                                width: 250,
                                height: 250
                            },
                        },
                        async (decodedText, decodedResult) => {
                                stopScanner();
                                const data = {};
                                const fields = decodedResult.decodedText.split(", ");
                                fields.forEach((field) => {
                                    const [key, value] = field.split(": ");
                                    data[key] = value;
                                });



                                console.log(data);
                                stopSpeaking()
                                if (data.type === "Eastwoods" && isValidNumber(data.code)) {
                                    startToSpeak('Welcome to eastwoods, have a nice day.')
                                        .then((finished) => {
                                            if (finished) {
                                                hideIndicatorSpeaking()
                                            }
                                            $('#popup-scanner').removeClass('active')
                                        })
                                } else {
                                    // Attach click event to the button
                                    // $('#autoClicker').on('click', buttonClickHandler);
                                    // $('#autoClicker').trigger('click');

                                    var updatesCompleted =
                                        "Im sorry but this qr is not recognized. Authentication Failed!"

                                    startToSpeak(updatesCompleted)
                                        .then(async (finished) => {
                                            if (finished) {
                                                hideIndicatorSpeaking()
                                                input.hide()
                                                subBTN.hide()
                                                const camera = await availableCamera();
                                                startScanner(camera);
                                            } else {
                                                console.log('not finished')
                                            }
                                        })

                                }

                            },
                            (errorMessage) => {
                                // parse error, ignore it.
                                console.log(errorMessage);
                            }
                    );
                    scannerIsRunning = true;
                } catch (err) {
                    // Start failed, handle it.
                    console.log(err);
                    stopScanner()
                    const camera = await availableCamera();
                    startScanner(camera);
                }
            }

            // Function to check if a string is a valid number
            function isValidNumber(str) {
                // Use regular expression to check if the string consists only of digits
                return /^\d+$/.test(str);
            }

            function stopScanner() {
                if (scannerIsRunning) {
                    html5QrCode.stop().then(() => {
                        scannerIsRunning = false;
                    });
                }
            }

            (async function() {
                try {
                    const camera = await availableCamera();
                    console.log(camera);

                    const response = await fetch('/auth-required', {
                        method: 'GET',
                        headers: {
                            'Content-Type': 'application/json',
                            'X-CSRF-TOKEN': csrfToken,
                        },

                    });
                    // const responseData = await response.json();
                    // handleResponse(response)
                    const responseData = await response.json();

                    // console.log(responseData)

                    if (!responseData.auth.status) {

                        stopSpeaking()
                        stopScanner()
                        $('#popup-scanner').removeClass('active')

                    } else {

                        stopSpeaking()
                        input.hide()
                        subBTN.hide()
                        $('#popup-scanner').toggleClass('active')
                        startScanner(camera);
                        // Call startSessionTimer when the user logs in

                    }
                } catch (error) {
                    console.error(error);
                }
            })();

            

            function startSessionTimer() {
                // Reset the timer on any user interaction (mousemove, keypress, or touch)
                $(document).on('mousemove keypress touchstart', resetSessionTimer);

                // Start the timer
                timeoutId = setTimeout(startLogoutCountdown, sessionTimeout);
            }

            function resetSessionTimer() {
                // Reset both the session timeout and countdown interval
                console.log('Timer is reset...');
                clearTimeout(timeoutId);
                clearInterval(countdownInterval);
                $('#popup-count').removeClass('active');
                $('#c').text("0" + 5);
                // Start the timer again
                timeoutId = setTimeout(startLogoutCountdown, sessionTimeout);
            }

            function startLogoutCountdown() {
                // Display a warning message or trigger some visual indication
                console.log('Session will expire soon. Please interact to continue.');
                //   $('#popup-scanner').removeClass('active');
                $('#popup-count').addClass('active');

                // Start a countdown (adjust the duration as needed)
                let countdown = 5; // 5 seconds warning
                countdownInterval = setInterval(() => {
                    // console.log(countdown);
                    countdown--;
                    if (countdown !== -1) {
                        $('#c').text("0" + countdown);
                    }

                    if (countdown < 0) {
                        clearInterval(countdownInterval);
                        logoutUser();
                    }
                }, 1000); // Update every second
            }

            function logoutUser() {
                // Perform logout actions (e.g., redirect to logout endpoint on the server)
                console.log('User logged out due to inactivity.');
                window.location.reload();
            }

            // Call startSessionTimer when the user logs in
            startSessionTimer();

            // Function to display the speech indicator
            function showIndicator() {
                const speechIndicator = document.getElementById('speechIndicator');
                speechIndicator.style.display = 'flex';
            }

            // Function to hide the speech indicator
            function hideIndicator() {
                const speechIndicator = document.getElementById('speechIndicator');
                speechIndicator.style.display = 'none';
            }

            // Function to update the HTML content of the speech indicator
            function updateIndicatorText(html) {
                const textContainer = document.querySelector('.speech-bubble .text-container');
                textContainer.innerHTML = html;
            }

            // You can simulate changes in the indicator based on your logic
            function simulateSpeaking() {
                // Display the indicator
                showIndicatorSpeaking();
            }

            // Function to display the speech indicator
            function showIndicatorSpeaking() {
                const speechIndicator = document.getElementById('speakingIndicator');
                speechIndicator.style.display = 'flex';
            }

            // Function to hide the speech indicator
            function hideIndicatorSpeaking() {
                const speechIndicator = document.getElementById('speakingIndicator');
                speechIndicator.style.display = 'none';
            }

            // Check if the page is refreshed
            if (performance.navigation.type === 1) {
                stopSpeaking()
                hideIndicator()
                hideIndicatorSpeaking()
            } else {
                console.log('Page is not refreshed');
            }

            // indicator speech
            // showIndicator();

        });
    </script>
@endsection
