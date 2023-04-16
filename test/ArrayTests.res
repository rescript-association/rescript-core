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

Test.run(__POS_OF__("shuffle - length"), Array.shuffle([1, 2, 3])->Array.length, eq, 3)

Test.run(
  __POS_OF__("shuffleInPlace - length"),
  {
    let arr = [1, 2, 3]
    Array.shuffleInPlace(arr)
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

Test.run(__POS_OF__("lastIndexOf"), [3, 5, 7, 5, 8]->Array.lastIndexOf(5), eq, 3)
Test.run(__POS_OF__("lastIndexOf"), [3, 5, 7, 5, 8]->Array.lastIndexOf(100), eq, -1)
Test.run(__POS_OF__("lastIndexOf"), []->Array.lastIndexOf(100), eq, -1)
Test.run(__POS_OF__("lastIndexOf"), [{"a": 1}]->Array.lastIndexOf({"a": 1}), eq, -1)

Test.run(__POS_OF__("lastIndexOfOpt"), [3, 5, 7, 5, 8]->Array.lastIndexOfOpt(5), eq, Some(3))
Test.run(__POS_OF__("lastIndexOfOpt"), [3, 5, 7, 5, 8]->Array.lastIndexOfOpt(100), eq, None)
Test.run(__POS_OF__("lastIndexOfOpt"), []->Array.lastIndexOfOpt(100), eq, None)
Test.run(__POS_OF__("lastIndexOfOpt"), [{"a": 1}]->Array.lastIndexOfOpt({"a": 1}), eq, None)

Test.run(__POS_OF__("lastIndexOfFrom"), [3, 5, 7, 5, 8]->Array.lastIndexOfFrom(5, -3), eq, 1)
Test.run(__POS_OF__("lastIndexOfFrom"), [3, 5, 7, 5, 8]->Array.lastIndexOfFrom(5, 4), eq, 3)
Test.run(__POS_OF__("lastIndexOfFrom"), [3, 5, 7, 5, 8]->Array.lastIndexOfFrom(5, 0), eq, -1)

Test.run(__POS_OF__("findLast"), [3, 5, 7, 5, 8]->Array.findLast(i => i < 8), eq, Some(5))
Test.run(__POS_OF__("findLast"), []->Array.findLast(_ => true), eq, None)
Test.run(__POS_OF__("findLast"), [3, 5, 7, 5, 8]->Array.findLast(i => i > 100), eq, None)

Test.run(__POS_OF__("findLastIndex"), [3, 5, 7, 5, 8]->Array.findLastIndex(i => i == 5), eq, 3)
Test.run(__POS_OF__("findLastIndex"), [3, 5, 7, 5, 8]->Array.findLastIndex(i => i > 100), eq, -1)
Test.run(__POS_OF__("findLastIndex"), []->Array.findLastIndex(_ => true), eq, -1)

Test.run(
  __POS_OF__("findLastIndexOpt"),
  [3, 5, 7, 5, 8]->Array.findLastIndexOpt(i => i == 5),
  eq,
  Some(3),
)
Test.run(
  __POS_OF__("findLastIndexOpt"),
  [3, 5, 7, 5, 8]->Array.findLastIndexOpt(i => i > 100),
  eq,
  None,
)
Test.run(__POS_OF__("findLastIndexOpt"), []->Array.findLastIndexOpt(_ => true), eq, None)

Test.run(
  __POS_OF__("findLastIndexWithIndex"),
  [3, 5, 7, 5, 8]->Array.findLastIndexWithIndex((val, inx) => val == 5 && inx <= 2),
  eq,
  1,
)
Test.run(
  __POS_OF__("findLastIndexWithIndex"),
  [3, 5, 7, 5, 8]->Array.findLastIndexWithIndex((val, inx) => val == 5 && inx >= 1),
  eq,
  3,
)
Test.run(
  __POS_OF__("findLastIndexWithIndex"),
  [3, 5, 7, 5, 8]->Array.findLastIndexWithIndex((val, inx) => val >= 8 && inx < 2),
  eq,
  -1,
)
