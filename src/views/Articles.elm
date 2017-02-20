module Articles exposing (viewArticles)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Model exposing (..)
import Article exposing (..)
import Msgs exposing (..)

viewArticle : Article -> Html Msg
viewArticle a =
    article
        [ onClick (ToggleContent a) ]
        [ h2 [] [ text ( a.title ++ " ... " ++ a.date )]
        , div
            [ hidden (not a.showContent) ]
            [ text a.content ]
        ]

viewArticles : Model -> Html Msg
viewArticles model =
  div
    [ class "col-sm-8 blog-main" ]
    (List.map viewArticle model.articles)
