<div class="modal fade" id="myModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true"
            data-bs-backdrop="static">
            <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content">
                    <div class="modal-header border-0">
                        <h5 class="modal-title me-2" id="exampleModalLabel">
                            <i class="ri-checkbox-blank-circle-fill font-size-10 text-success align-middle me-2"></i>
                            Navigation Guide <span id="span-floor"></span>
                        </h5>
                        <div class="row">
                            <div class="col-auto">
                                <button type="button" class="btn btn-success" id="back-floor-button">
                                    <i class="bi bi-arrow-left"></i> Back
                                </button>
                            </div>
                            <div class="col-auto mx-2"> <!-- Add mx-2 class for horizontal margin -->
                                <button type="button" class="btn btn-success" id="next-floor-button">
                                    Next <i class="bi bi-arrow-right"></i>
                                </button>
                            </div>
                            <div class="col-auto mx-2"> <!-- Add mx-2 class for horizontal margin -->
                                <button type="button" class="btn-close bg-danger" data-bs-dismiss="modal"
                                    aria-label="Close"></button>
                            </div>
                        </div>
                    </div>
                    <div class="modal-body">
                        <div class="col-xl-10">
                            <div class="card">
                                <div class="card-body">
                                    {{-- {{ $details }} --}}
                                    <div class="table-responsive row">
                                        {{-- all contents --}}

                                        <div class="col-sm-10 mx-auto mb-2 grid-container" id="grid-container">
                                            <!-- Points will be dynamically generated here -->
                                        </div>
                                    </div>
                                </div><!-- end card -->
                            </div><!-- end card -->
                        </div>
                    </div>
                    
                    {{-- <div class="modal-footer">
                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">Close</button>
                    </div> --}}
                </div>
                <div class="legend">
                    <h1>legend here</h1>
                </div>
            </div>
        </div>
        <div id="overlay" class="hidden"></div>