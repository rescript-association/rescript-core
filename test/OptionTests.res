open RescriptCore

let eq = (a, b) => a == b

// ======================
// isSomeAnd and isNoneOr
// ======================

let isPositive = i => i > 0

Test.run(
  __POS_OF__("isSomeAnd: if None, return false"),
  None->Option.isSomeAnd(isPositive),
  eq,
  false,
)

Test.run(
  __POS_OF__("isSomeAnd: if Some and true, return true"),
  Some(1)->Option.isSomeAnd(isPositive),
  eq,
  true,
)
Test.run(
  __POS_OF__("isSomeAnd: if Some and false, return false"),
  Some(-1)->Option.isSomeAnd(isPositive),
  eq,
  false,
)

Test.run(__POS_OF__("isNoneOr: if None, return true"), None->Option.isNoneOr(isPositive), eq, true)
Test.run(
  __POS_OF__("isNoneOr: if Some and true, return true"),
  Some(1)->Option.isNoneOr(isPositive),
  eq,
  true,
)
Test.run(
  __POS_OF__("isNoneOr: if Some and false, return false"),
  Some(-1)->Option.isNoneOr(isPositive),
  eq,
  false,
)
