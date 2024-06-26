<div data-simplebar class="h-100">

    <!-- User details -->
    <div class="user-profile text-center mt-3">
        <div class="">
            <img src="{{ asset('backend/assets/images/epcst_logo.png') }}" alt="" class="avatar-md rounded-circle">
        </div>
        <div class="mt-3">
            <h4 class="font-size-16 mb-1">Administrator</h4>
            <span class="text-muted"><i class="ri-record-circle-line align-middle font-size-14 text-success"></i>
                Online</span>
        </div>
    </div>

    <!--- Sidemenu -->
    <div id="sidebar-menu">
        <!-- Left Menu Start -->
        <ul class="metismenu list-unstyled" id="side-menu">
            <li class="menu-title">Menu</li>

            <li>
                <a href="{{ route('dashboard') }}" class="waves-effect">
                    <i class="ri-dashboard-line"></i>
                    {{-- <span class="badge rounded-pill bg-success float-end">3</span> --}}
                    <span>Dashboard</span>
                </a>
            </li>

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-mail-send-line"></i>
                    <span>Information</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                    <li><a href="{{ route('admin.table', ['parameter' => 'teachers', 'actions'=>'destroy_t', 'routes'=>'admin.teachers']) }}">Teacher's</a></li>
                    <li><a href="{{ route('admin.table', ['parameter' => 'eastwoods_facilities', 'actions'=>'destroy_ef', 'routes'=>'admin.facilities']) }}">Facilities</a></li>
                    {{-- <li><a href="{{ route('admin.table', ['parameter' => 'teachers', 'actions'=>'destroy_e']) }}">Events</a></li> --}}
                    <li><a href="{{ route('admin.table', ['parameter' => 'frequentlies', 'actions'=>'destroy_f', 'routes'=>'admin.frequently']) }}">Frequently Ask</a></li>
                    <li><a href="{{ route('hmv') }}">HMV</a></li>
                </ul>
            </li>

            {{-- <li>
                <a href="calendar.html" class=" waves-effect">
                    <i class="ri-calendar-2-line"></i>
                    <span>Calendar</span>
                </a>
            </li> --}}

            {{-- <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-mail-send-line"></i>
                    <span>Facilities</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                    <li><a href="email-inbox.html">First Floor</a></li>
                    <li><a href="email-inbox.html">Second Floor</a></li>
                    <li><a href="email-inbox.html">Third Floor</a></li>
                    <li><a href="email-inbox.html">Fourth Floor</a></li>
                    <li><a href="email-inbox.html">Fifth Floor</a></li>
                    <li><a href="email-inbox.html">Sixth Floor</a></li>
                    <li><a href="email-inbox.html">Seventh Floor</a></li>
                </ul>
            </li> --}}

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-layout-3-line"></i>
                    <span>Building Layouts</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li><a href="{{ route('admin.building.layouts') }}">Floor Plan</a></li>
                    {{-- <li><a href="{{ route('admin.building.layouts.get') }}">Test Floor Layout</a></li> --}}
                    <li><a href="{{ route('deployed') }}">Deployed Floor Layout</a></li>
                </ul>
            </li>

            <li class="menu-title">Pages</li>

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-account-circle-line"></i>
                    <span>Functionality</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                    <li><a href="{{ route('func.manage') }}">Manage System</a></li>
                    <li><a id="generate_qr">Generate QR Codes</a></li>
                </ul>
            </li>

            {{-- <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-profile-line"></i>
                    <span>Utility</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                    <li><a href="pages-starter.html">Starter Page</a></li>
                    <li><a href="pages-timeline.html">Timeline</a></li>
                    <li><a href="pages-directory.html">Directory</a></li>
                    <li><a href="pages-invoice.html">Invoice</a></li>
                    <li><a href="pages-404.html">Error 404</a></li>
                    <li><a href="pages-500.html">Error 500</a></li>
                </ul>
            </li> --}}

            {{-- <li class="menu-title">Components</li>

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-pencil-ruler-2-line"></i>
                    <span>UI Elements</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                    <li><a href="ui-alerts.html">Alerts</a></li>
                    <li><a href="ui-buttons.html">Buttons</a></li>
                    <li><a href="ui-cards.html">Cards</a></li>
                    <li><a href="ui-carousel.html">Carousel</a></li>
                    <li><a href="ui-dropdowns.html">Dropdowns</a></li>
                    <li><a href="ui-grid.html">Grid</a></li>
                    <li><a href="ui-images.html">Images</a></li>
                    <li><a href="ui-lightbox.html">Lightbox</a></li>
                    <li><a href="ui-modals.html">Modals</a></li>
                    <li><a href="ui-offcanvas.html">Offcavas</a></li>
                    <li><a href="ui-progressbars.html">Progress Bars</a></li>
                    <li><a href="ui-tabs-accordions.html">Tabs & Accordions</a></li>
                    <li><a href="ui-typography.html">Typography</a></li>
                    <li><a href="ui-video.html">Video</a></li>
                    <li><a href="ui-general.html">General</a></li>

                </ul>
            </li>

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-vip-crown-2-line"></i>
                    <span>Advanced UI</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                    <li><a href="advance-rangeslider.html">Range Slider</a></li>
                    <li><a href="advance-roundslider.html">Round Slider</a></li>
                    <li><a href="advance-session-timeout.html">Session Timeout</a></li>
                    <li><a href="advance-sweet-alert.html">Sweetalert 2</a></li>
                    <li><a href="advance-rating.html">Rating</a></li>
                    <li><a href="advance-notifications.html">Notifications</a></li>
                </ul>
            </li>

            <li>
                <a href="javascript: void(0);" class="waves-effect">
                    <i class="ri-eraser-fill"></i>
                    <span class="badge rounded-pill bg-danger float-end">8</span>
                    <span>Forms</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                    <li><a href="form-elements.html">Form Elements</a></li>
                    <li><a href="form-validation.html">Form Validation</a></li>
                    <li><a href="form-advanced.html">Form Advanced Plugins</a></li>
                    <li><a href="form-editors.html">Form Editors</a></li>
                    <li><a href="form-uploads.html">Form File Upload</a></li>
                    <li><a href="form-xeditable.html">Form X-editable</a></li>
                    <li><a href="form-wizard.html">Form Wizard</a></li>
                    <li><a href="form-mask.html">Form Mask</a></li>
                </ul>
            </li>

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-table-2"></i>
                    <span>Tables</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                    <li><a href="tables-basic.html">Basic Tables</a></li>
                    <li><a href="tables-datatable.html">Data Tables</a></li>
                    <li><a href="tables-responsive.html">Responsive Table</a></li>
                    <li><a href="tables-editable.html">Editable Table</a></li>
                </ul>
            </li>

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-bar-chart-line"></i>
                    <span>Charts</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                    <li><a href="charts-apex.html">Apex Charts</a></li>
                    <li><a href="charts-chartjs.html">Chartjs Charts</a></li>
                    <li><a href="charts-flot.html">Flot Charts</a></li>
                    <li><a href="charts-knob.html">Jquery Knob Charts</a></li>
                    <li><a href="charts-sparkline.html">Sparkline Charts</a></li>
                </ul>
            </li>

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-brush-line"></i>
                    <span>Icons</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                    <li><a href="icons-remix.html">Remix Icons</a></li>
                    <li><a href="icons-materialdesign.html">Material Design</a></li>
                    <li><a href="icons-dripicons.html">Dripicons</a></li>
                    <li><a href="icons-fontawesome.html">Font awesome 5</a></li>
                </ul>
            </li>

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-map-pin-line"></i>
                    <span>Maps</span>
                </a>
                <ul class="sub-menu" aria-expanded="false">
                    <li><a href="maps-google.html">Google Maps</a></li>
                    <li><a href="maps-vector.html">Vector Maps</a></li>
                </ul>
            </li>

            <li>
                <a href="javascript: void(0);" class="has-arrow waves-effect">
                    <i class="ri-share-line"></i>
                    <span>Multi Level</span>
                </a>
                <ul class="sub-menu" aria-expanded="true">
                    <li><a href="javascript: void(0);">Level 1.1</a></li>
                    <li><a href="javascript: void(0);" class="has-arrow">Level 1.2</a>
                        <ul class="sub-menu" aria-expanded="true">
                            <li><a href="javascript: void(0);">Level 2.1</a></li>
                            <li><a href="javascript: void(0);">Level 2.2</a></li>
                        </ul>
                    </li>
                </ul>
            </li> --}}

        </ul>
    </div>
    <!-- Sidebar -->
</div>
