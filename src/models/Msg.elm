module Msg exposing (..)

import Article exposing (..)

type Msg
    = NoOp
    | Clicked Article
    | Previous
    | Next
