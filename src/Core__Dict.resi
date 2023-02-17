/***
A mutable dictionary with string keys.

Compiles to a regular JavaScript object.*/

/**
Type representing a dictionary of value `'a`.
*/
type t<'a> = Js.Dict.t<'a>

/**
Returns the value at the provided key, if it exists. Returns an option.

## Examples
```rescript
let dict = Dict.fromArray([("someKey", "someValue")])

switch dict->Dict.get("someKey") {
| None => Console.log("Nope, didn't have the key.")
| Some(value) => Console.log(value)
}
```
*/
@get_index
external get: (t<'a>, string) => option<'a> = ""

/**
`set(dictionary, key, value)` sets the value at the provided key to the provided value.

## Examples
```rescript
let dict = Dict.make()

dict->Dict.set("someKey", "someValue")
```
*/
@set_index
external set: (t<'a>, string, 'a) => unit = ""

/**
`delete(dictionary, key)` deletes the value at `key`, if it exists.

## Examples
```rescript
let dict = Dict.fromArray([("someKey", "someValue")])

dict->Dict.delete("someKey")
```
*/
let delete: (t<'a>, string) => unit

/**
`make()` creates a new, empty dictionary.

## Examples
```rescript
let dict1: Dict.t<int> = Dict.make() // You can annotate the type of the values of your dict yourself if you want

let dict2 = Dict.make() // Or you can let ReScript infer it via usage.
dict2->Dict.set("someKey", 12)
```
*/
@obj
external make: unit => t<'a> = ""

/**
`fromArray(entries)` creates a new dictionary from the provided array of key/value pairs.

## Examples
```rescript
let dict = Dict.fromArray([("key1", "value1"), ("key2", "value2")])
```
*/
@val
external fromArray: array<(string, 'a)> => t<'a> = "Object.fromEntries"

/**
`fromIterator(entries)` creates a new dictionary from the provided iterator of key/value pairs.

## Examples
```rescript
// Pretend we have an iterator of the correct shape
@val external someIterator: Iterator.t<(string, int)> = "someIterator"

let dict = Dict.fromIterator(someIterator) // Dict.t<int>
```
*/
@val
external fromIterator: Core__Iterator.t<(string, 'a)> => t<'a> = "Object.fromEntries"

/**
`toArray(dictionary)` returns an array of all the key/value pairs of the dictionary.

## Examples
```rescript
let dict = Dict.make()
dict->Dict.set("someKey", 1)
dict->Dict.set("someKey2", 2)
let asArray = dict->Dict.toArray
Console.log(asArray) // Logs `[["someKey", 1], ["someKey2", 2]]` to the console
```
*/
@val
external toArray: t<'a> => array<(string, 'a)> = "Object.entries"

/**
`keysToArray(dictionary)` returns an array of all the keys of the dictionary.

## Examples
```rescript
let dict = Dict.make()
dict->Dict.set("someKey", 1)
dict->Dict.set("someKey2", 2)
let keys = dict->Dict.keysToArray
Console.log(keys) // Logs `["someKey", "someKey2"]` to the console
```
*/
@val
external keysToArray: t<'a> => array<string> = "Object.keys"

/**
`valuesToArray(dictionary)` returns an array of all the values of the dictionary.

## Examples
```rescript
let dict = Dict.make()
dict->Dict.set("someKey", 1)
dict->Dict.set("someKey2", 2)
let values = dict->Dict.valuesToArray
Console.log(values) // Logs `[1, 2]` to the console
```
*/
@val
external valuesToArray: t<'a> => array<'a> = "Object.values"

/**
`assign(dictionary1, dictionary2)` [shallowly](https://developer.mozilla.org/en-US/docs/Glossary/Shallow_copy) merges dictionary2 into dictionary1, and returns dictionary1.

Beware this will *mutate* dictionary1. If you're looking for a way to copy a dictionary, check out `Dict.copy`.

## Examples
```rescript
let dict1 = Dict.make()
dict1->Dict.set("firstKey", 1)
Console.log(dict1->Dict.keysToArray) // Logs `["firstKey"]`

let dict2 = Dict.make()
dict2->Dict.set("someKey", 2)
dict2->Dict.set("someKey2", 3)

let dict1 = dict1->Dict.assign(dict2)

Console.log(dict1->Dict.keysToArray) // Logs `["firstKey", "someKey", "someKey2"]`

```
*/
@val
external assign: (t<'a>, t<'a>) => t<'a> = "Object.assign"

/**
`copy(dictionary)` [shallowly copies](https://developer.mozilla.org/en-US/docs/Glossary/Shallow_copy) the provided dictionary to a new dictionary.

## Examples
```rescript
let dict = Dict.fromArray([("key1", "value1"), ("key2", "value2")])
let dict2 = dict->Dict.copy

// Both log `["key1", "key2"]` here.
Console.log2(dict->Dict.keysToArray, dict2->Dict.keysToArray)
```
*/
@val
external copy: (@as(json`{}`) _, t<'a>) => t<'a> = "Object.assign"
