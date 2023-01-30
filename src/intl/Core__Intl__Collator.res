type t

@new external make: unit => t = "Intl.Collator"
@new external makeWithLocale: string => t = "Intl.Collator"
@new external makeWithLocales: array<string> => t = "Intl.Collator"
@new external makeWithLocaleAndOptions: (string, {..}) => t = "Intl.Collator"
@new external makeWithLocalesAndOptions: (array<string>, {..}) => t = "Intl.Collator"
@new external makeWithOptions: (@as(json`undefined`) _, {..}) => t = "Intl.Collator"

@val external supportedLocalesOf: array<string> => t = "Intl.Collator.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, {..}) => t =
  "Intl.Collator.supportedLocalesOf"

@send external resolvedOptions: t => {..} = "resolvedOptions"

@send external compare: (t, string, string) => int = "compare"
