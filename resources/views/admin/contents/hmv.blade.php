@extends('admin.admin-dashboard')

@section('links')
    <meta charset="utf-8" />
    <title>Dashboard | Exousia Navi</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
    <meta content="Themesdesign" name="author" />
    <!-- App favicon -->
    <link rel="shortcut icon" href="{{ asset('backend/assets/images/favicon.ico') }}">

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
                                <li class="breadcrumb-item active">HMV's</li>
                            </ol>
                        </div>

                    </div>
                </div>
            </div>
            <!-- end page title -->

            <div class="row">

                @foreach ($hmns as $type => $group)
                    @foreach ($group as $model)
                        {{-- <li>Name: {{ $model->type }}</li> --}}
                        @switch($model->type)
                            @case('mission')
                                {{-- Mission --}}
                                <div class="col-xl-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title mb-4">
                                                <i
                                                    class="ri-checkbox-blank-circle-fill font-size-10 text-danger align-middle me-2"></i>
                                                Manage Mission Information
                                            </h4>
                                            <div class="table-responsive">
                                                <form action="{{ route('mission') }}" method="post" class="form-control"
                                                    style="position: relative;">
                                                    @csrf
                                                    <textarea class="form-control text-justify" name="mission" id="wordCountMission" rows="12" maxlength="500">
                                                        {{ $model->descriptions }}
                                                    </textarea>
                                                    <small id="wordCount" class="form-text text-muted"
                                                        style="position: absolute;right:12px;">Word count: 0</small>

                                                    <input type="submit" class="btn btn-danger" value="Update Mission">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @break

                            @case('vision')
                                {{-- Vision --}}
                                <div class="col-xl-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title mb-4">
                                                <i
                                                    class="ri-checkbox-blank-circle-fill font-size-10 text-danger align-middle me-2"></i>
                                                Manage Vision Information
                                            </h4>
                                            <div class="table-responsive">
                                                <form action="{{ route('vision') }}" method="post" class="form-control"
                                                    style="position: relative;">
                                                    @csrf
                                                    <textarea class="form-control" name="vision" id="wordCountVision" rows="12" maxlength="500" required>
                                                        {{ $model->descriptions }}
                                                    </textarea>
                                                    <small id="wordCountVisionT" class="form-text text-muted"
                                                        style="position: absolute;right:12px;">Word count: 0</small>

                                                    <input type="submit" class="btn btn-danger" value="Update Vision">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @break

                            @case('hymn')
                                {{-- Hymn --}}
                                <div class="col-xl-4">
                                    <div class="card">
                                        <div class="card-body">
                                            <h4 class="card-title mb-4">
                                                <i
                                                    class="ri-checkbox-blank-circle-fill font-size-10 text-danger align-middle me-2"></i>
                                                Manage Hymn Information
                                            </h4>
                                            <div class="table-responsive">
                                                <form action="#" method="post" class="form-control"
                                                    style="position: relative;">
                                                    @csrf
                                                    <lord-icon src="https://cdn.lordicon.com/ilsmzilo.json" trigger="hover"
                                                        style="width:350px;height:230px;" data-path="{{ $model->path }}">
                                                    </lord-icon>
                                                    <p class="text-center">Eastwoods Hymn</p>
                                                    <input type="button" class="btn btn-danger" id="upt"
                                                        value="Update Hymn">
                                                </form>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            @break

                            @default
                        @endswitch
                    @endforeach
                @endforeach
            </div>


            @include('admin.modal.hymn')
            @include('admin.modal.upload')

        </div>

    </div>
@endsection

@section('scripts')
    <!-- JAVASCRIPT -->

    <script src="{{ asset('backend/assets/libs/jquery/jquery.min.js') }}"></script>
    <script src="{{ asset('backend/assets/libs/bootstrap/js/bootstrap.bundle.min.js') }}"></script>
    <script src="{{ asset('backend/assets/libs/metismenu/metisMenu.min.js') }}"></script>
    <script src="{{ asset('backend/assets/libs/simplebar/simplebar.min.js') }}"></script>
    <script src="{{ asset('backend/assets/libs/node-waves/waves.min.js') }}"></script>




    <!-- jquery.vectormap map -->
    <script src="{{ asset('backend/assets/libs/admin-resources/jquery.vectormap/jquery-jvectormap-1.2.2.min.js') }}">
    </script>
    <script src="{{ asset('backend/assets/libs/admin-resources/jquery.vectormap/maps/jquery-jvectormap-us-merc-en.js') }}">
    </script>

    <!-- toastr plugin -->
    <script src="{{ asset('backend/assets/libs/toastr/build/toastr.min.js') }}"></script>
    <!-- toastr init -->
    <script src="{{ asset('backend/assets/js/pages/toastr.init.js') }}"></script>
    <!-- App js -->
    <script src="{{ asset('backend/assets/js/app.js') }}"></script>

    <script src="https://cdn.lordicon.com/lordicon.js"></script>
    {{-- custom --}}
    <script>
        $(document).ready(function() {
            $('#wordCountMission').on('input', function() {
                countWordMission();
            });
            $('#wordCountVision').on('input', function() {
                countWordVision();
            });

            $(document).on('click', 'lord-icon', function() {
                var path = $(this).data('path')
                $('#player').html(`
                    <source src="${path}" type="video/mp4">
                    Your browser does not support the video tag.
                `)
                $('#hymnModal').modal('show')
            })

            $(document).on('click', '#upt', function() {
                $('#uploadModal').modal('show')
            })

            $('#videoInput').change(function() {
                previewVideo();
            });

            $(document).on('click','.btnCloseUpload', function(){
                $('#videoForm')[0].reset();
                $('#videoPreview').attr('src', '').hide();

                // Close the modal
                $('#uploadModal').modal('hide');
            })

            function previewVideo() {
                const videoInput = $('#videoInput')[0];
                const videoPreview = $('#videoPreview')[0];

                if (videoInput.files && videoInput.files[0]) {
                    const reader = new FileReader();

                    reader.onload = function(e) {
                        videoPreview.src = e.target.result;
                        videoPreview.style.display = 'block';
                    };

                    reader.readAsDataURL(videoInput.files[0]);
                } else {
                    videoPreview.src = '';
                    videoPreview.style.display = 'none';
                }
            }

            function countWordMission() {
                const textareaValue = $('#wordCountMission').val();
                const wordCount = textareaValue.trim().split(/\s+/).filter(word => word.length > 0).length;
                $('#wordCount').text(`Word count: ${wordCount}`);
            }

            function countWordVision() {
                const textareaValue = $('#wordCountVision').val();
                const wordCount = textareaValue.trim().split(/\s+/).filter(word => word.length > 0).length;
                $('#wordCountVisionT').text(`Word count: ${wordCount}`);
            }
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
