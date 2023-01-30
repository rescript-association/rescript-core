type t = Js.Date.t

module Time = {
  type t = float
}

@send external valueOf: t => Time.t = "valueOf"

@new external make: unit => t = "Date"
@new external fromString: string => t = "Date"
@new external fromTime: Time.t => t = "Date"

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

module UTC = {
  @val external makeWithYM: (~year: int, ~month: int) => Time.t = "Date.UTC"
  @val external makeWithYMD: (~year: int, ~month: int, ~date: int) => Time.t = "Date.UTC"
  @val
  external makeWithYMDH: (~year: int, ~month: int, ~date: int, ~hours: int) => Time.t = "Date.UTC"
  @val
  external makeWithYMDHM: (
    ~year: int,
    ~month: int,
    ~date: int,
    ~hours: int,
    ~minutes: int,
  ) => Time.t = "Date.UTC"
  @val
  external makeWithYMDHMS: (
    ~year: int,
    ~month: int,
    ~date: int,
    ~hours: int,
    ~minutes: int,
    ~seconds: int,
  ) => Time.t = "Date.UTC"
  @val
  external makeWithYMDHMSM: (
    ~year: int,
    ~month: int,
    ~date: int,
    ~hours: int,
    ~minutes: int,
    ~seconds: int,
    ~milliseconds: int,
  ) => Time.t = "Date.UTC"
}

@val external now: unit => Time.t = "Date.now"

@send external getTime: t => Time.t = "getTime"
@send external getTimezoneOffset: t => int = "getTimezoneOffset"

// Locale
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

// UTC
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

@send external toLocaleDateString: t => string = "toLocaleDateString"
@send external toLocaleString: t => string = "toLocaleString"
@send external toLocaleTimeString: t => string = "toLocaleTimeString"

@send external toISOString: t => string = "toISOString"
@send external toUTCString: t => string = "toUTCString"
@return(nullable) @send external toJSON: t => option<string> = "toJSON"
