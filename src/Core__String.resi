/* Copyright (C) 2015-2016 Bloomberg Finance L.P.
 *
 * This program is free software: you can redistribute it and/or modify
 * it under the terms of the GNU Lesser General Public License as published by
 * the Free Software Foundation, either version 3 of the License, or
 * (at your option) any later version.
 *
 * In addition to the permissions granted to you by the LGPL, you may combine
 * or link a "work that uses the Library" with a publicly distributed version
 * of this file to produce a combined library or application, then distribute
 * that combined work under the terms of your choosing, with no requirement
 * to comply with the obligations normally placed on you by section 4 of the
 * LGPL version 3 (or the corresponding section of a later version of the LGPL
 * should you choose to use a later version).
 *
 * This program is distributed in the hope that it will be useful,
 * but WITHOUT ANY WARRANTY; without even the implied warranty of
 * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
 * GNU Lesser General Public License for more details.
 *
 * You should have received a copy of the GNU Lesser General Public License
 * along with this program; if not, write to the Free Software
 * Foundation, Inc., 59 Temple Place - Suite 330, Boston, MA 02111-1307, USA. */

/*** Functions for interacting with JavaScript strings.
See: [`String`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String).*/

/**
`make(value)` converts the given value to a `string`.

## Examples

```rescript
String.make(3.5) == "3.5"
String.make([1, 2, 3]) == "1,2,3"
```
*/
@val
external make: 'a => string = "String"

/**
`fromCharCode(n)` creates a `string` containing the character corresponding to
that number; `n` ranges from 0 to 65535.If out of range, the lower 16 bits of
the value are used. Thus, `fromCharCode(0x1F63A)` gives the same result as
`fromCharCode(0xF63A)`.
See [`String.fromCharCode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCharCode)
on MDN.

## Examples

```rescript
String.fromCharCode(65) == "A"
String.fromCharCode(0x3c8) == `ψ`
String.fromCharCode(0xd55c) == `한`
String.fromCharCode(-64568) == `ψ`
```
*/
@val
external fromCharCode: int => string = "String.fromCharCode"

/**
`fromCharCodeMany([n1, n2, n3])` creates a `string` from the characters
corresponding to the given numbers, using the same rules as `fromCharCode`.
See [`String.fromCharCode`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCharCode)
on MDN.
*/
@variadic
@val
external fromCharCodeMany: array<int> => string = "String.fromCharCode"

/**
`fromCodePoint(n)` creates a `string` containing the character corresponding to
that numeric code point. If the number is not a valid code point, it raises
`RangeError`. Thus, `fromCodePoint(0x1F63A)` will produce a correct value,
unlike `fromCharCode(0x1F63A)`, and `fromCodePoint(-5)` will raise a
`RangeError`.
See [`String.fromCodePoint`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCodePoint)
on MDN.

## Examples

```rescript
String.fromCodePoint(65) == "A"
String.fromCodePoint(0x3c8) == `ψ`
String.fromCodePoint(0xd55c) == `한`
String.fromCodePoint(0x1f63a) == `😺`
```
*/
@val
external fromCodePoint: int => string = "String.fromCodePoint"

/**
`fromCodePointMany([n1, n2, n3])` creates a `string` from the characters
corresponding to the given code point numbers, using the same rules as
`fromCodePoint`.
See [`String.fromCodePoint`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/fromCodePoint)
on MDN.

## Examples

```rescript
String.fromCodePointMany([0xd55c, 0xae00, 0x1f63a]) == `한글😺`
```
*/
@variadic
@val
external fromCodePointMany: array<int> => string = "String.fromCodePoint"

/**
`length(str)` returns the length of the given `string`.
See [`String.length`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/length)
on MDN.

## Examples

```rescript
String.length("abcd") == 4
```
*/
@get
external length: string => int = "length"

/**
`get(str, n)` returns as a `option<string>` at the given index number. If `n`
is out of range, this function returns `None`.

## Examples

```rescript
String.get("Reason", 0) == "R"
String.get("Reason", 4) == "o"
String.get(`Rẽasöń`, 5) == `ń`
```
*/
@get_index
external get: (string, int) => option<string> = ""

