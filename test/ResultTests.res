open RescriptCore

let eq = (a, b) => a == b

let fromArrayTestCases = [
  ("when empty, return empty", [], Ok([])),
  ("when one error, return it", [Error("a")], Error("a")),
  ("when one ok, return it", [Ok(1)], Ok([1])),
  ("when all ok, return all", [Ok(1), Ok(2), Ok(3)], Ok([1, 2, 3])),
  ("when all error, return first", [Error("a"), Error("b"), Error("c")], Error("a")),
  ("when mix, return first error", [Ok(1), Error("a"), Ok(2), Error("b")], Error("a")),
]
fromArrayTestCases->Array.forEach(((title, input, output)) =>
  Test.run(__POS_OF__(`fromArray: ${title}`), input->Result.fromArray, eq, output)
)

let fromArrayWithTestCases = [
  ("when empty, return empty", [], Ok([])),
  ("when one error, return it", [30], Error("30")),
  ("when one ok, return it", [2], Ok([4])),
  ("when all ok, return all", [1, 2, 3], Ok([2, 4, 6])),
  ("when all error, return first", [20, 30, 40], Error("20")),
  ("when mix, return first error", [1, 2, 14, 3, 4], Error("14")),
]
let fromArrayWithMapper = n => n < 10 ? Ok(n * 2) : Error(n->Int.toString)
fromArrayWithTestCases->Array.forEach(((title, input, output)) =>
  Test.run(
    __POS_OF__(`fromArrayWith: ${title}`),
    input->Result.fromArrayWith(fromArrayWithMapper),
    eq,
    output,
  )
)
