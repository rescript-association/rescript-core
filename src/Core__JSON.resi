/***
Functions for interacting with JSON.
*/

/** 
A type representing a JSON object.
*/
@unboxed
type rec t = Js.Json.t =
  | Boolean(bool)
  | @as(null) Null
  | String(string)
  | Number(float)
  | Object(Core__Dict.t<t>)
  | Array(array<t>)

/** 
`parseExn(string)` 

Parses a JSON string or throws a JavaScript exception (SyntaxError), if the string isn't valid.
It returns a JSON type.

## Examples
```rescript
try {
  let _ = JSON.parseExn(`{"foo":"bar","hello":"world"}`)
  // { foo: 'bar', hello: 'world' }

  let _ = JSON.parseExn("")
  // error
} catch {
| Exn.Error(_) => Console.log("error")
}
```

## Exceptions 

- Raises a SyntaxError (Exn.t) if the string isn't valid JSON.
*/
@raises(Exn.t)
@val
external parseExn: (string, ~reviver: (string, t) => t=?) => t = "JSON.parse"

/** 
`stringify(json)` 

Converts a JSON object to a JSON string.
If you want to stringify any type, use `JSON.stringifyAny` instead.

## Examples
```rescript
let json =
  Dict.fromArray([
    ("foo", JSON.Encode.string("bar")),
    ("hello", JSON.Encode.string("world")),
    ("someNumber", JSON.Encode.int(42)),
  ])->JSON.Encode.object

JSON.stringify(json)
// {"foo":"bar","hello":"world","someNumber":42}
```
*/
@unboxed
type replacer = Array(array<string>) | Function((string, t) => t)

@val external stringify: (t, ~replacer: replacer=?, ~indent: int=?) => string = "JSON.stringify"

/** 
`stringifyAny(any)` 

Converts any type to a JSON string.
Stringifying a function or `undefined` will return `None`.
If the value contains circular references or `BigInt`s, the function will throw a JavaScript exception (TypeError).
If you want to stringify a JSON object, use `JSON.stringify` instead.

## Examples
```rescript
let dict = Dict.fromArray([
  ("foo", JSON.Encode.string("bar")),
  ("hello", JSON.Encode.string("world")),
  ("someNumber", JSON.Encode.int(42)),
])

JSON.stringifyAny(dict)
// {"foo":"bar","hello":"world","someNumber":42}

JSON.stringifyAny(() => "hello world")
// None

BigInt.fromInt(0)->JSON.stringifyAny
// exception
```

## Exceptions 

- Raises a TypeError if the value contains circular references.
- Raises a TypeError if the value contains `BigInt`s.
*/
@raises(Exn.t)
@val
external stringifyAny: ('a, ~replacer: replacer=?, ~indent: int=?) => option<string> =
  "JSON.stringify"

module Classify: {
  /**
  A type representing a JavaScript type.
  */
  type t =
    | Bool(bool)
    | Null
    | String(string)
    | Number(float)
    | Object(Core__Dict.t<t>)
    | Array(array<t>)

  /**
  Returns the JSON type of any value.

  ## Examples
  ```rescript
  JSON.Classify.classify("hello world")
  // String("hello world")

  JSON.Classify.classify(42)
  // Number(42)
  ```
  */
  let classify: 'a => t
}

module Encode: {
  /**
  Returns a boolean as a JSON object.

  ## Examples
  ```rescript
  JSON.Encode.bool(true)
  ```
  */
  external bool: bool => t = "%identity"

  /**
  Returns null as a JSON object.

  ## Examples
  ```rescript
  JSON.Encode.null
  ```
  */
  external null: t = "#null"

  /**
  Returns a string as a JSON object.

  ## Examples
  ```rescript
  JSON.Encode.string("hello world")
  ```
  */
  external string: string => t = "%identity"

  /**
  Returns an int as a JSON object.

  ## Examples
  ```rescript
  JSON.Encode.int(42)
  ```
  */
  external int: int => t = "%identity"

  /**
  Returns a float as a JSON object.

  ## Examples
  ```rescript
  JSON.Encode.float(42.0)
  ```
  */
  external float: float => t = "%identity"

  /**
  Returns a dict as a JSON object.

  ## Examples
  ```rescript
  let dict = Dict.fromArray([
    ("foo", JSON.Encode.string("bar")),
    ("hello", JSON.Encode.string("world")),
  ])

  JSON.Encode.object(dict)
  ```
  */
  external object: Core__Dict.t<t> => t = "%identity"

  /**
  Returns an array as a JSON object.

  ## Examples
  ```rescript
  let array = [JSON.Encode.string("hello world"), JSON.Encode.int(42)]

  JSON.Encode.array(array)
  ```
  */
  external array: array<t> => t = "%identity"
}

module Decode: {
  /**
  Decodes a single JSON value. If the value is a bool, it will return `Some(bool)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`true`)->JSON.Decode.bool
  // Some(true)

  JSON.parseExn(`"hello world"`)->JSON.Decode.bool
  // None
  ```
  */
  let bool: t => option<bool>

  /**
  Decodes a single JSON value. If the value is null, it will return `Some(Null.t)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`null`)->JSON.Decode.null
  // Some(null)

  JSON.parseExn(`"hello world"`)->JSON.Decode.null
  // None
  ```
  */
  let null: t => option<Core__Null.t<'a>>

  /**
  Decodes a single JSON value. If the value is a string, it will return `Some(string)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`"hello world"`)->JSON.Decode.string
  // Some("hello world")

  JSON.parseExn(`42`)->JSON.Decode.string
  // None 
  ```
  */
  let string: t => option<string>

  /**
  Decodes a single JSON value. If the value is a float, it will return `Some(float)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`42.0`)->JSON.Decode.float
  // Some(42.0)

  JSON.parseExn(`"hello world"`)->JSON.Decode.float
  // None
  ```
  */
  let float: t => option<float>

  /**
  Decodes a single JSON value. If the value is an object, it will return `Some(Dict.t)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`{"foo":"bar"}`)->JSON.Decode.object
  // Some({ foo: 'bar' })

  JSON.parseExn(`"hello world"`)->JSON.Decode.object
  // None
  ```
  */
  let object: t => option<Core__Dict.t<t>>

  /**
  Decodes a single JSON value. If the value is an array, it will return `Some(array)` - otherwise it will return `None`.

  ## Examples
  ```rescript
  JSON.parseExn(`["foo", "bar"]`)->JSON.Decode.array
  // Some([ 'foo', 'bar' ])

  JSON.parseExn(`"hello world"`)->JSON.Decode.array
  // None
  ```
  */
  let array: t => option<array<t>>
}
