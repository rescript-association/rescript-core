@obj external empty: unit => {..} = ""

/**
`Object.is` determines if two objects are identical in all contexts. Objects, arrays, records, and other non-primitives are only identical if they reference the **exact** same object in memory. Primitives like ints, floats, and strings are identical if they have the same value. `+0` and `-0` are distinct. NaN is 
equal to itself.

**Note:** In most scenarios use `==` and `===`. If the type you want to compare by value has an `equals` function, use it.

The `==` operator [is different in ReScript than Javascript](https://rescript-lang.org/docs/manual/latest/overview#boolean). Arrays, records and other non-primitives are equal if they have the same contents (deep equality).

In ReScript, the `===` operator performs a strict equality check, like Javascript, and is similar but not identical to `Object.is`; see [Mozilla](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is). 

## Examples
```rescript
Object.is(25, 13) // false
Object.is("abc", "abc") // true
Object.is(undefined, undefined) // true
Object.is(undefined, null) // false
Object.is(-0.0, 0.0) // false
Object.is(list{1, 2}, list{1, 2}) // false

let fruit = {"name": "Apple" }
Object.is(fruit, fruit) // true
Object.is(fruit, {"name": "Apple" }) // false
fruit == {"name": "Apple" } // true
fruit === {"name": "Apple" } // false

Object.is([1, 2, 3], [1, 2, 3]) // false
[1, 2, 3] == [1, 2, 3] // true
[1, 2, 3] === [1, 2, 3] // false
```
## Specifications
- [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.is)
- [`Object.is on Mozilla`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is)
- [Equality operators in ReScript](https://rescript-lang.org/docs/manual/latest/overview#boolean)
*/
@val
external is: ('a, 'b) => bool = "Object.is"

@val external create: {..} => {..} = "Object.create"
@val external createWithProperties: ({..}, {..}) => {..} = "Object.create"
@val external createWithNull: (@as(json`null`) _, unit) => {..} = "Object.create"
@val external createWithNullAndProperties: (@as(json`null`) _, {..}) => {..} = "Object.create"

@val external assign: ({..}, {..}) => {..} = "Object.assign"
@variadic @val external assignMany: ({..}, array<{..}>) => {..} = "Object.assign"
@val external copy: (@as(json`{}`) _, {..}) => {..} = "Object.assign"

@get_index external get: ({..}, string) => option<'a> = ""
@get_index external getSymbol: ({..}, Core__Symbol.t) => option<'a> = ""
@get_index external getSymbolUnsafe: ({..}, Core__Symbol.t) => 'a = ""

@set_index external set: ({..}, string, 'a) => unit = ""
@set_index external setSymbol: ({..}, Core__Symbol.t, 'a) => unit = ""

@val external keysToArray: {..} => array<string> = "Object.keys"

@val external hasOwnProperty: ({..}, string) => bool = "Object.prototype.hasOwnProperty.call"

@val external seal: 'a => 'a = "Object.seal"
@val external preventExtensions: 'a => 'a = "Object.preventExtensions"
@val external freeze: 'a => 'a = "Object.freeze"

@val external isSealed: 'a => bool = "Object.isSealed"
@val external isFrozen: 'a => bool = "Object.isFrozen"
@val external isExtensible: 'a => bool = "Object.isExtensible"
