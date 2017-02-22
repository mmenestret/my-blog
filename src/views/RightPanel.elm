module RightPanel exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Msg exposing (..)
import Article exposing (..)
import Model exposing (..)

import Articles exposing (articlesDesc)
viewAbout : Html msg
viewAbout =
  div
    [ class "sidebar-module sidebar-module-inset" ]
    [ h4
      []
      [ text "About Me" ]
    , p
      []
      [ text
            "I'm an overcurious software developper with an insatiable hunger for learning."
      , br [] []
      , br [] []
      , text
            "My current interests and attractions, in no particular order are:"
      , br [] []
      , b
            []
            [text "Functional programing, Scala, Elm, Haskell"]
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


viewArticleList : Model -> Html Msg
viewArticleList model =
  let
      emphasizeIfCurrent m =
          let
              a = text m.title
          in if m == model.currentArticle then (b [] [a]) else a

      articleDateAndTitleListLi : Article -> Html Msg
      articleDateAndTitleListLi article =
          li
              [ class "full-width" ]
              [ a
                    [ onClick (Clicked article)
                    , class "normal-link article-link full-width" ]
                    [ emphasizeIfCurrent article ]
              ]

      postListSize = 5

      moreArticles : Bool -> Html Msg
      moreArticles fullyExpanded =
        if (not fullyExpanded)
        then
          p
            [ class "expander" ]
            [ a
              [ onClick (Expand True)
              , class "normal-link" ]
              [ text "More..." ]
            ]
        else
          p
            [ class "expander" ]
            [ a
              [ onClick (Expand False)
              , class "normal-link" ]
              [ text "Less..." ]
            ]


      filteredList =
        if model.fullyExpanded
        then (Articles.articlesDesc model.articles)
        else model.articles |> Articles.articlesDesc |> List.take postListSize
  in
      div
        [ class "sidebar-module" ]
        [ h4
          []
          [ text "Articles" ]
        , ol
          [ class "list-unstyled full-width" ]
          ( (List.map articleDateAndTitleListLi filteredList)
            ++ [moreArticles model.fullyExpanded])
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
      (List.map viewLi [("https://twitter.com/mmenestret", "Twitter"), ("https://github.com/mmenestret", "GitHub")])
    ]

viewRightPanel : Model -> Html Msg
viewRightPanel m =
  div
    [ class "col-sm-3 col-sm-offset-1 blog-sidebar" ]
    [
      viewAbout
    , viewArticleList m
    , viewContact
    ]
