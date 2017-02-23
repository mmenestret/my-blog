module Msg exposing (..)

import Http
import Article exposing (..)

type Maybeither error value
  = None
  | Error error
  | Success value

type Msg
    = NoOp
    | Clicked Article
    | Previous
    | Next
    | Expand Bool
    | GetArticlesMeta (Result Http.Error String)