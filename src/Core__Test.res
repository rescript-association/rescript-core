/**
`last(array)` returns the last element of `array`.

Returns `None` if the array is empty.

## Examples
```rescript
let array = ["Hello", "Hi", "Good bye"]

array->Array.last == Some("Good bye") // true
[]->Array.last == None // true
```
*/
@send external at: (array<'a>, int) => option<'a> = "at"
