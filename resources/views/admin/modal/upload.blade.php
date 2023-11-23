<!-- Modal -->
<div class="modal fade" id="uploadModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">Eastwoods Hymn mp4</h5>
          <button type="button" class="btn-close btnCloseUpload"  aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form action="{{ route('hymn') }}" method="post" enctype="multipart/form-data" id="videoForm">
                @csrf
                <input type="file" name="video" class="form-control" id="videoInput" accept="video/mp4" required>
                {{-- <video id="videoPreview" width="320" height="180" controls style="display: none;"></video> --}}
                <video id="videoPreview" width="465" height="360" controls style="display: none;" class="mb-2"></video>  
                <button type="submit" class="btn btn-secondary mx-auto float-end">Upload Video</button>
            </form>  
        </div>
        <div class="modal-footer">
          
        </div>
      </div>
    </div>
  </div>