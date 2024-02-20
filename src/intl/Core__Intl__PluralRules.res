type t

type localeType = [#cardinal | #ordinal]

type options = {
  localeMatcher?: Core__Intl__Common.localeMatcher,
  \"type"?: localeType,
  // use either this group
  minimumIntegerDigits?: Core__Intl__Common.oneTo21,
  minimumFractionDigits?: Core__Intl__Common.zeroTo20,
  maximumFractionDigits?: Core__Intl__Common.zeroTo20,
  // OR this group
  minimumSignificantDigits?: Core__Intl__Common.oneTo21,
  maximumSignificantDigits?: Core__Intl__Common.oneTo21,
}

type pluralCategories = [
  | #zero
  | #one
  | #two
  | #few
  | #many
  | #other
]

type resolvedOptions = {
  locale: string,
  pluralCategories: array<pluralCategories>,
  \"type": localeType,
  // either this group
  minimumIntegerDigits?: Core__Intl__Common.oneTo21,
  minimumFractionDigits?: Core__Intl__Common.zeroTo20,
  maximumFractionDigits?: Core__Intl__Common.zeroTo20,
  // OR this group
  minimumSignificantDigits?: Core__Intl__Common.oneTo21,
  maximumSignificantDigits?: Core__Intl__Common.oneTo21,
}

type supportedLocalesOptions = {localeMatcher: Core__Intl__Common.localeMatcher}

@new external make: unit => t = "Intl.PluralRules"
@new external makeWithLocale: string => t = "Intl.PluralRules"
@new external makeWithLocales: array<string> => t = "Intl.PluralRules"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.PluralRules"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.PluralRules"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.PluralRules"

@val external supportedLocalesOf: array<string> => t = "Intl.PluralRules.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, supportedLocalesOptions) => t =
  "Intl.PluralRules.supportedLocalesOf"

@send external resolvedOptions: t => resolvedOptions = "resolvedOptions"

type rule = [#zero | #one | #two | #few | #many | #other]

@send external select: (t, float) => rule = "select"
@send external selectInt: (t, int) => rule = "select"
@send external selectBigInt: (t, Core__BigInt.t) => rule = "select"

@send
external selectRange: (t, ~start: float, ~end: float) => rule = "selectRange"

@send
external selectRangeInt: (t, ~start: int, ~end: int) => rule = "selectRange"

@send
external selectRangeBigInt: (t, ~start: Core__BigInt.t, ~end: Core__BigInt.t) => rule =
  "selectRange"
