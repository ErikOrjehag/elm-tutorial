module Main exposing (..)

import Html exposing (Html, div, button, text)
import Html.Events exposing (onClick)
import Html.App
import Random

-- Model

type alias Model =
  Int


init : ( Model, Cmd Msg )
init =
  ( 1, Cmd.none )


-- Message

type Msg
  = Roll
  | OnResult Int


-- View

view : Model -> Html Msg
view model =
  div []
      [ button [ onClick Roll ] [ text "Roll" ]
      , text (toString model)
      ]


-- Update
update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
  case msg of
    Roll ->
      ( model, Random.generate OnResult (Random.int 1 6) )

    OnResult res ->
      ( res, Cmd.none )


-- Main

main : Program Never
main =
  Html.App.program
    { init = init
    , view = view
    , update = update
    , subscriptions = (always Sub.none)
    }