type t

type usage = [#sort | #search]
type sensitivity = [#base | #accent | #case | #variant]
type caseFirst = [#upper | #lower | #"false"]

type options = {
  localeMatcher?: Core__Intl__Common.localeMatcher,
  usage?: usage,
  sensitivity?: sensitivity,
  ignorePunctuation?: bool,
  numeric?: bool,
  caseFirst?: caseFirst,
}

type resolvedOptions = {
  locale: string,
  usage: usage,
  sensitivity: sensitivity,
  ignorePunctuation: bool,
  collation: [Core__Intl__Common.collation | #default],
  numeric?: bool,
  caseFirst?: caseFirst,
}

type supportedLocalesOptions = {localeMatcher: Core__Intl__Common.localeMatcher}

@new external make: unit => t = "Intl.Collator"
@new external makeWithLocale: string => t = "Intl.Collator"
@new external makeWithLocales: array<string> => t = "Intl.Collator"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.Collator"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.Collator"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.Collator"

@val external supportedLocalesOf: array<string> => t = "Intl.Collator.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, supportedLocalesOptions) => t =
  "Intl.Collator.supportedLocalesOf"

@send external resolvedOptions: t => resolvedOptions = "resolvedOptions"

@send external compare: (t, string, string) => int = "compare"
