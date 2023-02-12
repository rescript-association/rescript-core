/*** Provide bindings to JS string.*/

/**
`make(value)` converts the given value to a `string`.

```rescript
String.make(3.5) == "3.5"
String.make([1, 2, 3]) == "1,2,3"
```
*/
@val external make: 'a => string = "String"
/**
`fromCharCode(n)` creates a `string` containing the character corresponding to
that number; `n` ranges from 0 to 65535.If out of range, the lower 16 bits of
the value are used. Thus, `fromCharCode(0x1F63A)` gives the same result as
`fromCharCode(0xF63A)`.
See [`String.fromCharCode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCharCode)
on MDN.
```rescript
String.fromCharCode(65) == "A"
String.fromCharCode(0x3c8) == `ψ`
String.fromCharCode(0xd55c) == `한`
String.fromCharCode(-64568) == `ψ`
```
*/
@val external fromCharCode: int => string = "String.fromCharCode"
/**
`fromCharCodeMany([n1, n2, n3])` creates a `string` from the characters
corresponding to the given numbers, using the same rules as `fromCharCode`.
See [`String.fromCharCode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCharCode)
on MDN.
*/
@variadic @val external fromCharCodeMany: array<int> => string = "String.fromCharCode"
/**
`fromCodePoint(n)` creates a `string` containing the character corresponding to
that numeric code point. If the number is not a valid code point, it raises
`RangeError`. Thus, `fromCodePoint(0x1F63A)` will produce a correct value,
unlike `fromCharCode(0x1F63A)`, and `fromCodePoint(-5)` will raise a
`RangeError`.
See [`String.fromCodePoint`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCodePoint)
on MDN.
```rescript
String.fromCodePoint(65) == "A"
String.fromCodePoint(0x3c8) == `ψ`
String.fromCodePoint(0xd55c) == `한`
String.fromCodePoint(0x1f63a) == `😺`
```
*/
@val external fromCodePoint: int => string = "String.fromCodePoint"
/**
`fromCodePointMany([n1, n2, n3])` creates a `string` from the characters
corresponding to the given code point numbers, using the same rules as
`fromCodePoint`.
See [`String.fromCodePoint`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCodePoint)
on MDN.
```rescript
String.fromCodePointMany([0xd55c, 0xae00, 0x1f63a]) == `한글😺`
```
*/
@variadic @val external fromCodePointMany: array<int> => string = "String.fromCodePoint"
/**
`length(s)` returns the length of the given `string`.
See [`String.length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length)
on MDN.
```rescript
String.length("abcd") == 4
```
*/
@get external length: string => int = "length"

