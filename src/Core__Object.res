@obj external empty: unit => {..} = ""

@val external is: ('a, 'b) => bool = "Object.is"

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
/**
`preventExtensions` prevents new properties from being added to the object. It modifies the object (rather than creating a copy) and returns it.

See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.preventextensions) and [Object.preventExtensions on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/preventExtensions)

## Examples

```rescript
let obj = {"a": 1}
obj->Object.set("b", 2) // succeeds
obj->Object.preventExtensions->ignore
obj->Object.set("c", 3) // fails
```
*/
@val
external preventExtensions: 'a => 'a = "Object.preventExtensions"
@val external freeze: 'a => 'a = "Object.freeze"

@val external isSealed: 'a => bool = "Object.isSealed"
@val external isFrozen: 'a => bool = "Object.isFrozen"
/**
`isExtensible` determines if an object is extensible (whether it can have new properties added to it).

See [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.isextensible) and [Object.isExtensible on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isExtensible)

## Examples

```rescript
let obj = {"a": 1}
obj->Object.isExtensible // true
obj->Object.preventExtensions->ignore
obj->Object.isExtensible // false
```
*/
@val
external isExtensible: 'a => bool = "Object.isExtensible"
