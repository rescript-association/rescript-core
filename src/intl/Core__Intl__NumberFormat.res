type t

type options = {
  localeMathcer?: [#lookup | #"best fit"],
  numberingSystem?: string,
  compactDisplay?: [#compact | #short | #long],
  currency?: string,
  currencyDisplay?: [#symbol | #narrowSymbol | #code | #name],
  currencySign?: [#standard | #accounting],
  notation?: [#standard | #scientific | #engineering | #compact],
  signDisplay?: [#auto | #always | #exceptZero | #negative | #never],
  style?: [#decimal | #currency | #percent | #unit],
  unit?: string,
  unitDisplay?: [#long | #short | #narrow],
  useGrouping?: bool, // TODO: also [#always | #auto | #min2]
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
  trailingZeroDisplay?: [#auto | #stripIfInteger],
  minimumIntegerDigits?: int,
  minimumFractionDigits?: int,
  maximumFractionDigits?: int,
  minimumSignificantDigits?: int,
  maximumSignificantDigits?: int,
}

@new external make: unit => t = "Intl.NumberFormat"
@new external makeWithLocale: string => t = "Intl.NumberFormat"
@new external makeWithLocales: array<string> => t = "Intl.NumberFormat"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.NumberFormat"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.NumberFormat"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.NumberFormat"

@val external supportedLocalesOf: array<string> => t = "Intl.NumberFormat.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, options) => t =
  "Intl.NumberFormat.supportedLocalesOf"

@send external resolvedOptions: t => options = "resolvedOptions"

@send external format: (t, float) => string = "format"
@send
external formatToParts: (t, float) => array<{"type": string, "value": string}> = "formatToParts"

@send external formatInt: (t, int) => string = "format"
@send
external formatIntToParts: (t, int) => array<{"type": string, "value": string}> = "formatToParts"

@send external formatBigInt: (t, Core__BigInt.t) => string = "format"
@send
external formatBigIntToParts: (t, Core__BigInt.t) => array<{"type": string, "value": string}> =
  "formatToParts"
