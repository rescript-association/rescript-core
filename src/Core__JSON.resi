type t = Js.Json.t

type jsonReviver
external asJsonReviver: 'a => jsonReviver = "%identity"
type jsonReplacer
external asJsonReplacer: 'a => jsonReplacer = "%identity"

@val external parseExn: string => t = "JSON.parse"
@val external parseExnWithReviver: (string, jsonReviver) => t = "JSON.parse"
@val external stringify: t => string = "JSON.stringify"
@val external stringifyWithIndent: (t, @as(json`null`) _, int) => string = "JSON.stringify"
@val external stringifyWithReplacer: (t, jsonReplacer) => string = "JSON.stringify"
@val external stringifyWithReplacerAndIndent: (t, jsonReplacer, int) => string = "JSON.stringify"

@val external parseToAnyExn: string => 'a = "JSON.parse"
@val external parseToAnyExnWithReviver: (string, jsonReviver) => 'a = "JSON.parse"
@val external stringifyAny: 'a => option<string> = "JSON.stringify"
@val
external stringifyAnyWithIndent: ('a, @as(json`null`) _, int) => option<string> = "JSON.stringify"
@val
external stringifyAnyWithReplacer: ('a, jsonReplacer) => option<string> = "JSON.stringify"
@val
external stringifyAnyWithReplacerAndIndent: ('a, jsonReplacer, int) => option<string> =
  "JSON.stringify"

module Classify: {
  type t =
    | Bool(bool)
    | Null
    | String(string)
    | Number(float)
    | Object(Core__Dict.t<t>)
    | Array(array<t>)

  let classify: 'a => t
}

module Encode: {
  external bool: bool => t = "%identity"
  external null: t = "#null"
  external string: string => t = "%identity"
  external int: int => t = "%identity"
  external float: float => t = "%identity"
  external object: Core__Dict.t<t> => t = "%identity"
  external array: array<t> => t = "%identity"
}

module Decode: {
  let bool: t => option<bool>
  let null: t => option<Core__Null.t<'a>>
  let string: t => option<string>
  let float: t => option<float>
  let object: t => option<Core__Dict.t<t>>
  let array: t => option<array<t>>
}
