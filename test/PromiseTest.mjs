// Generated by ReScript, PLEASE EDIT WITH CARE

import * as Test from "./Test.mjs";
import * as Js_exn from "rescript/lib/es6/js_exn.js";
import * as Caml_obj from "rescript/lib/es6/caml_obj.js";
import * as Core__Promise from "../src/Core__Promise.mjs";
import * as Caml_exceptions from "rescript/lib/es6/caml_exceptions.js";

var TestError = /* @__PURE__ */Caml_exceptions.create("PromiseTest.TestError");

var fail = Js_exn.raiseError;

var equal = Caml_obj.equal;

function resolveTest() {
  Promise.resolve("test").then(function (str) {
        Test.run([
              [
                "PromiseTest.res",
                19,
                26,
                47
              ],
              "Should resolve test"
            ], str, equal, "test");
        return Promise.resolve();
      });
}

function runTests() {
  resolveTest();
}

var Creation = {
  resolveTest: resolveTest,
  runTests: runTests
};

function testThen() {
  return Promise.resolve(1).then(function (first) {
                return Promise.resolve(first + 1 | 0);
              }).then(function (value) {
              Test.run([
                    [
                      "PromiseTest.res",
                      41,
                      26,
                      39
                    ],
                    "Should be 2"
                  ], value, equal, 2);
              return Promise.resolve();
            });
}

function testInvalidThen() {
  return Promise.resolve(1).then(function (first) {
                return Promise.resolve(Promise.resolve(first + 1 | 0));
              }).then(function (p) {
              var isPromise = typeof p === "object";
              Test.run([
                    [
                      "PromiseTest.res",
                      56,
                      26,
                      51
                    ],
                    "Should not be a promise"
                  ], isPromise, equal, false);
              return Promise.resolve();
            });
}

function testThenResolve() {
  return Promise.resolve(1).then(function (num) {
                return num + 1 | 0;
              }).then(function (ret) {
              Test.run([
                    [
                      "PromiseTest.res",
                      69,
                      26,
                      39
                    ],
                    "Should be 2"
                  ], ret, equal, 2);
            });
}

function testInvalidThenResolve() {
  return Promise.resolve(1).then(function (num) {
                return Promise.resolve(num);
              }).then(function (p) {
              var isPromise = typeof p === "object";
              Test.run([
                    [
                      "PromiseTest.res",
                      83,
                      26,
                      51
                    ],
                    "Should not be a promise"
                  ], isPromise, equal, false);
              return Promise.resolve();
            });
}

function runTests$1() {
  testThen();
  testInvalidThen();
  testThenResolve();
  testInvalidThenResolve();
}

var ThenChaining = {
  testThen: testThen,
  testInvalidThen: testInvalidThen,
  testThenResolve: testThenResolve,
  testInvalidThenResolve: testInvalidThenResolve,
  runTests: runTests$1
};

function testExnRejection() {
  Core__Promise.$$catch(Promise.reject({
            RE_EXN_ID: TestError,
            _1: "oops"
          }), (function (e) {
          Test.run([
                [
                  "PromiseTest.res",
                  105,
                  26,
                  30
                ],
                "Expect rejection to contain a TestError"
              ], e, equal, {
                RE_EXN_ID: TestError,
                _1: "oops"
              });
          return Promise.resolve();
        }));
}

function runTests$2() {
  testExnRejection();
}

var Rejection = {
  testExnRejection: testExnRejection,
  runTests: runTests$2
};

var asyncParseFail = (function() {
    return new Promise((resolve) => {
      var result = JSON.parse("{..");
      return resolve(result);
    })
  });

function testExternalPromiseThrow() {
  return Core__Promise.$$catch(asyncParseFail().then(function (param) {
                  return Promise.resolve();
                }), (function (e) {
                var success = e.RE_EXN_ID === Js_exn.$$Error ? Caml_obj.equal(e._1.name, "SyntaxError") : false;
                Test.run([
                      [
                        "PromiseTest.res",
                        139,
                        26,
                        76
                      ],
                      "Should be a parser error with Unexpected token ."
                    ], success, equal, true);
                return Promise.resolve();
              }));
}

