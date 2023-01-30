type t<'a>
type next<'a>

@get external done: next<'a> => bool = "done"
@get external value: next<'a> => option<'a> = "value"

@send external next: t<'a> => next<'a> = "next"
