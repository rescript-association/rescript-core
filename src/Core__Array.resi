@val external fromArrayLike: Js.Array2.array_like<'a> => array<'a> = "Array.from"
@val
external fromArrayLikeWithMap: (Js.Array2.array_like<'a>, 'a => 'b) => array<'b> = "Array.from"

/**
  `make(~length, init)`

  Creates an array of length `length` initialized with the value of `init`.

  ```res example
  Array.make(~length=3, #apple) == [#apple, #apple, #apple]
  ```
*/
let make: (~length: int, 'a) => array<'a>

/**
  `fromInitializer(~length, f)`

  Creates an array of length `length` initialized with the value returned from `f ` for each index.

  ```res example
  Array.make(~length=3, i => i + 3) == [3, 4, 5]
  ```
*/
let fromInitializer: (~length: int, int => 'a) => array<'a>

@val external isArray: 'a => bool = "Array.isArray"

/**
`length(array)` returns the `int` length (number of items) of the array.

See [`Array.length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length) on MDN.

## Examples
```rescript
let someArray = ["hi", "hello"]

Console.log(someArray->Array.length) // 2
```
*/
@get
external length: array<'a> => int = "length"
@send external copyAllWithin: (array<'a>, ~target: int) => array<'a> = "copyWithin"
@send
external copyWithinToEnd: (array<'a>, ~target: int, ~start: int) => array<'a> = "copyWithin"
@send
external copyWithin: (array<'a>, ~target: int, ~start: int, ~end: int) => array<'a> = "copyWithin"

/**
`fillAllInPlace(array, value)` fills the entire provided `array` with the provided `value`.

Beware this will *mutate* the array.

See [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.

## Examples
```rescript
let myArray = [1, 2, 3, 4]
myArray->Array.fillAllInPlace(9)

Console.log(myArray) // [9, 9, 9, 9]
```
*/
@send
external fillAllInPlace: (array<'a>, 'a) => unit = "fill"

/**
`fillInPlaceToEnd` fills the entire provided `array` with the provided `value`, starting from the index provided to `start`.

Beware this will *mutate* the array.

See [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.

## Examples
```rescript
let myArray = [1, 2, 3, 4]
myArray->Array.fillInPlaceToEnd(9, ~start=1)

Console.log(myArray) // [1, 9, 9, 9]
```
*/
@send
external fillInPlaceToEnd: (array<'a>, 'a, ~start: int) => unit = "fill"

/**
`fillInPlace` fills the entire provided `array` with the provided `value`, starting from the index provided to `start`, going to the index provided to `end`.

Beware this will *mutate* the array.

See [`Array.fill`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/fill) on MDN.

## Examples
```rescript
let myArray = [1, 2, 3, 4]
myArray->Array.fillInPlace(9, ~start=1, ~end=2)

Console.log(myArray) // [1, 9, 9, 4]
```
*/
@send
external fillInPlace: (array<'a>, 'a, ~start: int, ~end: int) => unit = "fill"

/**
`pop(array)` pops off the last item in the array, and returns it.

Beware this will *mutate* the array.

See [`Array.pop`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/pop) on MDN.

## Examples
```rescript
let someArray = ["hi", "hello"]
let lastItem = someArray->Array.pop // "hello"

Console.log(someArray) // ["hi"]. Notice last item is gone.
```
*/
@send
external pop: array<'a> => option<'a> = "pop"

/**
`push(array, item)` pushes a new item to the end of the array.

Beware this will *mutate* the array.

See [`Array.push`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) on MDN.

## Examples
```rescript
let someArray = ["hi", "hello"]
someArray->Array.push("yay")

Console.log(someArray) // ["hi", "hello", "yay"]
```
*/
@send
external push: (array<'a>, 'a) => unit = "push"

/**
`pushMany(array, itemsArray)` pushes many new items to the end of the array.

Beware this will *mutate* the array.

See [`Array.push`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/push) on MDN.

## Examples
```rescript
let someArray = ["hi", "hello"]
someArray->Array.pushMany(["yay", "wehoo"])

Console.log(someArray) // ["hi", "hello", "yay", "wehoo"]
```
*/
@variadic
@send
external pushMany: (array<'a>, array<'a>) => unit = "push"

/**
`reverseInPlace(array)` reverses the order of the items in the array.

Beware this will *mutate* the array.

See [`Array.reverse`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse) on MDN.

## Examples
```rescript
let someArray = ["hi", "hello"]
someArray->Array.reverseInPlace

Console.log(someArray) // ["hello", "h1"]
```
*/
@send
external reverseInPlace: array<'a> => unit = "reverse"

/**
`shift(array)` removes the first item in the array, and returns it.

Beware this will *mutate* the array.

See [`Array.shift`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/shift) on MDN.

## Examples
```rescript
let someArray = ["hi", "hello"]
let lastItem = someArray->Array.shift // "hi"

Console.log(someArray) // ["hello"]. Notice first item is gone.
```
*/
@send
external shift: array<'a> => option<'a> = "shift"

/**
`sort(array, comparator)` returns a new, sorted array from `array`, using the provided `comparator` function.

See [`Array.sort`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort) on MDN.

## Examples
```rescript
let someArray = [3, 2, 1]
let sortedArray = someArray->Array.sort((a, b) => a > b ? 1 : -1)

Console.log(sortedArray) // [1, 2, 3]
```
*/
let sort: (array<'a>, ('a, 'a) => int) => array<'a>

/**
`sortInPlace(array, comparator)` sorts the provided `array` using the provided `comparator` function.

Beware this will *mutate* the array.

See [`Array.sort`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/sort) on MDN.

## Examples
```rescript
let someArray = [3, 2, 1]
someArray->Array.sortInPlace((a, b) => a > b ? 1 : -1)

Console.log(someArray) // [1, 2, 3]
```
*/
@send
external sortInPlace: (array<'a>, ('a, 'a) => int) => unit = "sort"
@variadic @send
external spliceInPlace: (array<'a>, ~start: int, ~remove: int, ~insert: array<'a>) => unit =
  "splice"

/**
`unshift(array, item)` inserts a new item at the start of the array.

Beware this will *mutate* the array.

See [`Array.unshift`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift) on MDN.

## Examples
```rescript
let someArray = ["hi", "hello"]
someArray->Array.unshift("yay")

Console.log(someArray) // ["yay", "hi", "hello"]
```
*/
@send
external unshift: (array<'a>, 'a) => unit = "unshift"

/**
`unshiftMany(array, itemsArray)` inserts many new items to the start of the array.

Beware this will *mutate* the array.

See [`Array.push`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/unshift) on MDN.

## Examples
```rescript
let someArray = ["hi", "hello"]
someArray->Array.unshiftMany(["yay", "wehoo"])

Console.log(someArray) // ["yay", "wehoo", "hi", "hello"]
```
*/
@variadic
@send
external unshiftMany: (array<'a>, array<'a>) => unit = "unshift"

/**
`concat(array1, array2)` concatenates two arrays, creating a new array.

See [`Array.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat) on MDN.

## Examples
```rescript
let array1 = ["hi", "hello"]
let array2 = ["yay", "wehoo"]

let someArray = array1->Array.concat(array2)

Console.log(someArray) // ["hi", "hello", "yay", "wehoo"]
```
*/
@send
external concat: (array<'a>, array<'a>) => array<'a> = "concat"

/**
`concatMany(array1, arrays)` concatenates array1 with several other arrays, creating a new array.

See [`Array.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/concat) on MDN.

## Examples
```rescript
let array1 = ["hi", "hello"]
let array2 = ["yay"]
let array3 = ["wehoo"]

let someArray = array1->Array.concatMany([array2, array3])

Console.log(someArray) // ["hi", "hello", "yay", "wehoo"]
```
*/
@variadic
@send
external concatMany: (array<'a>, array<array<'a>>) => array<'a> = "concat"

/**
`flat(arrays)` flattens the provided arrays into a single array.

See [`Array.flat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat) on MDN.

## Examples
```rescript
Console.log([[1], [2], [3, 4]]->Array.flat) // [1, 2, 3, 4]
```
*/
@send
external flat: array<array<'a>> => array<'a> = "flat"

/**
`includes(array, item)` checks whether `array` includes `item`, by doing a [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality).

See [`Array.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes) on MDN.

## Examples
```rescript
Console.log([1, 2]->Array.includes(1)) // true
Console.log([1, 2]->Array.includes(3)) // false
Console.log([{"language": "ReScript"}]->Array.includes({"language": "ReScript"})) // false, because of strict equality
```
*/
@send
external includes: (array<'a>, 'a) => bool = "includes"

/**
`indexOf(array, item)` returns the index of the provided `item` in `array`. Uses [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) when comparing items.

Returns `-1` if the item doesn not exist. Check out `Array.indexOfOpt` for a version that returns `None` instead of `-1` if the item does not exist.

See [`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) on MDN.

## Examples
```rescript
Console.log([1, 2]->Array.indexOf(2)) // 1
Console.log([1, 2]->Array.indexOf(3)) // -1
Console.log([{"language": "ReScript"}]->Array.indexOf({"language": "ReScript"})) // -1, because of strict equality
```
*/
@send
external indexOf: (array<'a>, 'a) => int = "indexOf"

/**
`indexOfOpt(array, item)` returns an option of the index of the provided `item` in `array`. Uses [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) when comparing items.

See [`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) on MDN.

## Examples
```rescript
Console.log([1, 2]->Array.indexOfOpt(2)) // Some(1)
Console.log([1, 2]->Array.indexOfOpt(3)) // None
Console.log([{"language": "ReScript"}]->Array.indexOfOpt({"language": "ReScript"})) // None, because of strict equality
```
*/
let indexOfOpt: (array<'a>, 'a) => option<int>
@send external indexOfFrom: (array<'a>, 'a, int) => int = "indexOf"
@send external joinWith: (array<'a>, string) => string = "join"
@send external lastIndexOf: (array<'a>, 'a) => int = "lastIndexOf"
let lastIndexOfOpt: (array<'a>, 'a) => option<int>
@send external lastIndexOfFrom: (array<'a>, 'a, int) => int = "lastIndexOf"

/**
`slice(array, start, end)` creates a new array from the provided `array`, with all items from `array` starting from `start`, stopping _before_ `end` (`end` is not included).

See [`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) on MDN.

## Examples
```rescript
let myArray = [1, 2, 3, 4]

Console.log(myArray->Array.slice(~start=1, ~end=3)) // [2, 3]
```
*/
@send
external slice: (array<'a>, ~start: int, ~end: int) => array<'a> = "slice"

/**
`sliceToEnd(array, start)` creates a new array from the provided `array`, with all items from `array` starting from `start`.

See [`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) on MDN.

## Examples
```rescript
let myArray = [1, 2, 3, 4]

Console.log(myArray->Array.sliceToEnd(~start=1)) // [2, 3, 4]
```
*/
@send
external sliceToEnd: (array<'a>, ~start: int) => array<'a> = "slice"
/**
`copy(array)` makes a shallow copy of the provided `array`.

## Examples
```rescript
let myArray = [1, 2, 3]
let copyOfMyArray = myArray->Array.copy

Console.log(copyOfMyArray) // [1, 2, 3]
Console.log(myArray === copyOfMyArray) // false
```
*/
@send
external copy: array<'a> => array<'a> = "slice"
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
let reduce: (array<'a>, 'b, ('b, 'a) => 'b) => 'b

/**
  `reduceWithIndex(xs, f, init)`

  Applies `f` to each element of `xs` from beginning to end. Function `f` has three parameters: the item from the array and an “accumulator”, which starts with a value of `init` and the index of each element. `reduceWithIndex` returns the final value of the accumulator.

  ```res example
  Array.reduceWithIndex([1, 2, 3, 4], (acc, x, i) => acc + x + i, 0) == 16
  ```
*/
let reduceWithIndex: (array<'a>, 'b, ('b, 'a, int) => 'b) => 'b

/**
  `reduceRight(xs, f, init)`

  Works like `Array.reduce`; except that function `f` is applied to each item of `xs` from the last back to the first.

  ```res example
  Array.reduceRight(["a", "b", "c", "d"], (a, b) => a ++ b, "") == "dcba"
  ```
*/
let reduceRight: (array<'a>, 'b, ('b, 'a) => 'b) => 'b

/**
  `reduceRightWithIndex(xs, f, init)`

  Like `reduceRight`, but with an additional index argument on the callback function.

  ```res example
  Array.reduceRightWithIndex([1, 2, 3, 4], (acc, x, i) => acc + x + i, 0) == 16
  ```
*/
let reduceRightWithIndex: (array<'a>, 'b, ('b, 'a, int) => 'b) => 'b

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

/**
`reverse(array)` creates a new array with all items from `array` in reversed order.

See [`Array.reverse`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/reverse) on MDN.

## Examples
```rescript
let someArray = ["hi", "hello"]
let reversed = someArray->Array.reverse

Console.log(reversed) // ["hello", "h1"]
```
*/
let reverse: array<'a> => array<'a>
let filterMap: (array<'a>, 'a => option<'b>) => array<'b>

/**
  `keepSome(arr)`

  Returns a new array containing `value` for all elements that are `Some(value)`
  and ignoring every value that is `None`

  ```res example
  Array.keepSome([Some(1), None, Some(3)]) == [1, 3]
  ```
*/
let keepSome: array<option<'a>> => array<'a>
let shuffle: array<'a> => array<'a>
let shuffleInPlace: array<'a> => unit
@send external flatMap: (array<'a>, 'a => array<'b>) => array<'b> = "flatMap"

/**
  `findMap(arr, f)`

  Calls `f` for each element and returns the first value from `f` that is `Some(_)`.
  Otherwise returns `None`

  ```res example
  Array.findMap([1, 2, 3], n => mod(n, 2) ? Some(n - 2) : None) == 0
  ```
*/
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
