<!-- Modal -->
<div class="modal fade" id="qr" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
      <div class="modal-content">
        <div class="modal-header">
          <h5 class="modal-title" id="staticBackdropLabel">Generate Qrcodes</h5>
          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
        </div>
        <div class="modal-body">
            <form class="row g-2">
                <div class="col-sm-4">
                  <label for="type" class="form-control">Generate for:</label>
                  <select class="form-select" id="type" aria-label="Default select example" disabled>
                    <option value="a">Generate</option>
                  </select>
                </div>
                <div class="col-sm-4">
                  <label for="type" class="form-control">Generate Count:</label>
                  <select class="form-select" id="count" aria-label="Default select example">
                    @for ($x=1; $x<=80;$x++)
                        <option value="{{ $x }}">{{ $x }}</option>
                    @endfor
                  </select>
                </div>
                <div class="col-sm-4">
                    <label for="type" class="form-control">QR code Size:</label>
                    <select class="form-select" id="size" aria-label="Default select example" disabled>
                        <option value="100">100</option>
                        <option value="150">150</option>
                        <option value="200">200</option>
                        <option value="250">250</option>
                        <option value="300">300</option>
                        <option value="350">350</option>
                        <option value="400">400</option>
                        <option value="500">500</option>
                      </select>
                </div>
              </form>
        </div>
        <div class="modal-footer">
          <button type="button" class="btn btn-primary generate">Generate</button>
        </div>
      </div>
    </div>
  </div>