module Articles exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)
import Markdown exposing(..)

import Article exposing (..)
import Msg exposing (..)
import Model exposing (..)

getArticles : List Article
getArticles =
  [ Article 0 "Article 1" """[testagain](http://www.google.fr)""" False "15/01/2017"
  , Article 1 "Article 2" "Lorem Ipsum 2" False "15/01/2017"
  , Article 2 "Article 3" "Lorem Ipsum 3" False "15/01/2017"
  , Article 3 "Article 4" "Lorem Ipsum 4" False "15/01/2017"
  ]

articlesDesc : List Article -> List Article
articlesDesc articles =
    (List.sortBy (\a -> -a.id) articles)

articlesAsc : List Article -> List Article
articlesAsc articles =
    (List.sortBy (\a -> a.id) articles)

topArticle : List Article -> Article
topArticle articles =
    let
        default = (Article 2 "Article 1" """[testagain](http://www.google.fr)""" False "15/01/2017")
    in
        Maybe.withDefault default (List.head articles)

lastArticle : List Article -> Article
lastArticle articles =
    articles |> articlesDesc |> topArticle

firstArticle : List Article -> Article
firstArticle articles =
    articles |> articlesAsc |> topArticle

getArticleById : List Article -> Id -> Maybe Article
getArticleById articles id =
    List.head (List.filter (\a -> a.id == id) articles)

previousArticle : List Article -> Article -> Article
previousArticle articles a =
    Maybe.withDefault (firstArticle articles) (getArticleById articles (a.id - 1))

nextArticle : List Article -> Article -> Article
nextArticle articles a =
    Maybe.withDefault (lastArticle articles) (getArticleById articles (a.id + 1))


pager : Model -> Html Msg
pager model =
    nav
      []
      [ ul
        [ class "pager" ]
        [ li
          [ class "previous" ]
          [ a
            [ onClick Previous ]
            [ text "Previous" ]
          ]
        , li
          [ class "next" ]
          [ a
            [ onClick Next ]
            [ text "Next" ]
          ]
        ]
      ]

viewArticle : Model -> Html Msg
viewArticle model =
    div
      [ class "col-sm-8 blog-main" ]
      [ div
        [ class "blog-post" ]
        [ h2
          [ class "blog-post-title" ]
          [ text model.currentArticle.title ]
        , p
          [ class "blog-post-meta" ]
          [ text model.currentArticle.date]
        , (Markdown.toHtmlWith { defaultOptions | sanitize = True } [] model.currentArticle.content)
        , pager model
        ]]
