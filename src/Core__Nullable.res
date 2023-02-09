type t<'a> = Js.Nullable.t<'a>

external null: t<'a> = "#null"

external undefined: t<'a> = "#undefined"

external make: 'a => t<'a> = "%identity"

external toOption: t<'a> => option<'a> = "#nullable_to_opt"

let fromOption: option<'a> => t<'a> = option =>
  switch option {
  | Some(x) => make(x)
  | None => undefined
  }
