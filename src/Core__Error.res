type t = unknown

@@warning("-38") /* unused extension constructor */
exception Error = JsError

external fromException: exn => option<t> = "?as_js_exn"
external toException: t => exn = "%identity"

@get external stack: t => option<string> = "stack"
@get external message: t => option<string> = "message"
@get external name: t => option<string> = "name"
@get external fileName: t => option<string> = "fileName"

@new external make: string => t = "Error"

external isCamlExceptionOrOpenVariant: 'a => bool = "?is_extension"

module EvalError = {
  @new external make: string => t = "EvalError"
}

module RangeError = {
  @new external make: string => t = "RangeError"
}

module ReferenceError = {
  @new external make: string => t = "ReferenceError"
}

module SyntaxError = {
  @new external make: string => t = "SyntaxError"
}

module TypeError = {
  @new external make: string => t = "TypeError"
}

module URIError = {
  @new external make: string => t = "URIError"
}

external raise: t => 'a = "%raise"

let panic = msg => make(`Panic! ${msg}`)->raise
