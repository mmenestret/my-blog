module Footer exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)

import Msg exposing (..)

viewFooter : Html Msg
viewFooter =
  footer
    [ class "blog-footer" ]
    [ p
      []
      [ text "Blog template built for"
      , a
          [ href "http://getbootstrap.com" ]
          [ text "Bootstrap" ]
      , text "by"
      , a
          [ href "https://twitter.com/mdo" ]
          [ text "@mdo" ]
      , text "."
      ]
    , p
      []
      [ a
        [ href "#" ]
        [ text "Back to top" ]
      ]
    ]
