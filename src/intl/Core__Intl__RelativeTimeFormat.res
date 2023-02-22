type t

type numeric = [#always | #auto]
type style = [#long | #short | #narrow]
type timeUnit = [#year | #quarter | #month | #week | #day | #hour | #minute | #second]

type options = {
  localeMatcher?: Core__Intl__Common.localeMatcher,
  numeric?: numeric,
  style?: style,
}

type supportedLocalesOptions = {localeMatcher: Core__Intl__Common.localeMatcher}

type resolvedOptions = {
  locale: string,
  numeric: numeric,
  style: style,
  numberingSystem: string,
}

type relativeTimePartComponent = [#literal | #integer]
type relativeTimePart = {
  \"type": relativeTimePartComponent,
  value: string,
  unit?: timeUnit,
}

@new external make: unit => t = "Intl.RelativeTimeFormat"
@new external makeWithLocale: string => t = "Intl.RelativeTimeFormat"
@new external makeWithLocales: array<string> => t = "Intl.RelativeTimeFormat"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.RelativeTimeFormat"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.RelativeTimeFormat"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.RelativeTimeFormat"

@val
external supportedLocalesOf: array<string> => t = "Intl.RelativeTimeFormat.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, supportedLocalesOptions) => t =
  "Intl.RelativeTimeFormat.supportedLocalesOf"

@send external resolvedOptions: t => resolvedOptions = "resolvedOptions"

@send external format: (t, int, timeUnit) => string = "format"
@send
external formatToParts: (t, int, timeUnit) => array<relativeTimePart> = "formatToParts"