/**
`charAt(str, n)` gets the character at index `n` within string `str`. If `n` is
negative or greater than the length of `str`, it returns the empty string. If
the string contains characters outside the range \u0000-\uffff, it will return
the first 16-bit value at that position in the string.
See [`String.charAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/charAt)
on MDN.

## Examples

```rescript
String.charAt("Reason", 0) == "R"
String.charAt("Reason", 12) == ""
String.charAt(`Rẽasöń`, 5) == `ń`
```
*/
@send
external charAt: (string, int) => string = "charAt"

/**
`charCodeAt(str, n)` returns the character code at position `n` in string `str`
the result is in the range 0-65535, unlke `codePointAt`, so it will not work
correctly for characters with code points greater than or equal to 0x10000. The
return type is `float` because this function returns NaN if `n` is less than
zero or greater than the length of the string.
See [`String.charCodeAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/charCodeAt)
on MDN.

## Examples

```rescript
String.charCodeAt(`😺`, 0) == 0xd83d->Int.toFloat
String.codePointAt(`😺`, 0) == Some(0x1f63a)
```
*/
@send
external charCodeAt: (string, int) => float = "charCodeAt"

/**
`codePointAt(str, n)` returns the code point at position `n` within string `str`
as a `Some(value)`. The return value handles code points greater than or equal
to 0x10000. If there is no code point at the given position, the function
returns `None`.
See [`String.codePointAt`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/codePointAt)
on MDN.

## Examples

```rescript
String.codePointAt(`¿😺?`, 1) == Some(0x1f63a)
String.codePointAt("abc", 5) == None
```
*/
@send
external codePointAt: (string, int) => option<int> = "codePointAt"

/**
`concat(original, append)` returns a new `string` with `append` added after
`original`.
See [`String.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat)
on MDN.

## Examples

```rescript
String.concat("cow", "bell") == "cowbell"
String.concat("Re", "Script") == "ReScript"
```
*/
@send
external concat: (string, string) => string = "concat"

/**
`concatMany(original, arr)` returns a new `string` consisting of each item of an
array of strings added to the `original` string.
See [`String.concat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/concat)
on MDN.

## Examples

```rescript
String.concatMany("1st", ["2nd", "3rd", "4th"]) == "1st2nd3rd4th"
```
*/
@variadic
@send
external concatMany: (string, array<string>) => string = "concat"

/**
ES2015: `endsWith(str, substr)` returns `true` if the `str` ends with `substr`,
`false` otherwise.
See [`String.endsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith)
on MDN.

## Examples

```rescript
String.endsWith("BuckleScript", "Script") == true
String.endsWith("BuckleShoes", "Script") == false
```
*/
@send
external endsWith: (string, string) => bool = "endsWith"

// NOTE: Honestly, this should have been named endsWithAt, but oh well
/**
`endsWithFrom(str, ending, len)` returns `true` if the first len characters of
`str` end with `ending`, `false` otherwise. If `len` is greater than or equal
to the length of `str`, then it works like `endsWith`.
See [`String.endsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/endsWith)
on MDN.

## Examples

```rescript
String.endsWithFrom("abcd", "cd", 4) == true
String.endsWithFrom("abcde", "cd", 3) == false
String.endsWithFrom("abcde", "cde", 99) == true
String.endsWithFrom("example.dat", "ple", 7) == true
```
*/
@send
external endsWithFrom: (string, string, int) => bool = "endsWith"

/**
ES2015: `includes(str, searchValue)` returns `true` if `searchValue` is found
anywhere within `str`, `false` otherwise.
See [`String.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes)
on MDN.

## Examples

```rescript
String.includes("programmer", "gram") == true
String.includes("programmer", "er") == true
String.includes("programmer", "pro") == true
String.includes("programmer.dat", "xyz") == false
```
*/
@send
external includes: (string, string) => bool = "includes"

