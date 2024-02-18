type t

@new external make: unit => t = "Intl.NumberFormat"
@new external makeWithLocale: string => t = "Intl.NumberFormat"
@new external makeWithLocales: array<string> => t = "Intl.NumberFormat"
@new external makeWithLocaleAndOptions: (string, {..}) => t = "Intl.NumberFormat"
@new external makeWithLocalesAndOptions: (array<string>, {..}) => t = "Intl.NumberFormat"
@new external makeWithOptions: (@as(json`undefined`) _, {..}) => t = "Intl.NumberFormat"

@val external supportedLocalesOf: array<string> => t = "Intl.NumberFormat.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, {..}) => t =
  "Intl.NumberFormat.supportedLocalesOf"

@send external resolvedOptions: t => {..} = "resolvedOptions"

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
