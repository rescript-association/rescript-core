open RescriptCore

Console.log("---")
Console.log("Intl.RelativeTimeFormat")

Intl.RelativeTimeFormat.supportedLocalesOf(["en-US", "en-GB"])->ignore
Intl.RelativeTimeFormat.supportedLocalesOfWithOptions(
  ["en-US", "en-GB"],
  {localeMatcher: #lookup},
)->ignore

let formatter = Intl.RelativeTimeFormat.make()
let formatter = Intl.RelativeTimeFormat.makeWithLocale("en-US")
let formatter = Intl.RelativeTimeFormat.makeWithLocales(["en-US", "en-GB"])
let formatter = Intl.RelativeTimeFormat.makeWithOptions({
  numeric: #always,
  style: #narrow,
})
let formatter = Intl.RelativeTimeFormat.makeWithLocaleAndOptions(
  "en-US",
  {
    numeric: #always,
    style: #narrow,
  },
)
let formatter = Intl.RelativeTimeFormat.makeWithLocalesAndOptions(
  ["en-US"],
  {
    numeric: #always,
    style: #narrow,
  },
)

formatter->Intl.RelativeTimeFormat.resolvedOptions->Console.log

formatter->Intl.RelativeTimeFormat.format(3, #hour)->Console.log
formatter->Intl.RelativeTimeFormat.formatToParts(3, #hour)->Console.log
