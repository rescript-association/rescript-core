// Test "framework"

open RescriptCore

@scope("process") @val external exit: int => unit = "exit"
@scope("Error") @val external captureStackTrace: {..} => unit = "captureStackTrace"
@module("@babel/code-frame") @val
external codeFrameColumns: (string, {..}, {..}) => string = "codeFrameColumns"
@module("fs") @val external readFileSync: (string, {..}) => string = "readFileSync"
@module("path") @val external join: (string, string) => string = "join"

let dirname = %raw("new URL('.', import.meta.url).pathname")

let cleanUpStackTrace = stack => {
  // Stack format: https://nodejs.org/api/errors.html#errors_error_stack
  // Remove the node loader and other lines. No point in showing them
  let rec removeInternalLines = (lines, i) => {
    if i >= Array.length(lines) {
      lines
    } else if Array.getUnsafe(lines, i)->String.indexOf(" (internal/") >= 0 {
      lines->Array.slice(~start=0, ~end=i)
    } else {
      removeInternalLines(lines, i + 1)
    }
  }

  stack
  ->String.split("\n")
  // first line is "Error ...". Second line is this frame's stack trace. Ignore the 2
  ->Array.sliceToEnd(~start=2)
  ->removeInternalLines(0)
  // stack is indented 4 spaces. Remove 2
  ->Array.map(line => line->String.sliceToEnd(~start=2))
  ->Array.joinWith("\n")
}

let run = (loc, left, comparator, right) => {
  if !comparator(left, right) {
    let ((file, line, _, _), _) = loc
    let fileContent = readFileSync(join(dirname, file), {"encoding": "utf-8"})
    let left = JSON.stringifyAny(left)
    let right = JSON.stringifyAny(right)
    let codeFrame = codeFrameColumns(
      fileContent,
      {"start": {"line": line}},
      {"highlightCode": true},
    )
    let errorMessage = j`
  \u001b[31mTest Failure!
  \u001b[36m$file\u001b[0m:\u001b[2m$line
$codeFrame
  \u001b[39mLeft: \u001b[31m$left
  \u001b[39mRight: \u001b[31m$right\u001b[0m
`
    Console.log(errorMessage)
    // API: https://nodejs.org/api/errors.html#errors_error_capturestacktrace_targetobject_constructoropt
    let obj = Object.empty()
    captureStackTrace(obj)
    Console.log(obj["stack"]->cleanUpStackTrace)
  }
}
