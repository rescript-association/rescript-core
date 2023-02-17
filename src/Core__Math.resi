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
Functions for interacting with JavaScript Math.
See: [`Math`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math).
*/

/**
Mathematical Constants
*/
module Constants: {
  /**
  `Math.Constants.e` returns Euler's number, ≈ 2.718281828459045.
  See [`Math.E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/E) on MDN.

  ## Examples

  ```rescript
  Math.Constants.e
  ```
  */
  @val
  external e: float = "Math.E"

  /**
  `Math.Constants.ln2` returns Natural logarithm of 2, ≈ 0.6931471805599453.
  See [`Math.LN2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LN2) on MDN.

  ## Examples

  ```rescript
  Math.Constants.LN2
  ```
  */
  @val
  external ln2: float = "Math.LN2"

  /**
  `Math.Constants.ln10` returns Natural logarithm of 10, ≈ 2.302585092994046.
  See [`Math.LN10`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LN10) on MDN.

  ## Examples

  ```rescript
  Math.Constants.ln10
  ```
  */
  @val
  external ln10: float = "Math.LN10"

  /**
  `Math.Constants.log2e` returns Base 2 logarithm of E, ≈ 1.4426950408889634.
  See [`Math.LOG2E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LOG2E) on MDN.

  ## Examples

  ```rescript
  Math.Constants.log2e
  ```
  */
  @val
  external log2e: float = "Math.LOG2E"

  /**
  `Math.Constants.log10e` returns Base 10 logarithm of E, ≈ 0.4342944819032518.
  See [`Math.LOG10E`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/LOG10E) on MDN.

  ## Examples

  ```rescript
  Math.Constants.log10e
  ```
  */
  @val
  external log10e: float = "Math.LOG10E"
  /**
  `Math.Constants.pi` returns Pi - ratio of the circumference to the diameter
  of a circle, ≈ 3.141592653589793.
  See [`Math.PI`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/PI) on MDN.

  ## Examples

  ```rescript
  Math.Constants.pi
  ```
  */
  @val
  external pi: float = "Math.PI"
  /**
  `Math.Constants.sqrt1_2` returns Square root of 1/2, ≈ 0.7071067811865476.
  See [`Math.SQRT1_2`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/SQRT1_2) on MDN.

  ## Examples

  ```rescript
  Math.Constants.sqrt1_2
  ```
  */
  @val
  external sqrt1_2: float = "Math.SQRT1_2"
  /**
  `Math.Constants.e` returns Absolute value for integer argument.
  See [`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs) on MDN.

  ## Examples

  ```rescript
  Math.Constants.sqrt2
  ```
  */
  @val
  external sqrt2: float = "Math.SQRT2"
}

/**
Provide Math utilities for `int`
*/
module Int: {
  /**
  `abs(v)` returns absolute value of `v`.
  See [`Math.abs`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/abs) on MDN.

  ## Examples

  ```rescript
  Math.Int.abs(-2) // 2
  Math.Int.abs(3) // 3
  ```
  */
  @val
  external abs: int => int = "Math.abs"

  /**
  `clz32(v)` returns the number of leading zero bits of the argument's 32 bit
  int representation.
  See [`Math.clz32`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/clz32) on MDN.

  ## Examples

  ```rescript
  // 00000000000000000000000000000001
  Math.Int.clz32(1) // 31
  // 00000000000000000000000000000100
  Math.Int.clz32(4) // 29
  ```
  */
  @val
  external clz32: int => int = "Math.clz32"

  /**
  `imul(a, b)` returns 32-bit integer multiplication. Use this only when you
  need to optimize performance of multiplication of numbers stored as 32-bit
  integers. See [`Math.imul`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/imul) on MDN.

  ## Examples

  ```rescript
  Math.Int.imul(3, 4) // 12
  Math.Int.imul(-5, 12) // 60
  ```
  */
  @val external imul: (int, int) => int = "Math.imul"

  /**
  `min(a, b)` returns the minimum of its two integer arguments. See [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.

  ## Examples

  ```rescript
  Math.Int.min(1, 2) // 1
  Math.Int.min(-1, -2) // -2
  ```
  */
  @val external min: (int, int) => int = "Math.min"

