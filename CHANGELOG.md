# @rescript/core Changelog

## Next version

## 0.5.0

### API changes

- Add `Result.mapError` https://github.com/rescript-association/rescript-core/pull/98

### Documentation

- Docstrings for `Object`. Not yet complete. https://github.com/rescript-association/rescript-core/pull/117

## 0.4.0

### API changes

- Map, Set, WeakMap, WeakSet: use the types defined in the Js namespace. https://github.com/rescript-association/rescript-core/pull/143
- Symbol: use the types defined in the Js namespace. https://github.com/rescript-association/rescript-core/pull/145
- The types `RescriptCore.Type.function` and `RescriptCore.Type.object` use the types defined in the Js namespace. https://github.com/rescript-association/rescript-core/pull/146
- The type `RescriptCore.Type.symbol` removed in favor of `RescriptCore.Symbol.t`. https://github.com/rescript-association/rescript-core/pull/146
- Added `BigInt` support for `RescriptCore.Classify.t`. https://github.com/rescript-association/rescript-core/pull/146
- `Array` mutable & immutable helper name changed to conform to JS' upcoming APIs [such as `toSorted`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSorted)
  - `sort` -> `toSorted`, `sortInPlace` -> `sort`
  - `reverse` -> `toReversed`, `reverseInPlace` -> `reverse`
  - `splice` -> `toSpliced`, `spliceInPlace` -> `splice`
  - `shuffle` -> `toShuffled`, `shuffleInPlace` -> `shuffle`
  - `fillAllInPlace` -> `fillAll`, `fillInPlaceToEnd` -> `fillToEnd`, `fillInPlace` -> `fill`
  - added `with`
- Same for `TypedArray`:
  - `sort` -> `toSorted`, `sortInPlace` -> `sort`
  - `reverse` -> `toReversed`, `reverseInPlace` -> `reverse`
  - `fillAllInPlace` -> `fillAll`, `fillInPlaceToEnd` -> `fillToEnd`, `fillInPlace` -> `fill`
- And `List`:
  - `shuffle` -> `toShuffled`
- Use `float` instead of `int` for ordering to avoid premature overflow. https://github.com/rescript-association/rescript-core/pull/149
- Add `Ordering` module. https://github.com/rescript-association/rescript-core/pull/149

**Note 1**: These changes should all produce the correct type errors. Though `TypedArray`'s `reverse` and `sort` previously mutated _and_ returned the mutated array itself, whereas now they'd be copies. Please be careful refactoring these 2.

**Note 2**: the newly added helpers, `Array.toSorted`, `Array.toSpliced`, `Array.toReversed`, `Array.with`, `TypedArray.toSorted` and `TypedArray.toReversed` require their respective polyfill, as [they're not currently supported by Firefox](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Array/toSorted).

## 0.3.1

### Bug fixes

- Fix peer dependency range so later versions of npm don't complain as `Core` is used with ReScript `v11` alpha.

## 0.3.0

### API changes

- Add `Result.forEach` https://github.com/rescript-association/rescript-core/pull/116
- Set peer dependencies range for ReScript compiler https://github.com/rescript-association/rescript-core/pull/133

## 0.2.0

### API changes

- Change `Map.set` to not return self, to indicate that it's mutable. https://github.com/rescript-association/rescript-core/pull/34
- Change `Set.add` to not return self, to indicate that it's mutable. https://github.com/rescript-association/rescript-core/pull/35
- Change `Iterator` bindings to have the same shape as `AsyncIterator` for consistency. https://github.com/rescript-association/rescript-core/pull/34
- Add `Iterator.toArray` binding for turning an iterator into an array. https://github.com/rescript-association/rescript-core/pull/34
- Add `Array.at` binding for returning an array item by its index. https://github.com/rescript-association/rescript-core/pull/48
- Fixed type signatures of `Array.fromArrayLikeWithMap` and `Array.fromIteratorWithMap`. https://github.com/rescript-association/rescript-core/pull/50
- Remove internal async/await helpers that do not need to be exposed in `Core`.
- Add locale and formatting options to `localeDateString`, `localeString` and `localTimeString` functions https://github.com/rescript-association/rescript-core/pull/30
- Remove `Undefined` module. `Nullable` or `option` directly (where appropriate) can be used instead. https://github.com/rescript-association/rescript-core/pull/59
- Change `RegExp.source` to return a `string`. Was previously returning a `bool`, which is wrong. https://github.com/rescript-association/rescript-core/pull/47
- Remove `Date.valueOf` as it returns the same as `Date.getTime`. https://github.com/rescript-association/rescript-core/pull/61
- Change `Float.fromString` signature. Now accepts only string. https://github.com/rescript-association/rescript-core/pull/54
- Change `Float.parseFloat` signature. Now accepts only string. https://github.com/rescript-association/rescript-core/pull/54
- Add `getExn`, `getUnsafe`, `getWithDefault`, `map`, `mapWithDefault` and `flatMap` to `Nullable`. https://github.com/rescript-association/rescript-core/pull/67
- Add `getExn`, `getUnsafe`, `getWithDefault`, `map`, `mapWithDefault` and `flatMap` to `Null`. https://github.com/rescript-association/rescript-core/pull/73
- Add `make`, `fromInitializer`, `findMap`, `keepSome`, `reduceRight` and `reduceRightWithIndex`. https://github.com/rescript-association/rescript-core/pull/49
- Remove `reduceReverse` in favor of `reduceRight`. https://github.com/rescript-association/rescript-core/pull/49
- Fixed type signatures of `reduce` and `reduceWithIndex`. https://github.com/rescript-association/rescript-core/pull/49
- Add `panic`/`Error.panic`. https://github.com/rescript-association/rescript-core/pull/72
- The globally available `null` value now originates from `Nullable` and not `Null`, just like the globally available `undefined` value does. https://github.com/rescript-association/rescript-core/pull/88
- Add `Int.range` and `Int.rangeWithOptions`, https://github.com/rescript-association/rescript-core/pull/52
- Remove `Array.fromIterator` and `Array.fromIteratorWithMap`. The same functions exist in `Iterator` as `Iterator.fromArray` and `Iterator.fromArrayWithMapper`. https://github.com/rescript-association/rescript-core/pull/78
- Remove unsafe `Array.from` and `Array.fromWithMap`. https://github.com/rescript-association/rescript-core/pull/78

### Documentation

- Docstrings for `Map` and `Iterator`. https://github.com/rescript-association/rescript-core/pull/34
- Docstrings for `Global`. https://github.com/rescript-association/rescript-core/pull/39
- Docstrings for `Set`. https://github.com/rescript-association/rescript-core/pull/35
- Docstrings for `AsyncIterator`. https://github.com/rescript-association/rescript-core/pull/33
- Docstrings for `Type`. https://github.com/rescript-association/rescript-core/pull/32
- Docstrings for `Int`. https://github.com/rescript-association/rescript-core/pull/37
- Docstrings for `Dict`. https://github.com/rescript-association/rescript-core/pull/40
- Docstrings for `RegExp`. https://github.com/rescript-association/rescript-core/pull/47
- Docstrings for `Date`. https://github.com/rescript-association/rescript-core/pull/61
- Docstrings for `Float`. https://github.com/rescript-association/rescript-core/pull/54
- Docstrings for `String`. https://github.com/rescript-association/rescript-core/pull/27
- Docstrings from `Array`. https://github.com/rescript-association/rescript-core/pull/78
