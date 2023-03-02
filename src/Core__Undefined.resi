/***
Functions for handling values that could be `undefined`.

Please note that a regular `option` is also represented as `undefined` or the value `'a`. In many cases it makes sense to use `option` directly.

If you also need to cover `null`, check out `Nullable` instead.
*/

/**
A type representing a value that can be either `'a` or `undefined`.
*/
type t<'a> = Js.Undefined.t<'a>

/**
Converts a `Undefined.t` into a `Nullable.t`.

## Examples
```rescript
let undefinedValue = Undefined.make("Hello")
let asNullable = undefinedValue->Undefined.asNullable // Nullable.t<string>
```
*/
external asNullable: t<'a> => Core__Nullable.t<'a> = "%identity"

/**
The value `undefined`.

See [`undefined`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/undefined) on MDN.

## Examples
```rescript
Console.log(Undefined.undefined) // Logs `undefined` to the console.
```
*/
external undefined: t<'a> = "#undefined"

/**
Creates a new `Undefined.t` from the provided value. 
This means the compiler will enforce `undefined` checks for the new value.

## Examples
```rescript
let myStr = "Hello"
let asUndefinedValue = myStr->Undefined.make // The compiler now thinks this can be `string` or `undefined`.
```
*/
external make: 'a => t<'a> = "%identity"

/**
Converts a potentially undefined value into an option, so it can be pattern matched on.
Will convert `undefined` to `None`, and a present value to `Some(value)`.

## Examples
```rescript
let undefinedStr = Undefined.make("Hello")

switch undefinedStr->Undefined.toOption {
| Some(str) => Console.log2("Got string:", str)
| None => Console.log("Didn't have a value.")
}
```
*/
external toOption: t<'a> => option<'a> = "#undefined_to_opt"

/**
Turns an `option` into a `Undefined.t`. `None` will be converted to `undefined`.

## Examples
```rescript
let optString: option<string> = None
let asUndefined = optString->Undefined.fromOption // Undefined.t<string>
Console.log(asUndefined == Undefined.undefined) // Logs `true` to the console.
```
*/
let fromOption: option<'a> => t<'a>
