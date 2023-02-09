type t = [#undefined | #object | #boolean | #number | #bigint | #string | #symbol | #function]

external typeof: 'a => t = "#typeof"

module Classify: {
  type function
  type object
  type symbol

  type t =
    | Bool(bool)
    | Null
    | Undefined
    | String(string)
    | Number(float)
    | Object(object)
    | Function(function)
    | Symbol(symbol)

  let classify: 'a => t
}
