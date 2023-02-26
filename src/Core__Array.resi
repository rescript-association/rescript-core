@val external from: 'a => array<'b> = "Array.from"
@val external fromWithMap: ('a, 'b => 'c) => array<'c> = "Array.from"
@val external fromArrayLike: Js.Array2.array_like<'a> => array<'a> = "Array.from"
@val
external fromArrayLikeWithMap: (Js.Array2.array_like<'a>, 'a => 'b) => array<'b> = "Array.from"
@val external fromIterator: Core__Iterator.t<'a> => array<'a> = "Array.from"
@val external fromIteratorWithMap: (Core__Iterator.t<'a>, 'a => 'b) => array<'b> = "Array.from"
let make: (~length: int, 'a) => array<'a>
let fromInitializer: (~length: int, int => 'a) => array<'a>
@val external isArray: 'a => bool = "Array.isArray"
@get external length: array<'a> => int = "length"
@send external copyAllWithin: (array<'a>, ~target: int) => array<'a> = "copyWithin"
@send
external copyWithinToEnd: (array<'a>, ~target: int, ~start: int) => array<'a> = "copyWithin"
@send
external copyWithin: (array<'a>, ~target: int, ~start: int, ~end: int) => array<'a> = "copyWithin"
@send external fillAllInPlace: (array<'a>, 'a) => unit = "fill"
@send external fillInPlaceToEnd: (array<'a>, 'a, ~start: int) => unit = "fill"
@send external fillInPlace: (array<'a>, 'a, ~start: int, ~end: int) => unit = "fill"
@send external pop: array<'a> => option<'a> = "pop"
@send external push: (array<'a>, 'a) => unit = "push"
@variadic @send external pushMany: (array<'a>, array<'a>) => unit = "push"
@send external reverseInPlace: array<'a> => unit = "reverse"
@send external shift: array<'a> => option<'a> = "shift"
let sort: (array<'a>, ('a, 'a) => int) => array<'a>
@send external sortInPlace: (array<'a>, ('a, 'a) => int) => unit = "sort"
@variadic @send
external spliceInPlace: (array<'a>, ~start: int, ~remove: int, ~insert: array<'a>) => unit =
  "splice"
@send external unshift: (array<'a>, 'a) => unit = "unshift"
@variadic @send external unshiftMany: (array<'a>, array<'a>) => unit = "unshift"
@send external concat: (array<'a>, array<'a>) => array<'a> = "concat"
@variadic @send external concatMany: (array<'a>, array<array<'a>>) => array<'a> = "concat"
@send external flat: array<array<'a>> => array<'a> = "flat"
@send external includes: (array<'a>, 'a) => bool = "includes"
@send external indexOf: (array<'a>, 'a) => int = "indexOf"
let indexOfOpt: (array<'a>, 'a) => option<int>
@send external indexOfFrom: (array<'a>, 'a, int) => int = "indexOf"
@send external joinWith: (array<'a>, string) => string = "join"
@send external lastIndexOf: (array<'a>, 'a) => int = "lastIndexOf"
let lastIndexOfOpt: (array<'a>, 'a) => option<int>
@send external lastIndexOfFrom: (array<'a>, 'a, int) => int = "lastIndexOf"
@send external slice: (array<'a>, ~start: int, ~end: int) => array<'a> = "slice"
@send external sliceToEnd: (array<'a>, ~start: int) => array<'a> = "slice"
@send external copy: array<'a> => array<'a> = "slice"
@send external toString: array<'a> => string = "toString"
@send external toLocaleString: array<'a> => string = "toLocaleString"
@send external every: (array<'a>, 'a => bool) => bool = "every"
@send external everyWithIndex: (array<'a>, ('a, int) => bool) => bool = "every"
@send external filter: (array<'a>, 'a => bool) => array<'a> = "filter"
@send external filterWithIndex: (array<'a>, ('a, int) => bool) => array<'a> = "filter"
@send external find: (array<'a>, 'a => bool) => option<'a> = "find"
@send external findWithIndex: (array<'a>, ('a, int) => bool) => option<'a> = "find"
@send external findIndex: (array<'a>, 'a => bool) => int = "findIndex"
@send external findIndexWithIndex: (array<'a>, ('a, int) => bool) => int = "findIndex"
@send external forEach: (array<'a>, 'a => unit) => unit = "forEach"
@send external forEachWithIndex: (array<'a>, ('a, int) => unit) => unit = "forEach"
@send external map: (array<'a>, 'a => 'b) => array<'b> = "map"
@send external mapWithIndex: (array<'a>, ('a, int) => 'b) => array<'b> = "map"

/**
  `reduce(xs, f, init)`

  Applies `f` to each element of `xs` from beginning to end. Function `f` has two parameters: the item from the list and an “accumulator”; which starts with a value of `init`. `reduce` returns the final value of the accumulator.

  ```res example
  Array.reduce([2, 3, 4], (a, b) => a + b, 1) == 10

  Array.reduce(["a", "b", "c", "d"], (a, b) => a ++ b, "") == "abcd"
  ```
*/
@send
external reduce: (array<'b>, ('a, 'b) => 'a, 'a) => 'a = "reduce"

/**
  `reduceRight(xs, f, init)`

  Works like `Array.reduce`; except that function `f` is applied to each item of `xs` from the last back to the first.

  ```res example
  Array.reduceRight(["a", "b", "c", "d"], (a, b) => a ++ b, "") == "dcba"
  ```
*/
@send
external reduceRight: (array<'b>, ('a, 'b) => 'a, 'a) => 'a = "reduceRight"

/**
  Applies `f` to each element of `xs` from beginning to end. Function `f` has three parameters: the item from the array and an “accumulator”, which starts with a value of `init` and the index of each element. `reduceWithIndex` returns the final value of the accumulator.

  ```res example
  Array.reduceWithIndex([1, 2, 3, 4], 0, (acc, x, i) => acc + x + i) == 16
  ```
*/
let reduceWithIndex: (array<'a>, 'b, ('b, 'a, int) => 'b) => 'b

@send external some: (array<'a>, 'a => bool) => bool = "some"
@send external someWithIndex: (array<'a>, ('a, int) => bool) => bool = "some"
@get_index external get: (array<'a>, int) => option<'a> = ""
@set_index external set: (array<'a>, int, 'a) => unit = ""
@get_index external getSymbol: (array<'a>, Core__Symbol.t) => option<'b> = ""
@get_index external getSymbolUnsafe: (array<'a>, Core__Symbol.t) => 'b = ""
@set_index external setSymbol: (array<'a>, Core__Symbol.t, 'b) => unit = ""
external getUnsafe: (array<'a>, int) => 'a = "%array_unsafe_get"
external setUnsafe: (array<'a>, int, 'a) => unit = "%array_unsafe_set"
let findIndexOpt: (array<'a>, 'a => bool) => option<int>
let reverse: array<'a> => array<'a>
let filterMap: (array<'a>, 'a => option<'b>) => array<'b>
let keepSome: array<option<'a>> => array<'a>
let shuffle: array<'a> => array<'a>
let shuffleInPlace: array<'a> => unit
@send external flatMap: (array<'a>, 'a => array<'b>) => array<'b> = "flatMap"
let findMap: (array<'a>, 'a => option<'b>) => option<'b>

/**
  `at(array, index)`

  Get an element by its index. Negative indices count backwards from the last item.

  ## Examples
  ```rescript
  ["a", "b", "c"]->Array.at(0) // Some("a")
  ["a", "b", "c"]->Array.at(2) // Some("c")
  ["a", "b", "c"]->Array.at(3) // None
  ["a", "b", "c"]->Array.at(-1) // Some("c")
  ["a", "b", "c"]->Array.at(-3) // Some("a")
  ["a", "b", "c"]->Array.at(-4) // None
  ```
*/
@send
external at: (array<'a>, int) => option<'a> = "at"
