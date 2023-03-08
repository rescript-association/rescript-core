open RescriptCore

Console.log("---")
Console.log("Intl.NumberFormat")

let currencyFormatter = Intl.NumberFormat.makeWithLocaleAndOptions(
  "fr-FR",
  {currency: "EUR", style: #currency},
)

Console.log(Intl.NumberFormat.supportedLocalesOf(["fr-FR", "en-US"]))
Console.log(currencyFormatter->Intl.NumberFormat.format(123.23))

let roundingFormatter = Intl.NumberFormat.makeWithOptions({
  roundingPriority: #lessPrecision,
  roundingIncrement: #500,
})

let groupingFormatter1 = Intl.NumberFormat.makeWithOptions({
  useGrouping: Intl.NumberFormat.Grouping.fromBool(true),
})
let groupingFormatter2 = Intl.NumberFormat.makeWithOptions({
  useGrouping: Intl.NumberFormat.Grouping.fromString(#auto),
})

let sigFormatter = Intl.NumberFormat.makeWithOptions({
  minimumIntegerDigits: #1,
  minimumFractionDigits: #1,
  maximumFractionDigits: #1,
  minimumSignificantDigits: #1,
  maximumSignificantDigits: #1,
})

let options = sigFormatter->Intl.NumberFormat.resolvedOptions
Console.log(options)
options.useGrouping->Core__Intl__NumberFormat.Grouping.parseJsValue->Console.log
