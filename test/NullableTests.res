open RescriptCore

let eq = (a, b) => a == b

// ===== isNull, isUndefined, isNullOrUndefined =====

Test.run(__POS_OF__("isNull when null"), Nullable.null->Nullable.isNull, eq, true)
Test.run(__POS_OF__("isNull when undef"), Nullable.undefined->Nullable.isNull, eq, false)
Test.run(__POS_OF__("isNull when abc"), "abc"->Nullable.make->Nullable.isNull, eq, false)
Test.run(__POS_OF__("isNull when None"), None->Nullable.make->Nullable.isNull, eq, false)

Test.run(__POS_OF__("isUndef when null"), Nullable.null->Nullable.isUndefined, eq, false)
Test.run(__POS_OF__("isUndef when undef"), Nullable.undefined->Nullable.isUndefined, eq, true)
Test.run(__POS_OF__("isUndef when abc"), "abc"->Nullable.make->Nullable.isUndefined, eq, false)
Test.run(__POS_OF__("isUndef when None"), None->Nullable.make->Nullable.isUndefined, eq, true)

Test.run(__POS_OF__("isNullOrUndef when null"), Nullable.null->Nullable.isNullOrUndefined, eq, true)
Test.run(
  __POS_OF__("isNullOrUndef when undef"),
  Nullable.undefined->Nullable.isNullOrUndefined,
  eq,
  true,
)
Test.run(
  __POS_OF__("isNullOrUndef when abc"),
  "abc"->Nullable.make->Nullable.isNullOrUndefined,
  eq,
  false,
)
Test.run(
  __POS_OF__("isNullOrUndef when None"),
  None->Nullable.make->Nullable.isNullOrUndefined,
  eq,
  true,
)

Test.run(__POS_OF__("isNull when null using Null module"), Null.null->Null.isNull, eq, true)
Test.run(
  __POS_OF__("isNull when undef using Null module"),
  Nullable.undefined->Null.make->Null.isNull,
  eq,
  false,
)
Test.run(__POS_OF__("isNull when abc using Null module"), "abc"->Null.make->Null.isNull, eq, false)
Test.run(__POS_OF__("isNull when None using Null module"), None->Null.make->Null.isNull, eq, false)
