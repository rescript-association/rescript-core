/* Copyright (C) 2015-2016 Bloomberg Finance L.P.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * In addition to the permissions granted to you by the LGPL, you may combine
 * or link a "work that uses the Library" with a publicly distributed version
 * of this file to produce a combined library or application, then distribute
 * that combined work under the terms of your choosing, with no requirement
 * to comply with the obligations normally placed on you by section 4 of the
 * LGPL version 3 (or the corresponding section of a later version of the LGPL
 * should you choose to use a later version).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. */

/***
Functions for interacting with JavaScript Number.
See: [`Number`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number).
*/

module Constants: {
  /**
  The smallest positive number represented in JavaScript.
  See [`Number.MIN_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MIN_VALUE)
  on MDN.

  ## Examples

  ```rescript
  Console.log(Int.Constants.minValue)
  ```
  */
  @inline
  let minValue: int
  /**
  The largest positive number represented in JavaScript.
  See [`Number.MAX_VALUE`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/MAX_VALUE)
  on MDN.

  ## Examples

  ```rescript
  Console.log(Int.Constants.maxValue)
  ```
  */
  @inline
  let maxValue: int
}

let equal: (int, int) => bool

let compare: (int, int) => int

/**
`toExponential(n)` return a `string` representing the given value in exponential
notation.
See [`Number.toExponential`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential)
on MDN.

## Examples

```rescript
Int.toExponential(1000) // "1e+3"
Int.toExponential(-1000) // "-1e+3"
```
*/
@send
external toExponential: int => string = "toExponential"

/**
`toExponential(n, ~digits)` return a `string` representing the given value in
exponential notation. `digits` specifies how many digits should appear after
the decimal point. See [`Number.toExponential`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toExponential)
on MDN.

## Examples

```rescript
Int.toExponentialWithPrecision(77, ~digits=2) // "7.70e+1"
Int.toExponentialWithPrecision(5678, ~digits=2) // "5.68e+3"
```

## Exceptions

- `RangeError`: If `digits` less than 0 or greater than 10.
*/
@send
external toExponentialWithPrecision: (int, ~digits: int) => string = "toExponential"

/**
`toFixed(n)` return a `string` representing the given value using fixed-point
notation. See [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed)
on MDN.


## Examples

```rescript
Int.toFixed(123456) // "123456.00"
Int.toFixed(10) // "10.00"
```
*/
@send
external toFixed: int => string = "toFixed"

/**
`toFixedWithPrecision(n, ~digits)` return a `string` representing the given
value using fixed-point notation. `digits` specifies how many digits should
appear after the decimal point. See [`Number.toFixed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toFixed)
on MDN.

## Examples

```rescript
Int.toFixed(300, ~digits=4) // "300.0000"
Int.toFixed(300, ~digits=1) // "300.0"
```

## Exceptions

- `RangeError`: If `digits` is less than 0 or larger than 100.
*/
@send
external toFixedWithPrecision: (int, ~digits: int) => string = "toFixed"

/**
`toPrecision(n)` return a `string` representing the giver value with precision.
This function omits the argument that controls precision, so it behaves like
`toString`. See `toPrecisionWithPrecision` to control precision. See [`Number.toPrecision`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision) on MDN.

## Examples

```rescript
Int.toPrecision(100) // "100"
Int.toPrecision(1) // "1"
```
*/
@send
external toPrecision: int => string = "toPrecision"

/**
`toPrecision(n, ~digits)` return a `string` representing the giver value with
precision. `digits` specifies the number of significant digits. See [`Number.toPrecision`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toPrecision) on MDN.

## Examples

```rescript
Int.toPrecision(100, ~digits=2) // "1.0e+2"
Int.toPrecision(1) // "1.0"
```

## Exceptions

- `RangeError`: If `digits` is not between 1 and 100 (inclusive).
Implementations are allowed to support larger and smaller values as well.
ECMA-262 only requires a precision of up to 21 significant digits.

*/
@send
external toPrecisionWithPrecision: (int, ~digits: int) => string = "toPrecision"

/**
`toString(n)` return a `string` representing the given value.
See [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)
on MDN.

## Examples

```rescript
Int.toString(1000) // "1000"
Int.toString(-1000) // "-1000"
```
*/
@send
external toString: int => string = "toString"

/**
`toStringWithRadix(n, ~radix)` return a `string` representing the given value.
`~radix` specifies the radix base to use for the formatted number.
See [`Number.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toString)
on MDN.

## Examples

```rescript
Int.toString(6, ~radix=2) // "110"
Int.toString(3735928559, ~radix=16) // "deadbeef"
Int.toStringWithRadix(123456, ~radix=36) // "2n9c"
```

## Exceptions

`RangeError`: if `radix` is less than 2 or greater than 36.
*/
@send
external toStringWithRadix: (int, ~radix: int) => string = "toString"

/**
`toLocaleString(n)` return a `string` with language-sensitive representing the
given value. See [`Number.toLocaleString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Number/toLocaleString) on MDN.

## Examples

```rescript
// If the application uses English as the default language
Int.toLocaleString(1000) // "1,000"

// If the application uses Portuguese Brazil as the default language
Int.toLocaleString(1000) // "1.000"
```
*/
@send
external toLocaleString: int => string = "toLocaleString"

/**
`toFloat(n)` return a `float` representing the given value.

## Examples

```rescript
Int.toFloat(100) == 100.0
Int.toFloat(2) == 2.0
```
*/
external toFloat: int => float = "%identity"

/**
`fromFloat(n)` return an `int` representing the given value. The conversion is
done by truncating the decimal part.

## Examples

```rescript
Int.fromFloat(2.0) == 2
Int.fromFloat(1.999) == 1
Int.fromFloat(1.5) == 1
Int.fromFloat(0.9999) == 0
```
*/
external fromFloat: float => int = "%intoffloat"

/**
`fromString(~radix?, str)` return an `option<int>` representing the given value
`str`. `~radix` specifies the radix base to use for the formatted number.

## Examples

```rescript
Int.fromString("0") == Some(0)
Int.fromString("NaN") == None
Int.fromString(~radix=2, "6") == None
```
*/
let fromString: (~radix: int=?, string) => option<int>

/**
`mod(n1, n2)` calculates the modulo (remainder after division) of two integers.

## Examples

```rescript
Int.mod(7, 4) == 3
```
*/
external mod: (int, int) => int = "%modint"
