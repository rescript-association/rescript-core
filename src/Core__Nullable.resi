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
Console.log(Nullable.undefined) // Logs `undefined` to the console.
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
