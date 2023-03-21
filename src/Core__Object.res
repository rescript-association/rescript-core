@obj external empty: unit => {..} = ""

@val external is: ('a, 'b) => bool = "Object.is"

@val external create: {..} => {..} = "Object.create"
@val external createWithProperties: ({..}, {..}) => {..} = "Object.create"
@val external createWithNull: (@as(json`null`) _, unit) => {..} = "Object.create"
@val external createWithNullAndProperties: (@as(json`null`) _, {..}) => {..} = "Object.create"

/**
`assign(target, source)` copies enumerable own properties from the source to the target, overwriting properties with the same name. It returns the modified target object. A deep clone is not created; properties are copied by reference.

**Note:** ReScript provides [first-class support for immutable objects](https://rescript-lang.org/docs/manual/latest/object), including spreading one object into another. This is often more convenient than using `assign`.  

See [Object.assign on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) or [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.assign).

## Examples

```rescript
Object.assign({"a": 1}, {"a": 2}) // {"a": 2}
Object.assign({"a": 1, "b": 2}, {"a": 0}) // {"a": 0, "b": 2}
Object.assign({"a": 1}, {"a": null}) // {"a": null}
```
*/
@val
external assign: ({..}, {..}) => {..} = "Object.assign"
@variadic
@val
/**
`assignMany(target, sources)` copies enumerable own properties from each source to the target, overwriting properties with the same name. Later sources' properties overwrite earlier ones. It returns the modified target object. A deep clone is not created; properties are copied by reference.

**Note:** ReScript provides [first-class support for immutable objects](https://rescript-lang.org/docs/manual/latest/object), including spreading one object into another. This is often more convenient than using `assign` or `assignMany`.  

See [Object.assign on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/assign) or [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.assign).
*/
external assignMany: ({..}, array<{..}>) => {..} = "Object.assign"
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
