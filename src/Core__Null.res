type t<'a> = Js.Null.t<'a>

external asNullable: t<'a> => Core__Nullable.t<'a> = "%identity"

external null: t<'a> = "#null"

external make: 'a => t<'a> = "%identity"

external toOption: t<'a> => option<'a> = "#null_to_opt"

let fromOption: option<'a> => t<'a> = option =>
  switch option {
  | Some(x) => make(x)
  | None => null
  }

let getWithDefault = (value, default) =>
  switch value->toOption {
  | Some(x) => x
  | None => default
  }

let getExn: t<'a> => 'a = value =>
  switch value->toOption {
  | Some(x) => x
  | None => raise(Invalid_argument("Null.getExn: value is null"))
  }

external getUnsafe: t<'a> => 'a = "%identity"

let map = (value, f) =>
  switch value->toOption {
  | Some(x) => make(f(x))
  | None => null
  }

let mapWithDefault = (value, default, f) =>
  switch value->toOption {
  | Some(x) => f(x)
  | None => default
  }

let flatMap = (value, f) =>
  switch value->toOption {
  | Some(x) => f(x)
  | None => null
  }
