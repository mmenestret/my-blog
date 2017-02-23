import Html exposing (..)
import Html.Attributes exposing (..)

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
  { articles  : List Article
  , currentArticle : Article
  , isFullyExpanded : Bool
  , shortListSize : Int
  }

init : ( Model, Cmd Msg )
init =
  let
      articleList = Articles.getArticles
  in
      { articles = articleList
      , currentArticle = Articles.lastArticle articleList
      , isFullyExpanded = False
      , shortListSize = 5
      } ! []



-- UPDATE

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



-- SUBSCRIPTIONS


subscriptions : Model -> Sub Msg
subscriptions model =
    Sub.none


-- VIEW

view : Model -> Html Msg
view model =
  let
    current = model.currentArticle
    articles = model.articles
    expanded = model.isFullyExpanded
    listSize = model.shortListSize
  in
    div []
        [ Navigation.viewNavigation
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