type t<'a>

type value<'a> = {
  done: bool,
  value: option<'a>,
}

@send external next: t<'a> => value<'a> = "next"
external toArray: t<'a> => array<'a> = "Array.from"
external toArrayWithMapper: (t<'a>, 'a => 'b) => array<'b> = "Array.from"
