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
        , fullyExpanded = False
        }


init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        Clicked a ->
            (
                { model | currentArticle = a }
            ,   Cmd.none )

        Previous ->
            (
                { model | currentArticle = Articles.previousArticle model.articles model.currentArticle }
            ,   Cmd.none )

        Next ->
            (
                { model | currentArticle = Articles.nextArticle model.articles model.currentArticle }
            ,   Cmd.none )

        Expand b ->
            (
                { model | fullyExpanded = b }
            ,   Cmd.none )

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
