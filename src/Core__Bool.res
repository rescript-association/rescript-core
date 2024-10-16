// Core__Bool.res
external compare: (bool, bool) => Core__Ordering.t = "%compare"

external equal: (bool, bool) => bool = "%equal"

@send external toString: bool => string = "toString"

let fromStringExn = param =>
  switch param {
  | "true" => true
  | "false" => false
  | _ => raise(Invalid_argument(`Bool.fromStringExn: value is neither "true" nor "false"`))
  }

let fromString = param =>
  switch param {
  | "true" => Some(true)
  | "false" => Some(false)
  | _ => None
  }

external and_: (bool, bool) => bool = "%sequand"

external or: (bool, bool) => bool = "%sequor"

external not: bool => bool = "%boolnot"

let xor = (a, b) => a !== b

let xnor = (a, b) => !xor(a, b)

let nand = (a, b) => !and_(a, b)

let nor = (a, b) => !or(a, b)
