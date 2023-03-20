@obj external empty: unit => {..} = ""

@val external is: ('a, 'b) => bool = "Object.is"

@val external create: {..} => {..} = "Object.create"
@val external createWithProperties: ({..}, {..}) => {..} = "Object.create"
@val external createWithNull: (@as(json`null`) _, unit) => {..} = "Object.create"
@val external createWithNullAndProperties: (@as(json`null`) _, {..}) => {..} = "Object.create"

@val external assign: ({..}, {..}) => {..} = "Object.assign"
@variadic @val external assignMany: ({..}, array<{..}>) => {..} = "Object.assign"
@val external copy: (@as(json`{}`) _, {..}) => {..} = "Object.assign"

/**
`get` gets the value of a property by name. Returns `None` if the property does not exist or has the value `undefined`. Otherwise returns `Some`, including if the value is `null`.

## Examples

```rescript
{"a": 1}->Object.get("a") // Some(1)
{"a": 1}->Object.get("b") // None
{"a": undefined}->Object.get("a") // None
{"a": null}->Object.get("a") // Some(null)
{"a": 1}->Object.get("toString")->Option.isSome // true
```
*/
@get_index
external get: ({..}, string) => option<'a> = ""
/**
`getSymbol` gets the value of a property by symbol. Returns `None` if the property does not exist or has the value `undefined`. Otherwise returns `Some`, including if the value is `null`.

## Examples

```rescript
let fruit = Symbol.make("fruit")
let x = Object.empty()
x->Object.setSymbol(fruit, "banana")
x->Object.getSymbol(fruit) // Some("banana")
```
*/
@get_index
external getSymbol: ({..}, Core__Symbol.t) => option<'a> = ""
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