/**
ES2015: `includes(str, searchValue start)` returns `true` if `searchValue` is
found anywhere within `str` starting at character number `start` (where 0 is
the first character), `false` otherwise.
See [`String.includes`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/includes)
on MDN.

## Examples

```rescript
String.includesFrom("programmer", "gram", 1) == true
String.includesFrom("programmer", "gram", 4) == false
String.includesFrom(`대한민국`, `한`, 1) == true
```
*/
@send
external includesFrom: (string, string, int) => bool = "includes"

/**
ES2015: `indexOf(str, searchValue)` returns the position at which `searchValue`
was first found within `str`, or `-1` if `searchValue` is not in `str`.
See [`String.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf)
on MDN.

## Examples

```rescript
String.indexOf("bookseller", "ok") == 2
String.indexOf("bookseller", "sell") == 4
String.indexOf("beekeeper", "ee") == 1
String.indexOf("bookseller", "xyz") == -1
```
*/
@send
external indexOf: (string, string) => int = "indexOf"
let indexOfOpt: (string, string) => option<int>

/**
`indexOfFrom(str, searchValue, start)` returns the position at which
`searchValue` was found within `str` starting at character position `start`, or
`-1` if `searchValue` is not found in that portion of `str`. The return value is
relative to the beginning of the string, no matter where the search started
from.
See [`String.indexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/indexOf)
on MDN.

## Examples

```rescript
String.indexOfFrom("bookseller", "ok", 1) == 2
String.indexOfFrom("bookseller", "sell", 2) == 4
String.indexOfFrom("bookseller", "sell", 5) == -1
```
*/
@send
external indexOfFrom: (string, string, int) => int = "indexOf"

/**
`lastIndexOf(str, searchValue)` returns the position of the last occurrence of
`searchValue` within `str`, searching backwards from the end of the string.
Returns `-1` if `searchValue` is not in `str`. The return value is always
relative to the beginning of the string.
See [`String.lastIndexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/lastIndexOf)
on MDN.

## Examples

```rescript
String.lastIndexOf("bookseller", "ok") == 2
String.lastIndexOf("beekeeper", "ee") == 4
String.lastIndexOf("abcdefg", "xyz") == -1
```
*/
@send
external lastIndexOf: (string, string) => int = "lastIndexOf"
let lastIndexOfOpt: (string, string) => option<int>

/**
`lastIndexOfFrom(str, searchValue, start)` returns the position of the last
occurrence of `searchValue` within `str`, searching backwards from the given
start position. Returns `-1` if `searchValue` is not in `str`. The return value
is always relative to the beginning of the string.
See [`String.lastIndexOf`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/lastIndexOf)
on MDN.

## Examples

```rescript
String.lastIndexOfFrom("bookseller", "ok", 6) == 2
String.lastIndexOfFrom("beekeeper", "ee", 8) == 4
String.lastIndexOfFrom("beekeeper", "ee", 3) == 1
String.lastIndexOfFrom("abcdefg", "xyz", 4) == -1
```
*/
@send
external lastIndexOfFrom: (string, string, int) => int = "lastIndexOf"

