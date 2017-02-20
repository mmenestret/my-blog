module Articles exposing (viewArticles)

import Html exposing (..)
import Html.Attributes exposing (..)

import Model exposing (..)
import Article exposing (..)
import Msg exposing (..)

viewArticle : Article -> Html Msg
viewArticle a =
  div
    [ class "blog-post" ]
    [ h2
      [ class "blog-post-title" ]
      [ text a.title ]
    , p
      [ class "blog-post-meta" ]
      [ text a.date]
    , div
        []
        [ text a.content ]
    ]

viewArticles : Model -> Html Msg
viewArticles model =
  div
    [ class "col-sm-8 blog-main" ]
    (List.map viewArticle model.articles)
