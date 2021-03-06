module Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Msg exposing (..)

viewHeader : Html Msg
viewHeader =
  div
  [ class "blog-header" ]
  [ h1
    [ class "blog-title" ]
    [ text "Geek"
    , img
        [ src "ressources/img/geekocephale.png"
        , class "title-img"
        ]
        []
    , text "cephale"
    ]
  , p
    [ class "lead blog-description" ]
    [ text "The blog of a Lambda God apprentice." ]
  ]