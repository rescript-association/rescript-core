open RescriptCore

let eq = (a, b) => a == b

Test.run(__POS_OF__("all"), Option.all([]), eq, Some([]))
Test.run(__POS_OF__("all"), Option.all([Some(1), Some(2), Some(3)]), eq, Some([1, 2, 3]))
Test.run(__POS_OF__("all"), Option.all([Some(1), None]), eq, None)
