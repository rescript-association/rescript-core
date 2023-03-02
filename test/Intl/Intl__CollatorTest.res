open RescriptCore

Console.log("---")
Console.log("Intl.Collator")

let collator = Intl.Collator.make()
let collator = Intl.Collator.makeWithLocale("en-US")
let collator = Intl.Collator.makeWithLocales(["en-US", "en-GB"])
let collator = Intl.Collator.makeWithLocaleAndOptions(
  "en-US",
  {caseFirst: #upper, sensitivity: #base, ignorePunctuation: true, numeric: true},
)
Intl.Collator.supportedLocalesOf(["en-US", "en-GB"])->ignore
Intl.Collator.supportedLocalesOfWithOptions(["en-US", "en-GB"], {localeMatcher: #lookup})->ignore

collator->Intl.Collator.resolvedOptions->Console.log
collator->Intl.Collator.compare("hi", "hï")->Console.log
Intl.Collator.supportedLocalesOf(["hi"])->Console.log
