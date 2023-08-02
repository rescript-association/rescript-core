type t<'a>

// TODO: Docs
@val external fromArrayLike: Js.Array2.array_like<'a> => t<'a> = "Array.from"

// TODO: Docs
@val
external fromArrayLikeWithMap: (Js.Array2.array_like<'a>, 'a => 'b) => array<'b> = "Array.from"

/**
  `make(~length, init)`

  Creates an immutable array of length `length` initialized with the value of `init`.

  ```res example
  Array.make(~length=3, #apple) == [#apple, #apple, #apple]
  ```
*/
let make: (~length: int, 'a) => t<'a>

/**
  `fromInitializer(~length, f)`

  Creates an immutable array of length `length` initialized with the value returned from `f ` for each index.

  ```res example
  Array.make(~length=3, i => i + 3) == [3, 4, 5]
  ```
*/
let fromInitializer: (~length: int, int => 'a) => t<'a>

@val external isArray: 'a => bool = "Array.isArray"

/**
`length(immutableArray)` returns the length of (i.e. number of items in) the immutable array.

See [`Array.length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/length) on MDN.

## Examples
```rescript
let someArray = ["hi", "hello"]

Console.log(someArray->Array.length) // 2
```
*/
@get
external length: t<'a> => int = "length"

// TODO: Docs
@send external copyAllWithin: (t<'a>, ~target: int) => t<'a> = "copyWithin"

// TODO: Docs
@send
external copyWithinToEnd: (t<'a>, ~target: int, ~start: int) => t<'a> = "copyWithin"

// TODO: Docs
@send
external copyWithin: (t<'a>, ~target: int, ~start: int, ~end: int) => t<'a> = "copyWithin"

/**
`toSorted(immutableArray, comparator)` returns a new, sorted immutable array from `immutableArray`, using the `comparator` function.

See [`Array.toSorted`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSorted) on MDN.

## Examples
```rescript
let someArray = [3, 2, 1]
let sorted = someArray->Array.toSorted((a, b) => a - b)

Console.log(sorted) // [1, 2, 3]
Console.log(someArray) // [3, 2, 1]. Original unchanged
```
*/
@send
external toSorted: (t<'a>, ('a, 'a) => int) => t<'a> = "toSorted"

@send
external toSpliced: (t<'a>, ~start: int, ~remove: int, ~insert: t<'a>) => t<'a> = "toSpliced"

@send external with: (t<'a>, int, 'a) => t<'a> = "with"

/**
`concat(immutableArray1, immutableArray2)` concatenates the two immutable arrays, creating a new immutable array.

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
external concat: (t<'a>, t<'a>) => t<'a> = "concat"

/**
`concatMany(immutableArray1, immutableArrays)` concatenates array1 with several other arrays, creating a new immutable array.

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
@send
external concatMany: (t<'a>, t<t<'a>>) => t<'a> = "concat"

/**
`flat(immutableArrays)` concatenates an immutable array of immutable arrays into a single immutable array.

See [`Array.flat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/flat) on MDN.

## Examples
```rescript
Console.log([[1], [2], [3, 4]]->Array.flat) // [1, 2, 3, 4]
```
*/
@send
external flat: t<t<'a>> => t<'a> = "flat"

/**
`includes(immutableArray, item)` checks whether `immutable array` includes `item`, by doing a [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality).

See [`Array.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/includes) on MDN.

## Examples
```rescript
Console.log([1, 2]->Array.includes(1)) // true
Console.log([1, 2]->Array.includes(3)) // false
Console.log([{"language": "ReScript"}]->Array.includes({"language": "ReScript"})) // false, because of strict equality
```
*/
@send
external includes: (t<'a>, 'a) => bool = "includes"

/**
`indexOf(immutableArray, item)` returns the index of the provided `item` in `immutableArray`. Uses [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) when comparing items.

Returns `-1` if the item doesn not exist. Check out `ImmutableArray.indexOfOpt` for a version that returns `None` instead of `-1` if the item does not exist.

See [`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) on MDN.

## Examples
```rescript
Console.log([1, 2]->Array.indexOf(2)) // 1
Console.log([1, 2]->Array.indexOf(3)) // -1
Console.log([{"language": "ReScript"}]->Array.indexOf({"language": "ReScript"})) // -1, because of strict equality
```
*/
@send
external indexOf: (t<'a>, 'a) => int = "indexOf"

/**
`indexOfOpt(immutableArray, item)` returns an option of the index of the provided `item` in `immutableArray`. Uses [strict check for equality](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Operators/Strict_equality) when comparing items.

See [`Array.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/indexOf) on MDN.

## Examples
```rescript
Console.log([1, 2]->Array.indexOfOpt(2)) // Some(1)
Console.log([1, 2]->Array.indexOfOpt(3)) // None
Console.log([{"language": "ReScript"}]->Array.indexOfOpt({"language": "ReScript"})) // None, because of strict equality
```
*/
let indexOfOpt: (t<'a>, 'a) => option<int>
@send external indexOfFrom: (t<'a>, 'a, int) => int = "indexOf"

/**
`joinWith(array, separator)` produces a string where all items of `array` are printed, separated by `separator`. Under the hood this will run JavaScript's `toString` on all the array items.

## Examples
```rescript
let array = [1, 2, 3]

Console.log(array->Array.joinWith(" -- ")) // 1 -- 2 -- 3
```
*/
@send
external joinWith: (t<'a>, string) => string = "join"
@send external lastIndexOf: (t<'a>, 'a) => int = "lastIndexOf"
let lastIndexOfOpt: (t<'a>, 'a) => option<int>
@send external lastIndexOfFrom: (t<'a>, 'a, int) => int = "lastIndexOf"

/**
`slice(array, ~start, ~end)` creates a new array of items copied from `array` from `start` until (but not including) `end`.

See [`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) on MDN.

## Examples
```rescript
let myArray = [1, 2, 3, 4]

Console.log(myArray->Array.slice(~start=1, ~end=3)) // [2, 3]
```
*/
@send
external slice: (t<'a>, ~start: int, ~end: int) => t<'a> = "slice"

/**
`sliceToEnd(array, start)` creates a new array from `array`, with all items from `array` starting from `start`.

See [`Array.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/slice) on MDN.

## Examples
```rescript
let myArray = [1, 2, 3, 4]

Console.log(myArray->Array.sliceToEnd(~start=1)) // [2, 3, 4]
```
*/
@send
external sliceToEnd: (t<'a>, ~start: int) => t<'a> = "slice"
/**
`copy(array)` makes a copy of the array with the items in it, but does not make copies of the items themselves.

## Examples
```rescript
let myArray = [1, 2, 3]
let copyOfMyArray = myArray->Array.copy

Console.log(copyOfMyArray) // [1, 2, 3]
Console.log(myArray === copyOfMyArray) // false
```
*/
@send
external copy: t<'a> => t<'a> = "slice"

/**
`toString(array)` stringifies `array` by running `toString` on all of the array elements and joining them with ",".

See [`Array.toString`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toString) on MDN.

## Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.toString) // "1,2,3,4"
```
*/
@send
external toString: t<'a> => string = "toString"

@send external toLocaleString: t<'a> => string = "toLocaleString"

/**
`every(array, predicate)` returns true if `predicate` returns true for all items in `array`.

See [`Array.every`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) on MDN.

## Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.every(num => num > 4)) // true
Console.log(array->Array.every(num => num === 1)) // false
```
*/
@send
external every: (t<'a>, 'a => bool) => bool = "every"

/**
`everyWithIndex(array, checker)` returns true if all items in `array` returns true when running the provided `checker` function.

See [`Array.every`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/every) on MDN.

## Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.everyWithIndex((num, index) => index < 2 && num <= 2)) // true
Console.log(array->Array.everyWithIndex((num, index) => index < 2 && num >= 2)) // false
```
*/
@send
external everyWithIndex: (t<'a>, ('a, int) => bool) => bool = "every"

/**
`filter(array, checker)` returns a new array containing all elements from `array` for which the provided `checker` function returns true.

See [`Array.filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) on MDN.

## Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.filter(num => num > 2)) // [3, 4]
```
*/
@send
external filter: (t<'a>, 'a => bool) => t<'a> = "filter"

/**
`filterWithIndex(array, checker)` returns a new array containing all elements from `array` for which the provided `checker` function returns true.

See [`Array.filter`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/filter) on MDN.

## Examples
```rescript
let array = [1, 2, 3, 4]

Console.log(array->Array.filterWithIndex((num, index) => index === 0 || num === 2)) // [1, 2]
```
*/
@send
external filterWithIndex: (t<'a>, ('a, int) => bool) => t<'a> = "filter"

/**
`find(array, checker)` returns the first element of `array` where the provided `checker` function returns true.

See [`Array.find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find) on MDN.

## Examples
```rescript
type languages = ReScript | TypeScript | JavaScript

let array = [ReScript, TypeScript, JavaScript]

switch array->Array.find(item => item == ReScript) {
| None => Console.log("No item...")
| Some(_) => Console.log("Yay, ReScript!")
}
```
*/
@send
external find: (t<'a>, 'a => bool) => option<'a> = "find"

/**
`findWithIndex(array, checker)` returns the first element of `array` where the provided `checker` function returns true.

See [`Array.find`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/find) on MDN.

## Examples
```rescript
type languages = ReScript | TypeScript | JavaScript

let array = [TypeScript, JavaScript, ReScript]

switch array->Array.findWithIndex((item, index) => index > 1 && item == ReScript) {
| None => Console.log("No item...")
| Some(_) => Console.log("Yay, ReScript exists in a later position!")
}
```
*/
@send
external findWithIndex: (t<'a>, ('a, int) => bool) => option<'a> = "find"

/**
`findIndex(array, checker)` returns the index of the first element of `array` where the provided `checker` function returns true.

Returns `-1` if the item does not exist. Consider using `Array.findIndexOpt` if you want an option instead (where `-1` would be `None`).

See [`Array.findIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex) on MDN.

## Examples
```rescript
type languages = ReScript | TypeScript | JavaScript

let array = [ReScript, JavaScript]

Console.log(array->Array.findIndex(item => item == ReScript)) // 0
Console.log(array->Array.findIndex(item => item == TypeScript)) // -1
```
*/
@send
external findIndex: (t<'a>, 'a => bool) => int = "findIndex"

/**
`findIndexWithIndex(array, checker)` returns the index of the first element of `array` where the provided `checker` function returns true.

Returns `-1` if the item does not exist. Consider using `Array.findIndexOpt` if you want an option instead (where `-1` would be `None`).

See [`Array.findIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex) on MDN.

## Examples
```rescript
type languages = ReScript | TypeScript | JavaScript

let array = [ReScript, JavaScript]

Console.log(array->Array.findIndexWithIndex((item, index) => index === 0 && item == ReScript)) // 0
Console.log(array->Array.findIndex((item, index) => index === 0 && item == TypeScript)) // -1
```
*/
@send
external findIndexWithIndex: (t<'a>, ('a, int) => bool) => int = "findIndex"

/**
`forEach(array, fn)` runs the provided `fn` on every element of `array`.

See [`Array.forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) on MDN.

## Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

array->Array.forEach(item => {
  Console.log(item)
})
```
*/
@send
external forEach: (t<'a>, 'a => unit) => unit = "forEach"

/**
`forEachWithIndex(array, fn)` runs the provided `fn` on every element of `array`.

See [`Array.forEach`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/forEach) on MDN.

## Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

array->Array.forEachWithIndex((item, index) => {
  Console.log("At item " ++ Int.toString(index) ++ ": " ++ item)
})
```
*/
@send
external forEachWithIndex: (t<'a>, ('a, int) => unit) => unit = "forEach"

/**
`map(array, fn)` returns a new array with all elements from `array`, each element transformed using the provided `fn`.

See [`Array.map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) on MDN.

## Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
let mappedArray = array->Array.map(greeting => greeting ++ " to you")

Console.log(mappedArray) // ["Hello to you", "Hi to you", "Good bye to you"]
```
*/
@send
external map: (t<'a>, 'a => 'b) => array<'b> = "map"

/**
`mapWithIndex(array, fn)` returns a new array with all elements from `array`, each element transformed using the provided `fn`.

See [`Array.map`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/map) on MDN.

## Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
let mappedArray =
  array->Array.mapWithIndex((greeting, index) =>
    greeting ++ " at position " ++ Int.toString(index)
  )

Console.log(mappedArray) // ["Hello at position 0", "Hi at position 1", "Good bye at position 2"]
```
*/
@send
external mapWithIndex: (t<'a>, ('a, int) => 'b) => array<'b> = "map"

/**
  `reduce(xs, f, init)`

  Applies `f` to each element of `xs` from beginning to end. Function `f` has two parameters: the item from the list and an “accumulator”; which starts with a value of `init`. `reduce` returns the final value of the accumulator.

  ```res example
  Array.reduce([2, 3, 4], (a, b) => a + b, 1) == 10

  Array.reduce(["a", "b", "c", "d"], (a, b) => a ++ b, "") == "abcd"
  ```
*/
let reduce: (t<'a>, 'b, ('b, 'a) => 'b) => 'b

/**
  `reduceWithIndex(xs, f, init)`

  Applies `f` to each element of `xs` from beginning to end. Function `f` has three parameters: the item from the array and an “accumulator”, which starts with a value of `init` and the index of each element. `reduceWithIndex` returns the final value of the accumulator.

  ```res example
  Array.reduceWithIndex([1, 2, 3, 4], (acc, x, i) => acc + x + i, 0) == 16
  ```
*/
let reduceWithIndex: (t<'a>, 'b, ('b, 'a, int) => 'b) => 'b

/**
  `reduceRight(xs, f, init)`

  Works like `Array.reduce`; except that function `f` is applied to each item of `xs` from the last back to the first.

  ```res example
  Array.reduceRight(["a", "b", "c", "d"], (a, b) => a ++ b, "") == "dcba"
  ```
*/
let reduceRight: (t<'a>, 'b, ('b, 'a) => 'b) => 'b

/**
  `reduceRightWithIndex(xs, f, init)`

  Like `reduceRight`, but with an additional index argument on the callback function.

  ```res example
  Array.reduceRightWithIndex([1, 2, 3, 4], (acc, x, i) => acc + x + i, 0) == 16
  ```
*/
let reduceRightWithIndex: (t<'a>, 'b, ('b, 'a, int) => 'b) => 'b

/**
`some(array, predicate)` returns true if `predicate` returns true for any element in `array`.

See [`Array.some`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some) on MDN.

## Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

Console.log(array->Array.some(greeting => greeting === "Hello")) // true
```
*/
@send
external some: (t<'a>, 'a => bool) => bool = "some"

/**
`someWithIndex(array, checker)` returns true if running the provided `checker` function on any element in `array` returns true.

See [`Array.some`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/some) on MDN.

## Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

Console.log(array->Array.someWithIndex((greeting, index) => greeting === "Hello" && index === 0)) // true
```
*/
@send
external someWithIndex: (t<'a>, ('a, int) => bool) => bool = "some"

/**
`get(array, index)` returns the element at `index` of `array`.

Returns `None` if the index does not exist in the array. Equivalent to doing `array[index]` in JavaScript.

## Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

array->Array.get(0) == Some("Hello") // true
```
*/
@get_index
external get: (t<'a>, int) => option<'a> = ""

@get_index external getSymbol: (t<'a>, Core__Symbol.t) => option<'b> = ""
@get_index external getSymbolUnsafe: (t<'a>, Core__Symbol.t) => 'b = ""

/**
`getUnsafe(array, index)` returns the element at `index` of `array`.

This is _unsafe_, meaning it will fail with an exception if `index` does not exist in `array`.

## Exceptions

- `Not_found`: If the provided `index` does not exist in `array`.

## Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

Console.log(array->Array.getUnsafe(0)) // "Hello"
Console.log(array->Array.getUnsafe(3)) // Fails and raises exception
```
*/
@raises(Not_found)
external getUnsafe: (t<'a>, int) => 'a = "%array_unsafe_get"

/**
`findIndexOpt(array, checker)` returns the index of the first element of `array` where the provided `checker` function returns true.

Returns `None` if no item matches.

See [`Array.findIndex`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/findIndex) on MDN.

## Examples
```rescript
type languages = ReScript | TypeScript | JavaScript

let array = [ReScript, TypeScript, JavaScript]

switch array->Array.findIndexOpt(item => item == ReScript) {
| None => Console.log("Ahh, no ReScript...")
| Some(index) => Console.log("Yay, ReScript at index " ++ Int.toString(index))
}
```
*/
let findIndexOpt: (t<'a>, 'a => bool) => option<int>

/**
`toReversed(array)` creates a new array with all items from `array` in reversed order.

See [`Array.toReversed`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toReversed) on MDN.

## Examples
```rescript
let someArray = ["hi", "hello"]
let reversed = someArray->Array.toReversed

Console.log(reversed) // ["hello", "h1"]
Console.log(someArray) // ["h1", "hello"]. Original unchanged
```
*/
@send
external toReversed: t<'a> => t<'a> = "toReversed"

/**
`get(array, index)` returns the element at `index` of `array`.

Returns `None` if the index does not exist in the array. Equivalent to doing `array[index]` in JavaScript.

## Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

Console.log(
  array->Array.filterMap(item =>
    switch item {
    | "Hello" => Some(item->String.length)
    | _ => None
    }
  ),
)
// [5]
```
*/
let filterMap: (t<'a>, 'a => option<'b>) => array<'b>

/**
  `keepSome(arr)`

  Returns a new array containing `value` for all elements that are `Some(value)`
  and ignoring every value that is `None`

  ```res example
  Array.keepSome([Some(1), None, Some(3)]) == [1, 3]
  ```
*/
let keepSome: array<option<'a>> => t<'a>

/**
`toShuffled(array)` returns a new array with all items in `array` in a random order.

## Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]
let shuffledArray = array->Array.toShuffled

Console.log(shuffledArray)
```
*/
let toShuffled: t<'a> => t<'a>

/**
`flatMap(array, mapper)` returns a new array concatenating the arrays returned from running `mapper` on all items in `array`.

## Examples
```rescript
type language = ReScript | TypeScript | JavaScript

let array = [ReScript, TypeScript, JavaScript]

Console.log(
  array->Array.flatMap(item =>
    switch item {
    | ReScript => [1, 2, 3]
    | TypeScript => [4, 5, 6]
    | JavaScript => [7, 8, 9]
    }
  ),
)
// [1, 2, 3, 4, 5, 6, 7, 8, 9]
```
*/
@send
external flatMap: (t<'a>, 'a => array<'b>) => array<'b> = "flatMap"

/**
  `findMap(arr, f)`

  Calls `f` for each element and returns the first value from `f` that is `Some(_)`.
  Otherwise returns `None`

  ```res example
  Array.findMap([1, 2, 3], n => mod(n, 2) ? Some(n - 2) : None) == 0
  ```
*/
let findMap: (t<'a>, 'a => option<'b>) => option<'b>

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
external at: (t<'a>, int) => option<'a> = "at"

@send
external fromArray: array<'a> => t<'a> = "slice"

@send
external toArray: t<'a> => array<'a> = "slice"
