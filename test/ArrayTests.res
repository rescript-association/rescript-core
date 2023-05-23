open RescriptCore

let eq = (a, b) => a == b

Test.run(__POS_OF__("make"), Array.make(~length=6, 7), eq, [7, 7, 7, 7, 7, 7])

Test.run(
  __POS_OF__("fromInitializer"),
  Array.fromInitializer(~length=7, i => i + 3),
  eq,
  [3, 4, 5, 6, 7, 8, 9],
)

Test.run(__POS_OF__("reduce"), Array.reduce([1, 2, 3], list{}, List.add), eq, list{3, 2, 1})
Test.run(__POS_OF__("reduce - empty"), Array.reduce([], list{}, List.add), eq, list{})

Test.run(
  __POS_OF__("reduceWithIndex"),
  Array.reduceWithIndex([1, 2, 3], list{}, (acc, v, i) => list{v + i, ...acc}),
  eq,
  list{5, 3, 1},
)
Test.run(
  __POS_OF__("reduceWithIndex - empty"),
  Array.reduceWithIndex([], list{}, (acc, v, i) => list{v + i, ...acc}),
  eq,
  list{},
)

Test.run(
  __POS_OF__("reduceRight"),
  Array.reduceRight([1, 2, 3], list{}, List.add),
  eq,
  list{1, 2, 3},
)
Test.run(__POS_OF__("reduceRight - empty"), Array.reduceRight([], list{}, List.add), eq, list{})

Test.run(
  __POS_OF__("reduceEightWithIndex"),
  Array.reduceRightWithIndex([1, 2, 3], list{}, (acc, v, i) => list{v + i, ...acc}),
  eq,
  list{1, 3, 5},
)
Test.run(
  __POS_OF__("reduceWithIndex - empty"),
  Array.reduceRightWithIndex([], list{}, (acc, v, i) => list{v + i, ...acc}),
  eq,
  list{},
)

Test.run(__POS_OF__("toShuffled - length"), Array.toShuffled([1, 2, 3])->Array.length, eq, 3)

Test.run(
  __POS_OF__("shuffle - length"),
  {
    let arr = [1, 2, 3]
    Array.shuffle(arr)
    arr->Array.length
  },
  eq,
  3,
)

Test.run(
  __POS_OF__("filterMap"),
  Array.filterMap([1, 2, 3, 4, 5, 6], n => mod(n, 2) == 0 ? Some(n * n) : None),
  eq,
  [4, 16, 36],
)
Test.run(__POS_OF__("filterMap - no match"), Array.filterMap([1, 2, 3, 4, 5, 6], _ => None), eq, [])
Test.run(
  __POS_OF__("filterMap - empty"),
  Array.filterMap([], n => mod(n, 2) == 0 ? Some(n * n) : None),
  eq,
  [],
)

Test.run(__POS_OF__("keepSome"), Array.keepSome([Some(1), None, Some(3)]), eq, [1, 3])
Test.run(
  __POS_OF__("keepSome - all Some"),
  Array.keepSome([Some(1), Some(2), Some(3)]),
  eq,
  [1, 2, 3],
)
Test.run(__POS_OF__("keepSome - all None"), Array.keepSome([None, None, None]), eq, [])
Test.run(__POS_OF__("keepSome - empty"), Array.keepSome([]), eq, [])

Test.run(
  __POS_OF__("findMap"),
  Array.findMap([1, 2, 3, 4, 5, 6], n => mod(n, 2) == 0 ? Some(n - 8) : None),
  eq,
  Some(-6),
)
Test.run(__POS_OF__("findMap - no match"), Array.findMap([1, 2, 3, 4, 5, 6], _ => None), eq, None)
Test.run(
  __POS_OF__("findMap - empty"),
  Array.findMap([], n => mod(n, 2) == 0 ? Some(n * n) : None),
  eq,
  None,
)
