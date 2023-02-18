# @rescript/core Changelog

## main

### API changes

- Change `Map.set` to not return self, to indicate that it's mutable. https://github.com/rescript-association/rescript-core/pull/34
- Change `Set.add` to not return self, to indicate that it's mutable. https://github.com/rescript-association/rescript-core/pull/35
- Change `Iterator` bindings to have the same shape as `AsyncIterator` for consistency. https://github.com/rescript-association/rescript-core/pull/34
- Add `Iterator.toArray` binding for turning an iterator into an array. https://github.com/rescript-association/rescript-core/pull/34

### Documentation

- Docstrings for `Map` and `Iterator`. https://github.com/rescript-association/rescript-core/pull/34
- Docstrings for `Global`. https://github.com/rescript-association/rescript-core/pull/39
- Docstrings for `Set`. https://github.com/rescript-association/rescript-core/pull/35
- Docstrings for `AsyncIterator`. https://github.com/rescript-association/rescript-core/pull/33
- Docstrings for `Type`. https://github.com/rescript-association/rescript-core/pull/32
- Docstrings for `Int`. https://github.com/rescript-association/rescript-core/pull/37
- Docstrings for `Dict`. https://github.com/rescript-association/rescript-core/pull/40
