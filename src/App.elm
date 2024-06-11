module App exposing (..)

import Browser
import Html as H exposing (Html)
import Html.Attributes as HA
import Html.Events as HE

main = Browser.document
    { init = init
    , update = update
    , subscriptions = subscriptions
    , view = view
    }

init_model = 
  { html = "<h1>Hi, this is cool!</h1>\n<button type=\"button\">click</button>"
  , counter = 0
  }

type alias Model = 
  { html : String
  , counter : Int
  }

type Msg
  = Increment
  | SetHTML String

init : () -> (Model, Cmd msg)
init _ = (init_model, Cmd.none)

update msg model = case msg of
  Increment -> ({model | counter = model.counter + 1}, Cmd.none)
  SetHTML html -> ({model | html = html }, Cmd.none)

subscriptions model = Sub.none

view model = 
  {
    title = "Hey",
    body = 
      [
        H.p [] [H.text "This shows how to embed arbitrary HTML inside an Elm app, using a custom element."]
      , H.p [] [H.text "The Elm model has an HTML string and an integer counter, which increments when there's a click event from the embedded HTML."]
      , H.p [] [H.text "Counter: ", H.text <| String.fromInt model.counter]
      , H.label
        [ HA.for "html-input" ]
        [ H.text "Write HTML here"]
      , H.textarea
        [ HE.onInput SetHTML
        , HA.value model.html
        ]
        []
      , H.p [] [H.text "And now, here's that HTML rendered in the page:"]
      , H.hr
          []
          []
      , H.node "elm-html" 
          [HA.attribute "html" model.html
          , HE.onClick Increment
          ]
          []
      , H.hr [] []
      , H.p [] [H.text "And here's a bit more text after the HTML."]
      ]
  }