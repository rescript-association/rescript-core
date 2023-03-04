type t = Js.Json.t

type jsonReplacer
external asJsonReplacer: 'a => jsonReplacer = "%identity"

@raises @val external parseExn: string => t = "JSON.parse"
@raises @val external parseExnWithReviver: (string, (string, t) => t) => t = "JSON.parse"
@val external stringify: t => string = "JSON.stringify"
@val external stringifyWithIndent: (t, @as(json`null`) _, int) => string = "JSON.stringify"
@val external stringifyWithReplacer: (t, jsonReplacer) => string = "JSON.stringify"
@val external stringifyWithReplacerAndIndent: (t, jsonReplacer, int) => string = "JSON.stringify"

@raises @val external parseToAnyExn: string => 'a = "JSON.parse"
@raises @val external parseToAnyExnWithReviver: (string, (string, t) => t) => 'a = "JSON.parse"
@raises @val external stringifyAny: 'a => option<string> = "JSON.stringify"
@raises @val
external stringifyAnyWithIndent: ('a, @as(json`null`) _, int) => option<string> = "JSON.stringify"
@raises @val
external stringifyAnyWithReplacer: ('a, jsonReplacer) => option<string> = "JSON.stringify"
@raises @val
external stringifyAnyWithReplacerAndIndent: ('a, jsonReplacer, int) => option<string> =
  "JSON.stringify"

module Classify = {
  type t =
    | Bool(bool)
    | Null
    | String(string)
    | Number(float)
    | Object(Core__Dict.t<t>)
    | Array(array<t>)

  @val external _internalClass: 'a => string = "Object.prototype.toString.call"
  external _asBool: 'a => bool = "%identity"
  external _asString: 'a => string = "%identity"
  external _asFloat: 'a => float = "%identity"
  external _asArray: 'a => array<Js.Json.t> = "%identity"
  external _asDict: 'a => Core__Dict.t<Js.Json.t> = "%identity"

  let classify = value => {
    switch _internalClass(value) {
    | "[object Boolean]" => Bool(_asBool(value))
    | "[object Null]" => Null
    | "[object String]" => String(_asString(value))
    | "[object Number]" => Number(_asFloat(value))
    | "[object Array]" => Array(_asArray(value))
    | _ => Object(_asDict(value))
    }
  }
}

module Encode = {
  external bool: bool => t = "%identity"
  external null: t = "#null"
  external string: string => t = "%identity"
  external int: int => t = "%identity"
  external float: float => t = "%identity"
  external object: Core__Dict.t<t> => t = "%identity"
  external array: array<t> => t = "%identity"
  external any: 'a => t = "%identity"
}

module Decode = {
  let bool = (json: t) =>
    Core__Type.typeof(json) === #boolean ? Some((Obj.magic(json): bool)) : None
  let null = (json: t) => Obj.magic(json) === Core__Null.null ? Some(Core__Null.null) : None
  let string = (json: t) =>
    Core__Type.typeof(json) === #string ? Some((Obj.magic(json): string)) : None
  let float = (json: t) =>
    Core__Type.typeof(json) === #number ? Some((Obj.magic(json): float)) : None
  let object = (json: t) =>
    if (
      Core__Type.typeof(json) === #object &&
      !Core__Array.isArray(json) &&
      !(Obj.magic(json) === Core__Null.null)
    ) {
      Some((Obj.magic(json): Core__Dict.t<t>))
    } else {
      None
    }
  let array = (json: t) => Core__Array.isArray(json) ? Some((Obj.magic(json): array<t>)) : None
}
