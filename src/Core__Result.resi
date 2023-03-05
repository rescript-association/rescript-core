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

/**
  Result types are really useful to describe the result of a certain operation
  without relying on exceptions or `option` types.

  This module gives you useful utilities to create and combine `Result` data.
*/
/**
  The type `Result.t(result, err)` describes a variant of two states:
  `Ok(someResult)` represents a successful operation, whereby
  ``Error(someError)` signals an erronous operation.

  In this concrete example, we are defining our own `Result` type to reflect an HTTP like
  query operation:

  ```res example
  type responseError = NotAvailable | NotFound
  type queryResult = t<string, responseError>

  let failQueryUser = (username: string): queryResult => {
    Error(NotAvailable)
  }
```
*/
type t<'a, 'b> = result<'a, 'b> = Ok('a) | Error('b)

/**
  `getExn(res)`: when `res` is `Ok(n)`, returns `n` when `res` is `Error(m)`, raise an exception

  ```res example
  Result.getExn(Result.Ok(42)) == 42

  Result.getExn(Result.Error("Invalid data")) /* raises exception */
  ```
*/
let getExn: t<'a, 'b> => 'a

/**
  `mapWithDefault(res, default, f)`: When res is `Ok(n)`, returns `f(n)`,
  otherwise `default`.

  ```res example
  let ok = Result.Ok(42)
  Result.mapWithDefault(ok, 0, (x) => x / 2) == 21

  let error = Result.Error("Invalid data")
  Result.mapWithDefault(error, 0, (x) => x / 2) == 0
  ```
*/
let mapWithDefault: (t<'a, 'c>, 'b, 'a => 'b) => 'b

/**
  `map(res, f)`: When res is `Ok(n)`, returns `Ok(f(n))`. Otherwise returns res
  unchanged. Function `f` takes a value of the same type as `n` and returns an
  ordinary value.

  ```res example
  let f = (x) => sqrt(Int.toFloat(x))

  Result.map(Ok(64), f) == Ok(8.0)

  Result.map(Error("Invalid data"), f) == Error("Invalid data")
  ```
*/
let map: (t<'a, 'c>, 'a => 'b) => t<'b, 'c>

/**
  `flatMap(res, f)`: When res is `Ok(n)`, returns `f(n)`. Otherwise, returns res
  unchanged. Function `f` takes a value of the same type as `n` and returns a
  `Result`.

  ```res example
  let recip = (x) =>
    if (x !== 0.0) {
      Result.Ok(1.0 /. x)
    } else {
      Result.Error("Divide by zero")
    }

  Result.flatMap(Ok(2.0), recip) == Ok(0.5)

  Result.flatMap(Ok(0.0), recip) == Error("Divide by zero")

  Result.flatMap(Error("Already bad"), recip) == Error("Already bad")
  ```
*/
let flatMap: (t<'a, 'c>, 'a => t<'b, 'c>) => t<'b, 'c>

/**
  `getWithDefault(res, defaultValue)`: If `res` is `Ok(n)`, returns `n`,
  otherwise `default`

  ```res example
  Result.getWithDefault(Ok(42), 0) == 42

  Result.getWithDefault(Error("Invalid Data"), 0) == 0
  ```
*/
let getWithDefault: (t<'a, 'b>, 'a) => 'a

/**
  `isOk(res)`: Returns `true` if `res` is of the form `Ok(n)`, `false` if it is
  the `Error(e)` variant.
*/
let isOk: t<'a, 'b> => bool

/**
  `isError(res)`: Returns `true` if `res` is of the form `Error(e)`, `false` if
  it is the `Ok(n)` variant.
*/
let isError: t<'a, 'b> => bool

/**
  `equal(res1, res2, f)`: Determine if two `Result` variables are equal with
  respect to an equality function. If `res1` and `res2` are of the form `Ok(n)`
  and `Ok(m)`, return the result of `f(n, m)`. If one of `res1` and `res2` are of
  the form `Error(e)`, return false If both `res1` and `res2` are of the form
  `Error(e)`, return true

  ```res example
  let good1 = Result.Ok(42)

  let good2 = Result.Ok(32)

  let bad1 = Result.Error("invalid")

  let bad2 = Result.Error("really invalid")

  let mod10equal = (a, b) => mod(a, 10) === mod(b, 10)

  Result.equal(good1, good2, mod10equal) == true

  Result.equal(good1, bad1, mod10equal) == false

  Result.equal(bad2, good2, mod10equal) == false

  Result.equal(bad1, bad2, mod10equal) == true
  ```
*/
let equal: (t<'a, 'c>, t<'b, 'd>, ('a, 'b) => bool) => bool

/**
  `compare(res1, res2, f)`: Compare two `Result` variables with respect to a
  comparison function. The comparison function returns -1 if the first variable
  is "less than" the second, 0 if the two variables are equal, and 1 if the first
  is "greater than" the second.

  If `res1` and `res2` are of the form `Ok(n)` and `Ok(m)`, return the result of
  `f(n, m)`. If `res1` is of the form `Error(e)` and `res2` of the form `Ok(n)`,
  return -1 (nothing is less than something) If `res1` is of the form `Ok(n)` and
  `res2` of the form `Error(e)`, return 1 (something is greater than nothing) If
  both `res1` and `res2` are of the form `Error(e)`, return 0 (equal)

  ```res example
  let good1 = Result.Ok(59)

  let good2 = Result.Ok(37)

  let bad1 = Result.Error("invalid")

  let bad2 = Result.Error("really invalid")

  let mod10cmp = (a, b) => Pervasives.compare(mod(a, 10), mod(b, 10))

  Result.compare(Ok(39), Ok(57), mod10cmp) == 1

  Result.compare(Ok(57), Ok(39), mod10cmp) == (-1)

  Result.compare(Ok(39), Error("y"), mod10cmp) == 1

  Result.compare(Error("x"), Ok(57), mod10cmp) == (-1)

  Result.compare(Error("x"), Error("y"), mod10cmp) == 0
  ```
*/
let compare: (t<'a, 'c>, t<'b, 'd>, ('a, 'b) => int) => int
