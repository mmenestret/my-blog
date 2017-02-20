import Html exposing (..)
import Html.Attributes exposing (..)

-- Types
import Model exposing (..)
import Article exposing (..)
import Msg exposing (..)

-- Views
import Navigation
import Header
import Articles

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
    Model "Geekocephale"
    [ Article "Article 1" "Lorem Ipsum 1" False "15/01/2017"
    , Article "Article 2" "Lorem Ipsum 2" False "15/01/2017"
    , Article "Article 3" "Lorem Ipsum 3" False "15/01/2017"
    , Article "Article 4" "Lorem Ipsum 4" False "15/01/2017"
    ]



init : ( Model, Cmd Msg )
init =
    ( initialModel, Cmd.none )



-- UPDATE

update : Msg -> Model -> ( Model, Cmd Msg )
update msg model =
    case msg of
        NoOp ->
            ( model, Cmd.none )

        ToggleContent a ->
            let
              newArticles =
                (List.map
                (\x -> if x == a then { x | showContent = not x.showContent } else x)
                model.articles)
            in ( { model | articles = newArticles }, Cmd.none )


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
                [ Articles.viewArticles model
                ]
            ]
        ]
