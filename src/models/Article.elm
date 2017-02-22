module Article exposing (..)

type alias Id = Int
type alias Title = String

type alias Article =
    { title: Title
    , content: String
    , showContent: Bool
    , date: String
    }
