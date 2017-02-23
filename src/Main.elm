import Html exposing (..)
import Html.Attributes exposing (..)
import Http

-- Types
import Article exposing (..)
import Msg exposing (..)

-- Views
import Navigation
import Header
import Articles
import RightPanel
import Footer

-- MODEL

type alias Model =
  { articlesMeta : Maybeither String String
  , articles  : List Article
  , currentArticle : Article
  , isFullyExpanded : Bool
  , shortListSize : Int
  }

init : ( Model, Cmd Msg )
init =
  let
      articleList = Articles.getArticles
  in
      { articlesMeta = None
      , articles = articleList
      , currentArticle = Articles.lastArticle articleList
      , isFullyExpanded = False
      , shortListSize = 5
      } ! [ getArticlesMeta ]



-- UPDATE

errorMapper : Http.Error -> String
errorMapper e = toString e

getArticlesMeta : Cmd Msg
getArticlesMeta =
  let
    url = "https://raw.githubusercontent.com/mmenestret/my-blog/master/src/ressources/articles/article1.md"
  in
    Http.send GetArticlesMeta (Http.getString url)

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            model ! []

        Clicked a ->
            { model | currentArticle = a } ! []

        Previous ->
            { model | currentArticle = Articles.previousArticle model.articles model.currentArticle } ! []

        Next ->
            let
              newModel = { model | currentArticle = Articles.nextArticle model.articles model.currentArticle }

             in
               if (Articles.isAfterShortList newModel.articles newModel.shortListSize newModel.currentArticle)
               then update (Expand True) newModel
               else newModel ! []

        Expand b ->
            { model | isFullyExpanded = b } ! []

        GetArticlesMeta res ->
          case res of
            Err e -> { model | articlesMeta = Error (errorMapper e) } ! []
            Ok metaList -> { model | articlesMeta = Success metaList } ! []



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- VIEW

viewArticlesMeta : Maybeither String String -> Html Msg
viewArticlesMeta maybeither =
  case maybeither of
    None -> text "Articles Meta havn't been loaded."

    Success v -> text v

    Error e -> text e

view : Model -> Html Msg
view m =
  let
    current = m.currentArticle
    articles = m.articles
    expanded = m.isFullyExpanded
    listSize = m.shortListSize
  in
    div []
        [ viewArticlesMeta m.articlesMeta
        , Navigation.viewNavigation
        , div
            [ class "container" ]
            [ Header.viewHeader
            , div
                [ class "row" ]
                [ Articles.viewArticle current
                , RightPanel.viewRightPanel articles current listSize expanded
                ]
            ]
        , Footer.viewFooter
        ]

-- Main

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }