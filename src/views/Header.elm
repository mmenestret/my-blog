module Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Msgs exposing (..)

viewHeader : Html Msg
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
