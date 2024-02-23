/***
Not supported in Firefox
*/
type t

type granularity = [#grapheme | #word | #sentence]

type options = {
  localeMatcher?: Core__Intl__Common.localeMatcher,
  granularity?: granularity,
}

type pluralCategories = [
  | #zero
  | #one
  | #two
  | #few
  | #many
  | #other
]

type resolvedOptions = {locale: string, granularity: granularity}

type supportedLocalesOptions = {localeMatcher: Core__Intl__Common.localeMatcher}

@new external make: unit => t = "Intl.Segmenter"
@new external makeWithLocale: string => t = "Intl.Segmenter"
@new external makeWithLocales: array<string> => t = "Intl.Segmenter"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.Segmenter"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.Segmenter"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.Segmenter"

@val external supportedLocalesOf: array<string> => t = "Intl.Segmenter.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, supportedLocalesOptions) => t =
  "Intl.Segmenter.supportedLocalesOf"

@send external resolvedOptions: t => resolvedOptions = "resolvedOptions"

@send external segment: (t, string) => Core__Intl__Segments.t = "segment"
