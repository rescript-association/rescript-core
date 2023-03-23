/***
Utilities for classifying and safely using JavaScript values at runtime.
*/

/**
The possible types of JavaScript values. See [typeof on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof)
*/
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

/**
An abstract type-safe representation for values whose contents are a mystery, or at least not 100% guaranteed to be what you expect. A value of type `unknown` could a number, string, function, null, or any other JavaScript type. To safely use an `unknown` value use the functions in this module to test and classify it as its true underlying type.
*/
type unknown

external toUnknown: 'a => unknown = "%identity"

/**
`typeof(value)` returns the underlying JavaScript type of `value` at runtime. **Note** null values return `object`. See [typeof on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/typeof)

## Examples
```rescript
Type.typeof("Hello") // "string"
Type.typeof(3) // "number"
Type.typeof(3.14) // "number"
Type.typeof(null) // "object"
```
*/
external typeof: 'a => typeof = "#typeof"

// Why can't this be {..} so it can be used by the Object module?
type object

/**
  An abstract type representing a JavaScript function. See [`function on MDN`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Function)
  */
type function

/**
Represents a classified JavaScript value.
*/
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

/**
`classify(value)` inspects a value and determines its type using the `typeof` function.

## Examples
```rescript
switch %raw(`null`)->Type.Classify.classify {
| Null => Console.log("Yup, that's null.")
| _ => Console.log("This doesn't actually appear to be null...")
}
```
*/
let classify: 'a => jsType

let isUndefined: 'a => bool
let isNull: 'a => bool
let isNullOrUndefined: 'a => bool

let toObject: 'a => option<object>
let toBool: 'a => option<bool>
let toFloat: 'a => option<float>
let toBigInt: 'a => option<Core__BigInt.t>
let toString: 'a => option<string>
let toSymbol: 'a => option<Core__Symbol.t>
let toFunction: 'a => option<function>

let toObjectUnsafe: 'a => object
let toBoolUnsafe: 'a => bool
let toFloatUnsafe: 'a => float
let toBigIntUnsafe: 'a => Core__BigInt.t
let toStringUnsafe: 'a => string
let toSymbolUnsafe: 'a => Core__Symbol.t
let toFunctionUnsafe: 'a => function

// == EXPERIMENTAL ==
// Might be helpful for pulling data out of an exception or Error
// or unknown object, without having to add getters to additional
// objects.

// Throws on null or undefined
// @get_index external getUnsafe: ('a, string) => option<unknown> = ""
// @get_index external getBySymbolUnsafe: ('a, Core__Symbol.t) => option<unknown> = ""

// Checks for null and undefined first; are these safe?
let get: ('a, string) => option<unknown>
let getBySymbol: ('a, Core__Symbol.t) => option<unknown>
