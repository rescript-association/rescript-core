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

let filterU = (opt, p) =>
  switch opt {
  | Some(x) as some if p(. x) => some
  | _ => None
  }

let filter = (opt, p) => filterU(opt, (. x) => p(x))

let forEachU = (opt, f) =>
  switch opt {
  | Some(x) => f(. x)
  | None => ()
  }

let forEach = (opt, f) => forEachU(opt, (. x) => f(x))

let getExn = x =>
  switch x {
  | Some(x) => x
  | None => raise(Not_found)
  }

external getUnsafe: option<'a> => 'a = "%identity"

let mapWithDefaultU = (opt, default, f) =>
  switch opt {
  | Some(x) => f(. x)
  | None => default
  }

let mapWithDefault = (opt, default, f) => mapWithDefaultU(opt, default, (. x) => f(x))

let mapU = (opt, f) =>
  switch opt {
  | Some(x) => Some(f(. x))
  | None => None
  }

let map = (opt, f) => mapU(opt, (. x) => f(x))

let flatMapU = (opt, f) =>
  switch opt {
  | Some(x) => f(. x)
  | None => None
  }

let flatMap = (opt, f) => flatMapU(opt, (. x) => f(x))

let getWithDefault = (opt, default) =>
  switch opt {
  | Some(x) => x
  | None => default
  }

let orElse = (opt, other) =>
  switch opt {
  | Some(_) as some => some
  | None => other
  }

let isSome = x =>
  switch x {
  | Some(_) => true
  | None => false
  }

let isNone = x => x == None

let equal = (a, b, eq) =>
  switch (a, b) {
  | (Some(a), Some(b)) => eq(a, b)
  | (None, None) => true
  | (None, Some(_)) | (Some(_), None) => false
  }

let compare = (a, b, cmp) =>
  switch (a, b) {
  | (Some(a), Some(b)) => cmp(a, b)
  | (None, Some(_)) => Core__Ordering.less
  | (Some(_), None) => Core__Ordering.greater
  | (None, None) => Core__Ordering.equal
  }
