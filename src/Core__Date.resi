/***
  Functions for interacting with JavaScript Dates.
*/

/** 
A type representing a JavaScript date
*/
type t = Js.Date.t

type time = float

/**
A type representing date time format options.

Note: There are some properties missing:
- fractionalSecondDigits
- dayPeriod
- calendar
- numberingSystem
- localeMatcher
- timeZone
- hour12
- hourCycle
- formatMatcher

See full spec at https://tc39.es/ecma402/#datetimeformat-objects
*/
type localeOptions = {
  dateStyle?: [#full | #long | #medium | #short],
  timeStyle?: [#full | #long | #medium | #short],
  weekday?: [#long | #narrow | #short],
  era?: [#long | #narrow | #short],
  year?: [#"2-digit" | #numeric],
  month?: [#"2-digit" | #long | #narrow | #numeric | #short],
  day?: [#"2-digit" | #numeric],
  hour?: [#"2-digit" | #numeric],
  minute?: [#"2-digit" | #numeric],
  second?: [#"2-digit" | #numeric],
  timeZoneName?: [#long | #short],
}

/** 
`valueOf(date)`

Returns the time in milliseconds between 1 January 1970 UTC and the given date.
Invalid dates will return NaN.
Dates before 1 January 1970 will return negative numbers.

The function will return the same result as Date.getTime

## Examples
```rescript
Date.fromString("2023-02-20")->Date.valueOf
// 1676851200000
```
*/
@send external valueOf: t => time = "valueOf"

/** 
`make()`

Creates a date object with the current date time as value.

## Examples
```rescript
Date.make()
```
*/
@new external make: unit => t = "Date"

/** 
`fromString(dateTimeString)` 

Creates a date object from given date time string.
The string has to be in the ISO 8601 format YYYY-MM-DDTHH:mm:ss.sssZ (https://tc39.es/ecma262/#sec-date-time-string-format).
Invalid date time strings will create invalid dates.

## Examples
```rescript
Date.fromString("2023")
// 2023-01-01T00:00:00.000Z

Date.fromString("2023-02-20")
// 2023-02-20T00:00:00.000Z

Date.fromString("2023-02-20T16:40:00.00Z")
// 2023-02-20T16:40:00.000Z
```
*/
@new external fromString: string => t = "Date"

/** 
`fromTime(deltaMilliseconds)` 

Creates a date object from the given time in milliseconds since / until 1 January 1970 UTC.

## Examples
```rescript
Date.fromTime(0.0)
// 1970-01-01T00:00:00.000Z

Date.fromTime(-86_400_000.0)
// 1969-12-31T00:00:00.000Z

Date.fromTime(86_400_000.0)
// 1970-01-02T00:00:00.000Z
```
*/
@new external fromTime: time => t = "Date"

/** 
Creates a date object with the given year and month.
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).

## Examples
```rescript
Date.makeWithYM(~year=2023, ~month=0)
// 2023-01-01T00:00:00.000Z

Date.makeWithYM(~year=2023, ~month=11)
// 2023-12-01T00:00:00.000Z

Date.makeWithYM(~year=2023, ~month=12)
// 2024-01-01T00:00:00.000Z

Date.makeWithYM(~year=2023, ~month=-1)
// 2022-12-01T00:00:00.000Z
```
*/
@new external makeWithYM: (~year: int, ~month: int) => t = "Date"

/** 
Creates a date object with the given year, month and date (day of month).
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
*/
@new external makeWithYMD: (~year: int, ~month: int, ~date: int) => t = "Date"

/** 
Creates a date object with the given year, month, date (day of month) and hours.
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
*/
@new external makeWithYMDH: (~year: int, ~month: int, ~date: int, ~hours: int) => t = "Date"

/** 
Creates a date object with the given year, month, date (day of month), hours and minutes.
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
*/
@new
external makeWithYMDHM: (~year: int, ~month: int, ~date: int, ~hours: int, ~minutes: int) => t =
  "Date"

/** 
Creates a date object with the given year, month, date (day of month), hours, minutes and seconds.
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
*/
@new
external makeWithYMDHMS: (
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
) => t = "Date"

/** 
Creates a date object with the given year, month, date (day of month), hours, minutes, seconds and milliseconds.
Be aware of using a value for year < 100, because it behaves inconsistent (see https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Global_Objects/Date#interpretation_of_two-digit_years).
Months are 0-indexed (0 = January, 11 = December).
*/
@new
external makeWithYMDHMSM: (
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
  ~milliseconds: int,
) => t = "Date"
module UTC: {
  /** 
  Same as Date.makeWithYM, but returns the time since 1 January 1970 in milliseconds.
  */
  @val external makeWithYM: (~year: int, ~month: int) => time = "Date.UTC"

  /** 
  Same as Date.makeWithYMD, but returns the time since 1 January 1970 in milliseconds.
  */
  @val external makeWithYMD: (~year: int, ~month: int, ~date: int) => time = "Date.UTC"

  /** 
  Same as Date.makeWithYMDH, but returns the time since 1 January 1970 in milliseconds.
  */
  @val
  external makeWithYMDH: (~year: int, ~month: int, ~date: int, ~hours: int) => time = "Date.UTC"

  /** 
  Same as Date.makeWithYMDHM, but returns the time since 1 January 1970 in milliseconds.
  */
  @val
  external makeWithYMDHM: (
    ~year: int,
    ~month: int,
    ~date: int,
    ~hours: int,
    ~minutes: int,
  ) => time = "Date.UTC"

  /** 
  Same as Date.makeWithYMDHMS, but returns the time since 1 January 1970 in milliseconds.
  */
  @val
  external makeWithYMDHMS: (
    ~year: int,
    ~month: int,
    ~date: int,
    ~hours: int,
    ~minutes: int,
    ~seconds: int,
  ) => time = "Date.UTC"

  /** 
  Same as Date.makeWithYMDHMSM, but returns the time since 1 January 1970 in milliseconds.
  */
  @val
  external makeWithYMDHMSM: (
    ~year: int,
    ~month: int,
    ~date: int,
    ~hours: int,
    ~minutes: int,
    ~seconds: int,
    ~milliseconds: int,
  ) => time = "Date.UTC"
}

/**
Returns the time in milliseconds between 1 January 1970 UTC and the current date time.
*/
@val external now: unit => time = "Date.now"

/** 
`getTime(date)`

Returns the time in milliseconds between 1 January 1970 UTC and the given date.
Invalid dates will return NaN.
Dates before 1 January 1970 will return negative numbers.

The function will return the same result as Date.valueOf

## Examples
```rescript
Date.fromString("2023-02-20")->Date.getTime
// 1676851200000
```
*/
@send external getTime: t => time = "getTime"
@send external getTimezoneOffset: t => int = "getTimezoneOffset"
@send external getFullYear: t => int = "getFullYear"
@send external getMonth: t => int = "getMonth"
@send external getDate: t => int = "getDate"
@send external getHours: t => int = "getHours"
@send external getMinutes: t => int = "getMinutes"
@send external getSeconds: t => int = "getSeconds"
@send external getMilliseconds: t => int = "getMilliseconds"
@send external getDay: t => int = "getDay"
@send external setFullYear: (t, int) => unit = "setFullYear"
@send external setFullYearM: (t, ~year: int, ~month: int) => unit = "setFullYear"
@send external setFullYearMD: (t, ~year: int, ~month: int, ~date: int) => unit = "setFullYear"
@send external setMonth: (t, int) => unit = "setMonth"
@send external setDate: (t, int) => unit = "setDate"
@send external setHours: (t, int) => unit = "setHours"
@send external setHoursM: (t, ~hours: int, ~minutes: int) => unit = "setHours"
@send external setHoursMS: (t, ~hours: int, ~minutes: int, ~seconds: int) => unit = "setHours"
@send
external setHoursMSMs: (t, ~hours: int, ~minutes: int, ~seconds: int, ~milliseconds: int) => unit =
  "setHours"
@send external setMinutes: (t, int) => unit = "setMinutes"
@send external setMinutesS: (t, ~minutes: int, ~seconds: int) => unit = "setMinutes"
@send
external setMinutesSMs: (t, ~minutes: int, ~seconds: int, ~milliseconds: int) => unit = "setMinutes"
@send external setSeconds: (t, int) => unit = "setSeconds"
@send external setSecondsMs: (t, ~seconds: int, ~milliseconds: int) => unit = "setSeconds"
@send external setMilliseconds: (t, int) => unit = "setMilliseconds"
@send external setDay: (t, int) => unit = "setDay"
@send external getUTCFullYear: t => int = "getUTCFullYear"
@send external getUTCMonth: t => int = "getUTCMonth"
@send external getUTCDate: t => int = "getUTCDate"
@send external getUTCHours: t => int = "getUTCHours"
@send external getUTCMinutes: t => int = "getUTCMinutes"
@send external getUTCSeconds: t => int = "getUTCSeconds"
@send external getUTCMilliseconds: t => int = "getUTCMilliseconds"
@send external getUTCDay: t => int = "getUTCDay"
@send external setUTCFullYear: (t, int) => unit = "setUTCFullYear"
@send external setUTCFullYearM: (t, ~year: int, ~month: int) => unit = "setUTCFullYear"
@send
external setUTCFullYearMD: (t, ~year: int, ~month: int, ~date: int) => unit = "setUTCFullYear"
@send external setUTCMonth: (t, int) => unit = "setUTCMonth"
@send external setUTCDate: (t, int) => unit = "setUTCDate"
@send external setUTCHours: (t, int) => unit = "setUTCHours"
@send external setUTCHoursM: (t, ~hours: int, ~minutes: int) => unit = "setUTCHours"
@send
external setUTCHoursMS: (t, ~hours: int, ~minutes: int, ~seconds: int) => unit = "setUTCHours"
@send
external setUTCHoursMSMs: (
  t,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
  ~milliseconds: int,
) => unit = "setUTCHours"
@send external setUTCMinutes: (t, int) => unit = "setUTCMinutes"
@send external setUTCMinutesS: (t, ~minutes: int, ~seconds: int) => unit = "setUTCMinutes"
@send
external setUTCMinutesSMs: (t, ~minutes: int, ~seconds: int, ~milliseconds: int) => unit =
  "setUTCMinutes"
@send external setUTCSeconds: (t, int) => unit = "setUTCSeconds"
@send external setUTCSecondsMs: (t, ~seconds: int, ~milliseconds: int) => unit = "setUTCSeconds"
@send external setUTCMilliseconds: (t, int) => unit = "setUTCMilliseconds"
@send external setUTCDay: (t, int) => unit = "setUTCDay"
@send external toDateString: t => string = "toDateString"
@send external toString: t => string = "toString"
@send external toTimeString: t => string = "toTimeString"

/** 
`toLocaleDateString(date)`

Converts a JavaScript date to a localized date string. It will use the current locale.

## Examples
```rescript
Date.make()->Date.toLocaleDateString->Console.log
// 2/19/2023
```
*/
@send
external toLocaleDateString: t => string = "toLocaleDateString"

/** 
`toLocaleDateStringWithLocale(date, locale)`

Converts a JavaScript date to a localized date string. It will use the specified locale.

## Examples
```rescript
Date.make()->Date.toLocaleDateStringWithLocale("en-US")->Console.log
// 2/19/2023
```
*/
@send
external toLocaleDateStringWithLocale: (t, string) => string = "toLocaleDateString"

/** 
`toLocaleDateStringWithLocaleAndOptions(date, locale, options)`

Converts a JavaScript date to a localized date string. It will use the specified locale and formatting options.

## Examples
```rescript
Date.make()->Date.toLocaleDateStringWithLocaleAndOptions("en-US", { dateStyle: #long })->Console.log
// February 19, 2023

Date.make()->Date.toLocaleDateStringWithLocaleAndOptions("de", { hour: #"2-digit", minute: #"2-digit" })->Console.log
// 19.2.2023, 15:40

Date.make()->Date.toLocaleDateStringWithLocaleAndOptions("de", { year: #numeric })->Console.log
// 2023
```
*/
@send
external toLocaleDateStringWithLocaleAndOptions: (t, string, localeOptions) => string =
  "toLocaleDateString"

/** 
`toLocaleString(date)`

Converts a JavaScript date to a localized date-time string. It will use the current locale.

## Examples
```rescript
Date.make()->Date.toLocaleString->Console.log
// 2/19/2023, 3:40:00 PM
```
*/
@send
external toLocaleString: t => string = "toLocaleString"

/** 
`toLocaleStringWithLocale(date, locale)`

Converts a JavaScript date to a localized date-time string. It will use the specified locale.

## Examples
```rescript
Date.make()->Date.toLocaleStringWithLocale("en-US")->Console.log
// 2/19/2023, 3:40:00 PM
```
*/
@send
external toLocaleStringWithLocale: (t, string) => string = "toLocaleString"

/** 
`toLocaleStringWithLocaleAndOptions(date, locale, options)`

Converts a JavaScript date to a localized date-time string. It will use the specified locale and formatting options.

## Examples
```rescript
Date.make()->Date.toLocaleStringWithLocaleAndOptions("en", { dateStyle: #short, timeStyle: #short })->Console.log
// 2/19/23, 3:40 PM

Date.make()->Date.toLocaleStringWithLocaleAndOptions("en", { era: #long, year: #numeric, month: #"2-digit", day: #"2-digit", hour: #numeric, timeZoneName: #short })->Console.log
// 02/19/2023 Anno Domini, 3 PM GMT+1
```
*/
@send
external toLocaleStringWithLocaleAndOptions: (t, string, localeOptions) => string = "toLocaleString"

/** 
`toLocaleTimeString(date)`

Converts a JavaScript date to a localized time string. It will use the current locale.

## Examples
```rescript
Date.make()->Date.toLocaleTimeString->Console.log
// 3:40:00 PM
```
*/
@send
external toLocaleTimeString: t => string = "toLocaleTimeString"

/** 
`toLocaleTimeStringWithLocale(date, locale)`

Converts a JavaScript date to a localized time string. It will use the specified locale.

## Examples
```rescript
Date.make()->Date.toLocaleTimeStringWithLocale("en-US")->Console.log
// 3:40:00 PM
```
*/
@send
external toLocaleTimeStringWithLocale: (t, string) => string = "toLocaleTimeString"

/** 
`toLocaleTimeStringWithLocaleAndOptions(date, locale, options)`

Converts a JavaScript date to a localized time string. It will use the specified locale and formatting options.

## Examples
```rescript
Date.make()->Date.toLocaleTimeStringWithLocaleAndOptions("en-US", { timeStyle: #long })->Console.log
// 3:40:00 PM GMT+1

Date.make()->Date.toLocaleTimeStringWithLocaleAndOptions("de", { hour: #"2-digit", minute: #"2-digit" })->Console.log
// 15:40
```
*/
@send
external toLocaleTimeStringWithLocaleAndOptions: (t, string, localeOptions) => string =
  "toLocaleTimeString"

@send external toISOString: t => string = "toISOString"
@send external toUTCString: t => string = "toUTCString"
@return(nullable) @send external toJSON: t => option<string> = "toJSON"
