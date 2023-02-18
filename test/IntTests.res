open RescriptCore

let eq = (a, b) => a == b

let catch = f =>
  try {
    let _ = f()
    failwith("no exception raised")
  } catch {
  | Exn.Error(err) => err
  }

Test.run(__POS_OF__("range - positive, increasing"), Int.range(3, 6), eq, [3, 4, 5])
Test.run(__POS_OF__("range - negative, increasing"), Int.range(-3, -1), eq, [-3, -2])
Test.run(__POS_OF__("range - cross-zero, incresing"), Int.range(-1, 2), eq, [-1, 0, 1])
Test.run(__POS_OF__("range - start == end"), Int.range(3, 3), eq, [])
Test.run(__POS_OF__("range - positive, decreasing"), Int.range(3, 1), eq, [3, 2])
Test.run(__POS_OF__("range - negative, decreasing"), Int.range(-1, -3), eq, [-1, -2])

Test.run(
  __POS_OF__("rangeWithOptions - positive, increasing, step 2"),
  Int.rangeWithOptions(3, 6, {step: 2}),
  eq,
  [3, 5],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, increasing, step 2"),
  Int.rangeWithOptions(3, 7, {step: 2}),
  eq,
  [3, 5],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, increasing, step 2"),
  Int.rangeWithOptions(3, 8, {step: 2}),
  eq,
  [3, 5, 7],
)
Test.run(
  __POS_OF__("rangeWithOptions - negative, increasing, step 2"),
  Int.rangeWithOptions(-6, -3, {step: 2}),
  eq,
  [-6, -4],
)
Test.run(
  __POS_OF__("rangeWithOptions - positive, increasing, step 0"),
  catch(() => Int.rangeWithOptions(3, 6, {step: 0})),
  eq,
  Error.RangeError.make("Incorrect range arguments"),
)
Test.run(
  __POS_OF__("rangeWithOptions - start == end, step 0"),
  Int.rangeWithOptions(3, 3, {step: 0}),
  eq,
  [],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, increasing, step -1"),
  Int.rangeWithOptions(3, 6, {step: -1}),
  eq,
  [],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, decreasing, step 1"),
  Int.rangeWithOptions(6, 3, {step: 1}),
  eq,
  [],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, decreasing, step -2"),
  Int.rangeWithOptions(6, 3, {step: -2}),
  eq,
  [6, 4],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, increasing, step -2"),
  Int.rangeWithOptions(6, 2, {step: -2}),
  eq,
  [6, 4],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, increasing, step -2"),
  Int.rangeWithOptions(6, 1, {step: -2}),
  eq,
  [6, 4, 2],
)
Test.run(
  __POS_OF__("rangeWithOptions + negative, decreasing, step -2"),
  Int.rangeWithOptions(-3, -6, {step: -2}),
  eq,
  [-3, -5],
)
Test.run(
  __POS_OF__("rangeWithOptions - positive, increasing, step 2, inclusive"),
  Int.rangeWithOptions(3, 6, {step: 2, inclusive: true}),
  eq,
  [3, 5],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, increasing, step 2, inclusive"),
  Int.rangeWithOptions(3, 7, {step: 2, inclusive: true}),
  eq,
  [3, 5, 7],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, increasing, step 2, inclusive"),
  Int.rangeWithOptions(3, 8, {step: 2, inclusive: true}),
  eq,
  [3, 5, 7],
)
Test.run(
  __POS_OF__("rangeWithOptions - negative, increasing, step 2, inclusive"),
  Int.rangeWithOptions(-6, -3, {step: 2, inclusive: true}),
  eq,
  [-6, -4],
)
Test.run(
  __POS_OF__("rangeWithOptions - positive, increasing, step 0, inclusive"),
  catch(() => Int.rangeWithOptions(3, 6, {step: 0, inclusive: true})),
  eq,
  Error.RangeError.make("Incorrect range arguments"),
)
Test.run(
  __POS_OF__("rangeWithOptions - start == end, step 0, inclusive"),
  Int.rangeWithOptions(3, 3, {step: 0, inclusive: true}),
  eq,
  [3],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, increasing, step -1, inclusive"),
  Int.rangeWithOptions(3, 6, {step: -1, inclusive: true}),
  eq,
  [],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, decreasing, step 1, inclusive"),
  Int.rangeWithOptions(6, 3, {step: 1, inclusive: true}),
  eq,
  [],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, decreasing, step -2, inclusive"),
  Int.rangeWithOptions(6, 3, {step: -2, inclusive: true}),
  eq,
  [6, 4],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, increasing, step -2, inclusive"),
  Int.rangeWithOptions(6, 2, {step: -2, inclusive: true}),
  eq,
  [6, 4, 2],
)
Test.run(
  __POS_OF__("rangeWithOptions + positive, increasing, step -2, inclusive"),
  Int.rangeWithOptions(6, 1, {step: -2, inclusive: true}),
  eq,
  [6, 4, 2],
)
Test.run(
  __POS_OF__("rangeWithOptions + negative, decreasing, step -2, inclusive"),
  Int.rangeWithOptions(-3, -6, {step: -2, inclusive: true}),
  eq,
  [-3, -5],
)
