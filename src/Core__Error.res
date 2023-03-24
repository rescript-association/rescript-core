type t = Js.Exn.t

external fromException: exn => option<t> = "?as_js_exn"
external toException: t => exn = "%identity"

@get external stack: t => option<string> = "stack"
@get external message: t => option<string> = "message"
@get external name: t => option<string> = "name"
@get external fileName: t => option<string> = "fileName"

@new external make: string => t = "Error"
@new external makeEvalError: string => t = "EvalError"
@new external makeRangeError: string => t = "RangeError"
@new external makeReferenceError: string => t = "ReferenceError"
@new external makeSyntaxError: string => t = "SyntaxError"
@new external makeTypeError: string => t = "TypeError"
@new external makeURIError: string => t = "URIError"

external raise: t => 'a = "%raise"

let panic = msg => make(`Panic! ${msg}`)->raise
