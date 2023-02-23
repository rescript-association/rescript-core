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
- Change `RegExp.source` to return a `string`. Was previously returning a `bool`, which is wrong. https://github.com/rescript-association/rescript-core/pull/47
- Remove `Date.valueOf` as it returns the same as `Date.getTime`. https://github.com/rescript-association/rescript-core/pull/61
- Change `Float.fromString` signature. Now accepts only string. https://github.com/rescript-association/rescript-core/pull/54
- Change `Float.parseFloat` signature. Now accepts only string. https://github.com/rescript-association/rescript-core/pull/54

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
