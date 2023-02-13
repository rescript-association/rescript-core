/***
Functions for interacting with JavaScript console.
See: [`Console`](https://developer.mozilla.org/en-US/docs/Web/API/Console).
*/

/**
`log(value)` outputs a message to console.
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
Console.log2([1, 2, 3], [4])
```
*/
@val
external log2: ('a, 'b) => unit = "console.log"

/**
`log3(v1, v2, v3)`. Like `log`, but with three arguments.

## Examples

```rescript
Console.log3("Hello", "World", "ReScript")
Console.log2([1, 2, 3], [4], [5])
```
*/
@val
external log3: ('a, 'b, 'c) => unit = "console.log"
/**
`log4(v1, v2, v3, v4)`. Like `log`, but with four arguments.

## Examples

```rescript
Console.log4("Hello", "World", "ReScript", "!!!")
Console.log4([1, 2, 3], [4], [5])
```
*/
@val
external log4: ('a, 'b, 'c, 'd) => unit = "console.log"

/**
`log5(v1, v2, v3, v4, v5)`. Like `log`, but with five arguments.

## Examples

```rescript
Console.log5("Hello", "World", "from", "JS", "!!!")
Console.log5(1, 2, 3, 4, 5)
```
*/
@val
external log5: ('a, 'b, 'c, 'd, 'e) => unit = "console.log"
/**
`info(value)` outputs an informational message to console.
See [`Console.info`](https://developer.mozilla.org/en-US/docs/Web/API/console/info)
on MDN.

## Examples

```rescript
Console.info("Hello")
Console.info([1, 2, 3])
Console.info(("Hello", "ReScript"))
```
*/
@val
external info: 'a => unit = "console.info"

/**
`info2(v1, v2)`. Like `info`, but two arguments.

## Examples

```rescript
Console.info2("Failed to", "download")
Console.info2([""])
```
*/
@val
external info2: ('a, 'b) => unit = "console.info"

/**
`info3(v1, v2, v3)`. Like `info`, but three arguments.

## Examples

```rescript
Console.info3("Hello", "World", "ReScript")
Console.info3([1, 2, 3], [4], [5])
```
*/
@val
external info3: ('a, 'b, 'c) => unit = "console.info"

/**
`info4(v1, v2, v3, v4)`. Like `info`, but with four arguments.

## Examples

```rescript
Console.info4("Hello", "World", "ReScript", "!!!")
Console.info4([1, 2, 3], [4], [5])
```
*/
@val
external info4: ('a, 'b, 'c, 'd) => unit = "console.info"

/**
`info5(v1, v2, v3, v4, v5)`. Like `info`, but with five arguments.

## Examples

```rescript
Console.info5("Hello", "World", "from", "JS", "!!!")
Console.info5(1, 2, 3, 4, 5)
```
*/
@val
external info5: ('a, 'b, 'c, 'd, 'e) => unit = "console.info"

/**
`warn(value)` outputs a warning message to console.
See [`Console.warn`](https://developer.mozilla.org/en-US/docs/Web/API/console/warn)
on MDN.

## Examples

```rescript
Console.warn("Hello")
Console.warn([1, 2, 3])
Console.warn(("Hello", "ReScript"))
```
*/
@val
external warn: 'a => unit = "console.warn"

/**
`warn2(v1, v2)`. Like `warn`, but two arguments.

## Examples

```rescript
Console.warn2("Hello", "World")
Console.warn2([1, 2, 3], [4])
```
*/
@val
external warn2: ('a, 'b) => unit = "console.warn"

/**
`warn3(v1, v2, v3)`. Like `warn`, but three arguments.

## Examples

```rescript
Console.warn3("Hello", "World", "ReScript")
Console.warn3([1, 2, 3], [4], [5])
```
*/
@val
external warn3: ('a, 'b, 'c) => unit = "console.warn"

/**
`warn4(v1, v2, v3, v4)`. Like `warn`, but with four arguments.

## Examples

```rescript
Console.warn4("Hello", "World", "ReScript", "!!!")
Console.warn4([1, 2, 3], [4], [5])
```
*/
@val
external warn4: ('a, 'b, 'c, 'd) => unit = "console.warn"

/**
`warn5(v1, v2, v3, v4, v5)`. Like `warn`, but with five arguments.

## Examples

```rescript
Console.warn5("Hello", "World", "from", "JS", "!!!")
Console.warn5(1, 2, 3, 4, 5)
```
*/
@val
external warn5: ('a, 'b, 'c, 'd, 'e) => unit = "console.warn"

/**
`error(value)` outputs an error message to console.
See [`Console.error`](https://developer.mozilla.org/en-US/docs/Web/API/console/error)
on MDN.

## Examples

```rescript
Console.error("Hello")
Console.error([1, 2, 3])
Console.error(("Hello", "ReScript"))
```
*/
@val
external error: 'a => unit = "console.error"

/**
`error(v1, v2)`. Like `error`, but two arguments.

## Examples

```rescript
Console.error("Hello", "World")
Console.error([1, 2, 3], [4])
```
*/
@val
external error2: ('a, 'b) => unit = "console.error"

/**
`error3(v1, v2, v3)`. Like `error`, but three arguments.

## Examples

```rescript
Console.error3("Hello", "World", "ReScript")
Console.error3([1, 2, 3], [4], [5])
```
*/
@val
external error3: ('a, 'b, 'c) => unit = "console.error"

/**
`error4(v1, v2, v3, v4)`. Like `error`, but with four arguments.

## Examples

```rescript
Console.error("Hello", "World", "ReScript", "!!!")
Console.error([1, 2, 3], [4], [5])
```
*/
@val
external error4: ('a, 'b, 'c, 'd) => unit = "console.error"

/**
`error5(v1, v2, v3, v4, v5)`. Like `error`, but with five arguments.

## Examples

```rescript
Console.error5("Hello", "World", "from", "JS", "!!!")
Console.error5(1, 2, 3, 4, 5)
```
*/
@val
external error5: ('a, 'b, 'c, 'd, 'e) => unit = "console.error"

/**
`trace()` outputs a stack trace to console.
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
`time(label)` starts a timer you can use to track how long an operation takes.
You give each timer a unique name `label`, and may have up to 10,000 timers
running on a given page. Call `Console.timeEnd` with the same `label` to browser
output time, in milliseconds.
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
`timeEnd(label)` stops a timer that was previously started by calling
`Console.time(label)`. See [`Console.timeEnd`](https://developer.mozilla.org/en-US/docs/Web/API/console/timeEnd)
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
