I've been wondering for a while how to put arbitrary HTML inside an Elm app.

I wondered if I could register a custom HTML element which takes a string of HTML code as an attribute, and sets the `innerHTML` of its shadow root to that code. The Elm app could then create an instance of that element and pass a string of HTML to it.

It works!
