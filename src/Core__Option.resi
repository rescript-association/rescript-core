/* Copyright (C) 2017 Authors of ReScript
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
We represent the existence and nonexistence of a value by wrapping it with
the `option` type. In order to make it a bit more convenient to work with
option-types, we provide utility-functions for it.

The `option` type is a part of the ReScript standard library which is defined
like this:

```rescript
type option<'a> = None | Some('a)
```

```rescript
let someString: option<string> = Some("hello")
```
*/

/**
`filter(opt, f)` applies `f` to `opt`, if `f` returns `true`, then it returns `Some(value)`, otherwise returns `None`.

## Examples

```rescript
Option.filter(Some(10), x => x > 5) // Some(10)
Option.filter(Some(4), x => x > 5) // None
Option.filter(None, x => x > 5) // None
```
*/
let filter: (option<'a>, 'a => bool) => option<'a>

/**
`forEach(opt, f)` call `f` on `opt`. if `opt` is `Some(value)`, then if calls
`f`, otherwise returns `unit`.

## Examples

```rescript
Option.forEach(Some("thing"), x => Console.log(x)) // logs "thing"
Option.forEach(None, x => Console.log(x)) // returns ()
```
*/
let forEach: (option<'a>, 'a => unit) => unit

/**
`getExn(opt)` returns `value` if `opt` is `Some(value)`, otherwise raises an exception.

```rescript
Option.getExn(Some(3)) // 3
Option.getExn(None) /* Raises an Error */
```

## Exceptions

- Raises an error if `opt` is `None`
*/
let getExn: option<'a> => 'a

/**
`getUnsafe(value)` returns `value`.

## Examples

```rescript
Option.getUnsafe(Some(3)) == 3
Option.getUnsafe(None) // Raises an error
```

## Exceptions

- This is an unsafe operation, it assumes `value` is neither `None` nor `Some(None(...)))`
*/
external getUnsafe: option<'a> => 'a = "%identity"

/**
`mapWithDefault(opt, default, f)` returns `f(value)` if `opt` is `Some(value)`, otherwise `default`.

## Examples

```rescript
let someValue = Some(3)
someValue->Option.mapWithDefault(0, x => x + 5) // 8

let noneValue = None
noneValue->Option.mapWithDefault(0, x => x + 5) // 0
```
*/
let mapWithDefault: (option<'a>, 'b, 'a => 'b) => 'b

/**
`map(opt, f)` returns `Some(f(value))` if `opt` is `Some(value)`, otherwise `None`.

## Examples

```rescript
Option.map(Some(3), x => x * x) // Some(9)
Option.map(None, x => x * x) // None
```
*/
let map: (option<'a>, 'a => 'b) => option<'b>

/**
`flatMap(opt, f)` returns `f(value)` if `opt` is `Some(value)`, otherwise `None`.

## Examples

```rescript
let addIfAboveOne = value =>
  if (value > 1) {
    Some(value + 1)
  } else {
    None
  }

Option.flatMap(Some(2), addIfAboveOne) // Some(3)
Option.flatMap(Some(-4), addIfAboveOne) // None
Option.flatMap(None, addIfAboveOne) // None
```
*/
let flatMap: (option<'a>, 'a => option<'b>) => option<'b>

/**
`getWithDefault(opt, default)` returns `value` if `opt` is `Some(value)`, otherwise `default`.

## Examples

```rescript
Option.getWithDefault(None, "Banana") // Banana
Option.getWithDefault(Some("Apple"), "Banana") // Apple

let greet = (firstName: option<string>) =>
  "Greetings " ++ firstName->Option.getWithDefault("Anonymous")

Some("Jane")->greet // "Greetings Jane"
None->greet // "Greetings Anonymous"
```
*/
let getWithDefault: (option<'a>, 'a) => 'a

/**
`orElse(opt1, opt2)` returns `opt2` if `opt1` is `None`, otherwise `opt1`.

## Examples

```rescript
Option.orElse(Some(1812), Some(1066)) == Some(1812)
Option.orElse(None, Some(1066) == Some(1066)
Option.orElse(None, None) == None
```
*/
let orElse: (option<'a>, option<'a>) => option<'a>

/**
`isSome(opt)` returns `true` if `opt` is `Some(value)`, otherwise returns `false`.

## Examples

```rescript
Option.isSome(None) // false
Option.isSome(Some(1)) // true
```
*/
let isSome: option<'a> => bool

/**
`isNone(opt)` returns `true` if `opt` is `None`, false otherwise.

## Examples

```rescript
Option.isNone(None) // true
Option.isNone(Some(1)) // false
```
*/
let isNone: option<'a> => bool

/**
`equal(opt1, opt2, f)` evaluates two optional values for equality with respect to a predicate function `f`. If both `opt1` and `opt2` are `None`, returns `true`.
If one of the arguments is `Some(value)` and the other is `None`, returns
`false`.
If arguments are `Some(value1)` and `Some(value2)`, returns the result of
`f(value1, value2)`, the predicate function `f` must return a bool.

## Examples

```rescript
let clockEqual = (a, b) => mod(a, 12) == mod(b, 12)

open Option

equal(Some(3), Some(15), clockEqual) // true
equal(Some(3), None, clockEqual) // false
equal(None, Some(3), clockEqual) // false
equal(None, None, clockEqual) // true
```
*/
let equal: (option<'a>, option<'b>, ('a, 'b) => bool) => bool

/**
`compare(opt1, opt2, f)` compares two optional values with respect to given `f`.

If both `opt1` and `opt2` are `None`, it returns `0`. If the first argument is `Some(value1)` and the second is `None`, returns `1` (something is greater than nothing).

If the first argument is `None` and the second is `Some(value2)`, returns `-1`
(nothing is less than something).

If the arguments are `Some(value1)` and `Some(value2)`, returns the result of
`f(value1, value2)`, `f` takes two arguments and returns `-1` if the first
argument is less than the second, `0` if the arguments are equal, and `1` if
the first argument is greater than the second.

## Examples

```rescript
let clockCompare = (a, b) => compare(mod(a, 12), mod(b, 12))

open Option

compare(Some(3), Some(15), clockCompare) // 0
compare(Some(3), Some(14), clockCompare) // 1
compare(Some(2), Some(15), clockCompare) // (-1)
compare(None, Some(15), clockCompare) // (-1)
compare(Some(14), None, clockCompare) // 1
compare(None, None, clockCompare) // 0
```
*/
let compare: (option<'a>, option<'b>, ('a, 'b) => int) => int
