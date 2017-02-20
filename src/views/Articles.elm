module Articles exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Markdown exposing(..)

import Article exposing (..)
import Msg exposing (..)

getArticles : List Article
getArticles =
  [ Article "Article 1" """[testagain](http://www.google.fr)""" False "15/01/2017"
  , Article "Article 2" "Lorem Ipsum 2" False "15/01/2017"
  , Article "Article 3" "Lorem Ipsum 3" False "15/01/2017"
  , Article "Article 4" "Lorem Ipsum 4" False "15/01/2017"
  ]

lastArticle : Article
lastArticle =
    (Article "Article 1" """[testagain](http://www.google.fr)""" False "15/01/2017")

previous : Article -> Article
previous a =
    Article "Article 1" "Lorem Ipsum 1" False "15/01/2017"

next : Article -> Article
next a =
    Article "Article 3" "Lorem Ipsum 3" False "15/01/2017"


pager : Article -> Html Msg
pager article =
    nav
      []
      [ ul
        [ class "pager" ]
        [ li
          []
          [ a
            [ onClick (Previous article) ]
            [ text "Previous" ]
          ]
        , li
          []
          [ a
            [ onClick (Next article) ]
            [ text "Next" ]
          ]
        ]
      ]

viewArticle : Article -> Html Msg
viewArticle a =
    div
      [ class "col-sm-8 blog-main" ]
      [ div
        [ class "blog-post" ]
        [ h2
          [ class "blog-post-title" ]
          [ text a.title ]
        , p
          [ class "blog-post-meta" ]
          [ text a.date]
        , (Markdown.toHtmlWith { defaultOptions | sanitize = True } [] a.content)
        , pager a
        ]]
