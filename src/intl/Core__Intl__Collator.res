type t

type usage = [#sort | #search]
type sensitivity = [#base | #accent | #case | #variant]
type caseFirst = [#upper | #lower | #"false"]
type collation = [
  | #big5han // (Chinese; do not use; not available in Firefox, Chrome or Edge)
  | #compat // (Arabic)
  | #dict // (Sinhala)
  | #direct // (deprecated, do not use)
  | #ducet // (not available, do not use)
  | #emoji // (root)
  | #eor // (root)
  | #gb2312 // (Chinese; do not use; not available in Chrome or Edge)
  | #phonebk // (German)
  | #phonetic // (Lingala)
  | #pinyin // (Chinese)
  | #reformed // (formerly Swedish; do not specify explicitly as this was the old name for the default for Swedish)
  | #searchjl // (Korean; do not use as this is for searching rather than sorting, and the API covers only sorting)
  | #stroke // (Chinese)
  | #trad
  | #unihan // (Chinese, Japanese, and Korean; not available in Chrome or Edge)
  | #zhuyin
] // (Chinese)

type options = {
  localeMatcher?: Core__Intl__Common.localeMatcher,
  usage?: usage,
  sensitivity?: sensitivity,
  ignorePunctuation?: bool,
  numeric?: bool,
  caseFirst?: caseFirst,
}

type resolvedOptions = {
  locale: string,
  usage: usage,
  sensitivity: sensitivity,
  ignorePunctuation: bool,
  collation: [collation | #default],
  numeric?: bool,
  caseFirst?: caseFirst,
}

type supportedLocalesOptions = {localeMatcher: Core__Intl__Common.localeMatcher}

@new external make: unit => t = "Intl.Collator"
@new external makeWithLocale: string => t = "Intl.Collator"
@new external makeWithLocales: array<string> => t = "Intl.Collator"
@new external makeWithLocaleAndOptions: (string, options) => t = "Intl.Collator"
@new external makeWithLocalesAndOptions: (array<string>, options) => t = "Intl.Collator"
@new external makeWithOptions: (@as(json`undefined`) _, options) => t = "Intl.Collator"

@val external supportedLocalesOf: array<string> => t = "Intl.Collator.supportedLocalesOf"
@val
external supportedLocalesOfWithOptions: (array<string>, supportedLocalesOptions) => t =
  "Intl.Collator.supportedLocalesOf"

@send external resolvedOptions: t => resolvedOptions = "resolvedOptions"

@send external compare: (t, string, string) => int = "compare"