function testExnThrow() {
  return Core__Promise.$$catch(Promise.resolve().then(function () {
                  throw {
                        RE_EXN_ID: TestError,
                        _1: "Thrown exn",
                        Error: new Error()
                      };
                }), (function (e) {
                var isTestErr = e.RE_EXN_ID === TestError && e._1 === "Thrown exn" ? true : false;
                Test.run([
                      [
                        "PromiseTest.res",
                        158,
                        26,
                        49
                      ],
                      "Should be a TestError"
                    ], isTestErr, equal, true);
                return Promise.resolve();
              }));
}

function testRaiseErrorThrow() {
  return Core__Promise.$$catch(Promise.resolve().then(function () {
                  return Js_exn.raiseError("Some JS error");
                }), (function (e) {
                var isTestErr = e.RE_EXN_ID === Js_exn.$$Error ? Caml_obj.equal(e._1.message, "Some JS error") : false;
                Test.run([
                      [
                        "PromiseTest.res",
                        181,
                        26,
                        51
                      ],
                      "Should be some JS error"
                    ], isTestErr, equal, true);
                return Promise.resolve();
              }));
}

function thenAfterCatch() {
  return Core__Promise.$$catch(Promise.resolve().then(function () {
                    return Promise.reject({
                                RE_EXN_ID: TestError,
                                _1: "some rejected value"
                              });
                  }), (function (e) {
                  var tmp;
                  tmp = e.RE_EXN_ID === TestError && e._1 === "some rejected value" ? "success" : "not a test error";
                  return Promise.resolve(tmp);
                })).then(function (msg) {
              Test.run([
                    [
                      "PromiseTest.res",
                      204,
                      26,
                      45
                    ],
                    "Should be success"
                  ], msg, equal, "success");
              return Promise.resolve();
            });
}

function testCatchFinally() {
  var wasCalled = {
    contents: false
  };
  Core__Promise.$$catch(Promise.resolve(5).then(function (param) {
                  return Promise.reject({
                              RE_EXN_ID: TestError,
                              _1: "test"
                            });
                }).then(function () {
                return Promise.resolve(v);
              }), (function (param) {
              return Promise.resolve();
            })).finally(function () {
          wasCalled.contents = true;
        }).then(function () {
        Test.run([
              [
                "PromiseTest.res",
                226,
                26,
                48
              ],
              "value should be unit"
            ], v$1, equal, undefined);
        Test.run([
              [
                "PromiseTest.res",
                227,
                26,
                59
              ],
              "finally should have been called"
            ], wasCalled.contents, equal, true);
        return Promise.resolve();
      });
}

function testResolveFinally() {
  var wasCalled = {
    contents: false
  };
  Promise.resolve(5).then(function (v) {
            return Promise.resolve(v + 5 | 0);
          }).finally(function () {
          wasCalled.contents = true;
        }).then(function (v) {
        Test.run([
              [
                "PromiseTest.res",
                244,
                26,
                45
              ],
              "value should be 5"
            ], v, equal, 10);
        Test.run([
              [
                "PromiseTest.res",
                245,
                26,
                59
              ],
              "finally should have been called"
            ], wasCalled.contents, equal, true);
        return Promise.resolve();
      });
}

function runTests$3() {
  testExternalPromiseThrow();
  testExnThrow();
  testRaiseErrorThrow();
  thenAfterCatch();
  testCatchFinally();
  testResolveFinally();
}

var Catching = {
  asyncParseFail: asyncParseFail,
  testExternalPromiseThrow: testExternalPromiseThrow,
  testExnThrow: testExnThrow,
  testRaiseErrorThrow: testRaiseErrorThrow,
  thenAfterCatch: thenAfterCatch,
  testCatchFinally: testCatchFinally,
  testResolveFinally: testResolveFinally,
  runTests: runTests$3
};

