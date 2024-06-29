/*
                             OCaml

         Xavier Leroy, projet Cristal, INRIA Rocquencourt

Copyright 1996 Institut National de Recherche en Informatique et en Automatique.

All rights reserved.  This file is distributed under the terms of
the GNU Lesser General Public License version 2.1, with the
special exception on linking described in the file LICENSE.
*/


type t = char

external code: char => int = "%identity"
external unsafeChr: int => char = "%identity"

let chr = n =>
  if n < 0 || n > 255 {
    invalid_arg("Char.chr")
  } else {
    unsafeChr(n)
  }

external bytes_create: int => bytes = "?create_bytes"
external bytes_unsafe_set: (bytes, int, char) => unit = "%bytes_unsafe_set"
external unsafe_to_string: bytes => string = "%bytes_to_string"

let escaped = param =>
  switch param {
  | '\'' => "\\'"
  | '\\' => "\\\\"
  | '\n' => "\\n"
  | '\t' => "\\t"
  | '\r' => "\\r"
  | '\b' => "\\b"
  | ' ' .. '~' as c =>
    let s = bytes_create(1)
    bytes_unsafe_set(s, 0, c)
    unsafe_to_string(s)
  | c =>
    let n = code(c)
    let s = bytes_create(4)
    bytes_unsafe_set(s, 0, '\\')
    bytes_unsafe_set(s, 1, unsafeChr(48 + n / 100))
    bytes_unsafe_set(s, 2, unsafeChr(48 + mod(n / 10, 10)))
    bytes_unsafe_set(s, 3, unsafeChr(48 + mod(n, 10)))
    unsafe_to_string(s)
  }

let lowercaseAscii = c =>
  if c >= 'A' && c <= 'Z' {
    unsafeChr(code(c) + 32)
  } else {
    c
  }

let uppercaseAscii = c =>
  if c >= 'a' && c <= 'z' {
    unsafeChr(code(c) - 32)
  } else {
    c
  }


let compare = (c1, c2) => code(c1) - code(c2)
let equal = (c1: t, c2: t) => compare(c1, c2) == 0
