type t<'a> = array<'a>

@new external makeUninitializedUnsafe: int => t<'a> = "Array"
@set external truncateToLengthUnsafe: (t<'a>, int) => unit = "length"
external getUnsafe: (t<'a>, int) => 'a = "%array_unsafe_get"
external setUnsafe: (t<'a>, int, 'a) => unit = "%array_unsafe_set"

@val external fromArrayLike: Js.Array2.array_like<'a> => t<'a> = "Array.from"
@val
external fromArrayLikeWithMap: (Js.Array2.array_like<'a>, 'a => 'b) => t<'b> = "Array.from"

@send external fromArray: t<'a> => t<'a> = "slice"

@send external fillAll: (t<'a>, 'a) => unit = "fill"

let make = (~length, x) =>
  if length <= 0 {
    []
  } else {
    let arr = makeUninitializedUnsafe(length)
    arr->fillAll(x)
    arr
  }

let fromInitializer = (~length, f) =>
  if length <= 0 {
    []
  } else {
    let arr = makeUninitializedUnsafe(length)
    for i in 0 to length - 1 {
      arr->setUnsafe(i, f(i))
    }
    arr
  }

@val external isArray: 'a => bool = "Array.isArray"

@get external length: t<'a> => int = "length"

@send external copyAllWithin: (t<'a>, ~target: int) => t<'a> = "copyWithin"

@send
external copyWithinToEnd: (t<'a>, ~target: int, ~start: int) => t<'a> = "copyWithin"

@send
external copyWithin: (t<'a>, ~target: int, ~start: int, ~end: int) => t<'a> = "copyWithin"

@send external toReversed: t<'a> => t<'a> = "toReversed"

@send
external toSpliced: (t<'a>, ~start: int, ~remove: int, ~insert: t<'a>) => t<'a> = "toSpliced"

@send external with: (t<'a>, int, 'a) => t<'a> = "with"

@send external concat: (t<'a>, t<'a>) => t<'a> = "concat"
@send external concatMany: (t<'a>, t<t<'a>>) => t<'a> = "concat"

@send external flat: t<t<'a>> => t<'a> = "flat"

@send external includes: (t<'a>, 'a) => bool = "includes"

@send external indexOf: (t<'a>, 'a) => int = "indexOf"
let indexOfOpt = (arr, item) =>
  switch arr->indexOf(item) {
  | -1 => None
  | index => Some(index)
  }
@send external indexOfFrom: (t<'a>, 'a, int) => int = "indexOf"

@send external joinWith: (t<'a>, string) => string = "join"

@send external lastIndexOf: (t<'a>, 'a) => int = "lastIndexOf"
let lastIndexOfOpt = (arr, item) =>
  switch arr->lastIndexOf(item) {
  | -1 => None
  | index => Some(index)
  }
@send external lastIndexOfFrom: (t<'a>, 'a, int) => int = "lastIndexOf"

@send external slice: (t<'a>, ~start: int, ~end: int) => t<'a> = "slice"
@send external sliceToEnd: (t<'a>, ~start: int) => t<'a> = "slice"
@send external copy: t<'a> => t<'a> = "slice"

@send external toSorted: (t<'a>, ('a, 'a) => int) => t<'a> = "toSorted"

@send external toString: t<'a> => string = "toString"
@send external toLocaleString: t<'a> => string = "toLocaleString"

@send external every: (t<'a>, 'a => bool) => bool = "every"
@send external everyWithIndex: (t<'a>, ('a, int) => bool) => bool = "every"

@send external filter: (t<'a>, 'a => bool) => t<'a> = "filter"
@send external filterWithIndex: (t<'a>, ('a, int) => bool) => t<'a> = "filter"

@send external find: (t<'a>, 'a => bool) => option<'a> = "find"
@send external findWithIndex: (t<'a>, ('a, int) => bool) => option<'a> = "find"

@send external findIndex: (t<'a>, 'a => bool) => int = "findIndex"
@send external findIndexWithIndex: (t<'a>, ('a, int) => bool) => int = "findIndex"

@send external forEach: (t<'a>, 'a => unit) => unit = "forEach"
@send external forEachWithIndex: (t<'a>, ('a, int) => unit) => unit = "forEach"

@send external map: (t<'a>, 'a => 'b) => t<'b> = "map"
@send external mapWithIndex: (t<'a>, ('a, int) => 'b) => t<'b> = "map"

@send external reduce: (t<'b>, ('a, 'b) => 'a, 'a) => 'a = "reduce"
let reduce = (arr, init, f) => reduce(arr, f, init)
@send external reduceWithIndex: (t<'b>, ('a, 'b, int) => 'a, 'a) => 'a = "reduce"
let reduceWithIndex = (arr, init, f) => reduceWithIndex(arr, f, init)
@send
external reduceRight: (t<'b>, ('a, 'b) => 'a, 'a) => 'a = "reduceRight"
let reduceRight = (arr, init, f) => reduceRight(arr, f, init)
@send
external reduceRightWithIndex: (t<'b>, ('a, 'b, int) => 'a, 'a) => 'a = "reduceRight"
let reduceRightWithIndex = (arr, init, f) => reduceRightWithIndex(arr, f, init)

@send external some: (t<'a>, 'a => bool) => bool = "some"
@send external someWithIndex: (t<'a>, ('a, int) => bool) => bool = "some"

@get_index external get: (t<'a>, int) => option<'a> = ""

@get_index external getSymbol: (t<'a>, Core__Symbol.t) => option<'b> = ""
@get_index external getSymbolUnsafe: (t<'a>, Core__Symbol.t) => 'b = ""

let findIndexOpt = (array: t<'a>, finder: 'a => bool): option<int> =>
  switch findIndex(array, finder) {
  | -1 => None
  | index => Some(index)
  }

let swapUnsafe = (xs, i, j) => {
  let tmp = getUnsafe(xs, i)
  setUnsafe(xs, i, getUnsafe(xs, j))
  setUnsafe(xs, j, tmp)
}

let shuffle = xs => {
  let len = length(xs)
  for i in 0 to len - 1 {
    swapUnsafe(xs, i, Js.Math.random_int(i, len)) /* [i,len) */
  }
}

let toShuffled = xs => {
  let result = copy(xs)
  shuffle(result)
  result
}

let filterMapU = (a, f) => {
  let l = length(a)
  let r = makeUninitializedUnsafe(l)
  let j = ref(0)
  for i in 0 to l - 1 {
    let v = getUnsafe(a, i)
    switch f(. v) {
    | None => ()
    | Some(v) =>
      setUnsafe(r, j.contents, v)
      j.contents = j.contents + 1
    }
  }
  truncateToLengthUnsafe(r, j.contents)
  r
}

let filterMap = (a, f) => filterMapU(a, (. a) => f(a))

let keepSome = filterMap(_, x => x)

@send external flatMap: (t<'a>, 'a => t<'b>) => t<'b> = "flatMap"

let findMap = (arr, f) => {
  let rec loop = i =>
    if i == arr->length {
      None
    } else {
      switch f(getUnsafe(arr, i)) {
      | None => loop(i + 1)
      | Some(_) as r => r
      }
    }

  loop(0)
}

@send external at: (t<'a>, int) => option<'a> = "at"
