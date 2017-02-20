module Model exposing (..)

import Article exposing (..)

type alias Model =
    { blogTitle: Title
    , articles: List Article
    }
