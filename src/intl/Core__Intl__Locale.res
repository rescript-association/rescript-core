type t

@new external make: string => t = "Intl.Locale"
@new external makeWithOptions: (string, {..}) => t = "Intl.Locale"

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
