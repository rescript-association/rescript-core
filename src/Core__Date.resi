/***
  Functions for interacting with JavaScript Dates.
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

@send external valueOf: t => time = "valueOf"
@new external make: unit => t = "Date"
@new external fromString: string => t = "Date"
@new external fromTime: time => t = "Date"
@new external makeWithYM: (~year: int, ~month: int) => t = "Date"
@new external makeWithYMD: (~year: int, ~month: int, ~date: int) => t = "Date"
@new external makeWithYMDH: (~year: int, ~month: int, ~date: int, ~hours: int) => t = "Date"
@new
external makeWithYMDHM: (~year: int, ~month: int, ~date: int, ~hours: int, ~minutes: int) => t =
  "Date"
@new
external makeWithYMDHMS: (
  ~year: int,
  ~month: int,
  ~date: int,
  ~hours: int,
  ~minutes: int,
  ~seconds: int,
) => t = "Date"
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
  @val external makeWithYM: (~year: int, ~month: int) => time = "Date.UTC"
  @val external makeWithYMD: (~year: int, ~month: int, ~date: int) => time = "Date.UTC"
  @val
  external makeWithYMDH: (~year: int, ~month: int, ~date: int, ~hours: int) => time = "Date.UTC"
  @val
  external makeWithYMDHM: (
    ~year: int,
    ~month: int,
    ~date: int,
    ~hours: int,
    ~minutes: int,
  ) => time = "Date.UTC"
  @val
  external makeWithYMDHMS: (
    ~year: int,
    ~month: int,
    ~date: int,
    ~hours: int,
    ~minutes: int,
    ~seconds: int,
  ) => time = "Date.UTC"
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
@val external now: unit => time = "Date.now"
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
  Date.make()->Date.toLocaleDateStringWithLocaleAndOptions("de", { hour: #"2-digit", minute: #"2-digit" })->Console.log
  Date.make()->Date.toLocaleDateStringWithLocaleAndOptions("de", { year: #numeric })->Console.log
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
  Date.make()->Date.toLocaleStringWithLocaleAndOptions("en", { era: #long, year: #numeric, month: #"2-digit", day: #"2-digit", hour: #numeric, timeZoneName: #short })->Console.log
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
  Date.make()->Date.toLocaleTimeStringWithLocaleAndOptions("de", { hour: #"2-digit", minute: #"2-digit" })->Console.log
  ```
*/
@send
external toLocaleTimeStringWithLocaleAndOptions: (t, string, localeOptions) => string =
  "toLocaleTimeString"

@send external toISOString: t => string = "toISOString"
@send external toUTCString: t => string = "toUTCString"
@return(nullable) @send external toJSON: t => option<string> = "toJSON"
