@obj external empty: unit => {..} = ""

/**
`is` determines if two objects are identical in all contexts. Objects, arrays, records, and other non-primitives are only identical if they reference the **exact** same object in memory. Primitives like ints, floats, and strings are identical if they have the same value. `+0` and `-0` are distinct. NaN is equal to itself. See [Object.is on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/is)

In most scenarios use `==` or `===` or the custom `equals` function (if provided) for the type.

## Examples

```rescript
Object.is(25, 13) // false
Object.is("abc", "abc") // true
Object.is(undefined, undefined) // true
Object.is(undefined, null) // false
Object.is(-0.0, 0.0) // false
Object.is(list{1, 2}, list{1, 2}) // false

Object.is([1, 2, 3], [1, 2, 3]) // false
[1, 2, 3] == [1, 2, 3] // true
[1, 2, 3] === [1, 2, 3] // false

let fruit = {"name": "Apple" }
Object.is(fruit, fruit) // true
Object.is(fruit, {"name": "Apple" }) // false
fruit == {"name": "Apple" } // true
fruit === {"name": "Apple" } // false
```
*/
@val
external is: ('a, 'a) => bool = "Object.is"

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
/**
`freeze` freezes an object. Freezing an object makes existing properties non-writable and prevents extensions. Once an object is frozen, new properties cannot be be added, existing properties cannot be removed, and their values cannot be changed.

**Note:** `freeze` returns the same object that was passed in; it does not create a frozen copy. Any attempt to change a frozen object will fail, either silently or by throwing an exception.

See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.isfrozen) and [Object.isFrozen on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isFrozen).

## Examples

 ```rescript
let obj = {"a": 1}
obj->Object.set("a", 2) // succeeds
obj->Object.freeze->ignore
obj->Object.set("a", 3) // fails
```
*/
@val
external freeze: 'a => 'a = "Object.freeze"

@val external isSealed: 'a => bool = "Object.isSealed"
/**
`isFrozen` determines if an object is frozen. An object is frozen if an only if it is not extensible, all its properties are non-configurable, and all its data properties are non-writable.

See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.isfrozen) and [Object.isFrozen on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isFrozen).

## Examples

```rescript
let point = {"x": 1, "y": 3}->Object.freeze
let pointIsFrozen = point->Object.isFrozen // true
let fruit = {"name": "Apple" }
let fruitIsFrozen = fruit->Object.isFrozen // false
 ```
*/
@val
external isFrozen: 'a => bool = "Object.isFrozen"
@val external isExtensible: 'a => bool = "Object.isExtensible"
