module RightPanel exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Msg exposing (..)

viewAbout : Html msg
viewAbout =
  div
    [ class "sidebar-module sidebar-module-inset" ]
    [ h4
      []
      [ text "About" ]
    , p
      []
      [ text "Etiam porta"
      , em
        []
        [ text "sem malesuada magna" ]
        , text "mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur."
      ]
    ]

viewLi : ( String, String ) -> Html Msg
viewLi (h, t) =
  li
    []
    [ a
      [ href h ]
      [ text t ]
    ]

viewSideBar : Html Msg
viewSideBar =
  let
    lis =
      [
        ("#", "March 2014")
      , ("#", "February 2014")
      , ("#", "January 2014")
      , ("#", "December 2013")
      , ("#", "November 2013")]
  in
    div
      [ class "sidebar-module" ]
      [ h4
        []
        [ text "Archives" ]
      , ol
        [ class "list-unstyled" ]
        (List.map viewLi lis)
      ]

viewContact : Html Msg
viewContact =
  div
    [ class "sidebar-module" ]
    [ h4
      []
      [ text "Elsewhere" ]
    , ol
      [ class "list-unstyled" ]
      (List.map viewLi [("#", "Twitter"), ("#", "GitHub")])
    ]

viewRightPanel : Html Msg
viewRightPanel =
  div
    [ class "col-sm-3 col-sm-offset-1 blog-sidebar" ]
    [
      viewAbout
    , viewSideBar
    , viewContact
    ]
