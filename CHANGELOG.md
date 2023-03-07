# @rescript/core Changelog

## main

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
- Stricter number parsing in `Float.fromString` and `Int.fromString`, https://github.com/rescript-association/rescript-core/pull/93

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
