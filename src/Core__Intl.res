module Collator = Core__Intl__Collator
module DateTimeFormat = Core__Intl__DateTimeFormat
module Locale = Core__Intl__Locale
module NumberFormat = Core__Intl__NumberFormat
module PluralRules = Core__Intl__PluralRules
module RelativeTimeFormat = Core__Intl__RelativeTimeFormat

/**
@throws RangeError
*/
external getCanonicalLocalesExn: string => array<string> = "Intl.getCanonicalLocales"

/**
@throws RangeError
*/
external getCanonicalLocalesManyExn: array<string> => array<string> = "Intl.getCanonicalLocales"

/**
@throws RangeError
*/
external supportedValuesOfExn: string => array<string> = "Intl.supportedValuesOf"
