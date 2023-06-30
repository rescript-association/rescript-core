type t = [#undefined | #object | #boolean | #number | #bigint | #string | #symbol | #function]

external typeof: 'a => t = "#typeof"

module Classify = {
  type function = Js.Types.function_val
  type object = Js.Types.obj_val

  type t =
    | Bool(bool)
    | Null
    | Undefined
    | String(string)
    | Number(float)
    | Object(object)
    | Function(function)
    | Symbol(Core__Symbol.t)
    | BigInt(Core__BigInt.t)

  @val external _internalClass: 'a => string = "Object.prototype.toString.call"
  external _asBool: 'a => bool = "%identity"
  external _asString: 'a => string = "%identity"
  external _asFloat: 'a => float = "%identity"
  external _asObject: 'a => object = "%identity"
  external _asFunction: 'a => function = "%identity"
  external _asSymbol: 'a => Core__Symbol.t = "%identity"
  external _asBigInt: 'a => Core__BigInt.t = "%identity"

  let classify = value => {
    switch _internalClass(value) {
    | "[object Boolean]" => Bool(_asBool(value))
    | "[object Null]" => Null
    | "[object Undefined]" => Undefined
    | "[object String]" => String(_asString(value))
    | "[object Number]" => Number(_asFloat(value))
    | "[object Function]"
    | "[object GeneratorFunction]"
    | "[object AsyncFunction]" =>
      Function(_asFunction(value))
    | "[object Symbol]" => Symbol(_asSymbol(value))
    | "[object BigInt]" => BigInt(_asBigInt(value))
    | _ => Object(_asObject(value))
    }
  }
}
