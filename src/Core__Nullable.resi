/***
Functions for handling nullable values.

Primarily useful when interoping with JavaScript when you don't know whether you'll get a value, `null` or `undefined`.
*/

/**
Type representing a nullable value. 
A nullable value can be the value `'a`, `null` or `undefined`.
*/
type t<'a> = Js.Nullable.t<'a>

/**
The value `null`.

See [`null`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/null) on MDN.

## Examples
```rescript
Console.log(Nullable.null) // Logs `null` to the console.
```
*/
external null: t<'a> = "#null"

/**
The value `undefined`.

See [`undefined`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/undefined) on MDN.

## Examples
```rescript
Console.log(undefined) // Logs `undefined` to the console.
```
*/
external undefined: t<'a> = "#undefined"

/**
Creates a new nullable value from the provided value. 
This means the compiler will enforce null checks for the new value.

## Examples
```rescript
let myStr = "Hello"
let asNullable = myStr->Nullable.make

// Can't do the below because we're now forced to check for nullability
// myStr == asNullable

// Need to do this
switch asNullable->Nullable.toOption {
| Some(value) if value == myStr => Console.log("Yay, values matched!")
| _ => Console.log("Values did not match.")
}
```
*/
external make: 'a => t<'a> = "%identity"

let equal: (t<'a>, t<'b>, ('a, 'b) => bool) => bool

let compare: (t<'a>, t<'b>, ('a, 'b) => int) => int

/**
Converts a nullable value into an option, so it can be pattern matched on.
Will convert both `null` and `undefined` to `None`, and a present value to `Some(value)`.

## Examples
```rescript
let nullableString = Nullable.make("Hello")

switch nullableString->Nullable.toOption {
| Some(str) => Console.log2("Got string:", str)
| None => Console.log("Didn't have a value.")
}
```
*/
external toOption: t<'a> => option<'a> = "#nullable_to_opt"

/**
Turns an `option` into a `Nullable.t`.

## Examples
```rescript
let optString = Some("Hello")
let asNullable = optString->Nullable.fromOption // Nullable.t<string>
```
*/
let fromOption: option<'a> => t<'a>

/**
`getWithDefault(value, default)` returns `value` if not `null` or `undefined`,
otherwise return `default`.

## Examples

```rescript
Nullable.getWithDefault(Nullable.null, "Banana") // Banana
Nullable.getWithDefault(Nulalble.make("Apple"), "Banana") // Apple

let greet = (firstName: option<string>) =>
  "Greetings " ++ firstName->Nullable.getWithDefault("Anonymous")

Nullable.make("Jane")->greet // "Greetings Jane"
Nullable.null->greet // "Greetings Anonymous"
```
*/
let getWithDefault: (t<'a>, 'a) => 'a

/**
`getExn(value)` raises an exception if `null` or `undefined`, otherwise returns the value.

```rescript
Nullable.getExn(Nullable.make(3)) // 3
Nullable.getExn(Nullable.null) /* Raises an Error */
```

## Exceptions

- Raises `Invalid_argument` if `value` is `null` or `undefined`
*/
let getExn: t<'a> => 'a

/**
`getUnsafe(value)` returns `value`.

## Examples

```rescript
Nullable.getUnsafe(Nullable.make(3)) == 3
Nullable.getUnsafe(Nullable.null) // Raises an error
```

## Important

- This is an unsafe operation, it assumes `value` is not `null` or `undefined`.
*/
external getUnsafe: t<'a> => 'a = "%identity"

/**
`map(value, f)` returns `f(value)` if `value` is not `null` or `undefined`,
otherwise returns `value` unchanged.

## Examples

```rescript
Nullable.map(Nullable.make(3), x => x * x) // Nullable.make(9)
Nullable.map(undefined, x => x * x) // undefined
```
*/
let map: (t<'a>, 'a => 'b) => t<'b>

/**
`mapWithDefault(value, default, f)` returns `f(value)` if `value` is not `null`
or `undefined`, otherwise returns `default`.

## Examples

```rescript
let someValue = Nullable.make(3)
someValue->Nullable.mapWithDefault(0, x => x + 5) // 8

let noneValue = Nullable.null
noneValue->Nullable.mapWithDefault(0, x => x + 5) // 0
```
*/
let mapWithDefault: (t<'a>, 'b, 'a => 'b) => 'b

/**
`flatMap(value, f)` returns `f(value)` if `value` is not `null` or `undefined`,
otherwise returns `value` unchanged.

## Examples

```rescript
let addIfAboveOne = value =>
  if (value > 1) {
    Nullable.make(value + 1)
  } else {
    Nullable.null
  }

Nullable.flatMap(Nullable.make(2), addIfAboveOne) // Nullable.make(3)
Nullable.flatMap(Nullable.make(-4), addIfAboveOne) // undefined
Nullable.flatMap(Nullable.null, addIfAboveOne) // undefined
```
*/
let flatMap: (t<'a>, 'a => t<'b>) => t<'b>
