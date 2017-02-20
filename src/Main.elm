import Html exposing (..)
import Html.Attributes exposing (..)
import Html.Events exposing (onClick)

import Header

main : Program Never Model Msg
main =
    Html.program
        { init = init
        , view = view
        , update = update
        , subscriptions = subscriptions
        }



-- MODEL

type alias Title = String
type alias Article =
    { title: Title
    , content: String
    , showContent: Bool
    , date: String
    }

type alias Model =
    { blogTitle: Title
    , articles: List Article
    }



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


type Msg
    = NoOp
    | ToggleContent Article


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
viewArticle : Article -> Html Msg
viewArticle a =
    article
        [ onClick (ToggleContent a) ]
        [ h2 [] [ text ( a.title ++ " ... " ++ a.date )]
        , div
            [ hidden (not a.showContent) ]
            [ text a.content ]
        ]

view : Model -> Html Msg
view model =
    div []
        [ Header.viewHeader
        , div [] (List.map viewArticle model.articles)
        ]
