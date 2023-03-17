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
@val external preventExtensions: 'a => 'a = "Object.preventExtensions"
/**
`freeze` freezes an object. Freezing an object makes existing properties non-writable and prevents extensions. Once an object is frozen, new properties cannot be be added, existing properties cannot be removed, and their values cannot be changed. `freeze` returns the same object that was passed in; it does not create a frozen copy.
 
Any attempt to change a frozen object will fail, either silently or by throwing an exception.

Rescript usually [disallows modifying objects](https://rescript-lang.org/docs/manual/latest/object#update) regardless of whether they are frozen.

 ## Examples

 ```rescript
let point = {"x": 1, "y": 3}->Object.freeze
let pointIsFrozen = point->Object.isFrozen // true
let fruit = {"name": "Apple" }
let fruitIsFrozen = fruit->Object.isFrozen // false
 ```
 ## Specifications
- [Updating objects in Rescript](https://rescript-lang.org/docs/manual/latest/object#update)
- [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.freeze)
- [Object.freeze on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/freeze)
 */
@val
external freeze: 'a => 'a = "Object.freeze"

@val external isSealed: 'a => bool = "Object.isSealed"
/**
`isFrozen` determines if an object is frozen. An object is frozen if an only if it is not extensible, all its properties are non-configurable, and all its data properties are non-writable.

## Examples

```rescript
let point = {"x": 1, "y": 3}->Object.freeze
let pointIsFrozen = point->Object.isFrozen // true
let fruit = {"name": "Apple" }
let fruitIsFrozen = fruit->Object.isFrozen // false
 ```
 ## Specifications
- [Updating objects in Rescript](https://rescript-lang.org/docs/manual/latest/object#update)
- [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.isfrozen)
- [Object.isFrozen on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isFrozen)
 */
@val
external isFrozen: 'a => bool = "Object.isFrozen"
@val external isExtensible: 'a => bool = "Object.isExtensible"
