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
        7,
        20,
        42
      ],
      "getUnsafe - existing"
    ], 1, eq, 1);

Test.run([
      [
        "ArrayTests.res",
        8,
        20,
        41
      ],
      "getUnsafe - missing"
    ], [
        0,
        1,
        2
      ][10], eq, undefined);

Test.run([
      [
        "ArrayTests.res",
        11,
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
        17,
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
        18,
        20,
        36
      ],
      "reduce - empty"
    ], Core__Array.reduce([], /* [] */0, Core__List.add), eq, /* [] */0);

Test.run([
      [
        "ArrayTests.res",
        21,
        13,
        30
      ],
      "reduceWithIndex"
    ], Core__Array.reduceWithIndex([
          1,
          2,
          3
        ], /* [] */0, (function (acc, v, i) {
            return {
                    hd: v + i | 0,
                    tl: acc
                  };
          })), eq, {
      hd: 5,
      tl: {
        hd: 3,
        tl: {
          hd: 1,
          tl: /* [] */0
        }
      }
    });

Test.run([
      [
        "ArrayTests.res",
        27,
        13,
        38
      ],
      "reduceWithIndex - empty"
    ], Core__Array.reduceWithIndex([], /* [] */0, (function (acc, v, i) {
            return {
                    hd: v + i | 0,
                    tl: acc
                  };
          })), eq, /* [] */0);

Test.run([
      [
        "ArrayTests.res",
        34,
        13,
        26
      ],
      "reduceRight"
    ], Core__Array.reduceRight([
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
        39,
        20,
        41
      ],
      "reduceRight - empty"
    ], Core__Array.reduceRight([], /* [] */0, Core__List.add), eq, /* [] */0);

Test.run([
      [
        "ArrayTests.res",
        42,
        13,
        35
      ],
      "reduceEightWithIndex"
    ], Core__Array.reduceRightWithIndex([
          1,
          2,
          3
        ], /* [] */0, (function (acc, v, i) {
            return {
                    hd: v + i | 0,
                    tl: acc
                  };
          })), eq, {
      hd: 1,
      tl: {
        hd: 3,
        tl: {
          hd: 5,
          tl: /* [] */0
        }
      }
    });

Test.run([
      [
        "ArrayTests.res",
        48,
        13,
        38
      ],
      "reduceWithIndex - empty"
    ], Core__Array.reduceRightWithIndex([], /* [] */0, (function (acc, v, i) {
            return {
                    hd: v + i | 0,
                    tl: acc
                  };
          })), eq, /* [] */0);

Test.run([
      [
        "ArrayTests.res",
        54,
        20,
        41
      ],
      "toShuffled - length"
    ], Core__Array.toShuffled([
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
        57,
        13,
        31
      ],
      "shuffle - length"
    ], (Core__Array.shuffle(arr), arr.length), eq, 3);

Test.run([
      [
        "ArrayTests.res",
        68,
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
        73,
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
        75,
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
        81,
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
        83,
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
        88,
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
        89,
        20,
        38
      ],
      "keepSome - empty"
    ], Core__Array.keepSome([]), eq, []);

Test.run([
      [
        "ArrayTests.res",
        92,
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
        97,
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
        99,
        13,
        30
      ],
      "findMap - empty"
    ], Core__Array.findMap([], (function (n) {
            if (n % 2 === 0) {
              return Math.imul(n, n);
            }
            
          })), eq, undefined);

Test.run([
      [
        "ArrayTests.res",
        106,
        13,
        27
      ],
      "fromIterator"
    ], Array.from(new Map([
                [
                  1,
                  3
                ],
                [
                  2,
                  4
                ]
              ]).values()), eq, [
      3,
      4
    ]);

export {
  eq ,
}
/*  Not a pure module */
