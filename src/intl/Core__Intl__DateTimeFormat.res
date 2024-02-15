type t

type options = {
  localeMathcer?: [#lookup | #"best fit"],
  calendar?: string,
  numberingSystem?: string,
  hour12?: bool,
  hourCycle?: [#h11 | #h12 | #h23 | #h24],
  timeZone?: string,
  weekday?: [#long | #short | #narrow],
  era?: [#long | #short | #narrow],
  year?: [#numeric | #"2-digit"],
  month?: [#numeric | #"2-digit" | #long | #short | #narrow],
  day?: [#numeric | #"2-digit"],
  dayPeriod?: [#long | #short | #narrow],
  hour?: [#numeric | #"2-digit"],
  minute?: [#numeric | #"2-digit"],
  second?: [#numeric | #"2-digit"],
  fractionalSecondDigits?: int,
  timeZoneName?: [#long | #short | #shortOffset | #longOffset | #shortGeneric | #longGeneric],
  formatMatcher?: [#basic | #"best fit"],
  dateStyle?: [#full | #long | #medium | #short],
  timeStyle?: [#full | #long | #medium | #short],
}

@new external make: unit => t = "Intl.DateTimeFormat"
@new external makeWithLocale: string => t = "Intl.DateTimeFormat"
@new external makeWithLocales: array<string> => t = "Intl.DateTimeFormat"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.DateTimeFormat"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.DateTimeFormat"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.DateTimeFormat"

@val external supportedLocalesOf: array<string> => t = "Intl.DateTimeFormat.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, options) => t =
  "Intl.DateTimeFormat.supportedLocalesOf"

@send external resolvedOptions: t => options = "resolvedOptions"

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