/**
`get(s, n)` returns as a `string` the character at the given index number. If
`n` is out of range, this function returns `undefined`,so at some point this
function may be modified to return `option(string)`.
```rescript
String.get("Reason", 0) == "R"
String.get("Reason", 4) == "o"
String.get(`Rẽasöń`, 5) == `ń`
```
*/
@get_index external get: (string, int) => option<string> = ""
/**
`charAt(s, n)` gets the character at index `n` within string `s`. If `n` is
negative or greater than the length of `s`, it returns the empty string. If the
string contains characters outside the range \u0000-\uffff, it will return the
first 16-bit value at that position in the string.
See [`String.charAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/charAt)
on MDN.
```rescript
String.charAt("Reason", 0) == "R"
String.charAt("Reason", 12) == ""
String.charAt(`Rẽasöń`, 5) == `ń`
```
*/
@send external charAt: (string, int) => string = "charAt"
/**
`charCodeAt(s, n)` returns the character code at position `n` in string `s`;
the result is in the range 0-65535, unlke `codePointAt`, so it will not work
correctly for characters with code points greater than or equal to 0x10000. The
return type is `float` because this function returns NaN if `n` is less than
zero or greater than the length of the string.
See [`String.charCodeAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/charCodeAt)
on MDN.
```rescript
String.charCodeAt(`😺`, 0) == 0xd83d->Belt.Int.toFloat
String.codePointAt(`😺`, 0) == Some(0x1f63a)
```
*/
@send external charCodeAt: (string, int) => float = "charCodeAt"
/**
`codePointAt(s, n)` returns the code point at position `n` within string `s` as
a `Some(value)`. The return value handles code points greater than or equal to
0x10000. If there is no code point at the given position, the function returns
`None`.
See [`String.codePointAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/codePointAt)
on MDN.
```rescript
Js.String2.codePointAt(`¿😺?`, 1) == Some(0x1f63a)
Js.String2.codePointAt("abc", 5) == None
```
*/
@send external codePointAt: (string, int) => option<int> = "codePointAt"
/**
`concat(original, append)` returns a new `string` with `append` added after
`original`.
See [`String.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat)
on MDN.
```rescript
String.concat("cow", "bell") == "cowbell"
```
*/
@send external concat: (string, string) => string = "concat"
/**
`concatMany(original, arr)` returns a new `string` consisting of each item of an
array of strings added to the `original` string.
See [`String.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat)
on MDN.
```rescript
String.concatMany("1st", ["2nd", "3rd", "4th"]) == "1st2nd3rd4th"
```
*/
@variadic @send external concatMany: (string, array<string>) => string = "concat"
/**
ES2015: `endsWith(str, substr)` returns `true` if the `str` ends with `substr`,
`false` otherwise.
See [`String.endsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith)
on MDN.
```rescript
String.endsWith("BuckleScript", "Script") == true
String.endsWith("BuckleShoes", "Script") == false
```
*/
@send external endsWith: (string, string) => bool = "endsWith"
/**
`endsWithFrom(str, ending, len)` returns `true` if the first len characters of
`str` end with `ending`, `false` otherwise. If `len` is greater than or equal
to the length of `str`, then it works like `endsWith`. (Honestly, this should
have been named endsWithAt, but oh well).
See [`String.endsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith)
on MDN.
```rescript
String.endsWithFrom("abcd", "cd", 4) == true
String.endsWithFrom("abcde", "cd", 3) == false
String.endsWithFrom("abcde", "cde", 99) == true
String.endsWithFrom("example.dat", "ple", 7) == true
```
*/
@send external endsWithFrom: (string, string, int) => bool = "endsWith"
/**
ES2015: `includes(str, searchValue)` returns `true` if `searchValue` is found
anywhere within `str`, false otherwise.
See [`String.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes)
on MDN.
```rescript
String.includes("programmer", "gram") == true
String.includes("programmer", "er") == true
String.includes("programmer", "pro") == true
String.includes("programmer.dat", "xyz") == false
```
*/
@send external includes: (string, string) => bool = "includes"
/**
ES2015: `includes(str, searchValue start)` returns `true` if `searchValue` is
found anywhere within `str` starting at character number `start` (where 0 is
the first character), `false` otherwise.
See [`String.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes)
on MDN.
```rescript
String.includesFrom("programmer", "gram", 1) == true
String.includesFrom("programmer", "gram", 4) == false
String.includesFrom(`대한민국`, `한`, 1) == true
```
*/
@send external includesFrom: (string, string, int) => bool = "includes"
/**
ES2015: `indexOf(str, searchValue)` returns the position at which `searchValue`
was first found within `str`, or -1 if `searchValue` is not in `str`.
See [`String.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf)
on MDN.
```rescript
String.indexOf("bookseller", "ok") == 2
String.indexOf("bookseller", "sell") == 4
String.indexOf("beekeeper", "ee") == 1
String.indexOf("bookseller", "xyz") == -1
```
*/
@send external indexOf: (string, string) => int = "indexOf"
let indexOfOpt: (string, string) => option<int>
@send external indexOfFrom: (string, string, int) => int = "indexOf"
@send external lastIndexOf: (string, string) => int = "lastIndexOf"
let lastIndexOfOpt: (string, string) => option<int>
@send external lastIndexOfFrom: (string, string, int) => int = "lastIndexOf"
@return(nullable) @send
external match: (string, Core__RegExp.t) => option<Core__RegExp.Result.t> = "match"
type normalizeForm = [#NFC | #NFD | #NFKC | #NFKD]
@send external normalize: string => string = "normalize"
@send external normalizeByForm: (string, normalizeForm) => string = "normalize"
@send external repeat: (string, int) => string = "repeat"
@send external replace: (string, string, string) => string = "replace"
@send external replaceRegExp: (string, Core__RegExp.t, string) => string = "replace"
@send
external unsafeReplaceRegExpBy0: (
  string,
  Core__RegExp.t,
  (@uncurry ~match: string, ~offset: int, ~input: string) => string,
) => string = "replace"
@send
external unsafeReplaceRegExpBy1: (
  string,
  Core__RegExp.t,
  (@uncurry ~match: string, ~group1: string, ~offset: int, ~input: string) => string,
) => string = "replace"
@send
external unsafeReplaceRegExpBy2: (
  string,
  Core__RegExp.t,
  (
    @uncurry ~match: string,
    ~group1: string,
    ~group2: string,
    ~offset: int,
    ~input: string,
  ) => string,
) => string = "replace"
@send
external unsafeReplaceRegExpBy3: (
  string,
  Core__RegExp.t,
  (
    @uncurry ~match: string,
    ~group1: string,
    ~group2: string,
    ~group3: string,
    ~offset: int,
    ~input: string,
  ) => string,
) => string = "replace"
@send external search: (string, Core__RegExp.t) => int = "search"
let searchOpt: (string, Core__RegExp.t) => option<int>
@send external slice: (string, ~start: int, ~end: int) => string = "slice"
@send external sliceToEnd: (string, ~start: int) => string = "slice"
@send external split: (string, string) => array<string> = "split"
@send external splitAtMost: (string, string, ~limit: int) => array<string> = "split"
@send external splitByRegExp: (string, Core__RegExp.t) => array<option<string>> = "split"
@send
external splitByRegExpAtMost: (string, Core__RegExp.t, ~limit: int) => array<option<string>> =
  "split"
@send external startsWith: (string, string) => bool = "startsWith"
@send external startsWithFrom: (string, string, int) => bool = "startsWith"
@send external substring: (string, ~start: int, ~end: int) => string = "substring"
@send external substringToEnd: (string, ~start: int) => string = "substring"
@send external toLowerCase: string => string = "toLowerCase"
@send external toLocaleLowerCase: string => string = "toLocaleLowerCase"
@send external toUpperCase: string => string = "toUpperCase"
@send external toLocaleUpperCase: string => string = "toLocaleUpperCase"
@send external trim: string => string = "trim"
@send external trimStart: string => string = "trimStart"
@send external trimEnd: string => string = "trimEnd"
@send external padStart: (string, int, string) => string = "padStart"
@send external padEnd: (string, int, string) => string = "padEnd"
@get_index external getSymbol: (string, Core__Symbol.t) => option<'a> = ""
@get_index external getSymbolUnsafe: (string, Core__Symbol.t) => 'a = ""
@set_index external setSymbol: (string, Core__Symbol.t, 'a) => unit = ""
@send external localeCompare: (string, string) => float = "localeCompare"
