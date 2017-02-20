module Header exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

viewHeader : Html msg
viewHeader =
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
          [ text "New features" ]
        , a
          [ class "blog-nav-item", href "#" ]
          [ text "Press" ]
        , a
          [ class "blog-nav-item", href "#" ]
          [ text "New hires" ]
        , a
          [ class "blog-nav-item", href "#" ]
          [ text "About" ]
        ]
      ]
    ]
