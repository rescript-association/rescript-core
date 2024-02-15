type t

type options = {
  usage?: [#sort | #search],
  localeMathcer?: [#lookup | #"best fit"],
  collation?: string,
  numeric?: bool,
  caseFirst?: [#upper | #lower | #"false"],
  sensitivity?: [#base | #accent | #case | #variant],
  ignorePunctuation?: bool,
}

@new external make: unit => t = "Intl.Collator"
@new external makeWithLocale: string => t = "Intl.Collator"
@new external makeWithLocales: array<string> => t = "Intl.Collator"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.Collator"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.Collator"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.Collator"

@val external supportedLocalesOf: array<string> => t = "Intl.Collator.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, options) => t =
  "Intl.Collator.supportedLocalesOf"

@send external resolvedOptions: t => options = "resolvedOptions"

@send external compare: (t, string, string) => int = "compare"