  /**
  `minMany(arr)` returns the minimum of the integers in the given array `arr`.
  See [`Math.min`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/min) on MDN.

  ## Examples

  ```rescript
  Math.Int.minMany([1, 2]) // 1
  Math.Int.minMany([-1, -2]) // -2
  Math.Int.minMany([]) == 0 // false
  ```
  */
  @variadic @val external minMany: array<int> => int = "Math.min"

  /**
  `max(a, b)` returns the maximum of its two integer arguments. See [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.

  ## Examples

  ```rescript
  Math.Int.max(1, 2) // 2
  Math.Int.max(-1, -2) // -1
  ```
  */
  @val external max: (int, int) => int = "Math.max"

  // NOTE: `Math.Int.maxMany([])` compile to `Math.max()` and return `Infinity`
  // In JS `Math.max([])` return 0
  // We should create a wrapper to handle an empty array?
  // An Example: `Math.Int.maxMany([])` not return an int.
  // Same problem with `Math.Int.minMany`

  /**
  `maxMany(arr)` returns the maximum of the integers in the given array `arr`.
  See [`Math.max`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/max) on MDN.

  ## Examples

  ```rescript
  Math.Int.maxMany([1, 2]) // 2
  Math.Int.maxMany([-1, -2]) // -1
  Math.Int.maxMany([]) == 0 // false
  ```
  */
  @variadic @val external maxMany: array<int> => int = "Math.max"

  // NOTE: the return type may be not int, example `pow(3, ~exp=-3)` return a float
  // We should remove this function?

  /**
  `pow(a, ~exp)` raises the given base `a` to the given exponent `exp`. See [`Math.pow`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/pow) on MDN.

  ## Examples

  ```rescript
  Math.Int.pow(2, ~exp=4) // 16
  Math.Int.pow(3, ~exp=4) // 81
  ```
  */
  @val external pow: (int, ~exp: int) => int = "Math.pow"

  // NOTE: In JS `Math.sin(2)` return a float

  /**
  `sign(a)` returns the sign of its integer argument: `-1` if negative, `0` if
  zero, `1` if positive. See [`Math.sign`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Math/sign) on MDN.

  ## Examples

  ```rescript
  Math.Int.sign(3) // 1
  Math.Int.sign(-3) // 1
  Math.Int.sign(0) // 0
  ```
  */
  @val external sign: int => int = "Math.sign"
}
@val external abs: float => float = "Math.abs"
@val external acos: float => float = "Math.acos"
@val external acosh: float => float = "Math.acosh"
@val external asin: float => float = "Math.asin"
@val external asinh: float => float = "Math.asinh"
@val external atan: float => float = "Math.atan"
@val external atanh: float => float = "Math.atanh"
@val external atan2: (~x: float, ~y: float) => float = "Math.atan2"
@val external cbrt: float => float = "Math.cbrt"
@val external ceil: float => float = "Math.ceil"
@val external cos: float => float = "Math.cos"
@val external cosh: float => float = "Math.cosh"
@val external exp: float => float = "Math.exp"
@val external expm1: float => float = "Math.expm1"
@val external floor: float => float = "Math.floor"
@val external fround: float => float = "Math.fround"
@val external hypot: (float, float) => float = "Math.hypot"
@variadic @val external hypotMany: array<float> => float = "Math.hypot"
@val external log: float => float = "Math.log"
@val external log1p: float => float = "Math.log1p"
@val external log10: float => float = "Math.log10"
@val external log2: float => float = "Math.log2"
@val external min: (float, float) => float = "Math.min"
@variadic @val external minMany: array<float> => float = "Math.min"
@val external max: (float, float) => float = "Math.max"
@variadic @val external maxMany: array<float> => float = "Math.max"
@val external pow: (float, ~exp: float) => float = "Math.pow"
@val external random: unit => float = "Math.random"
@val external round: float => float = "Math.round"
@val external sign: float => float = "Math.sign"
@val external sin: float => float = "Math.sin"
@val external sinh: float => float = "Math.sinh"
@val external sqrt: float => float = "Math.sqrt"
@val external tan: float => float = "Math.tan"
@val external tanh: float => float = "Math.tanh"
@val external trunc: float => float = "Math.trunc"
