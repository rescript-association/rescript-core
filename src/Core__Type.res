type typeof = [
  | #undefined
  | #object
  | #boolean
  | #number
  | #bigint
  | #string
  | #symbol
  | #function
]

external typeof: 'a => typeof = "#typeof"

type unknown
external toUnknown: 'a => unknown = "%identity"

type object // How to use with the Object module?
type function

// typeof null == "object". Gotta love that! Do better here.
// https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof#typeof_null
type jsType =
  | Undefined
  | Null
  | Object(object)
  | Bool(bool)
  | Number(float)
  | BigInt(Core__BigInt.t)
  | String(string)
  | Symbol(Core__Symbol.t)
  | Function(function)

external toObjectUnsafe: 'a => object = "%identity"
external toBoolUnsafe: 'a => bool = "%identity"
external toFloatUnsafe: 'a => float = "%identity"
external toBigIntUnsafe: 'a => Core__BigInt.t = "%identity"
external toStringUnsafe: 'a => string = "%identity"
external toSymbolUnsafe: 'a => Core__Symbol.t = "%identity"
external toFunctionUnsafe: 'a => function = "%identity"

let isNull = %raw(`function(a) { return (a===null); }`)
let isNullOrUndefined = %raw(`function(a) { return (a===null || a===undefined); }`)
let isUndefined = %raw(`function(a) { return (a===undefined); }`)

let classify = value => {
  switch typeof(value) {
  | #number => value->toFloatUnsafe->Number
  | #string => value->toStringUnsafe->String
  | #boolean => value->toBoolUnsafe->Bool
  | #undefined => Undefined
  | #function => value->toFunctionUnsafe->Function
  | #bigint => value->toBigIntUnsafe->BigInt
  | #symbol => value->toSymbolUnsafe->Symbol
  | #object =>
    switch isNull(value) {
    | true => Null
    | false => value->toObjectUnsafe->Object
    }
  }
}

let toObject = i =>
  switch i->classify {
  | Object(i) => Some(i)
  | _ => None
  }

let toBool = i =>
  switch i->classify {
  | Bool(b) => Some(b)
  | _ => None
  }

let toFloat = i =>
  switch i->classify {
  | Number(i) => Some(i)
  | _ => None
  }

let toBigInt = i =>
  switch i->classify {
  | BigInt(i) => Some(i)
  | _ => None
  }

let toString = i =>
  switch i->classify {
  | String(i) => Some(i)
  | _ => None
  }

let toSymbol = i =>
  switch i->classify {
  | Symbol(i) => Some(i)
  | _ => None
  }

let toFunction = i =>
  switch i->classify {
  | Function(i) => Some(i)
  | _ => None
  }

// throws on null or undefined
@get_index external getUnsafe: ('a, string) => option<unknown> = ""
@get_index external getBySymbolUnsafe: ('a, Core__Symbol.t) => option<unknown> = ""

let get = (item, name) => isNullOrUndefined(item) ? None : item->getUnsafe(name)
let getBySymbol = (item, sym) => isNullOrUndefined(item) ? None : item->getBySymbolUnsafe(sym)
