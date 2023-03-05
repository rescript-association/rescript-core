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

let equal = (a, b, eq) => Core__Option.equal(a->toOption, b->toOption, eq)

let compare = (a, b, cmp) => Core__Option.compare(a->toOption, b->toOption, cmp)

let getWithDefault = (value, default) =>
  switch value->toOption {
  | Some(x) => x
  | None => default
  }

let getExn: t<'a> => 'a = value =>
  switch value->toOption {
  | Some(x) => x
  | None => raise(Invalid_argument("Nullable.getExn: value is null or undefined"))
  }

external getUnsafe: t<'a> => 'a = "%identity"

let map = (value, f) =>
  switch value->toOption {
  | Some(x) => make(f(x))
  | None => Obj.magic(value)
  }

let mapWithDefault = (value, default, f) =>
  switch value->toOption {
  | Some(x) => f(x)
  | None => default
  }

let flatMap = (value, f) =>
  switch value->toOption {
  | Some(x) => f(x)
  | None => Obj.magic(value)
  }
