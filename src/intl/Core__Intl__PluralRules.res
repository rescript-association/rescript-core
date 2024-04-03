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

@new external make: (~locales: array<string>=?, ~options: options=?) => t = "Intl.PluralRules"

@val
external supportedLocalesOf: (array<string>, ~options: supportedLocalesOptions=?) => t =
  "Intl.PluralRules.supportedLocalesOf"

@send external resolvedOptions: t => resolvedOptions = "resolvedOptions"

type rule = [#zero | #one | #two | #few | #many | #other]

@send external select: (t, float) => rule = "select"
@send external selectInt: (t, int) => rule = "select"
@send external selectBigInt: (t, bigint) => rule = "select"

@send
external selectRange: (t, ~start: float, ~end: float) => rule = "selectRange"

@send
external selectRangeInt: (t, ~start: int, ~end: int) => rule = "selectRange"

@send
external selectRangeBigInt: (t, ~start: bigint, ~end: bigint) => rule = "selectRange"
