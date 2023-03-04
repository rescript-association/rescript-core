/***
  Functions for interacting with JSON.
*/

/** 
A type representing a JSON object.
*/
type t = Js.Json.t

/**
A type which describes how the value should be transformed while stringification.
It is a function which receives a key and a value.
*/
type jsonReplacer
external asJsonReplacer: 'a => jsonReplacer = "%identity"

/** 
`parseExn(string)` 

Parses a JSON string or throws a JavaScript exception (SyntaxError), if the string isn't valid.
It returns a JSON type.

## Examples
```rescript
try {
  JSON.parseExn(`{"foo":"bar","hello":"world"}`)
  // { foo: 'bar', hello: 'world' }

  JSON.parseExn("")
  // error
} catch {
| Js.Exn.Error(obj) => Console.log("error")
}
```
*/
@raises
@val
external parseExn: string => t = "JSON.parse"

/** 
`parseExnWithReviver(string, reviver)` 

Parses a JSON string or throws a JavaScript exception (SyntaxError), if the string isn't valid.
The reviver describes how the value should be transformed. It is a function which receives a key and a value.
It returns a JSON type.

## Examples
```rescript
let reviver = (key, value) => {
  if key->String.toLowerCase->String.includes("date") {
    value->JSON.Decode.string->Option.map(Date.fromString)->JSON.Encode.any
  } else {
    value
  }
}

let jsonString = `{"parseAsDate":"2023-02-26","parseAsString":"2023-02-26"}`

try {
  JSON.parseExnWithReviver(jsonString, reviver)
  // { parseAsDate: 2023-02-26T00:00:00.000Z, parseAsString: '2023-02-26' }

  JSON.parseExnWithReviver("", reviver)
  // error
} catch {
| Js.Exn.Error(_) => Console.log("error")
}
```
*/
@raises
@val
external parseExnWithReviver: (string, (string, t) => t) => t = "JSON.parse"

/** 
`stringify(json)` 

Converts a JSON object to a JSON string.
If you want to stringify any type, use `JSON.stringifyAny` instead.

## Examples
```rescript
Dict.fromArray([("foo", JSON.Encode.string("bar")), ("hello", JSON.Encode.string("world"))])
->JSON.Encode.object
->JSON.stringify
// {"foo":"bar","hello":"world"}
}
```
*/
@val
external stringify: t => string = "JSON.stringify"

/** 
`stringifyWithIndent(json, indentation)` 

Converts a JSON object to a JSON string. The output will be indented.
If you want to stringify any type, use `JSON.stringifyAnyWithIndent` instead.

## Examples
```rescript
Dict.fromArray([("foo", JSON.Encode.string("bar")), ("hello", JSON.Encode.string("world"))])
->JSON.Encode.object
->JSON.stringify
// {
//   "foo": "bar",
//   "hello": "world"
// }
}
```
*/
@val
external stringifyWithIndent: (t, @as(json`null`) _, int) => string = "JSON.stringify"

/** 
`stringifyWithReplacer(json, jsonReplacer)` 

Converts a JSON object to a JSON string.
The replacer describes how the value should be transformed. It is a function which receives a key and a value.
If you want to stringify any type, use `JSON.stringifyAnyWithReplacer` instead.

## Examples
```rescript
let replacer = JSON.asJsonReplacer((key, value) => {
  if key === "foo" {
    String.toUpperCase(value)
  } else if value === "world" {
    value ++ "!"
  } else {
    value
  }
})

Dict.fromArray([("foo", JSON.Encode.string("bar")), ("hello", JSON.Encode.string("world"))])
->JSON.Encode.object
->JSON.stringifyWithReplacer(replacer)
// {"foo":"BAR","hello":"world!"}
```
*/
@val
external stringifyWithReplacer: (t, jsonReplacer) => string = "JSON.stringify"

/** 
`stringifyWithReplacerAndIndent(json, jsonReplacer, indentation)` 

Converts a JSON object to a JSON string. The output will be indented.
The replacer describes how the value should be transformed. It is a function which receives a key and a value.

## Examples
```rescript
let replacer = JSON.asJsonReplacer((key, value) => {
  if key === "foo" {
    String.toUpperCase(value)
  } else if value === "world" {
    value ++ "!"
  } else {
    value
  }
})

Dict.fromArray([("foo", JSON.Encode.string("bar")), ("hello", JSON.Encode.string("world"))])
->JSON.Encode.object
->JSON.stringifyWithReplacerAndIndent(replacer, 2)
// {
//   "foo": "BAR",
//   "hello": "world!"
// }
```
*/
@val
external stringifyWithReplacerAndIndent: (t, jsonReplacer, int) => string = "JSON.stringify"

