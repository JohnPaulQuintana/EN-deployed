<div class="popup" id="popup-ask">
    <div class="loading-container l-ask">
       
        @foreach ($frequentlies as $frequently)
            <div class="browseCard-ask" id="frequently-question" data-id="{{ $frequently->frequently }}">
                <i class="ri-question-fill"></i>
                <span>{{ $frequently->frequently }}</span>
            </div>
        @endforeach

    </div>
</div>