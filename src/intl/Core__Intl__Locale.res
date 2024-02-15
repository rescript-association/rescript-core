type t

type options = {
  language?: string,
  script?: string,
  region?: string,
  calendar?: string,
  collation?: string,
  numberingSystem?: string,
  caseFirst?: [#upper | #lower | #"false"],
  hourCycle?: [#h11 | #h12 | #h23 | #h24],
  numeric?: bool,
}

@new external make: string => t = "Intl.Locale"
@new external makeWithOptions: (string, options) => t = "Intl.Locale"

@get external baseName: t => string = "baseName"
@get external calendar: t => option<string> = "calendar"
@get external caseFirst: t => option<string> = "caseFirst"
@get external collation: t => option<string> = "collation"
@get external hourCycle: t => option<string> = "hourCycle"
@get external language: t => string = "language"
@get external numberingSystem: t => option<string> = "numberingSystem"
@get external numeric: t => bool = "numeric"
@get external region: t => option<string> = "region"
@get external script: t => option<string> = "script"

@send external maximize: t => t = "maximize"
@send external minimize: t => t = "minimize"
