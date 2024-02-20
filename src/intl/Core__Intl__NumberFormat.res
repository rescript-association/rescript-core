module Grouping = Core__Intl__NumberFormat__Grouping

type t

/**
An ISO 4217 currency code. e.g. USD, EUR, CNY
*/
type currency = string
type currencyDisplay = [#symbol | #narrowSymbol | #code | #name]
type currencySign = [#accounting | #standard]
type notation = [#scientific | #standard | #engineering | #compact]

/**
Used only when notation is #compact
*/
type compactDisplay = [#short | #long]

type signDisplay = [
  | #auto
  | #always
  | #exceptZero
  | #never
  | #negative
]

type style = [#decimal | #currency | #percent | #unit]

/**
Defined in https://tc39.es/proposal-unified-intl-numberformat/section6/locales-currencies-tz_proposed_out.html#sec-issanctionedsimpleunitidentifier
Only used when style is #unit
*/
type unitSystem = string

/**
Only used when style is #unit
*/
type unitDisplay = [#long | #short | #narrow]

type rounding = [
  | #ceil
  | #floor
  | #expand
  | #trunc
  | #halfCeil
  | #halfFloor
  | #halfExpand
  | #halfTrunc
  | #halfEven
]

type roundingPriority = [#auto | #morePrecision | #lessPrecision]

type roundingIncrement = [
  | #1
  | #2
  | #5
  | #10
  | #20
  | #25
  | #50
  | #100
  | #200
  | #250
  | #500
  | #1000
  | #2000
  | #2500
  | #5000
]

type trailingZeroDisplay = [#auto | #stripIfInteger | #lessPrecision]

type options = {
  compactDisplay?: compactDisplay,
  numberingSystem?: Core__Intl__Common.numberingSystem,
  currency?: currency,
  currencyDisplay?: currencyDisplay,
  currencySign?: currencySign,
  localeMatcher?: Core__Intl__Common.localeMatcher,
  notation?: notation,
  signDisplay?: signDisplay,
  style?: style,
  /**
  required if style == #unit
  */
  unit?: unitSystem,
  unitDisplay?: unitDisplay,
  useGrouping?: Grouping.t,
  roundingMode?: rounding, // not available in firefox v110
  roundingPriority?: roundingPriority, // not available in firefox v110
  roundingIncrement?: roundingIncrement, // not available in firefox v110
  /**
  Supported everywhere but Firefox as of v110
  */
  trailingZeroDisplay?: trailingZeroDisplay,
  // use either this group
  minimumIntegerDigits?: Core__Intl__Common.oneTo21,
  minimumFractionDigits?: Core__Intl__Common.zeroTo20,
  maximumFractionDigits?: Core__Intl__Common.zeroTo20,
  // OR these
  minimumSignificantDigits?: Core__Intl__Common.oneTo21,
  maximumSignificantDigits?: Core__Intl__Common.oneTo21,
}

type resolvedOptions = {
  // only when style == "currency"
  currency?: currency,
  currencyDisplay?: currencyDisplay,
  currencySign?: currencySign,
  // only when notation == "compact"
  compactDisplay?: compactDisplay,
  // only when style == "unit"
  unit: unitSystem,
  unitDisplay: unitDisplay,
  roundingMode?: rounding, // not available in firefox v110
  roundingPriority?: roundingPriority, // not available in firefox v110
  roundingIncrement?: roundingIncrement, // not available in firefox v110
  // either this group
  minimumIntegerDigits?: Core__Intl__Common.oneTo21,
  minimumFractionDigits?: Core__Intl__Common.zeroTo20,
  maximumFractionDigits?: Core__Intl__Common.zeroTo20,
  // OR these
  minimumSignificantDigits?: Core__Intl__Common.oneTo21,
  maximumSignificantDigits?: Core__Intl__Common.oneTo21,
  // always present
  locale: string,
  notation: notation,
  numberingSystem: Core__Intl__Common.numberingSystem,
  signDisplay: signDisplay,
  style: style,
  useGrouping: Grouping.t,
}

type supportedLocalesOptions = {localeMatcher: Core__Intl__Common.localeMatcher}

type numberFormatPartType = [
  | #compact
  | #currency
  | #decimal
  | #exponentInteger
  | #exponentMinusSign
  | #exponentSeparator
  | #fraction
  | #group
  | #infinity
  | #integer
  | #literal
  | #minusSign
  | #nan
  | #plusSign
  | #percentSign
  | #unit
  | #unknown
]

type numberFormatPart = {
  \"type": numberFormatPartType,
  value: string,
}

type rangeSource = [#startRange | #endRange | #shared]

type numberFormatRangePart = {
  \"type": numberFormatPartType,
  value: string,
  source: rangeSource,
}

@new external make: unit => t = "Intl.NumberFormat"
@new external makeWithLocale: string => t = "Intl.NumberFormat"
@new external makeWithLocales: array<string> => t = "Intl.NumberFormat"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.NumberFormat"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.NumberFormat"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.NumberFormat"

@val external supportedLocalesOf: array<string> => t = "Intl.NumberFormat.supportedLocalesOf"

@val
external supportedLocalesOfWithOptions: (array<string>, supportedLocalesOptions) => t =
  "Intl.NumberFormat.supportedLocalesOf"

@send external resolvedOptions: t => resolvedOptions = "resolvedOptions"

@send external format: (t, float) => string = "format"
@send
external formatRange: (t, ~start: float, ~end: float) => array<string> = "formatRange"
@send
external formatToParts: (t, float) => array<numberFormatPart> = "formatToParts"
@send
external formatRangeToParts: (t, ~start: float, ~end: float) => array<numberFormatRangePart> =
  "formatRange"

@send external formatInt: (t, int) => string = "format"

@send
external formatIntRange: (t, ~start: int, ~end: int) => array<string> = "formatRange"
@send
external formatIntToParts: (t, int) => array<numberFormatPart> = "formatToParts"

@send
external formatIntRangeToParts: (t, ~start: int, ~end: int) => array<numberFormatRangePart> =
  "formatRange"

@send external formatBigInt: (t, Core__BigInt.t) => string = "format"

@send
external formatBigIntRange: (t, ~start: Core__BigInt.t, ~end: Core__BigInt.t) => array<string> =
  "formatRange"
@send
external formatBigIntToParts: (t, Core__BigInt.t) => array<numberFormatPart> = "formatToParts"

@send
external formatBigIntRangeToParts: (
  t,
  ~start: Core__BigInt.t,
  ~end: Core__BigInt.t,
) => array<numberFormatPart> = "formatRange"

@send external formatString: (t, string) => string = "format"

@send
external formatStringToParts: (t, string) => array<numberFormatRangePart> = "formatToParts"
