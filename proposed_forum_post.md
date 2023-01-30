> This is a proposed forum post for when this is announced, after we've worked out the details.

# [ANN] ReScript Core - a new, batteries included drop-in standard library

ReScript core is a new drop-in standard library, intended to be familiar for JavaScript developers and rich enough that you don't need to reach for anything else for typical ReScript development.

It's designed to replace the usage of the current `Js` namespace as well as the OCaml pervasives (global `Array`, `List` etc). `Belt` remains unchanged. This is going to clear up the current standard library situation, which can be quite confusing.

Core **ships as its own package**. The developer experience will get better continuously (adding proper documentation, doc strings, and so on), but you can **start using this today**. And if the community agrees on this direction and it stands the test of time, it could eventually become part of the compiler.

Check out the [repository for the package here](https://github.com/rescript-association/rescript-standard-library).

## Acknowledgements

First thing's first - a huge thanks to @bloodyowl and the rest of the contributors to `rescript-js`. This standard library is heavily based on `rescript-js`. Thank you for your great work!

## What does it look like?

```rescript
Console.log("Hello world!")

let timeout = setTimeout(() => {
  Console.log("Hello!")
}, 100)

clearTimeout(timeout)

let array = [1, 2, 3]

let sum = array
  ->Array.map(x => x * 2)
  ->Array.reduce(0, (acc, item) => acc + item)

let maybeValidFloats = ["1", "1.5", "some random string"]

let validFloats = maybeValidFloats
  ->Array.filterMap(v => v->Float.fromString)
```

_A sample of how code written using `@rescript/core` can look._

The standard library is primarily a fusion of [`rescript-js`](https://github.com/bloodyowl/rescript-js), [`rescript-promise`](https://github.com/ryyppy/rescript-promise) and parts of `Belt`. All well liked and heavily battle tested. So, it's a _new_ standard library in the sense that the package is new, but the contents of it really isn't.

It moves all modules to the global namespace. Instead of doing `Js.String2.length`, you'd do `String.length`. Instead of doing `Belt.Option.getWithDefault`, you'd do `Option.getWithDefault`. This is going to make development feel much more natural.

The new standard library also tries to stay as close to JavaScript as possible. But, we've made some tweaks and sprinkled in a few additions to make it slightly richer than the standard library of JavaScript, as well as make it better adapted to ReScript where necessary.

We've also carefully incorporated useful utilities and modules that we believe are general enough to cater to a majority of developers. A few examples of what this includes:

- Extra utilities in the `Array` module brought in from `Belt`, like `flatMap`, `filterMap`, and `shuffle`.
- The entire `Option` and `Result` modules brought in from `Belt`. Because options (and to some extent result) is deeply ingrained into the language and ecosystem, they deserve to be first classed.
- [Patrick's `rescript-promise`](https://github.com/ryyppy/rescript-promise) is fully brought in, finally incorporating the refreshed promise module.

Check out all the [details on this in the repository](https://github.com/rescript-lang/rescript-standard-library).

## Cleaning up the current standard library situation

One of the main goals of this initiative is to clean up the current standard library situation. Today, if working with an array, you'll have 4 built-in options:

- `Array`. OCaml pervasives, leftover, shouldn't be used.
- `Js.Array`. Data last, shouldn't be used, prefer data first.
- `Js.Array2`. Data first, use this for zero cost bindings.
- `Belt.Array`. Data first and "batteries included". Use this for more specialized usage.

With this new standard library, you'll have 2 options:

- `Array`. From the standard library.
- `Belt.Array`.

Most importantly, this will make development feel more _natural_ and intuitive if you're used to JavaScript. Instead of reaching for `Js.Array2`, or `Belt.Array`, you'll just reach for `Array`. Simpler, easier and cleaner.

### What about Belt

`Belt` will stay as is, and continues to be a great alternative for more specialized use cases. If you're doing `-open Belt` and you're happy with that today, you can just keep doing that.

However, this standard library aims to stay closer to JavaScript in how the APIs are shaped (and what they're called) than what `Belt` is currently doing.

### Removing the `Js` namespace

> The `Js` namespace refers to `Js.Array`, `Js.Array2` and everything else under `Js`.

Having a separate `Js` namespace is a leftover from when integration between ReScript and OCaml was a lot tighter. Since ReScript is focusing on JavaScript exclusively now, the `Js` namespace is no longer necessary. Therefore, this is designed to pave the way for eventually removing the `Js` namespace. All that the `Js` namespace can do today will be possible to do with this new standard library, which would be available in the global scope directly.

However, removing it wouldn't happen in the near future. It would live on in its current form for a long time, to let the ecosystem migrate to this new standard library in its own pace.

## Migration

We'll be supplying some basic utilities to ease migration, making most of it automatic. There will however be some manual work involved, but we are going to focus on allowing migration to be gradual. There are more details on [_migrating here_](https://github.com/rescript-association/rescript-standard-library#migration).

## Documentation (we need your help!)

As the initial version of the standard library ships as its own package, it'll lack both some of the docstrings in the code, as well as actual documentation. This will be fixed continuously.

If you're interested, **your help is much wanted**. We'd some love help crafting proper docstrings for the parts of the standard library that does not already have them. We'll get back here with more details on how you can help soon.

## Wrapping up

Thank you for reading! We're excited to move forward with this proposal to start clearing up the current situation.
