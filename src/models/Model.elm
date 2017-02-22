module Model exposing (..)

import Article exposing (..)

type alias Model =
  { articles  : List Article
  , currentArticle : Article
  , isFullyExpanded : Bool
  , shortListSize : Int
  , articlesTest : List String
  }
