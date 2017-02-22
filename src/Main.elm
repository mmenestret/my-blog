import Html exposing (..)
import Html.Attributes exposing (..)
-- Types
import Model exposing (..)
import Msg exposing (..)

-- Views
import Navigation
import Header
import Articles
import RightPanel
import Footer


main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }

-- MODEL

initialModel : Model
initialModel =
    let
        articleList = Articles.getArticles
    in
        { articles = articleList
        , currentArticle = Articles.lastArticle articleList
        , isFullyExpanded = False
        , shortListSize = 5
        }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



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
    div []
        [ Navigation.viewNavigation
        , div
            [ class "container" ]
            [ Header.viewHeader
            , div
                [ class "row" ]
                [ Articles.viewArticle model
                , RightPanel.viewRightPanel model
                ]
            ]
        , Footer.viewFooter
        ]
