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

/**
`seal` seals an object. Sealing an object prevents extensions and makes existing properties non-configurable. A sealed object has a fixed set of properties. Unlike `freeze`, values of existing properties can still be changed as long as they are writable. `seal` returns the same object that was passed in.
 
Any attempt to delete or add properties to a sealed object will fail, either silently or by throwing an error. 

Rescript usually [disallows modifying objects](https://rescript-lang.org/docs/manual/latest/object#update) regardless of whether they are sealed.

## Examples

```rescript
let point = {"x": 1, "y": 3}->Object.seal
let pointIsSealed = point->Object.isSealed // true
let fruit = {"name": "Apple" }
let fruitIsSealed = fruit->Object.isSealed // false
```
## Specifications
- [Updating objects in Rescript](https://rescript-lang.org/docs/manual/latest/object#update)
- [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.seal)
- [Object.seal on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/seal)
*/
@val
external seal: 'a => 'a = "Object.seal"
@val external preventExtensions: 'a => 'a = "Object.preventExtensions"
@val external freeze: 'a => 'a = "Object.freeze"

/**
 `isSealed` determines if an object is sealed. A sealed object has a fixed set of properties.

 ## Examples

 ```rescript
 let point = {"x": 1, "y": 3}->Object.seal
 let pointIsSealed = point->Object.isSealed // true
 let fruit = {"name": "Apple" }
 let fruitIsSealed = fruit->Object.isSealed // false
  ```
  ## Specifications
 - [Updating objects in Rescript](https://rescript-lang.org/docs/manual/latest/object#update)
 - [ECMAScript Language Specification](https://tc39.es/ecma262/multipage/fundamental-objects.html#sec-object.issealed)
 - [Object.isSealed on MDN](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Object/isSealed)
  */
@val
external isSealed: 'a => bool = "Object.isSealed"
@val external isFrozen: 'a => bool = "Object.isFrozen"
@val external isExtensible: 'a => bool = "Object.isExtensible"
