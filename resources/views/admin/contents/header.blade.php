<header id="page-topbar">
    <div class="navbar-header">
        <div class="d-flex">
            <!-- LOGO -->
            <div class="navbar-brand-box">
                <a class="logo logo-dark">
                    <span class="logo-sm">
                        <img src="backend/assets/images/epcst_logo.png" alt="logo-sm" height="22">
                    </span>
                    {{-- <span class="logo-lg">
                        <h4 class="card-title font-size-16 mt-2"> Eastwoods Professional College of Science and Technology</h4>
                    </span> --}}
                </a>

                <a class="logo logo-light">
                    <span class="logo-sm">
                        <img src="backend/assets/images/epcst_logo.png" alt="logo-sm-light" height="22">
                    </span>
                    {{-- <span class="logo-lg">
                        <h4 class="font-size-16 mt-2"> Eastwoods Professional College of Science and Technology</h4>
                    </span> --}}
                </a>
            </div>

            <button type="button" class="btn btn-sm px-3 font-size-24 header-item waves-effect" id="vertical-menu-btn">
                <i class="ri-menu-2-line align-middle"></i>
            </button>
        </div>

        <div class="d-flex">

            <div class="dropdown d-inline-block">
                <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-notifications-dropdown"
                      data-bs-toggle="dropdown" aria-expanded="false">
                    <i class="ri-notification-3-line"></i>
                    <span class="noti-dot"></span>
                </button>
                <div class="dropdown-menu dropdown-menu-lg dropdown-menu-end p-0"
                    aria-labelledby="page-header-notifications-dropdown">
                    <div class="p-3">
                        <div class="row align-items-center">
                            <div class="col">
                                <h6 class="m-0"> Notifications </h6>
                            </div>
                            <div class="col-auto">
                                {{-- <p class="text-primary"> New updates</p> --}}
                            </div>
                        </div>
                    </div>
                    <div data-simplebar style="max-height: 230px; overflow-y:auto;" class="notif-container">
                        <a class="text-reset notification-item">
                            <div class="d-flex">
                                <img src="{{ asset('icons/uptodate.png') }}"
                                    class="me-3 rounded-circle avatar-xs" alt="user-pic">
                                <div class="flex-1">
                                    <h6 class="mb-1 text-success">Exousia-Navi is up to date.</h6>
                                    <div class="font-size-12 text-muted">
                                        <p class="mb-0"><i class="mdi mdi-clock-outline"></i> No updates available</p>
                                    </div>
                                </div>
                            </div>
                        </a>
                    </div>
                    <div class="p-2 border-top">
                        <div class="d-grid">
                            <a class="btn btn-sm btn-link font-size-14 text-center updates-btn" href="{{ route('admin.updates') }}">
                                <i class="mdi mdi-arrow-right-circle me-1"></i> Update System Now
                            </a>
                        </div>
                    </div>
                </div>
            </div>

            <div class="dropdown d-none d-lg-inline-block ms-1">
                <button type="button" class="btn header-item noti-icon waves-effect" data-toggle="fullscreen">
                    <i class="ri-fullscreen-line"></i>
                </button>
            </div>

            <div class="dropdown d-inline-block user-dropdown">
                <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                    data-bs-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    <img class="rounded-circle header-profile-user" src="{{ asset('backend/assets/images/users/avatar-9.ico') }}"
                        alt="Header Avatar">
                    <span class="d-none d-xl-inline-block ms-1">Administrator</span>
                    <i class="mdi mdi-chevron-down d-none d-xl-inline-block"></i>
                </button>
                <div class="dropdown-menu dropdown-menu-end">
                    <!-- item-->
                    <a class="dropdown-item" href="{{ route('profile.edit') }}"><i class="ri-user-line align-middle me-1"></i> Profile</a>
                    
                    <div class="dropdown-divider"></div>
                    {{-- <a class="dropdown-item text-danger" href="#"><i class="ri-shut-down-line align-middle me-1 text-danger"></i> Logout</a> --}}
                    <!-- Authentication -->
                    <form method="POST" action="{{ route('logout') }}">
                        @csrf
                        <a class="dropdown-item text-danger" href="{{ route('logout') }}" onclick="event.preventDefault();this.closest('form').submit();"><i
                            class="ri-shut-down-line align-middle me-1 text-danger"></i> Logout</a>

                    </form>
                </div>
            </div>

            <div class="dropdown d-inline-block">
                <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
                    <i class="ri-settings-2-line"></i>
                </button>
            </div>

        </div>
    </div>
</header>