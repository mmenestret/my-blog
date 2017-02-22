module Model exposing (..)

import Article exposing (..)

type alias Model =
  { articles  : List Article
  , currentArticle : Article
  , isFullyExpanded : Bool
  }
