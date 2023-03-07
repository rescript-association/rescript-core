// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Test from "./Test.mjs";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Pervasives from "rescript/lib/es6/pervasives.js";
import * as Core__Float from "../src/Core__Float.mjs";

var eq = Caml_obj.equal;

Test.run([
      [
        "FloatTests.res",
        5,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("4.2"), eq, 4.2);

Test.run([
      [
        "FloatTests.res",
        6,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("4.2foo"), eq, undefined);

Test.run([
      [
        "FloatTests.res",
        7,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("4,2"), eq, undefined);

Test.run([
      [
        "FloatTests.res",
        8,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("4 2"), eq, undefined);

Test.run([
      [
        "FloatTests.res",
        9,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("4_2"), eq, undefined);

Test.run([
      [
        "FloatTests.res",
        10,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("42"), eq, 42);

Test.run([
      [
        "FloatTests.res",
        11,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("  4.2  "), eq, 4.2);

Test.run([
      [
        "FloatTests.res",
        12,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString(".42"), eq, 0.42);

Test.run([
      [
        "FloatTests.res",
        13,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("4.2e1"), eq, 42);

Test.run([
      [
        "FloatTests.res",
        14,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("4.2E1"), eq, 42);

Test.run([
      [
        "FloatTests.res",
        15,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("4.2e+1"), eq, 42);

Test.run([
      [
        "FloatTests.res",
        16,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("4.2e-1"), eq, 0.42);

Test.run([
      [
        "FloatTests.res",
        17,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("0xF"), eq, 15);

Test.run([
      [
        "FloatTests.res",
        18,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("0777"), eq, 777);

Test.run([
      [
        "FloatTests.res",
        19,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("0o777"), eq, 511);

Test.run([
      [
        "FloatTests.res",
        20,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("0b101"), eq, 5);

Test.run([
      [
        "FloatTests.res",
        21,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("foo"), eq, undefined);

Test.run([
      [
        "FloatTests.res",
        22,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("NaN"), eq, undefined);

Test.run([
      [
        "FloatTests.res",
        23,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("Infinity"), eq, Pervasives.infinity);

Test.run([
      [
        "FloatTests.res",
        24,
        20,
        32
      ],
      "fromString"
    ], Core__Float.fromString("-Infinity"), eq, Pervasives.neg_infinity);

export {
  eq ,
}
/*  Not a pure module */
