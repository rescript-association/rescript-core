open RescriptCore

Console.log("---")
Console.log("Intl.Segmenter")

Intl.Segmenter.supportedLocalesOf(["en-US", "en-GB"])->ignore
Intl.Segmenter.supportedLocalesOfWithOptions(["en-US", "en-GB"], {localeMatcher: #lookup})->ignore

let formatter = Intl.Segmenter.make()
let formatter = Intl.Segmenter.makeWithLocale("en-US")
let formatter = Intl.Segmenter.makeWithLocales(["en-US", "en-GB"])
let formatter = Intl.Segmenter.makeWithOptions({
  granularity: #word,
})
let formatter = Intl.Segmenter.makeWithLocaleAndOptions(
  "en-US",
  {
    granularity: #word,
  },
)
let formatter = Intl.Segmenter.makeWithLocalesAndOptions(
  ["en-US"],
  {
    granularity: #word,
  },
)

formatter->Intl.Segmenter.resolvedOptions->Console.log
let segments = formatter->Intl.Segmenter.segment("This is a sentence with several words")

Console.log(segments)

Intl.Segments.containing(segments)->Console.log
Intl.Segments.containingWithIndex(segments, 1)->Console.log
