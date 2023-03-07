open RescriptCore

let eq = (a, b) => a == b

Test.run(__POS_OF__("fromString"), Float.fromString("4.2"), eq, Some(4.2))
Test.run(__POS_OF__("fromString"), Float.fromString("4.2foo"), eq, Some(4.2))
Test.run(__POS_OF__("fromString"), Float.fromString("4,2"), eq, Some(4.))
Test.run(__POS_OF__("fromString"), Float.fromString("4 2"), eq, Some(4.))
Test.run(__POS_OF__("fromString"), Float.fromString("4_2"), eq, Some(4.))
Test.run(__POS_OF__("fromString"), Float.fromString("42"), eq, Some(42.))
Test.run(__POS_OF__("fromString"), Float.fromString("  4.2  "), eq, Some(4.2))
Test.run(__POS_OF__("fromString"), Float.fromString(".42"), eq, Some(0.42))
Test.run(__POS_OF__("fromString"), Float.fromString("4.2e1"), eq, Some(42.))
Test.run(__POS_OF__("fromString"), Float.fromString("4.2E1"), eq, Some(42.))
Test.run(__POS_OF__("fromString"), Float.fromString("4.2e+1"), eq, Some(42.))
Test.run(__POS_OF__("fromString"), Float.fromString("4.2e-1"), eq, Some(0.42))
Test.run(__POS_OF__("fromString"), Float.fromString("0xF"), eq, Some(0.))
Test.run(__POS_OF__("fromString"), Float.fromString("0777"), eq, Some(777.))
Test.run(__POS_OF__("fromString"), Float.fromString("0o777"), eq, Some(0.))
Test.run(__POS_OF__("fromString"), Float.fromString("0b101"), eq, Some(0.))
Test.run(__POS_OF__("fromString"), Float.fromString("foo"), eq, None)
Test.run(__POS_OF__("fromString"), Float.fromString("NaN"), eq, None)
Test.run(__POS_OF__("fromString"), Float.fromString("Infinity"), eq, Some(infinity))
Test.run(__POS_OF__("fromString"), Float.fromString("-Infinity"), eq, Some(neg_infinity))
