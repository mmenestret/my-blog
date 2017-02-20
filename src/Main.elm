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
    { articles = Articles.getArticles
    , currentArticle = Articles.lastArticle
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

        Previous a ->
            (
                { model | currentArticle = Articles.previous(a) }
            ,   Cmd.none )

        Next a ->
            (
                { model | currentArticle = Articles.next(a) }
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
                [ Articles.viewArticle model.currentArticle
                , RightPanel.viewRightPanel model
                ]
            ]
        , Footer.viewFooter
        ]
