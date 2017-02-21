module Navigation exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Msg exposing (..)

viewNavigation : Html Msg
viewNavigation =
  div
    [ class "blog-masthead" ]
    [ div
      [ class "container" ]
      [ nav
        [ class "blog-nav" ]
        [ a
          [ class "blog-nav-item active", href "#" ]
          [ text "Home" ]
        , a
          [ class "blog-nav-item", href "#" ]
          [ text "Article list" ]
        , a
          [ class "blog-nav-item", href "#" ]
          [ text "Curriculum vitae" ]
        ]
      ]
    ]
