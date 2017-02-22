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
      [
        text "A voluntarily"
      , a
        [ href "https://en.wikipedia.org/wiki/KISS_principle" ]
        [ text " KISS " ]
      , text "static website, built with "
      , a
          [ href "http://elm-lang.org/" ]
          [ text " Elm " ]
      , text "(based on blog template built for"
      , a
          [ href "http://getbootstrap.com" ]
          [ text " Bootstrap " ]
      , text "by"
      , a
          [ href "https://twitter.com/mdo" ]
          [ text " @mdo" ]
      , text "). "
      , br [] []
      , text "I made this blog to explain but also to learn so I could keep testing stuff on it someday !"
      , br [] []
      , text "© Martin Menestret"
      ]
    ]