function testParallel() {
  var place = {
    contents: 0
  };
  var delayedMsg = function (ms, msg) {
    return new Promise((function (resolve, param) {
                  setTimeout((function () {
                          place.contents = place.contents + 1 | 0;
                          resolve([
                                place.contents,
                                msg
                              ]);
                        }), ms);
                }));
  };
  var p1 = delayedMsg(1000, "is Anna");
  var p2 = delayedMsg(500, "myName");
  var p3 = delayedMsg(100, "Hi");
  return Promise.all([
                p1,
                p2,
                p3
              ]).then(function (arr) {
              var exp = [
                [
                  3,
                  "is Anna"
                ],
                [
                  2,
                  "myName"
                ],
                [
                  1,
                  "Hi"
                ]
              ];
              Test.run([
                    [
                      "PromiseTest.res",
                      282,
                      26,
                      55
                    ],
                    "Should have correct placing"
                  ], arr, equal, exp);
              return Promise.resolve();
            });
}

function testRace() {
  var racer = function (ms, name) {
    return new Promise((function (resolve, param) {
                  setTimeout((function () {
                          resolve(name);
                        }), ms);
                }));
  };
  var promises = [
    racer(1000, "Turtle"),
    racer(500, "Hare"),
    racer(100, "Eagle")
  ];
  return Promise.race(promises).then(function (winner) {
              Test.run([
                    [
                      "PromiseTest.res",
                      301,
                      26,
                      44
                    ],
                    "Eagle should win"
                  ], winner, equal, "Eagle");
              return Promise.resolve();
            });
}

function testParallel2() {
  var place = {
    contents: 0
  };
  var delayedMsg = function (ms, msg) {
    return new Promise((function (resolve, param) {
                  setTimeout((function () {
                          place.contents = place.contents + 1 | 0;
                          resolve([
                                place.contents,
                                msg
                              ]);
                        }), ms);
                }));
  };
  var p1 = delayedMsg(1000, "is Anna");
  var p2 = delayedMsg(500, "myName");
  return Promise.all([
                p1,
                p2
              ]).then(function (arr) {
              Test.run([
                    [
                      "PromiseTest.res",
                      325,
                      26,
                      55
                    ],
                    "Should have correct placing"
                  ], arr, equal, [
                    [
                      2,
                      "is Anna"
                    ],
                    [
                      1,
                      "myName"
                    ]
                  ]);
              return Promise.resolve();
            });
}

function testParallel3() {
  var place = {
    contents: 0
  };
  var delayedMsg = function (ms, msg) {
    return new Promise((function (resolve, param) {
                  setTimeout((function () {
                          place.contents = place.contents + 1 | 0;
                          resolve([
                                place.contents,
                                msg
                              ]);
                        }), ms);
                }));
  };
  var p1 = delayedMsg(1000, "is Anna");
  var p2 = delayedMsg(500, "myName");
  var p3 = delayedMsg(100, "Hi");
  return Promise.all([
                p1,
                p2,
                p3
              ]).then(function (arr) {
              Test.run([
                    [
                      "PromiseTest.res",
                      350,
                      26,
                      55
                    ],
                    "Should have correct placing"
                  ], arr, equal, [
                    [
                      3,
                      "is Anna"
                    ],
                    [
                      2,
                      "myName"
                    ],
                    [
                      1,
                      "Hi"
                    ]
                  ]);
              return Promise.resolve();
            });
}

