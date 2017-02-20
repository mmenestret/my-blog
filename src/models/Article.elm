module Article exposing (..)

type alias Title = String
type alias Article =
    { title: Title
    , content: String
    , showContent: Bool
    , date: String
    }
