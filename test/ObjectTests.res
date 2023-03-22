open RescriptCore

let eq = (a, b) => a == b

// ===== is =====

// Test.run(__POS_OF__("is: different types"), Object.is("abc", false), eq, false)

Test.run(__POS_OF__("is: ints"), Object.is(25, 25), eq, true)

Test.run(__POS_OF__("is: strings"), Object.is("abc", "abc"), eq, true)
Test.run(__POS_OF__("is: strings"), Object.is("abc", "ABC"), eq, false)

Test.run(__POS_OF__("is: null and undefined"), Object.is(null, undefined), eq, false)
Test.run(__POS_OF__("is: null and undefined"), Object.is(undefined, undefined), eq, true)
Test.run(__POS_OF__("is: null and undefined"), Object.is(null, null), eq, true)
// Test.run(__POS_OF__("is: null and undefined"), Object.is(null, None), eq, false)
// Test.run(__POS_OF__("is: undefined and None"), Object.is(undefined, None), eq, true)

let nums = [1, 2, 3]
Test.run(__POS_OF__("is: arrays"), Object.is([1, 2, 3], [1, 2, 3]), eq, false)
Test.run(__POS_OF__("is: arrays"), Object.is(nums, nums), eq, true)
Test.run(__POS_OF__("is: arrays"), [1, 2, 3] == [1, 2, 3], eq, true)
Test.run(__POS_OF__("is: arrays"), [1, 2, 3] === [1, 2, 3], eq, false)

Test.run(__POS_OF__("is: list"), Object.is(list{1, 2, 3}, list{1, 2, 3}), eq, false)
Test.run(__POS_OF__("is: list"), list{1, 2, 3} == list{1, 2, 3}, eq, true)
Test.run(__POS_OF__("is: list"), list{1, 2, 3} === list{1, 2, 3}, eq, false)

let d = Date.makeWithYM(~year=2000, ~month=1)
Test.run(
  __POS_OF__("is: date"),
  Object.is(Date.makeWithYM(~year=2000, ~month=1), Date.makeWithYM(~year=2000, ~month=1)),
  eq,
  false,
)
Test.run(__POS_OF__("is: date"), Object.is(d, d), eq, true)

let x = {"a": 1}
Test.run(__POS_OF__("is: objects"), Object.is(x, x), eq, true)
Test.run(__POS_OF__("is: objects"), Object.is({"a": 1}, {"a": 1}), eq, false)
Test.run(__POS_OF__("is: objects"), Object.is(Object.empty(), Object.empty()), eq, false) // hmm...
Test.run(__POS_OF__("is: === and == operator"), x === x, eq, true)
Test.run(__POS_OF__("is: === and == operator"), x == x, eq, true)
Test.run(__POS_OF__("is: === and == operator"), {"a": 1} == {"a": 1}, eq, true)

Test.run(__POS_OF__("is: zeros"), Object.is(-0, -0), eq, true)
Test.run(__POS_OF__("is: zeros"), Object.is(-0.0, -0.0), eq, true)
Test.run(__POS_OF__("is: zeros"), Object.is(0.0, -0.0), eq, false)

let mkBig = s => BigInt.fromString(s)
Test.run(__POS_OF__("is: bigint"), Object.is(mkBig("123456789"), mkBig("123456789")), eq, true)
Test.run(__POS_OF__("is: bigint"), Object.is(mkBig("123489"), mkBig("123456789")), eq, false)
Test.run(__POS_OF__("is: bigint"), Object.is(mkBig("000000000"), mkBig("0")), eq, true)
Test.run(__POS_OF__("is: bigint"), mkBig("123") == mkBig("123"), eq, true)
Test.run(__POS_OF__("is: bigint"), mkBig("123") === mkBig("123"), eq, true)
