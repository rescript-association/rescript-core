# @rescript/core

A drop-in standard library for ReScript. Intended to be familiar for JavaScript developers, easy to use, and be rich enough (without being bloated) so that you don't need to reach for anything else for typical ReScript development.

## Background

We're proposing a new, experimental drop-in standard library intended to solve a number of problems we see in ReScript development today. This proposed standard library has the following purposes:

1. Adding a rich (enough) standard library that's familiar to JavaScript developers
2. Clearing up the current confusing situation with regards to t-first vs t-last, OCaml pervasives, `Js.Array2` etc
3. Prepare for "uncurried by default" by only shipping compatible APIs

In practice, the proposed standard library is a fusion of `rescript-js`, `rescript-promise`, and `Belt` - all battle tested and well liked, with a few minor additions sprinkled in. So while we're calling this a new standard library, the parts it's made up of isn't new.

It ships as a separate package, so you can try it out and start migrating to it if you want at your convenience. Eventually, if the community likes it and it stands the test of time, it might make its way into the compiler. And, at that point it would replace the current `Js` namespace.

## Versioning and current status

You're encouraged to start using this today. We don't anticipate nor plan for larger changes to any of the APIs, but please be aware that _changes may still happen_ as this project stabilizes. We're of course also interested in the community's feedback on the APIs. The DX of using Core is going to gradually improve as we add doc strings, documentation and so on.

## Guiding principles

We've been following a few guiding principles as we developed this:

- Familiarity for JavaScript developers. Let APIs follow their JS equivalents as much as possible, and where there are new APIs that don't exist in the JS standard library, follow a naming and layout that we think will feel familiar to a JS developer. Example: `Belt.Array.keepMap` is included in the `Array` module, but here renamed to `Array.filterMap` to be more familiar to JS developers.
- Focus on zero cost APIs, but prioritize quality. Sometimes a small bit of runtime is required for the API to be as good as it can be.
- Effortless inference is important here. Choose APIs where inference just works. Example: `Belt.Array.reduce` is included instead of `Js.Array2.reduce`, because the `Belt` version's inference is better than the `Js.Array2` version.

## Acknowledgements

