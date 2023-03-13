open RescriptCore

let eq = (a, b) => a == b

// ========
// mapError
// ========

Test.run(__POS_OF__("mapError: if ok, return it"), Ok(5)->Result.mapError(i => i * 3), eq, Ok(5))

Test.run(
  __POS_OF__("mapError: if error, apply f"),
  Error(5)->Result.mapError(i => i * 3),
  eq,
  Error(15),
)