/**
`match(str, regexp)` matches a `string` against the given `regexp`. If there is
no match, it returns `None`. For regular expressions without the g modifier, if
  there is a match, the return value is `Some(array)` where the array contains:
- The entire matched string
- Any capture groups if the regexp had parentheses
For regular expressions with the g modifier, a matched expression returns
`Some(array)` with all the matched substrings and no capture groups.
See [`String.match`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/match)
on MDN.

## Examples

```rescript
String.match("The better bats", %re("/b[aeiou]t/")) == Some(["bet"])
String.match("The better bats", %re("/b[aeiou]t/g")) == Some(["bet", "bat"])
String.match("Today is 2018-04-05.", %re("/(\d+)-(\d+)-(\d+)/")) == Some(["2018-04-05", "2018", "04", "05"])
String.match("The large container.", %re("/b[aeiou]g/")) == None
```
*/
@return(nullable)
@send
external match: (string, Core__RegExp.t) => option<Core__RegExp.Result.t> = "match"
type normalizeForm = [#NFC | #NFD | #NFKC | #NFKD]

/**
`normalize(str)` returns the normalized Unicode string using Normalization Form
Canonical (NFC) Composition. Consider the character ã, which can be represented
as the single codepoint \u00e3 or the combination of a lower case letter A
\u0061 and a combining tilde \u0303. Normalization ensures that both can be
stored in an equivalent binary representation.
See [`String.normalize`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/normalize)
on MDN. See also [Unicode technical report
#15](https://unicode.org/reports/tr15/) for details.

## Examples

```rescript
let string1 = "\uFB00"
let string2 = "\u0066\u0066"
Console.log(string1 === string2) // false

let normalizeString1 = String.normalize(string1, "NFKD")
let normalizeString2 = String.normalize(string2, "NFKD")
assert(normalizeString1 === normalizeString2)
```
*/
@send
external normalize: string => string = "normalize"

/**
ES2015: `normalize(str, form)` returns the normalized Unicode string using the
specified form of normalization, which may be one of:
- "NFC" — Normalization Form Canonical Composition.
- "NFD" — Normalization Form Canonical Decomposition.
- "NFKC" — Normalization Form Compatibility Composition.
- "NFKD" — Normalization Form Compatibility Decomposition.
See [`String.normalize`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/normalize) on MDN.
See also [Unicode technical report #15](https://unicode.org/reports/tr15/) for details.

## Examples

```rescript
let string1 = "\uFB00"
let string2 = "\u0066\u0066"
Console.log(string1 === string2) // false

let normalizeString1 = String.normalizeByForm(string1, #NFKD)
let normalizeString2 = String.normalizeByForm(string2, #NFKD)
assert(normalizeString1 === normalizeString2)
```
*/
@send
external normalizeByForm: (string, normalizeForm) => string = "normalize"

/**
`repeat(str, n)` returns a `string` that consists of `n` repetitions of `str`.
Raises `RangeError` if `n` is negative.
See [`String.repeat`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/repeat)
on MDN.

## Examples

```rescript
String.repeat("ha", 3) == "hahaha"
String.repeat("empty", 0) == ""
```
*/
@send
external repeat: (string, int) => string = "repeat"

/**
ES2015: `replace(str, substr, newSubstr)` returns a new `string` which is
identical to `str` except with the first matching instance of `substr` replaced
by `newSubstr`. `substr` is treated as a verbatim string to match, not a
regular expression.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace)
on MDN.

## Examples

```rescript
String.replace("old string", "old", "new") == "new string"
String.replace("the cat and the dog", "the", "this") == "this cat and the dog"
```
*/
@send
external replace: (string, string, string) => string = "replace"

/**
`replaceByRe(str, regex, replacement)` returns a new `string` where occurrences
matching regex have been replaced by `replacement`.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace)
on MDN.

## Examples

```rescript
String.replaceByRe("vowels be gone", %re("/[aeiou]/g"), "x") == "vxwxls bx gxnx"
String.replaceByRe("Juan Fulano", %re("/(\w+) (\w+)/"), "$2, $1") == "Fulano, Juan"
```
*/
@send
external replaceRegExp: (string, Core__RegExp.t, string) => string = "replace"

/**
Returns a new `string` with some or all matches of a pattern with no capturing
parentheses replaced by the value returned from the given function. The
function receives as its parameters the matched string, the offset at which the
match begins, and the whole string being matched.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace)
on MDN.

## Examples

```rescript
let str = "beautiful vowels"
let re = %re("/[aeiou]/g")
let matchFn = (matchPart, _offset, _wholeString) => String.toUpperCase(matchPart)
String.unsafeReplaceBy0(str, re, matchFn) == "bEAUtIfUl vOwEls"
```
*/
@send
external unsafeReplaceRegExpBy0: (
  string,
  Core__RegExp.t,
  (@uncurry ~match: string, ~offset: int, ~input: string) => string,
) => string = "replace"

/**
Returns a new `string` with some or all matches of a pattern with one set of
capturing parentheses replaced by the value returned from the given function.
The function receives as its parameters the matched string, the captured
string, the offset at which the match begins, and the whole string being
matched.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace)
on MDN.

## Examples

```rescript
let str = "Jony is 40"
let re = %re("/(Jony is )\d+/g")
let matchFn = (_match, part1, _offset, _wholeString) => {
  part1 ++ "41"
}
String.unsafeReplaceBy1(str, re, matchFn) == "Jony is 41"
```
*/
@send
external unsafeReplaceRegExpBy1: (
  string,
  Core__RegExp.t,
  (@uncurry ~match: string, ~group1: string, ~offset: int, ~input: string) => string,
) => string = "replace"

/**
Returns a new `string` with some or all matches of a pattern with two sets of
capturing parentheses replaced by the value returned from the given function.
The function receives as its parameters the matched string, the captured
strings, the offset at which the match begins, and the whole string being
matched.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace)
on MDN.

## Examples

```rescript
let str = "7 times 6"
let re = %re("/(\d+) times (\d+)/")
let matchFn = (_match, p1, p2, _offset, _wholeString) => {
  switch (Int.fromString(p1), Int.fromString(p2)) {
  | (Some(x), Some(y)) => Int.toString(x * y)
  | _ => "???"
  }
}
String.unsafeReplaceBy2(str, re, matchFn) == "42"
```
*/
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

/**
Returns a new `string` with some or all matches of a pattern with three sets of
capturing parentheses replaced by the value returned from the given function.
The function receives as its parameters the matched string, the captured
strings, the offset at which the match begins, and the whole string being
matched.
See [`String.replace`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/replace)
on MDN.
*/
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

/**
`search(str, regexp)` returns the starting position of the first match of
`regexp` in the given `str`, or -1 if there is no match.
See [`String.search`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/search)
on MDN.

## Examples

```rescript
String.search("testing 1 2 3", %re("/\d+/")) == 8
String.search("no numbers", %re("/\d+/")) == -1
```
*/
@send
external search: (string, Core__RegExp.t) => int = "search"
let searchOpt: (string, Core__RegExp.t) => option<int>

/**
`slice(str, ~start:n1, ~end:n2)` returns the substring of `str` starting at
character `n1` up to but not including `n2`.
- If either `n1` or `n2` is negative, then it is evaluated as `length(str - n1)` or `length(str - n2)`.
- If `n2` is greater than the length of `str`, then it is treated as `length(str)`.
- If `n1` is greater than `n2`, slice returns the empty string.
See [`String.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice)
on MDN.

## Examples

```rescript
String.slice("abcdefg", ~start=2, ~end=5) == "cde"
String.slice("abcdefg", ~start=2, ~end=9) == "cdefg"
String.slice("abcdefg", ~start=-4, ~end=-2) == "de"
String.slice("abcdefg", ~start=5, ~end=1) == ""
```
*/
@send
external slice: (string, ~start: int, ~end: int) => string = "slice"

/**
`sliceToEnd(str, ~start:n)` returns the substring of `str` starting at character
`n` to the end of the string.
- If `n` is negative, then it is evaluated as `length(str - n)`.
- If `n` is greater than the length of `str`, then sliceToEnd returns the empty string.
See [`String.slice`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/slice)
on MDN.

## Examples

```rescript
String.sliceToEnd("abcdefg", ~start=4) == "efg"
String.sliceToEnd("abcdefg", ~start=-2) == "fg"
String.sliceToEnd("abcdefg", ~start=7) == ""
```
*/
@send
external sliceToEnd: (string, ~start: int) => string = "slice"

/**
`split(str, delimiter)` splits the given `str` at every occurrence of
`delimiter` and returns an array of the resulting substrings.
See [`String.split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split)
on MDN.

## Examples

```rescript
String.split("2018-01-02", "-") == ["2018", "01", "02"]
String.split("a,b,,c", ",") == ["a", "b", "", "c"]
String.split("good::bad as great::awful", "::") == ["good", "bad as great", "awful"]
String.split("has-no-delimiter", ";") == ["has-no-delimiter"]
```
*/
@send
external split: (string, string) => array<string> = "split"

/**
`splitAtMost(str, delimiter, ~limit:n)` splits the given `str` at every
occurrence of `delimiter` and returns an array of the first `n` resulting
substrings. If `n` is negative or greater than the number of substrings, the
array will contain all the substrings.

## Examples

```rescript
String.splitAtMost("ant/bee/cat/dog/elk", "/", ~limit=3) = ["ant", "bee", "cat"]
String.splitAtMost("ant/bee/cat/dog/elk", "/", ~limit=0) = []
String.splitAtMost("ant/bee/cat/dog/elk", "/", ~limit=9) = ["ant", "bee", "cat", "dog", "elk"]
```
*/
@send
external splitAtMost: (string, string, ~limit: int) => array<string> = "split"

/**
`splitByRe(str, regex)` splits the given `str` at every occurrence of `regex`
and returns an array of the resulting substrings.
See [`String.split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split)
on MDN.
*/
@send
external splitByRegExp: (string, Core__RegExp.t) => array<option<string>> = "split"

/**
`splitByReAtMost(str, regex, ~limit:n)` splits the given `str` at every
occurrence of `regex` and returns an array of the first `n` resulting
substrings. If `n` is negative or greater than the number of substrings, the
array will contain all the substrings.
See [`String.split`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/split)
on MDN.
*/
@send
external splitByRegExpAtMost: (string, Core__RegExp.t, ~limit: int) => array<option<string>> =
  "split"

/**
ES2015: `startsWith(str, substr)` returns `true` if the `str` starts with
`substr`, `false` otherwise.
See [`String.startsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith)
on MDN.

## Examples

```rescript
String.startsWith("BuckleScript", "Buckle") == true
String.startsWith("BuckleScript", "") == true
String.startsWith("JavaScript", "Buckle") == false
```
*/
@send
external startsWith: (string, string) => bool = "startsWith"

/**
ES2015: `startsWithFrom(str, substr, n)` returns `true` if the `str` starts
with `substr` starting at position `n`, `false` otherwise. If `n` is negative,
the search starts at the beginning of `str`.
See [`String.startsWith`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/startsWith)
on MDN.

## Examples

```rescript
String.startsWithFrom("BuckleScript", "kle", 3) == true
String.startsWithFrom("BuckleScript", "", 3) == true
String.startsWithFrom("JavaScript", "Buckle", 2) == false
```
*/
@send
external startsWithFrom: (string, string, int) => bool = "startsWith"

/**
`substring(str, ~start:start, ~end:end)` returns characters `start` up to but 
not including end from `str`.
- If `start` is less than zero, it is treated as zero.
- If `end` is zero or negative, the empty string is returned.
- If `start` is greater than `end`, the `start` and `end` points are swapped.
See [`String.substring`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring)
on MDN.

## Examples

```rescript
String.substring("playground", ~start=3, ~end=6) == "ygr"
String.substring("playground", ~start=6, ~end=3) == "ygr"
String.substring("playground", ~start=4, ~end=12) == "ground"
```
*/
@send
external substring: (string, ~start: int, ~end: int) => string = "substring"

/**
`substringToEnd(str, ~start:start)` returns the substring of `str` from
position `start` to the end.
- If `start` is less than or equal to zero, the entire string is returned.
- If `start` is greater than or equal to the length of `str`, the empty string is returned.
See [`String.substring`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/substring)
on MDN.

## Examples

```rescript
String.substringToEnd("playground", ~start=4) == "ground"
String.substringToEnd("playground", ~start=-3) == "playground"
String.substringToEnd("playground", ~start=12) == ""
```
*/
@send
external substringToEnd: (string, ~start: int) => string = "substring"

/**
`toLowerCase(str)` converts `str` to lower case using the locale-insensitive
case mappings in the Unicode Character Database. Notice that the conversion can
give different results depending upon context, for example with the Greek
letter sigma, which has two different lower case forms; one when it is the last
character in a string and another when it is not.
See [`String.toLowerCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLowerCase)
on MDN.

## Examples

```rescript
String.toLowerCase("ABC") == "abc"
String.toLowerCase(`ΣΠ`) == `σπ`
String.toLowerCase(`ΠΣ`) == `πς`
```
*/
@send
external toLowerCase: string => string = "toLowerCase"

/**
`toLocaleLowerCase(str)` converts `str` to lower case using the current locale.
See [`String.toLocaleLowerCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLocaleLowerCase)
on MDN.
*/
@send
external toLocaleLowerCase: string => string = "toLocaleLowerCase"

/**
`toUpperCase(str)` converts `str` to upper case using the locale-insensitive
case mappings in the Unicode Character Database. Notice that the conversion can
expand the number of letters in the result; for example the German ß
capitalizes to two Ses in a row.
See [`String.toUpperCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toUpperCase)
on MDN.

## Examples

```rescript
String.toUpperCase("abc") == "ABC"
String.toUpperCase(`Straße`) == `STRASSE`
String.toUpperCase(`πς`) == `ΠΣ`
```
*/
@send
external toUpperCase: string => string = "toUpperCase"

/**
`toLocaleUpperCase(str)` converts `str` to upper case using the current locale.
See [`String.toLocaleUpperCase`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/toLocaleUpperCase)
on MDN.
*/
@send
external toLocaleUpperCase: string => string = "toLocaleUpperCase"

/**
`trim(str)` returns a string that is `str` with whitespace stripped from both
ends. Internal whitespace is not removed.
See [`String.trim`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trim)
on MDN.

## Examples

```rescript
String.trim("   abc def   ") == "abc def"
String.trim("\n\r\t abc def \n\n\t\r ") == "abc def"
```
*/
@send
external trim: string => string = "trim"

/**
`trimStart(str)` returns a string that is `str` with whitespace stripped from
the beginning of a string. Internal whitespace is not removed.
See [`String.trimStart`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimStart)
on MDN.

## Examples

```rescript
String.trimStart("   Hello world!   ") == "Hello world!   "
String.trimStart("   Hello   world!   ") == "Hello   world!   "
```
*/
@send
external trimStart: string => string = "trimStart"

/**
`trinEnd(str)` returns a string that is `str` with whitespace stripped from the
end of a string. Internal whitespace is not removed.
See [`String.trimEnd`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/trimEnd)
on MDN.

## Examples

```rescript
String.trimEnd("   Hello world!   ") == "   Hello world!"
String.trimEnd("   Hello   world!   ") == "   Hello   world!"
```
*/
@send
external trimEnd: string => string = "trimEnd"

/**
`padStart(str, n, padStr)` returns a string that has been padded with `padStr`
(multiple times, if needed) until the resulting string reaches the given `n`
length. The padding is applied from the start of the current string.
See [`String.padStart`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padStart)
on MDN.

## Examples

```rescript
String.padStart("abc", 5, " ") == "  abc"
String.padStart("abc", 6, "123465") == "123abc"
```
*/
@send
external padStart: (string, int, string) => string = "padStart"

/**
`padEnd(str, n, padStr)` returns a string that has been padded with `padStr`
(multiple times, if needed) until the resulting string reaches the given `n`
length. The padding is applied from the end of the current string.
See [`String.padEnd`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/padEnd)
on MDN.

## Examples

```rescript
String.padEnd("Hello", 10, ".") == "Hello....."
String.padEnd("abc", 1, "") == "abc"
```
*/
@send
external padEnd: (string, int, string) => string = "padEnd"
@get_index external getSymbol: (string, Core__Symbol.t) => option<'a> = ""
@get_index external getSymbolUnsafe: (string, Core__Symbol.t) => 'a = ""
@set_index external setSymbol: (string, Core__Symbol.t, 'a) => unit = ""

/**
`localeCompare(referenceStr, compareStr)` returns a float than indicatings
whether a reference string comes before or fater, or is the same as the given
string in sort order. If `referenceStr` occurs before `compareStr` positive if
the `referenceStr` occurs after `compareStr`; `0` if they are equivalent.
Do not rely on exact return values of `-1` or `1`
See [`String.localeCompare`](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/String/localeCompare)

## Examples

```rescript
String.localeCompare("a", "c") < 0. == true
String.localeCompare("a", "a") == 0.
```
*/
@send
external localeCompare: (string, string) => float = "localeCompare"
