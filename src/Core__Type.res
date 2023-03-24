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

let toObjectUnsafe = i => i->Obj.magic
let toBoolUnsafe = i => i->Obj.magic
let toFloatUnsafe = i => i->Obj.magic
let toBigIntUnsafe = i => i->Obj.magic
let toStringUnsafe = i => i->Obj.magic
let toSymbolUnsafe = i => i->Obj.magic
let toFunctionUnsafe = i => i->Obj.magic

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

let toObject = i => typeof(i) === #object ? Some((Obj.magic(i): object)) : None
let toBool = i => typeof(i) === #boolean ? Some((Obj.magic(i): bool)) : None
let toFloat = i => typeof(i) === #number ? Some((Obj.magic(i): float)) : None
let toBigInt = i => typeof(i) === #bigint ? Some((Obj.magic(i): Core__BigInt.t)) : None
let toString = i => typeof(i) === #string ? Some((Obj.magic(i): string)) : None
let toSymbol = i => typeof(i) === #symbol ? Some((Obj.magic(i): Core__Symbol.t)) : None
let toFunction = i => typeof(i) === #function ? Some((Obj.magic(i): function)) : None

// Implicitly creates a wrapper object for primitives that is promptly discard.
// Throws if the object is null or undefined.
@get_index external getUnsafe: ('a, string) => unknown = ""
@get_index external getBySymbolUnsafe: ('a, Core__Symbol.t) => unknown = ""

let getObject = (o, n) => isNullOrUndefined(o) ? None : o->getUnsafe(n)->toObject
let getObjectBySymbol = (o, s) => isNullOrUndefined(o) ? None : o->getBySymbolUnsafe(s)->toObject

let getBool = (o, n) => isNullOrUndefined(o) ? None : o->getUnsafe(n)->toBool
let getBoolBySymbol = (o, s) => isNullOrUndefined(o) ? None : o->getBySymbolUnsafe(s)->toBool

let getFloat = (o, n) => isNullOrUndefined(o) ? None : o->getUnsafe(n)->toFloat
let getFloatBySymbol = (o, s) => isNullOrUndefined(o) ? None : o->getBySymbolUnsafe(s)->toFloat

let getBigInt = (o, n) => isNullOrUndefined(o) ? None : o->getUnsafe(n)->toBigInt
let getBigIntBySymbol = (o, s) => isNullOrUndefined(o) ? None : o->getBySymbolUnsafe(s)->toBigInt

let getString = (o, n) => isNullOrUndefined(o) ? None : o->getUnsafe(n)->toString
let getStringBySymbol = (o, s) => isNullOrUndefined(o) ? None : o->getBySymbolUnsafe(s)->toString

let getSymbol = (o, n) => isNullOrUndefined(o) ? None : o->getUnsafe(n)->toSymbol
let getSymbolBySymbol = (o, s) => isNullOrUndefined(o) ? None : o->getBySymbolUnsafe(s)->toSymbol

let getFunction = (o, n) => isNullOrUndefined(o) ? None : o->getUnsafe(n)->toFunction
let getFunctionBySymbol = (o, s) =>
  isNullOrUndefined(o) ? None : o->getBySymbolUnsafe(s)->toFunction