/** 
`stringifyAny(any)` 

Converts any type to a JSON string. Values which can't be strinfified will return `None`. 
Throws a JavaScript exception (TypeError), if the value can't be stringified.
If you want to stringify a JSON object, use `JSON.stringify` instead.

## Examples
```rescript
Dict.fromArray([("foo", "bar"), ("hello", "world")])->JSON.stringifyAny
// Some({"foo":"bar","hello":"world"})

let someFunction = () => {"hello world"}

someFunction->JSON.stringifyAny
// None

BigInt.fromInt(0)->JSON.stringifyAny
// exception
```
*/
@raises
@val
external stringifyAny: 'a => option<string> = "JSON.stringify"

/** 
`stringifyAnyWithIndent(any, indentation)` 

Converts any type to a JSON string. Values which can't be strinfified will return `None`. 
Throws a JavaScript exception (TypeError), if the value can't be stringified.
If you want to stringify a JSON object, use `JSON.stringifyWithIndent` instead.

## Examples
```rescript
Dict.fromArray([("foo", "bar"), ("hello", "world")])->JSON.stringifyAnyWithIndent(2)
// Some({
//   "foo": "bar",
//   "hello": "world"
// })

let someFunction = () => {"hello world"}

someFunction->JSON.stringifyAnyWithIndent(2)
// None

BigInt.fromInt(0)->JSON.stringifyAnyWithIndent(2)
// exception
```
*/
@raises
@val
external stringifyAnyWithIndent: ('a, @as(json`null`) _, int) => option<string> = "JSON.stringify"

/** 
`stringifyAnyWithReplacer(json, jsonReplacer)` 

Converts any type to a JSON string. Values which can't be strinfified will return `None`. 
The replacer describes how the value should be transformed. It is a function which receives a key and a value.
Throws a JavaScript exception (TypeError), if the value can't be stringified.
If you want to stringify a JSON object, use `JSON.stringifyWithReplacer` instead.

## Examples
```rescript
let replacer = JSON.asJsonReplacer((key, value) => {
  if key === "foo" {
    String.toUpperCase(value)
  } else if value === "world" {
    value ++ "!"
  } else {
    value
  }
})

Dict.fromArray([("foo", "bar"), ("hello", "world")])->JSON.stringifyAnyWithReplacer(replacer)
// Some({"foo":"BAR","hello":"world!"})

let someFunction = () => {"hello world"}

someFunction->JSON.stringifyAnyWithReplacer(replacer)
// None

BigInt.fromInt(0)->JSON.stringifyAnyWithReplacer(replacer)
// exception
```
*/
@raises
@val
external stringifyAnyWithReplacer: ('a, jsonReplacer) => option<string> = "JSON.stringify"

/** 
`stringifyAnyWithReplacerAndIndent(json, jsonReplacer, indentation)` 

Converts any type to a JSON string. The output will be indented. Values which can't be strinfified will return `None`. 
The replacer describes how the value should be transformed. It is a function which receives a key and a value.
Throws a JavaScript exception (TypeError), if the value can't be stringified.
If you want to stringify a JSON object, use `JSON.stringifyWithReplacer` instead.

## Examples
```rescript
let replacer = JSON.asJsonReplacer((key, value) => {
  if key === "foo" {
    String.toUpperCase(value)
  } else if value === "world" {
    value ++ "!"
  } else {
    value
  }
})

Dict.fromArray([("foo", "bar"), ("hello", "world")])
->JSON.stringifyAnyWithReplacerAndIndent(replacer, 2)
// Some({
//   "foo": "BAR",
//   "hello": "world!"
// })

let someFunction = () => {"hello world"}

someFunction->JSON.stringifyAnyWithReplacerAndIndent(replacer, 2)
// None

BigInt.fromInt(0)->JSON.stringifyAnyWithReplacerAndIndent(replacer, 2)
// exception
```
*/
@raises
@val
external stringifyAnyWithReplacerAndIndent: ('a, jsonReplacer, int) => option<string> =
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
  Returns the JavaScript type of any value.

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

  /**
  Returns any as a JSON object.

  ## Examples
  ```rescript
  JSON.Encode.any("test")
  ```
  */
  external any: 'a => t = "%identity"
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
