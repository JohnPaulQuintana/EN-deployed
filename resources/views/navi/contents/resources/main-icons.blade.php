<span id="svg-title" class="text-white">
    <b>
        <svg class="guide-logo" xmlns="http://www.w3.org/2000/svg" width="30" height="30" viewBox="0 0 24 24">
            <!-- Book Icon -->
            <rect x="3" y="4" width="18" height="16" rx="2" ry="2" fill="none" stroke="currentColor" stroke-width="2"></rect>
            <!-- Pages -->
            <line x1="8" y1="4" x2="8" y2="20" stroke="currentColor" stroke-width="2"></line>
            <line x1="16" y1="4" x2="16" y2="20" stroke="currentColor" stroke-width="2"></line>
            <!-- Bookmark -->
            <line x1="6" y1="4" x2="6" y2="9" stroke="currentColor" stroke-width="2"></line>
            <polyline points="6 9 12 14 18 9" fill="none" stroke="currentColor" stroke-width="2"></polyline>
        </svg>
    </b>
</span>


<span id="svg-title" class="text-white">
    <b>
        <svg class="icons" data-id="search2" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
            viewBox="0 0 24 24">
            <path
                d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 20l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z" />
            <path d="M0 0h24v24H0z" fill="none" />
        </svg>

    </b>
</span>

<span id="svg-title" class="text-white">
    <b><svg class="icons" data-id="ask" xmlns="http://www.w3.org/2000/svg" width="40" height="40"
            viewBox="0 0 24 24">
            <path
                d="M12 4C9.243 4 7 6.243 7 9h2c0-1.654 1.346-3 3-3s3 1.346 3 3c0 1.069-.454 1.465-1.481 2.255-.382.294-.813.626-1.226 1.038C10.981 13.604 10.995 14.897 11 15v2h2v-2.009c0-.024.023-.601.707-1.284.32-.32.682-.598 1.031-.867C15.798 12.024 17 11.1 17 9c0-2.757-2.243-5-5-5zm-1 14h2v2h-2z">
            </path>
        </svg></b>
</span>
{{-- {{ $systems }} --}}
@php
    if (isset($systems[0])) {
        $auth = $systems[0]->status;
        if ($auth) {
            $className = 'icons';
        } else {
            $className = 'disabled';
        }
    }
@endphp
<span id="svg-title" class="text-white">
    <b><svg class="{{ $className }}" data-id="speech" xmlns="http://www.w3.org/2000/svg" width="30"
            height="40" viewBox="0 0 24 24">
            <path
                d="M8 12.052c1.995 0 3.5-1.505 3.5-3.5s-1.505-3.5-3.5-3.5-3.5 1.505-3.5 3.5 1.505 3.5 3.5 3.5zM9 13H7c-2.757 0-5 2.243-5 5v1h12v-1c0-2.757-2.243-5-5-5zm9.364-10.364L16.95 4.05C18.271 5.373 19 7.131 19 9s-.729 3.627-2.05 4.95l1.414 1.414C20.064 13.663 21 11.403 21 9s-.936-4.663-2.636-6.364z">
            </path>
            <path
                d="M15.535 5.464 14.121 6.88C14.688 7.445 15 8.198 15 9s-.312 1.555-.879 2.12l1.414 1.416C16.479 11.592 17 10.337 17 9s-.521-2.592-1.465-3.536z">
            </path>
        </svg></b>
</span>



