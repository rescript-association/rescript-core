/***
Functions for handling values that could be `null`.

If you also need to cover `undefined`, check out `Nullable` instead.
*/

/**
A type representing a value that can be either `'a` or `null`.
*/
type t<'a> = Js.Null.t<'a>

/**
Converts a `Null.t` into a `Nullable.t`.

## Examples
```rescript
let nullValue = Null.make("Hello")
let asNullable = nullValue->Null.asNullable // Nullable.t<string>
```
*/
external asNullable: t<'a> => Core__Nullable.t<'a> = "%identity"

/**
The value `null`.

See [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/null) on MDN.

## Examples
```rescript
Console.log(null) // Logs `null` to the console.
```
*/
external null: t<'a> = "#null"

/**
Creates a new `Null.t` from the provided value. 
This means the compiler will enforce null checks for the new value.

## Examples
```rescript
let myStr = "Hello"
let asNullValue = myStr->Null.make // The compiler now thinks this can be `string` or `null`.
```
*/
external make: 'a => t<'a> = "%identity"

let equal: (t<'a>, t<'b>, ('a, 'b) => bool) => bool

let compare: (t<'a>, t<'b>, ('a, 'b) => int) => int

/**
Converts a nullable value into an option, so it can be pattern matched on.
Will convert `null` to `None`, and a present value to `Some(value)`.

## Examples
```rescript
let nullStr = Null.make("Hello")

switch nullStr->Null.toOption {
| Some(str) => Console.log2("Got string:", str)
| None => Console.log("Didn't have a value.")
}
```
*/
external toOption: t<'a> => option<'a> = "#null_to_opt"

/**
Turns an `option` into a `Null.t`. `None` will be converted to `null`.

## Examples
```rescript
let optString: option<string> = None
let asNull = optString->Null.fromOption // Null.t<string>
Console.log(asNull == null) // Logs `true` to the console.
```
*/
let fromOption: option<'a> => t<'a>

/**
`getWithDefault(value, default)` returns `value` if not `null`, otherwise return
`default`.

## Examples

```rescript
Null.getWithDefault(null, "Banana") // Banana
Null.getWithDefault(Nulalble.make("Apple"), "Banana") // Apple

let greet = (firstName: option<string>) =>
  "Greetings " ++ firstName->Null.getWithDefault("Anonymous")

Null.make("Jane")->greet // "Greetings Jane"
null->greet // "Greetings Anonymous"
```
*/
let getWithDefault: (t<'a>, 'a) => 'a

/**
`getExn(value)` raises an exception if `null`, otherwise returns the value.

```rescript
Null.getExn(Null.make(3)) // 3
Null.getExn(null) /* Raises an Error */
```

## Exceptions

- Raises `Invalid_argument` if `value` is `null`,
*/
let getExn: t<'a> => 'a

/**
`getUnsafe(value)` returns `value`.

## Examples

```rescript
Null.getUnsafe(Null.make(3)) == 3
Null.getUnsafe(null) // Raises an error
```

## Important

- This is an unsafe operation, it assumes `value` is not `null`.
*/
external getUnsafe: t<'a> => 'a = "%identity"

/**
`map(value, f)` returns `f(value)` if `value` is not `null`, otherwise returns
`value` unchanged.

## Examples

```rescript
Null.map(Null.make(3), x => x * x) // Null.make(9)
Null.map(null, x => x * x) // null
```
*/
let map: (t<'a>, 'a => 'b) => t<'b>

/**
`mapWithDefault(value, default, f)` returns `f(value)` if `value` is not `null`,
otherwise returns `default`.

## Examples

```rescript
let someValue = Null.make(3)
someValue->Null.mapWithDefault(0, x => x + 5) // 8

let noneValue = null
noneValue->Null.mapWithDefault(0, x => x + 5) // 0
```
*/
let mapWithDefault: (t<'a>, 'b, 'a => 'b) => 'b

/**
`flatMap(value, f)` returns `f(value)` if `value` is not `null`, otherwise
returns `value` unchanged.

## Examples

```rescript
let addIfAboveOne = value =>
  if (value > 1) {
    Null.make(value + 1)
  } else {
    null
  }

Null.flatMap(Null.make(2), addIfAboveOne) // Null.make(3)
Null.flatMap(Null.make(-4), addIfAboveOne) // null
Null.flatMap(null, addIfAboveOne) // null
```
*/
let flatMap: (t<'a>, 'a => t<'b>) => t<'b>
