type t

type listType = [
  | #conjunction
  | #disjunction
  | #unit
]
type style = [
  | #long
  | #short
  | #narrow
]

type options = {
  localeMatcher?: Core__Intl__Common.localeMatcher,
  \"type"?: listType,
  style?: style,
}

type listPartComponentType = [
  | #element
  | #literal
]

type listPart = {
  \"type": listPartComponentType,
  value: string,
}

type resolvedOptions = {
  locale: string,
  style: style,
  \"type": listType,
}

type supportedLocalesOptions = {localeMatcher: Core__Intl__Common.localeMatcher}

@new external make: unit => t = "Intl.ListFormat"
@new external makeWithLocale: string => t = "Intl.ListFormat"
@new external makeWithLocales: array<string> => t = "Intl.ListFormat"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.ListFormat"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.ListFormat"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.ListFormat"

@val external supportedLocalesOf: array<string> => t = "Intl.ListFormat.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, supportedLocalesOptions) => t =
  "Intl.ListFormat.supportedLocalesOf"

@send external resolvedOptions: t => resolvedOptions = "resolvedOptions"

@send external format: (t, array<string>) => string = "format"
@send external formatToParts: (t, array<string>) => array<listPart> = "formatToParts"