function testParallel4() {
  var place = {
    contents: 0
  };
  var delayedMsg = function (ms, msg) {
    return new Promise((function (resolve, param) {
                  setTimeout((function () {
                          place.contents = place.contents + 1 | 0;
                          resolve([
                                place.contents,
                                msg
                              ]);
                        }), ms);
                }));
  };
  var p1 = delayedMsg(1500, "Anna");
  var p2 = delayedMsg(1000, "is");
  var p3 = delayedMsg(500, "my name");
  var p4 = delayedMsg(100, "Hi");
  return Promise.all([
                p1,
                p2,
                p3,
                p4
              ]).then(function (arr) {
              Test.run([
                    [
                      "PromiseTest.res",
                      376,
                      26,
                      55
                    ],
                    "Should have correct placing"
                  ], arr, equal, [
                    [
                      4,
                      "Anna"
                    ],
                    [
                      3,
                      "is"
                    ],
                    [
                      2,
                      "my name"
                    ],
                    [
                      1,
                      "Hi"
                    ]
                  ]);
              return Promise.resolve();
            });
}

function testParallel5() {
  var place = {
    contents: 0
  };
  var delayedMsg = function (ms, msg) {
    return new Promise((function (resolve, param) {
                  setTimeout((function () {
                          place.contents = place.contents + 1 | 0;
                          resolve([
                                place.contents,
                                msg
                              ]);
                        }), ms);
                }));
  };
  var p1 = delayedMsg(1500, "Anna");
  var p2 = delayedMsg(1000, "is");
  var p3 = delayedMsg(500, "name");
  var p4 = delayedMsg(100, "my");
  var p5 = delayedMsg(50, "Hi");
  return Promise.all([
                p1,
                p2,
                p3,
                p4,
                p5
              ]).then(function (arr) {
              Test.run([
                    [
                      "PromiseTest.res",
                      403,
                      26,
                      55
                    ],
                    "Should have correct placing"
                  ], arr, equal, [
                    [
                      5,
                      "Anna"
                    ],
                    [
                      4,
                      "is"
                    ],
                    [
                      3,
                      "name"
                    ],
                    [
                      2,
                      "my"
                    ],
                    [
                      1,
                      "Hi"
                    ]
                  ]);
              return Promise.resolve();
            });
}

function testParallel6() {
  var place = {
    contents: 0
  };
  var delayedMsg = function (ms, msg) {
    return new Promise((function (resolve, param) {
                  setTimeout((function () {
                          place.contents = place.contents + 1 | 0;
                          resolve([
                                place.contents,
                                msg
                              ]);
                        }), ms);
                }));
  };
  var p1 = delayedMsg(1500, "Anna");
  var p2 = delayedMsg(1000, "is");
  var p3 = delayedMsg(500, "name");
  var p4 = delayedMsg(100, "my");
  var p5 = delayedMsg(50, ", ");
  var p6 = delayedMsg(10, "Hi");
  return Promise.all([
                p1,
                p2,
                p3,
                p4,
                p5,
                p6
              ]).then(function (arr) {
              Test.run([
                    [
                      "PromiseTest.res",
                      431,
                      26,
                      55
                    ],
                    "Should have correct placing"
                  ], arr, equal, [
                    [
                      6,
                      "Anna"
                    ],
                    [
                      5,
                      "is"
                    ],
                    [
                      4,
                      "name"
                    ],
                    [
                      3,
                      "my"
                    ],
                    [
                      2,
                      ", "
                    ],
                    [
                      1,
                      "Hi"
                    ]
                  ]);
              return Promise.resolve();
            });
}

function runTests$4() {
  testParallel();
  testRace();
  testParallel2();
  testParallel3();
  testParallel4();
  testParallel5();
  testParallel6();
}

var Concurrently = {
  testParallel: testParallel,
  testRace: testRace,
  testParallel2: testParallel2,
  testParallel3: testParallel3,
  testParallel4: testParallel4,
  testParallel5: testParallel5,
  testParallel6: testParallel6,
  runTests: runTests$4
};

resolveTest();

runTests$1();

testExnRejection();

runTests$3();

runTests$4();

export {
  TestError ,
  fail ,
  equal ,
  Creation ,
  ThenChaining ,
  Rejection ,
  Catching ,
  Concurrently ,
}
/*  Not a pure module */
