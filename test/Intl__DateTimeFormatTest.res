open RescriptCore

let formatter = Intl.DateTimeFormat.makeWithOptions({dateStyle: #full, timeStyle: #full})

Console.log(formatter->Intl.DateTimeFormat.format(Date.fromTime(Date.now())))

Console.log(
  formatter->Intl.DateTimeFormat.formatRange(
    ~startDate=Date.makeWithYMD(~year=2023, ~date=1, ~month=1),
    ~endDate=Date.makeWithYMD(~year=2023, ~date=31, ~month=12),
  ),
)

let formatter = Intl.DateTimeFormat.makeWithOptions({
  hour12: false,
  hourCycle: #h24,
  timeZone: "UTC",
  weekday: #narrow,
  era: #narrow,
  year: #"2-digit",
  month: #"2-digit",
  day: #"2-digit",
  hour: #"2-digit",
  minute: #"2-digit",
  second: #"2-digit",
  fractionalSecondDigits: #3,
  timeZoneName: #short,
})

Console.log(formatter->Intl.DateTimeFormat.format(Date.fromTime(Date.now())))

let resolvedOptions = Intl.DateTimeFormat.make()->Intl.DateTimeFormat.resolvedOptions
let {Intl.DateTimeFormat.timeZone: timeZone, _} = resolvedOptions
