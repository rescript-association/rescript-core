open RescriptCore

Console.info("")
Console.info("Intl")
Console.info("---")
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
