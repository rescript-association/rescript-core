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
  Collection functions for manipulating the `list` data structures, a singly-linked list.

  **Prefer Array** if you need any of the following:

  - Random access of element
  - Better interop with JavaScript
  - Better memory usage & performance.
*/
/** `'a t` is compatible with built-in `list` type */
type t<'a> = list<'a>

/**
  Returns the length of a list.

  ```res example
  List.length(list{1, 2, 3}) // 3
  ```
*/
let length: t<'a> => int

/** **See** [`length`](##length) */
let size: t<'a> => int

/**
  Returns `Some(value)` where `value` is the first element in the list, or
  `None` if `someList` is an empty list.

  ```res example
  List.head(list{}) // None
  List.head(list{1, 2, 3}) // Some(1)
  ```
*/
let head: t<'a> => option<'a>

/**
  Same as [head](#head), but raises an exception if `someList` is empty. Use
  with care.

  ```res example
  List.headExn(list{1, 2, 3}) // 1

  List.headExn(list{}) // Raises an Error
  ```
*/
let headExn: t<'a> => 'a

/**
  Returns `None` if `someList` is empty, otherwise it returns `Some(tail)`
  where `tail` is everything except the first element of `someList`.

  ```res example
  List.tail(list{1, 2, 3}) // Some(list{2, 3})

  List.tail(list{}) // None
  ```
*/
let tail: t<'a> => option<t<'a>>

/**
  Same as [tail](#tail), but raises an exception if `someList` is empty. Use
  with care.

  ```res example
  List.tailExn(list{1, 2, 3}) // list{2, 3}

  List.tailExn(list{}) // Raises an Error
  ```
*/
let tailExn: t<'a> => t<'a>

/**
  Adds `value` to the beginning of `someList`.

  ```res example
  List.add(list{2, 3}, 1) // list{1, 2, 3}

  List.add(list{"World", "!"}, "Hello") // list{"Hello", "World", "!"}
  ```
*/
let add: (t<'a>, 'a) => t<'a>

