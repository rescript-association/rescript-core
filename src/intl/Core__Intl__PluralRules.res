type t

type options = {
  localeMathcer?: [#lookup | #"best fit"],
  @as("type") type_?: [#cardinal | #ordinal],
  roundingMode?: [
    | #ceil
    | #floot
    | #expand
    | #trunc
    | #halfCeil
    | #halfFloor
    | #haldExpand
    | #halfTrunc
    | #halfEven
  ],
  roundingPriority?: [#auto | #morePrecision | #lessPrecision],
  roundingIncrement?: int,
  minimumIntegerDigits?: int,
  minimumFractionDigits?: int,
  maximumFractionDigits?: int,
  minimumSignificantDigits?: int,
  maximumSignificantDigits?: int,
}

@new external make: unit => t = "Intl.PluralRules"
@new external makeWithLocale: string => t = "Intl.PluralRules"
@new external makeWithLocales: array<string> => t = "Intl.PluralRules"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.PluralRules"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.PluralRules"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.PluralRules"

@val external supportedLocalesOf: array<string> => t = "Intl.PluralRules.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, options) => t =
  "Intl.PluralRules.supportedLocalesOf"

@send external resolvedOptions: t => options = "resolvedOptions"

type rule = [#zero | #one | #two | #few | #many | #other]

@send external select: (t, float) => rule = "select"
@send external selectInt: (t, int) => rule = "select"
@send external selectBigInt: (t, Core__BigInt.t) => rule = "select"
