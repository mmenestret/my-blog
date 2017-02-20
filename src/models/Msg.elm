module Msg exposing (..)

import Article exposing (..)

type Msg
    = NoOp
    | ToggleContent Article
