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
      [ text "About" ]
    , p
      []
      [ text
            "Etiam porta sem malesuada magna mollis euismod. Cras mattis consectetur purus sit amet fermentum. Aenean lacinia bibendum nulla sed consectetur." ]
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
              a = text (m.date ++ " - " ++ m.title)
          in if m == model.currentArticle then (b [] [a]) else a

      articleDateAndTitleListLi : Article -> Html Msg
      articleDateAndTitleListLi article =
          li
              []
              [ a
                    [ onClick (Clicked article)
                    , class "normal-link" ]
                    [ emphasizeIfCurrent article ]
              ]

      postListSize = 5

      moreArticles : Bool -> Html Msg
      moreArticles fullyExpanded =
        if (not fullyExpanded)
        then
          p
            [ class "expander" ]
            a
              [ onClick (Expand True)
              , class "normal-link" ]
              [ text "More !" ]
        else
          p
            [ class "expander" ]
            a
              [ onClick (Expand False)
              , class "expander normal-link" ]
              [ text "Less !" ]


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
          [ class "list-unstyled" ]
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
      (List.map viewLi [("#", "Twitter"), ("#", "GitHub")])
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
