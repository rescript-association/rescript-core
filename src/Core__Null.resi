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
Console.log(Null.null) // Logs `null` to the console.
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
Console.log(asNull == Null.null) // Logs `true` to the console.
```
*/
let fromOption: option<'a> => t<'a>
