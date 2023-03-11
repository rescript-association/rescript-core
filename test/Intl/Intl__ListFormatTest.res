open RescriptCore

Console.log("---")
Console.log("Intl.ListFormat")

let formatter = Intl.ListFormat.make()
let formatter = Intl.ListFormat.makeWithLocale("en-US")
let formatter = Intl.ListFormat.makeWithLocales(["en-US", "en-GB"])
let formatter = Intl.ListFormat.makeWithLocaleAndOptions(
  "en-US",
  {style: #long, \"type": #conjunction},
)
let formatter = Intl.ListFormat.makeWithLocalesAndOptions(
  ["en-US", "en-GB"],
  {style: #long, \"type": #conjunction},
)
Intl.ListFormat.supportedLocalesOf(["en-US", "en-GB"])->ignore
Intl.ListFormat.supportedLocalesOfWithOptions(["en-US", "en-GB"], {localeMatcher: #lookup})->ignore

let formatter = Intl.ListFormat.makeWithOptions({style: #long, \"type": #conjunction})

formatter->Intl.ListFormat.resolvedOptions->Console.log
formatter->Intl.ListFormat.format(["one", "two", "three"])->Console.log
formatter->Intl.ListFormat.formatToParts(["one", "two", "three"])->Console.log
