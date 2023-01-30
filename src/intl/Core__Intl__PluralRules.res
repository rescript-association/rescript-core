type t

@new external make: unit => t = "Intl.PluralRules"
@new external makeWithLocale: string => t = "Intl.PluralRules"
@new external makeWithLocales: array<string> => t = "Intl.PluralRules"
@new external makeWithLocaleAndOptions: (string, {..}) => t = "Intl.PluralRules"
@new external makeWithLocalesAndOptions: (array<string>, {..}) => t = "Intl.PluralRules"
@new external makeWithOptions: (@as(json`undefined`) _, {..}) => t = "Intl.PluralRules"

@val external supportedLocalesOf: array<string> => t = "Intl.PluralRules.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, {..}) => t =
  "Intl.PluralRules.supportedLocalesOf"

@send external resolvedOptions: t => {..} = "resolvedOptions"

type rule = [#zero | #one | #two | #few | #many | #other]

@send external select: (t, float) => rule = "format"
@send external selectInt: (t, int) => rule = "format"
@send external selectBigInt: (t, Core__BigInt.t) => rule = "format"
