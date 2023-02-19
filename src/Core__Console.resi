/***
Functions for interacting with JavaScript console.
See: [`Console`](https://developer.mozilla.org/en-US/docs/Web/API/Console).
*/

/**
`log(value)` print a message to console.
See [`Console.log`](https://developer.mozilla.org/en-US/docs/Web/API/console/log)
on MDN.

## Examples

```rescript
Console.log("Hello")
let obj = {"name": "ReScript", "version": 10}
Console.log(obj)
```
*/
@val
external log: 'a => unit = "console.log"

/**
`log2(v1, v2)`. Like `log`, but with two arguments.

## Examples

```rescript
Console.log2("Hello", "World")
Console.log2([1, 2, 3], '4')
```
*/
@val
external log2: ('a, 'b) => unit = "console.log"

/**
`log3(v1, v2, v3)`. Like `log`, but with three arguments.

## Examples

```rescript
Console.log3("Hello", "World", "ReScript")
Console.log2("One", 2, #3)
```
*/
@val
external log3: ('a, 'b, 'c) => unit = "console.log"
/**
`log4(v1, v2, v3, v4)`. Like `log`, but with four arguments.

## Examples

```rescript
Console.log4("Hello", "World", "ReScript", "!!!")
Console.log4([1, 2], (3, 4), [#5, #6], #"polyvar")
```
*/
@val
external log4: ('a, 'b, 'c, 'd) => unit = "console.log"

/**
`log5(v1, v2, v3, v4, v5)`. Like `log`, but with five arguments.

## Examples

```rescript
Console.log5("Hello", "World", "JS", '!', '!')
Console.log5([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```
*/
@val
external log5: ('a, 'b, 'c, 'd, 'e) => unit = "console.log"

/**
`log6(v1, v2, v3, v4, v5, v6)`. Like `log`, but with six arguments.

## Examples

```rescript
Console.log6("Hello", "World", "JS", '!', '!', '?')
Console.log6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```
*/
@val
external log6: ('a, 'b, 'c, 'd, 'e, 'f) => unit = "console.log"

/**
`info(value)` print an informational message to console.
See [`Console.info`](https://developer.mozilla.org/en-US/docs/Web/API/console/info)
on MDN.

## Examples

```rescript
Console.info("Information")
Console.info(("Hello", "JS"))
```
*/
@val
external info: 'a => unit = "console.info"

/**
`info2(v1, v2)`. Like `info`, but with two arguments.

## Examples

```rescript
Console.info2("Info", "failed to download")
Console.info2(#info, {"name": "ReScript"})
```
*/
@val
external info2: ('a, 'b) => unit = "console.info"

/**
`info3(v1, v2, v3)`. Like `info`, but with three arguments.

## Examples

```rescript
Console.info3("Hello", "World", "ReScript")
Console.info3([1, 2, 3], #4, #5)
```
*/
@val
external info3: ('a, 'b, 'c) => unit = "console.info"

/**
`info4(v1, v2, v3, v4)`. Like `info`, but with four arguments.

## Examples

```rescript
Console.info4("Hello", "World", "ReScript", '!')
Console.info4([1, 2, 3], #4, #5, #lastinfo)
```
*/
@val
external info4: ('a, 'b, 'c, 'd) => unit = "console.info"

/**
`info5(v1, v2, v3, v4, v5)`. Like `info`, but with five arguments.

## Examples

```rescript
Console.info5("Hello", "World", "from", "JS", "!!!")
Console.info5([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```
*/
@val
external info5: ('a, 'b, 'c, 'd, 'e) => unit = "console.info"

/**
`info6(v1, v2, v3, v4, v5, v6)`. Like `info`, but with six arguments.

## Examples

```rescript
Console.info6("Hello", "World", "from", "JS", "!!!", '!')
Console.info6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```
*/
@val
external info6: ('a, 'b, 'c, 'd, 'e, 'f) => unit = "console.info"

/**
`warn(value)` print a warning message to console.
See [`Console.warn`](https://developer.mozilla.org/en-US/docs/Web/API/console/warn)
on MDN.

## Examples

```rescript
Console.warn("Warning")
Console.warn(("Warning", "invalid number"))
```
*/
@val
external warn: 'a => unit = "console.warn"

/**
`warn2(v1, v2)`. Like `warn`, but two arguments.

## Examples

```rescript
Console.warn2("Hello", "World")
Console.warn2([1, 2, 3], 4)
```
*/
@val
external warn2: ('a, 'b) => unit = "console.warn"

/**
`warn3(v1, v2, v3)`. Like `warn`, but three arguments.

## Examples

```rescript
Console.warn3("Hello", "World", "ReScript")
Console.warn3([1, 2, 3], #4, #5)
```
*/
@val
external warn3: ('a, 'b, 'c) => unit = "console.warn"

/**
`warn4(v1, v2, v3, v4)`. Like `warn`, but with four arguments.

## Examples

```rescript
Console.warn4("Hello", "World", "ReScript", "!!!")
Console.warn4(#first, #second, #third, ("fourth"))
```
*/
@val
external warn4: ('a, 'b, 'c, 'd) => unit = "console.warn"

/**
`warn5(v1, v2, v3, v4, v5)`. Like `warn`, but with five arguments.

## Examples

```rescript
Console.warn5("Hello", "World", "from", "JS", "!!!")
Console.warn5([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"})
```
*/
@val
external warn5: ('a, 'b, 'c, 'd, 'e) => unit = "console.warn"

/**
`warn6(v1, v2, v3, v4, v5, v6)`. Like `warn`, but with six arguments.

## Examples

```rescript
Console.warn6("Hello", "World", "from", "JS", "!!!", '!')
Console.warn6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```
*/
@val
external warn6: ('a, 'b, 'c, 'd, 'e, 'f) => unit = "console.warn"

/**
`error(value)` prints an error message to console.
See [`Console.error`](https://developer.mozilla.org/en-US/docs/Web/API/console/error)
on MDN.

## Examples

```rescript
Console.error("error message")
Console.error(("error", "invalid value"))
```
*/
@val
external error: 'a => unit = "console.error"

/**
`error(v1, v2)`. Like `error`, but two arguments.

## Examples

```rescript
Console.error2("Error", "here")
Console.error2(("log", "error"), "message")
```
*/
@val
external error2: ('a, 'b) => unit = "console.error"

/**
`error3(v1, v2, v3)`. Like `error`, but three arguments.

## Examples

```rescript
Console.error3("Hello", "World", "!!!")
Console.error3(#first, #second, #third)
```
*/
@val
external error3: ('a, 'b, 'c) => unit = "console.error"

/**
`error4(v1, v2, v3, v4)`. Like `error`, but with four arguments.

## Examples

```rescript
Console.error4("Hello", "World", "ReScript", '!')
Console.error4(#first, #second, #third, ("fourth"))
```
*/
@val
external error4: ('a, 'b, 'c, 'd) => unit = "console.error"

/**
`error5(v1, v2, v3, v4, v5)`. Like `error`, but with five arguments.

## Examples

```rescript
Console.error5('e', 'r, 'r', 'o', 'r')
Console.error5(1, #second, #third, ("fourth"), 'c')
```
*/
@val
external error5: ('a, 'b, 'c, 'd, 'e) => unit = "console.error"

/**
`error6(v1, v2, v3, v4, v5, v6)`. Like `error`, but with six arguments.

## Examples

```rescript
Console.error6("Hello", "World", "from", "JS", "!!!", '!')
Console.error6([1, 2], (3, 4), [#5, #6], #"polyvar", {"name": "ReScript"}, 42)
```
*/
@val
external error6: ('a, 'b, 'c, 'd, 'e, 'f) => unit = "console.error"

/**
`trace()` print a stack trace to console.
See [`Console.trace`](https://developer.mozilla.org/en-US/docs/Web/API/console/trace)
on MDN.

## Examples

```rescript
let main = () => {
  Console.trace()
}
main()
// In the console, the following trace will be displayed:
// main
// <anonymous>
```
*/
@val
external trace: unit => unit = "console.trace"

/**
`time(label)` creates a timer to measure how long an operation takes. `label`
must be a unique name. Call `Console.timeEnd` with the same `label` to print
output time. 
See [`Console.time`](https://developer.mozilla.org/en-US/docs/Web/API/console/time)
on MDN.

## Examples

```rescript
Console.time("for_time")
for x in 3 downto 1 {
  Console.log(x)
}
Console.timeEnd("for_time")
```
*/
@val
external time: string => unit = "console.time"

/**
`timeEnd(label)` stops a timer created by `time`.
See [`Console.timeEnd`](https://developer.mozilla.org/en-US/docs/Web/API/console/timeEnd)
on MDN.

## Examples

```rescript
Console.time("for_time")
for x in 3 downto 1 {
  Console.log(x)
}
Console.timeEnd("for_time")
```
*/
@val
external timeEnd: string => unit = "console.timeEnd"
