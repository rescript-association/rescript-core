// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Test from "./Test.mjs";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Core__List from "../src/Core__List.mjs";
import * as Core__Array from "../src/Core__Array.mjs";

var eq = Caml_obj.equal;

Test.run([
      [
        "ArrayTests.res",
        5,
        20,
        26
      ],
      "make"
    ], Core__Array.make(6, 7), eq, [
      7,
      7,
      7,
      7,
      7,
      7
    ]);

Test.run([
      [
        "ArrayTests.res",
        8,
        13,
        30
      ],
      "fromInitializer"
    ], Core__Array.fromInitializer(7, (function (i) {
            return i + 3 | 0;
          })), eq, [
      3,
      4,
      5,
      6,
      7,
      8,
      9
    ]);

Test.run([
      [
        "ArrayTests.res",
        14,
        20,
        28
      ],
      "reduce"
    ], Core__Array.reduce([
          1,
          2,
          3
        ], /* [] */0, Core__List.add), eq, {
      hd: 3,
      tl: {
        hd: 2,
        tl: {
          hd: 1,
          tl: /* [] */0
        }
      }
    });

Test.run([
      [
        "ArrayTests.res",
        15,
        20,
        36
      ],
      "reduce - empty"
    ], Core__Array.reduce([], /* [] */0, Core__List.add), eq, /* [] */0);

Test.run([
      [
        "ArrayTests.res",
        18,
        13,
        28
      ],
      "reduceReverse"
    ], Core__Array.reduceReverse([
          1,
          2,
          3
        ], /* [] */0, Core__List.add), eq, {
      hd: 1,
      tl: {
        hd: 2,
        tl: {
          hd: 3,
          tl: /* [] */0
        }
      }
    });

Test.run([
      [
        "ArrayTests.res",
        23,
        20,
        43
      ],
      "reduceReverse - empty"
    ], Core__Array.reduceReverse([], /* [] */0, Core__List.add), eq, /* [] */0);

Test.run([
      [
        "ArrayTests.res",
        25,
        20,
        38
      ],
      "shuffle - length"
    ], Core__Array.shuffle([
          1,
          2,
          3
        ]).length, eq, 3);

var arr = [
  1,
  2,
  3
];

Test.run([
      [
        "ArrayTests.res",
        28,
        13,
        38
      ],
      "shuffleInPlace - length"
    ], (Core__Array.shuffleInPlace(arr), arr.length), eq, 3);

Test.run([
      [
        "ArrayTests.res",
        39,
        13,
        24
      ],
      "filterMap"
    ], Core__Array.filterMap([
          1,
          2,
          3,
          4,
          5,
          6
        ], (function (n) {
            if (n % 2 === 0) {
              return Math.imul(n, n);
            }
            
          })), eq, [
      4,
      16,
      36
    ]);

Test.run([
      [
        "ArrayTests.res",
        44,
        20,
        42
      ],
      "filterMap - no match"
    ], Core__Array.filterMap([
          1,
          2,
          3,
          4,
          5,
          6
        ], (function (param) {
            
          })), eq, []);

Test.run([
      [
        "ArrayTests.res",
        46,
        13,
        32
      ],
      "filterMap - empty"
    ], Core__Array.filterMap([], (function (n) {
            if (n % 2 === 0) {
              return Math.imul(n, n);
            }
            
          })), eq, []);

Test.run([
      [
        "ArrayTests.res",
        52,
        20,
        30
      ],
      "keepSome"
    ], Core__Array.keepSome([
          1,
          undefined,
          3
        ]), eq, [
      1,
      3
    ]);

Test.run([
      [
        "ArrayTests.res",
        54,
        13,
        34
      ],
      "keepSome - all Some"
    ], Core__Array.keepSome([
          1,
          2,
          3
        ]), eq, [
      1,
      2,
      3
    ]);

Test.run([
      [
        "ArrayTests.res",
        59,
        20,
        41
      ],
      "keepSome - all None"
    ], Core__Array.keepSome([
          undefined,
          undefined,
          undefined
        ]), eq, []);

Test.run([
      [
        "ArrayTests.res",
        60,
        20,
        38
      ],
      "keepSome - empty"
    ], Core__Array.keepSome([]), eq, []);

Test.run([
      [
        "ArrayTests.res",
        63,
        13,
        22
      ],
      "findMap"
    ], Core__Array.findMap([
          1,
          2,
          3,
          4,
          5,
          6
        ], (function (n) {
            if (n % 2 === 0) {
              return n - 8 | 0;
            }
            
          })), eq, -6);

Test.run([
      [
        "ArrayTests.res",
        68,
        20,
        40
      ],
      "findMap - no match"
    ], Core__Array.findMap([
          1,
          2,
          3,
          4,
          5,
          6
        ], (function (param) {
            
          })), eq, undefined);

Test.run([
      [
        "ArrayTests.res",
        70,
        13,
        30
      ],
      "findMap - empty"
    ], Core__Array.findMap([], (function (n) {
            if (n % 2 === 0) {
              return Math.imul(n, n);
            }
            
          })), eq, undefined);

export {
  eq ,
}
/*  Not a pure module */
