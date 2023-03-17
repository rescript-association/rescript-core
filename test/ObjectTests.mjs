// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Test from "./Test.mjs";
import * as Curry from "rescript/lib/es6/curry.js";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Core__Option from "../src/Core__Option.mjs";

var eq = Caml_obj.equal;

function runGetTest(i) {
  Test.run([
        [
          "ObjectTests.res",
          15,
          22,
          46
        ],
        "Object.get: " + i.title + ""
      ], Curry._1(i.get, Curry._1(i.source, undefined)), eq, i.expected);
}

runGetTest({
      title: "prop exists, return Some",
      source: (function (param) {
          return {
                  a: 1
                };
        }),
      get: (function (__x) {
          return __x["a"];
        }),
      expected: 1
    });

runGetTest({
      title: "prop NOT exist, return None",
      source: (function (param) {
          return {
                  a: 1
                };
        }),
      get: (function (i) {
          return i["banana"];
        }),
      expected: undefined
    });

runGetTest({
      title: "prop like toString, return Some",
      source: (function (param) {
          return {
                  a: 1
                };
        }),
      get: (function (i) {
          return Core__Option.isSome(i["toString"]);
        }),
      expected: true
    });

runGetTest({
      title: "prop exist but explicitly undefined, return None",
      source: (function (param) {
          return {
                  a: undefined
                };
        }),
      get: (function (i) {
          return i["a"];
        }),
      expected: undefined
    });

runGetTest({
      title: "prop exist but explicitly null, return None",
      source: (function (param) {
          return {
                  a: null
                };
        }),
      get: (function (i) {
          return i["a"];
        }),
      expected: null
    });

runGetTest({
      title: "prop exists and is an array, can get it",
      source: (function (param) {
          return {
                  a: [
                    1,
                    2,
                    3
                  ]
                };
        }),
      get: (function (i) {
          return Core__Option.getWithDefault(Core__Option.map(i["a"], (function (i) {
                            return i.concat([
                                        4,
                                        5
                                      ]);
                          })), []);
        }),
      expected: [
        1,
        2,
        3,
        4,
        5
      ]
    });

export {
  eq ,
  runGetTest ,
}
/*  Not a pure module */
