module Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

viewHeader : Html msg
viewHeader =
  div
  [ class "blog-header" ]
  [ h1
    [ class "blog-title" ]
    [ text "The Bootstrap Blog" ]
  , p
    [ class "lead blog-description" ]
    [ text "The official example template of creating a blog with Bootstrap." ]
  ]