/**
  Return the nth element in `someList`, or `None` if `index` is larger than the
  length.

  ```res example
  let abc = list{"A", "B", "C"}

  abc->List.get(1) // Some("B")

  abc->List.get(4) // None
  ```
*/
let get: (t<'a>, int) => option<'a>

/**
  Same as [get](#get), but raises an exception if `index` is larger than the
  length. Use with care.

  ```res example
  let abc = list{"A", "B", "C"}

  abc->List.getExn(1) // "B"

  abc->List.getExn(4) // Raises an Error
  ```
*/
let getExn: (t<'a>, int) => 'a

/**
  Returns a list of length `numItems` with each element filled with value `v`. Returns an empty list if `numItems` is negative.

  ```res example
  List.make(3, 1) // list{1, 1, 1}
  ```
*/
let make: (int, 'a) => t<'a>

/**
Return a list of length `numItems` with element `i` initialized with `f(i)`.
Returns an empty list if `numItems` is negative.

```res example
List.makeBy(5, i => i) // list{0, 1, 2, 3, 4}

List.makeBy(5, i => i * i) // list{0, 1, 4, 9, 16}
```
*/
let makeBy: (int, int => 'a) => t<'a>

/**
  Returns a new list in random order.

  ```res example
  List.shuffle(list{1, 2, 3}) // list{2, 1, 3}
  ```
*/
let shuffle: t<'a> => t<'a>

/**
  Return a new list, dropping the first `n` elements. Returns `None` if `someList` has fewer than `n` elements.

  ```res example
  list{1, 2, 3}->List.drop(2) // Some(list{3})

  list{1, 2, 3}->List.drop(3) // Some(list{})

  list{1, 2, 3}->List.drop(4) // None
  ```
*/
let drop: (t<'a>, int) => option<t<'a>>

/**
Returns a list with the first `n` elements from `someList`, or `None` if `someList` has fewer than `n` elements.

```res example
list{1, 2, 3}->List.take(1) // Some(list{1})

list{1, 2, 3}->List.take(2) // Some(list{1, 2})

list{1, 2, 3}->List.take(4) // None
```
*/
let take: (t<'a>, int) => option<t<'a>>

/**
  Split the list `someList` at `index`. Returns `None` when the length of `someList` is less than `index`.

  ```res example
  list{"Hello", "World"}->List.splitAt(1) // Some((list{"Hello"}, list{"World"}))

  list{0, 1, 2, 3, 4}->List.splitAt(2) // Some((list{0, 1}, list{2, 3, 4}))
  ```
*/
let splitAt: (t<'a>, int) => option<(list<'a>, list<'a>)>

/**
  Returns the list obtained by adding `secondList` after `firstList`.

  ```res example
  List.concat(list{1, 2, 3}, list{4, 5}) // list{1, 2, 3, 4, 5}
  ```
*/
let concat: (t<'a>, t<'a>) => t<'a>

/**
  Returns the list obtained by concatenating all the lists in array `a`, in
  order.

  ```res example
  List.concatMany([list{1, 2, 3}, list{}, list{3}]) // list{1, 2, 3, 3}
  ```
*/
let concatMany: array<t<'a>> => t<'a>

/**
  Equivalent to writing: `concat(reverse(firstList, secondList)`

  ```res example
  List.reverseConcat(list{1, 2}, list{3, 4}) // list{2, 1, 3, 4}
  ```
*/
let reverseConcat: (t<'a>, t<'a>) => t<'a>

/**
  Return the list obtained by concatenating all the lists in list `ls`, in order.

  ```res example
  List.flatten(list{list{1, 2, 3}, list{}, list{3}}) // list{1, 2, 3, 3}
  ```
*/
let flatten: t<t<'a>> => t<'a>

/**
  Returns a new list with `f` applied to each element of `someList`.

  ```res example
  list{1, 2}->List.map(x => x + 1) // list{3, 4}
  ```
*/
let map: (t<'a>, 'a => 'b) => t<'b>

/**
  Returns a list of pairs from the two lists with the length of the shorter list.

  ```res example
  List.zip(list{1, 2}, list{3, 4, 5}) // list{(1, 3), (2, 4)}
  ```
*/
let zip: (t<'a>, t<'b>) => t<('a, 'b)>

/**
  **See:** [zip](#zip)

  ```res example
  List.zipBy(list{1, 2, 3}, list{4, 5}, (a, b) => 2 * a + b) // list{6, 9}
  ```
*/
let zipBy: (t<'a>, t<'b>, ('a, 'b) => 'c) => t<'c>

/**
  Applies `f` to each element of `someList`.
  Function `f` takes two arguments: the index starting from 0 and the element from `someList`, in that order.

  ```res example
  list{1, 2, 3}->List.mapWithIndex((index, x) => index + x) // list{1, 3, 5}
  ```
*/
let mapWithIndex: (t<'a>, (int, 'a) => 'b) => t<'b>

/**
  Converts the given array to a list.

  ```res example
  List.fromArray([1, 2, 3]) // list{1, 2, 3}
  ```
*/
let fromArray: array<'a> => t<'a>

/**
  Converts the given list to an array.

  ```res example
  List.toArray(list{1, 2, 3}) // [1, 2, 3]
  ```
*/
let toArray: t<'a> => array<'a>

/* type json = Js_json.t */

/* val toJson : 'a t -> ('a -> json  [@bs]) -> json */
/* val fromJson : json -> (json -> 'a [@bs]) -> 'a t */

/**
  Returns a new list whose elements are those of `someList` in reversed order.

  ```res example
  List.reverse(list{1, 2, 3}) /* list{3, 2, 1} */
  ```
*/
let reverse: t<'a> => t<'a>

/**
  Equivalent to:

  ```res
  map(someList, f)->reverse
  ```

  ```res example
  list{3, 4, 5}->List.mapReverse(x => x * x) /* list{25, 16, 9} */
  ```
*/
let mapReverse: (t<'a>, 'a => 'b) => t<'b>

/**
  Call `f` on each element of `someList` from the beginning to end.
  `f` returns `unit`, so no new array is created. Use `forEach` when you are primarily concerned with repetitively creating side effects.

  ```res example
  List.forEach(list{"a", "b", "c"}, x => Console.log("Item: " ++ x))
  /*
    prints:
    Item: a
    Item: b
    Item: c
  */
  ```
*/
let forEach: (t<'a>, 'a => 'b) => unit

/**
  Call `f` on each element of `someList` from beginning to end.
  Function `f` takes two arguments: the index starting from 0 and the element from `someList`. `f` returns `unit`.

  ```res example
  List.forEachWithIndex(list{"a", "b", "c"}, (index, x) => {
    Console.log("Item " ++ Int.toString(index) ++ " is " ++ x)
  })
  /*
    prints:
    Item 0 is a
    Item 1 is b
    Item 2 is cc
  */
  ```
*/
let forEachWithIndex: (t<'a>, (int, 'a) => 'b) => unit

/**
  Applies `f` to each element of `someList` from beginning to end. Function `f` has two parameters: the item from the list and an “accumulator”, which starts with a value of `initialValue`. reduce returns the final value of the accumulator.

  ```res example
  list{1, 2, 3, 4}->List.reduce(0, (a, b) => a + b) /* 10 */

  /* same as */

  list{1, 2, 3, 4}->List.reduce(0, (acc, item) => acc + item) /* 10 */
  ```
*/
let reduce: (t<'a>, 'b, ('b, 'a) => 'b) => 'b

/**
  Applies `f` to each element of `someList` from beginning to end. Function `f` has three parameters: the item from the list and an “accumulator”, which starts with a value of `initialValue` and the index of each element. `reduceWithIndex` returns the final value of the accumulator.

  ```res example
  list{1, 2, 3, 4}->List.reduceWithIndex(0, (acc, item, index) => acc + item + index) /* 16 */
  ```
*/
let reduceWithIndex: (t<'a>, 'b, ('b, 'a, int) => 'b) => 'b

/**
  Works like [reduce](#reduce), except that function `f` is applied to each
  item of `someList` from the last back to the first.

  ```res example
  list{1, 2, 3, 4}->List.reduceReverse(0, (a, b) => a + b) /* 10 */

  list{1, 2, 3, 4}->List.reduceReverse(10, (a, b) => a - b) /* 0 */

  list{1, 2, 3, 4}->List.reduceReverse(list{}, List.add) // list{1, 2, 3, 4}
  ```
*/
let reduceReverse: (t<'a>, 'b, ('b, 'a) => 'b) => 'b

/**
  Equivalent to: `zipBy(xs, ys, f)->reverse`

  ```res example

  List.mapReverse2(list{1, 2, 3}, list{1, 2}, (a, b) => a + b) // list{4, 2}
  ```
*/
let mapReverse2: (t<'a>, t<'b>, ('a, 'b) => 'c) => t<'c>

/**
  Stops at the length of the shorter list.

  ```res example
  List.forEach2(list{"Z", "Y"}, list{"A", "B", "C"}, (x, y) => Console.log2(x, y))

  /*
    prints:
    "Z" "A"
    "Y" "B"
  */
  ```
*/
let forEach2: (t<'a>, t<'b>, ('a, 'b) => 'c) => unit

/**
  Applies `f` to each element of `firstList` and `secondList` from beginning to end. Stops with the shorter list. Function `f` has three parameters: an “accumulator” which starts with a value of `initialValue`, an item from `firstList`, and an item from `secondList`. `reduce2` returns the final value of the accumulator.

  ```res example
  List.reduce2(list{1, 2, 3}, list{4, 5}, 0, (acc, x, y) => acc + x * x + y) /* 0 + (1 * 1 + 4) + (2 * 2 + 5) */
  ```
*/
let reduce2: (t<'b>, t<'c>, 'a, ('a, 'b, 'c) => 'a) => 'a

/**
  Applies `f` to each element of `firstList` and `secondList` from end to
  beginning. Stops with the shorter list. Function `f` has three parameters: an
  “accumulator” which starts with a value of init, an item from `firstList`,
  and an item from `secondList`. `reduce2` returns the final value of the
  accumulator.

  ```res example
  List.reduceReverse2(list{1, 2, 3}, list{4, 5}, 0, (acc, x, y) => acc + x * x + y) /*  + (1 * 1 + 4) + (2 * 2 + 5) */
  ```
*/
let reduceReverse2: (t<'a>, t<'b>, 'c, ('c, 'a, 'b) => 'c) => 'c

/**
  Returns `true` if all elements satisfy `pred`, where `pred` is a predicate: a function taking an element and returning a bool.

  ```res example
  let isBelow10 = value => value < 10

  list{1, 9, 8, 2}->List.every(isBelow10) /* true */

  list{1, 99, 8, 2}->List.every(isBelow10) /* false */
  ```
*/
let every: (t<'a>, 'a => bool) => bool

/**
  Returns `true` if at least _one_ of the elements in `someList` satisfies
  `pred`, where `pred` is a predicate: a function taking an element and
  returning a bool.

  ```res example
  let isAbove100 = value => value > 100

  list{101, 1, 2, 3}->List.some(isAbove100) /* true */

  list{1, 2, 3, 4}->List.some(isAbove100) /* false */
  ```
*/
let some: (t<'a>, 'a => bool) => bool

/**
  Returns `true` if predicate `pred(a, b)` is `true` for all pairs of elements
  up to the shorter length (i.e. `min(length(firstList), length(secondList))`)

  ```res example
  List.every2(list{1, 2, 3}, list{0, 1}, (a, b) => a > b) /* true */

  List.every2(list{}, list{1}, (a, b) => a > b) /* true */

  List.every2(list{2, 3}, list{1}, (a, b) => a > b) /* true */

  List.every2(list{0, 1}, list{5, 0}, (a, b) => a > b) /* false */
  ```
*/
let every2: (t<'a>, t<'b>, ('a, 'b) => bool) => bool

/**
  Returns `true` if predicate `pred(a, b)` is true for any pair of elements up
  to the shorter length (i.e. `min(length(firstList), length(secondList))`)

  ```res example
  List.some2(list{1, 2, 3}, list{0, 1}, (a, b) => a > b) /* true */

  List.some2(list{}, list{1}, (a, b) => a > b) /* false */

  List.some2(list{2, 3}, list{1}, (a, b) => a > b) /* true */

  List.some2(list{0, 1}, list{5, 0}, (a, b) => a > b) /* true */
  ```
*/
let some2: (t<'a>, t<'b>, ('a, 'b) => bool) => bool

/**
  Compare two lists solely by length. Returns `-1` if `length(firstList)` is
  less than `length(secondList)`, `0` if `length(firstList)` equals
  `length(secondList)`, and `1` if `length(firstList)` is greater than
  `length(secondList)`.

  ```res example
  List.cmpByLength(list{1, 2}, list{3, 4, 5, 6}) /* -1 */

  List.cmpByLength(list{1, 2, 3}, list{4, 5, 6}) /* = 0 */

  List.cmpByLength(list{1, 2, 3, 4}, list{5, 6}) /* = 1 */
  ```
*/
let cmpByLength: (t<'a>, t<'a>) => int

/**
  Compare elements one by one `compareFn(a, b)`. `compareFn` returns a negative number if `a` is "less than" `b`, zero if `a` is "equal to" `b`, a positive number if `a` is "greater than" `b`.

  The comparison returns the first non-zero result of `compareFn`, or zero if `compareFn` returns zero for all `a` and `b`.

  If all items have compared equal, but `firstList` is exhausted first, return `-1`. (`firstList` is shorter).
  If all items have compared equal, but `secondList` is exhausted first, return `1` (`firstList` is longer).

  ```res example
  List.cmp(list{3}, list{3, 7}, (a, b) => compare(a, b)) /* (-1) */

  List.cmp(list{5, 3}, list{5}, (a, b) => compare(a, b)) /* 1 */

  List.cmp(list{1, 3, 5}, list{1, 4, 2}, (a, b) => compare(a, b)) /* (-1) */

  List.cmp(list{1, 3, 5}, list{1, 2, 3}, (a, b) => compare(a, b)) /* 1 */

  List.cmp(list{1, 3, 5}, list{1, 3, 5}, (a, b) => compare(a, b)) /* 0 */
  ```

  **Please note:** The total ordering of List is different from Array,
  for Array, we compare the length first and, only if the lengths are equal, elements one by one.
  For lists, we just compare elements one by one.
*/
let cmp: (t<'a>, t<'a>, ('a, 'a) => int) => int

/**
  Check equality of `firstList` and `secondList` using `eqElem` for equality on
  elements, where `eqElem` is a function that returns `true` if items `x` and
  `y` meet some criterion for equality, `false` otherwise. eq `false` if length
  of `firstList` and `secondList` are not the same.

  ```res example
  List.eq(list{1, 2, 3}, list{1, 2}, (a, b) => a == b) /* false */

  List.eq(list{1, 2}, list{1, 2}, (a, b) => a == b) /* true */

  List.eq(list{1, 2, 3}, list{(-1), (-2), (-3)}, (a, b) => abs(a) == abs(b)) /* true */
  ```
*/
let eq: (t<'a>, t<'a>, ('a, 'a) => bool) => bool

/**
  Returns `true` if the list contains at least one element for which
  `eqFunction(x)` returns true.

  ```res example
  list{1, 2, 3}->List.has(2, (a, b) => a == b) /* true */

  list{1, 2, 3}->List.has(4, (a, b) => a == b) /* false */

  list{(-1), (-2), (-3)}->List.has(2, (a, b) => abs(a) == abs(b)) /* true */
  ```
*/
let has: (t<'a>, 'b, ('a, 'b) => bool) => bool

/**
  Returns `Some(value)` for the first value in `someList` that satisfies the
  predicate function `pred`. Returns `None` if no element satisfies the function.

  ```res example
  List.getBy(list{1, 4, 3, 2}, x => x > 3) /* Some(4) */

  List.getBy(list{1, 4, 3, 2}, x => x > 4) /* None */
  ```
*/
let getBy: (t<'a>, 'a => bool) => option<'a>

/**
  Returns a list of all elements in `someList` which satisfy the predicate function `pred`.

  ```res example
  let isEven = x => mod(x, 2) == 0

  List.filter(list{1, 2, 3, 4}, isEven) /* list{2, 4} */

  List.filter(list{None, Some(2), Some(3), None}, Option.isSome) /* list{Some(2), Some(3)} */
  ```
*/
let filter: (t<'a>, 'a => bool) => t<'a>

/**
  Returns a list of all elements in `someList` which satisfy the predicate function `pred`.

  ```res example
  let isEven = x => mod(x, 2) == 0

  List.filterWithIndex(list{1, 2, 3, 4}, (_x, index) => isEven(index)) /* list{1, 3} */
  ```
*/
let filterWithIndex: (t<'a>, ('a, int) => bool) => t<'a>

/**
  Applies `f` to each element of `someList`. If `f(x)` returns `Some(value)`, then `value` is _kept_ in the resulting list.
  If `f(x)` returns `None`, the element is _not_ retained in the result.

  ```res example
  let isEven = x => mod(x, 2) == 0

  list{1, 2, 3, 4}
  ->List.filterMap(x =>
      if (isEven(x)) {
        Some(x)
      } else {
        None
      }
    ) /* list{2, 4} */

  list{Some(1), Some(2), None}->List.filterMap(x => x) /* list{1, 2} */
  ```
*/
let filterMap: (t<'a>, 'a => option<'b>) => t<'b>

/**
  Creates a pair of lists; the first list consists of all elements of `someList` that satisfy the predicate function `pred`; the second list consists of all elements of `someList` that _do not_ satisfy `pred.

  In other words:

  ```res
  (elementsThatSatisfies, elementsThatDoesNotSatisfy)
  ```

  ```res example
  List.partition(list{1, 2, 3, 4}, x => x > 2) /* (list{3, 4}, list{1, 2}) */
  ```
*/
let partition: (t<'a>, 'a => bool) => (t<'a>, t<'a>)

/**
  Takes a list of pairs and creates a pair of lists. The first list contains all the first items of the pairs; the second list contains all the second items.

  ```res example
  List.unzip(list{(1, 2), (3, 4)}) /* (list{1, 3}, list{2, 4}) */

  List.unzip(list{("H", "W"), ("e", "o"), ("l", "r"), ("l", "l"), ("o", "d"), (" ", "!")})
  /* (list{"H", "e", "l", "l", "o", " "}, list{"W", "o", "r", "l", "d", "!"}) */
  ```
*/
let unzip: t<('a, 'b)> => (t<'a>, t<'b>)

/**
  Return the second element of a pair in `someList` where the first element equals `k` as per the predicate function `eqFunction`, or `None` if not found.

  ```res example
  list{(1, "a"), (2, "b"), (3, "c")}->List.getAssoc(3, (a, b) => a == b) /* Some("c") */

  list{(9, "morning"), (15, "afternoon"), (22, "night")}
  ->List.getAssoc(15, (k, item) => k /* 15 */ == item /* 9, 5, 22 */)
  /* Some("afternoon") */
  ```
*/
let getAssoc: (t<('a, 'c)>, 'b, ('a, 'b) => bool) => option<'c>

/**
  Returns `true` if there is a pair in `someList` where the first element equals `k` as per the predicate function `eqFunction`.

  ```res example
  list{(1, "a"), (2, "b"), (3, "c")}->List.hasAssoc(1, (a, b) => a == b) /* true */

  list{(9, "morning"), (15, "afternoon"), (22, "night")}
  ->List.hasAssoc(25, (k, item) => k /* 25 */ == item /* 9, 5, 22 */) /* false */
  ```
*/
let hasAssoc: (t<('a, 'c)>, 'b, ('a, 'b) => bool) => bool

/**
  Return a list after removing the first pair whose first value is `k` per the equality predicate `eqFunction`; if not found, return a new list identical to `someList`.

  ```res example
  list{(1, "a"), (2, "b"), (3, "c")}->List.removeAssoc(1, (a, b) => a == b) /* list{(2, "b"), (3, "c")} */

  list{(9, "morning"), (15, "afternoon"), (22, "night")}
  ->List.removeAssoc(9, (k, item) => k /* 9 */ == item /* 9, 5, 22 */)
  /* list{(15, "afternoon"), (22, "night")} */
  ```
*/
let removeAssoc: (t<('a, 'c)>, 'b, ('a, 'b) => bool) => t<('a, 'c)>

/**
  If `k` exists in `someList` by satisfying the `eqFunction` predicate, return a new list with the key and value replaced by the new `k` and `v`; otherwise, return a new list with the pair `k`, `v` added to the head of `someList`.

  ```res example
  list{(1, "a"), (2, "b"), (3, "c")}->List.setAssoc(2, "x", (a, b) => a == b) /* list{(1, "a"), (2, "x"), (3, "c")} */

  list{(1, "a"), (3, "c")}->List.setAssoc(2, "b", (a, b) => a == b) /* list{(2, "b"), (1, "a"), (3, "c")} */

  list{(9, "morning"), (3, "morning?!"), (22, "night")}
  ->List.setAssoc(15, "afternoon", (a, b) => mod(a, 12) == mod(b, 12))
  /* list{(9, "morning"), (15, "afternoon"), (22, "night")} */
  ```

  **Please note**

  In the last example, since: `15 mod 12` equals `3 mod 12`

  Both the key _and_ the value are replaced in the list.
*/
let setAssoc: (t<('a, 'c)>, 'a, 'c, ('a, 'a) => bool) => t<('a, 'c)>

/**
  Returns a sorted list.

  ```res example
  List.sort(list{5, 4, 9, 3, 7}, (a, b) => a - b) // list{3, 4, 5, 7, 9}
  ```
*/
let sort: (t<'a>, ('a, 'a) => int) => t<'a>
