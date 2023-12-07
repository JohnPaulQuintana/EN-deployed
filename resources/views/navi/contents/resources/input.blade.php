<div id="chat_container" hidden></div>
        <form class="textarea-container">
            <input type="text" id="key" value="" name="id" hidden>
            <input type="text" id="query" value="" name="query" hidden>
            <input id="input" name="prompt" class="form-control" {{ $className }}
                placeholder="Enter your query or use the mic button" style="background: transparent; color:white;font-weight:700; font-family:Arial, Helvetica, sans-serif;"></input>
            {{-- <button type="submit"><img src="assets/send.svg" alt="send" /> --}}
                {{-- <input type="button" id="submit-button" class="bx bxs-up-arrow-square"> --}}
                <box-icon id="submit-button" type='solid' name='up-arrow-square' {{ $className }}></box-icon>
                
        </form>