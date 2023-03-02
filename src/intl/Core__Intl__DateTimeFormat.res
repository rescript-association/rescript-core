type t

type dateStyle = [#full | #long | #medium | #short]
type timeStyle = [#full | #long | #medium | #short]
type dayPeriod = [#narrow | #short | #long]
type weekday = [#narrow | #short | #long]
type era = [#narrow | #short | #long]
type year = [#numeric | #"2-digit"]
type month = [#numeric | #"2-digit" | #narrow | #short | #long]
type day = [#numeric | #"2-digit"]
type hour = [#numeric | #"2-digit"]
type minute = [#numeric | #"2-digit"]
type second = [#numeric | #"2-digit"]
// Firefox also supports IANA time zone names here
type timeZoneName = [
  | #short
  | #long
]
// TODO unsupported in node?
// | #shortOffset
// | #shortGeneric
// | #longOffset
// | #longGeneric

type hourCycle = [#h11 | #h12 | #h23 | #h24]
type formatMatcher = [#basic | @as("best fit") #bestFit]
type fractionalSecondDigits = [#0 | #1 | #2 | #3]

type options = {
  dateStyle?: dateStyle, // can be used with timeStyle, but not other options
  timeStyle?: timeStyle, // can be used with dateStyle, but not other options
  calendar?: Core__Intl__Common.calendar,
  dayPeriod?: dayPeriod, // only has an effect if a 12-hour clock is used
  numberingSystem?: Core__Intl__Common.numberingSystem,
  localeMatcher?: Core__Intl__Common.localeMatcher,
  timeZone?: string,
  hour12?: bool,
  hourCycle?: hourCycle,
  formatMatcher?: formatMatcher,
  // date-time components
  weekday?: weekday,
  era?: era,
  year?: year,
  month?: month,
  day?: day,
  hour?: hour,
  minute?: minute,
  second?: second,
  fractionalSecondDigits?: fractionalSecondDigits,
  timeZoneName?: timeZoneName,
}

type resolvedOptions = {
  dateStyle?: dateStyle,
  timeStyle?: timeStyle,
  weekday?: weekday,
  era?: era,
  year?: year,
  month?: month,
  day?: day,
  hour?: hour,
  minute?: minute,
  second?: second,
  fractionalSecondDigits?: fractionalSecondDigits,
  timeZoneName?: timeZoneName,
  calendar: Core__Intl__Common.calendar,
  hour12: bool,
  hourCycle: hourCycle,
  locale: string,
  numberingSystem: Core__Intl__Common.numberingSystem,
  timeZone: string,
}

type supportedLocalesOptions = {localeMatcher: Core__Intl__Common.localeMatcher}

type dateTimeComponent = [
  | #day
  | #dayPeriod
  | #era
  | #fractionalSecond
  | #hour
  | #literal
  | #minute
  | #month
  | #relatedYear
  | #second
  | #timeZone
  | #weekday
  | #year
  | #yearName
]

type dateTimePart = {
  \"type": dateTimeComponent,
  value: string,
}

type dateTimeRangeSource = [#startRange | #shared | #endRange]
type dateTimeRangePart = {
  \"type": dateTimeComponent,
  value: string,
  source: dateTimeRangeSource,
}

@new external make: unit => t = "Intl.DateTimeFormat"
@new external makeWithLocale: string => t = "Intl.DateTimeFormat"
@new external makeWithLocales: array<string> => t = "Intl.DateTimeFormat"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.DateTimeFormat"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.DateTimeFormat"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.DateTimeFormat"

@val external supportedLocalesOf: array<string> => t = "Intl.DateTimeFormat.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, supportedLocalesOptions) => t =
  "Intl.DateTimeFormat.supportedLocalesOf"

@send external resolvedOptions: t => resolvedOptions = "resolvedOptions"

@send external format: (t, Core__Date.t) => string = "format"
@send
external formatToParts: (t, Core__Date.t) => array<{"type": string, "value": string}> =
  "formatToParts"

@send
external formatRange: (t, ~startDate: Core__Date.t, ~endDate: Core__Date.t) => string =
  "formatRange"

@send
external formatRangeToParts: (
  t,
  ~startDate: Core__Date.t,
  ~endDate: Core__Date.t,
) => array<{
  "type": string,
  "value": string,
  "source": string,
}> = "formatRangeToParts"
