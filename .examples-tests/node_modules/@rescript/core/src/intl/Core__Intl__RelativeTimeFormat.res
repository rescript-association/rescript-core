type t

@new external make: unit => t = "Intl.RelativeTimeFormat"
@new external makeWithLocale: string => t = "Intl.RelativeTimeFormat"
@new external makeWithLocales: array<string> => t = "Intl.RelativeTimeFormat"
@new external makeWithLocaleAndOptions: (string, {..}) => t = "Intl.RelativeTimeFormat"
@new external makeWithLocalesAndOptions: (array<string>, {..}) => t = "Intl.RelativeTimeFormat"
@new external makeWithOptions: (@as(json`undefined`) _, {..}) => t = "Intl.RelativeTimeFormat"

@val
external supportedLocalesOf: array<string> => t = "Intl.RelativeTimeFormat.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, {..}) => t =
  "Intl.RelativeTimeFormat.supportedLocalesOf"

@send external resolvedOptions: t => {..} = "resolvedOptions"

type timeUnit = [#year | #quarter | #month | #week | #day | #hour | #minute | #second]

@send external format: (t, int, timeUnit) => string = "format"
@send
external formatToParts: (
  t,
  int,
  timeUnit,
) => array<{
  "type": string,
  "value": string,
  "unit": option<string>,
}> = "formatToParts"