- [@bloodyowl](https://github.com/bloodyowl) + contributors to `rescript-js` are the people who've done the heavy lifting here, since this stdlib is based heavily on `rescript-js`.
- Also a shout out to the authors of `Belt`, as a few key things have been incorporated directly from `Belt`.
- Patrick ([@ryyppy](https://github.com/ryyppy)) for his work on `rescript-promise`, which is fully inlined into the stdlib.

## Installation

ReScript `>=10.1` is required.

```console
$ npm install @rescript/core
```

Then add `@rescript/core` to your `bsconfig.json`'s `bs-dependencies`:

```diff
 {
   "bs-dependencies": [
+    "@rescript/core"
   ]
 }
```

Open it so it's available in the global scope.

```diff
 {
   "bsc-flags": [
+    "-open RescriptCore",
   ]
 }
```

## What it looks like

All relevant standard library modules are designed to be available directly in
the global scope, just like you expect them to.

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

## Documentation

Documentation will be added successively to this repository. We're looking for help in producing good, high quality docstrings for all APIs. More information coming on how you can help out with this.

## OCaml compat

During the transition phase to this standard library you might find yourself needing to access the current global `Array`/`List` etc modules that originate from OCaml. These will be removed eventually, but in the transition phase you'll be able to access them by adding this open at the top of any file:

```rescript
open OCamlCompat
```

## Differences to `rescript-js`

This standard library is based on `rescript-js`, but with the tweaks and modifications. Some of the changes are listed below. There are also no uncurried versions of anything in the standard library. This is because _uncurried by default_ will be coming soon in ReScript 11, which will remove the need for explicitly uncurried functions.

### Array

- `reduce`/`reduceReverse` and friends (withIndex versions) are taken from `Belt` and replace the bindings to the JavaScript equivalents (`reduce` and `reduceRight`). The `reduce` versions from `Belt` works fully with type inference because of the argument order being reversed (`init` value comes first), whereas the JavaScript versions don't work well with inference. The runtime added for this is minor (and very fast still), and we want users to have to annotate as little as possible for the standard functions they'll be using.
- `push`/`pushMany`/`unshift`/`unshiftMany` are changed to return `unit`, for convenience. In JS, these return the new length of the array. That's however extremely rare to actually use, and you can just do `Array.length(array)` after pushing to get the new length. Changing the return type to be `unit` gets rid of needing to do `let _ = ` (or `->ignore`), which can be confusing for beginners.
- `findIndexOpt`/`lastIndexOf`/`indexOfOpt` are added, returning `None` instead of `-1` if the item searched for does not exist. These are in addition to `findIndex`/`lastIndexOf`, which still returns `-1` when the item you're looking for does not exist.
- `getUnsafe` added (copied from `Belt`).
- `setUnsafe` added (copied from `Belt`).
- `sort`, `toSorted`, `reverse`, `toReversed`, `splice`, `toSpliced` are the same as their JS counterpart (mutable and immutable, respectively).
- `keepMap` is added from `Belt`, but **renamed to `filterMap`**. Rationale: `filterMap` is closer to the JS convention of naming. It's also available in other languages like Rust. `keep` et al can confuse beginners, who're bound to be looking for `filter` style names since that's what JS has.
- `shuffle` and `toShuffled` are added (copied from `Belt`'s `shuffleInPlace` and `shuffle`).
- `flatMap` added (copied from `Belt`, but using native `map` and `concat` functions).

### Float

- `fromString` is copied from `Belt`. Main difference is that `fromString` now returns an `option` that's `None` if the parsed float is `NaN`. If you want the raw JS behavior of potentially parsing a float to `NaN` you can use `Float.parseFloat(string)`.

### String

- `searchOpt`/`indexOfOpt`/`lastIndexOfOpt` added. Convenience methods for returning an `option` instead of returning `-1` for not found.
- Added bindings for `localeCompare`.

### Promise

The `Promise` module is inlined from https://github.com/ryyppy/rescript-promise, with these additions:

- Jaap's `ignorePromise` PR is merged.

### Option, List, Result

- The above stated modules are brought in from `Belt`, since they're widely used in the ecosystem.
- In `Option` and `List`, the same naming convention is applied as in `Array` for `keep*` functions. As in `keep` becomes `filter`, `keepMap` becomes `filterMap`, etc.

### window, document

- `window` and `document` are typed as `Dom.window`/`Dom.document` rather than open objects (`{..}`).

## Migration

_Things are added to this section on migration gradually._

Migrating to the new standard library should be easy to do gradually. In this section we'll gather information that's intended to help migrating as painlessly as possible.

In general, we suggest you take the following gradual approach:

1. Install the stdlib and open it in the global scope
2. Fix any inconsistencies that uncovers. That will be things like module name clashes (more details below), `someArr[0]` now returning an option, and so on.
3. Run the semi-automated migration below. This will uncover more things to fix.
4. Do a final search for `Js.` in your project, and replace any leftovers that the migration script did not catch.

Check out [this issue on the GitHub tracker](https://github.com/rescript-association/rescript-core/issues/20) if you get stuck. We'll do what we can to help out when migrating there.

### Semi-automated migration

We've prepared a script you can run with [comby.dev](https://comby.dev) that will do parts of the migration for you automatically. The migration script is located in [`migration.toml`](migration/migration.toml). Here's an example of how you can run it:

```bash
# Run in your project root. Assumes `migration.toml` has been copied in place to your project root.
comby -config migration.toml -f .res -matcher .re -exclude-dir node_modules,__generated__ -i

# You should run it twice - once for .res files, and once for .resi. The command below runs for .resi, and the one above for .res.
comby -config migration.toml -f .resi -matcher .re -exclude-dir node_modules,__generated__ -i
```

The migration script is a set of instructions that Comby runs in sequence. You're encouraged to take `migration.toml` and tweak it so it fits your needs. [Comby](https://comby.dev) is powerful. It can do interactive rewriting and numerous other useful stuff. Check it out, but please note it's _not_ intended to cover all of the migration necessary. You'll still likely need to do a few manual fixes after running the migration scripts.

### Name clashes

Since the standard library is designed to live in the global scope, you _might_ have your own modules or modules from one of your dependencies whose names collide with the modules from the standard library.

This is a side effect of shipping the standard library as its own package, meaning it won't be a problem if the standard library is adopted and ships with the compiler. At that point you'll be able to have your own modules shadowing builtin modules.

In the meantime, as a workaround:

- For a conflict with your own module, the easiest way to solve this is to just rename your own module to something else.
- For a conflict with a dependency - e.g., Core's `Intl` vs. rescript-react-intl's `Intl`, you could use [patch-package](https://github.com/ds300/patch-package) to rename the conflicting module in Core (or remove it altogether if you are not using it).
