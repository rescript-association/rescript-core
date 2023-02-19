/* Copyright (C) 2017 Hongbo Zhang, Authors of ReScript
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

let flat = opt =>
  switch opt {
  | Some(v) => v
  | None => None
  }

let filterU = (opt, p) =>
  switch opt {
  | Some(value) as some if p(. value) => some
  | _ => None
  }

let filter = (opt, p) => filterU(opt, (. value) => p(value))

let forEachU = (opt, f) =>
  switch opt {
  | Some(value) => f(. value)
  | None => ()
  }

let forEach = (opt, f) => forEachU(opt, (. value) => f(value))

let getExn = opt =>
  switch opt {
  | Some(value) => value
  | None => raise(Not_found)
  }

let expect = (opt, message) =>
  switch opt {
  | Some(value) => value
  | None => raise(Failure(message))
  }

external getUnsafe: option<'a> => 'a = "%identity"

let mapWithDefaultU = (opt, default, f) =>
  switch opt {
  | Some(value) => f(. value)
  | None => default
  }

let mapWithDefault = (opt, default, f) => mapWithDefaultU(opt, default, (. value) => f(value))

let mapU = (opt, f) =>
  switch opt {
  | Some(value) => Some(f(. value))
  | None => None
  }

let map = (opt, f) => mapU(opt, (. value) => f(value))

let flatMapU = (opt, f) =>
  switch opt {
  | Some(value) => f(. value)
  | None => None
  }

let flatMap = (opt, f) => flatMapU(opt, (. value) => f(value))

let getWithDefault = (opt, default) =>
  switch opt {
  | Some(value) => value
  | None => default
  }

let or = (opt, other) =>
  switch opt {
  | Some(_) => opt
  | None => other
  }

let orElse = or

let isSome = opt => opt !== None

let isNone = opt => opt == None

let eqU = (a, b, f) =>
  switch a {
  | Some(a) =>
    switch b {
    | None => false
    | Some(b) => f(. a, b)
    }
  | None => b == None
  }

let eq = (a, b, f) => eqU(a, b, (. x, y) => f(x, y))

let cmpU = (a, b, f) =>
  switch (a, b) {
  | (Some(a), Some(b)) => f(. a, b)
  | (None, Some(_)) => -1
  | (Some(_), None) => 1
  | (None, None) => 0
  }

let cmp = (a, b, f) => cmpU(a, b, (. x, y) => f(x, y))
