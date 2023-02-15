type t<'a>

type value<'a> = {
  done: bool,
  value: option<'a>,
}

@send external next: t<'a> => value<'a> = "next"
@scope("Array") external toArray: t<'a> => array<'a> = "from"
