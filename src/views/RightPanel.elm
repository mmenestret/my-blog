module RightPanel exposing (..)

import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (..)

import Msg exposing (..)
import Article exposing (..)

import Articles exposing (articlesDesc)
viewAbout : Html Msg
viewAbout =
  div
    [ class "sidebar-module sidebar-module-inset" ]
    [ h4
      []
      [ text "About Me" ]
    , p
      []
      [ text
            "I'm a curious about everything software developper with an insatiable hunger for learning."
      , br [] []
      , text
            "My current interests and attractions, in no particular order are:"
      , br [] []
      , br [] []
      , b
            []
            [text "Functional programing, Scala, Elm, Haskell"]
      ]
    ]

linkAsLi : ( String, String ) -> Html Msg
linkAsLi (h, t) =
  li
    []
    [ a
      [ href h ]
      [ text t ]
    ]


articleAsList : (List Article) -> Article -> Html Msg
articleAsList articles article =
  let
    emphasizeIfCurrent m =
      let
          a = text m.title
      in if m == article then (b [] [a]) else a

    articleTitleAsLi : Article -> Html Msg
    articleTitleAsLi article =
      li
          [ class "full-width" ]
          [ a
                [ onClick (Clicked article)
                , class "normal-link article-link full-width" ]
                [ emphasizeIfCurrent article ]
          ]
  in
    ol
      [ class "list-unstyled full-width" ]
      (List.map articleTitleAsLi articles)


viewArticleList : List Article -> Article -> Int -> Bool -> Html Msg
viewArticleList articles currentArticle shortListSize isFullyExpanded  =
  let
      maybeExpander : Bool -> Int -> List (Html Msg)
      maybeExpander isFullyExpanded nbOfArticles =
        let
          expander =
            case (isFullyExpanded, (nbOfArticles > shortListSize)) of
              (False, True) ->
                Just
                  (p
                    [ class "expander" ]
                    [ a
                      [ onClick (Expand True)
                      , class "normal-link" ]
                      [ text "More..." ]
                    ])

              (True, True) ->
                Just (
                  p
                    [ class "expander" ]
                    [ a
                      [ onClick (Expand False)
                      , class "normal-link" ]
                      [ text "Less..." ]
                    ])

              _ -> Nothing
            in (Maybe.withDefault [] (Maybe.map (\x -> [x]) expander))


      shortList =
        if isFullyExpanded
        then (Articles.articlesDesc articles)
        else articles |> Articles.articlesDesc |> List.take shortListSize

      articleListSize = List.length articles

  in
    div
      [ class "sidebar-module" ]
      ([
        h4 [] [ text "Articles" ]
      , (articleAsList shortList currentArticle)
      ] ++ (maybeExpander isFullyExpanded articleListSize))


viewContact : Html Msg
viewContact =
  div
    [ class "sidebar-module" ]
    [ h4
      []
      [ text "Elsewhere" ]
    , ol
      [ class "list-unstyled" ]
      (List.map linkAsLi [("https://twitter.com/mmenestret", "Twitter"), ("https://github.com/mmenestret", "GitHub")])
    ]

viewRightPanel : List Article -> Article -> Int -> Bool -> Html Msg
viewRightPanel articles currentArticle shortListSize isFullyExpanded =
  div
    [ class "col-sm-3 col-sm-offset-1 blog-sidebar" ]
    [
      viewAbout
    , viewArticleList articles currentArticle shortListSize isFullyExpanded
    , viewContact
    ]
