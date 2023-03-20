open RescriptCore

let eq = (a, b) => a == b

// ===== get =====

type getTestData<'obj, 'res, 'expected> = {
  title: string,
  source: unit => 'obj,
  get: 'obj => 'res,
  expected: 'expected,
}

let runGetTest = i =>
  Test.run(__POS_OF__(`Object.get: ${i.title}`), i.source()->i.get, eq, i.expected)

{
  title: "prop exists, return Some",
  source: () => {"a": 1},
  get: Object.get(_, "a"),
  expected: Some(1),
}->runGetTest

{
  title: "prop NOT exist, return None",
  source: () => {"a": 1},
  get: i => i->Object.get("banana"),
  expected: None,
}->runGetTest

{
  title: "prop like toString, return Some",
  source: () => {"a": 1},
  get: i => i->Object.get("toString")->Option.isSome,
  expected: true,
}->runGetTest

{
  title: "prop exist but explicitly undefined, return None",
  source: () => {"a": undefined},
  get: i => i->Object.get("a"),
  expected: None,
}->runGetTest

{
  title: "prop exist but explicitly null, return None",
  source: () => {"a": null},
  get: i => i->Object.get("a"),
  expected: Some(null),
}->runGetTest

{
  title: "prop exists and is an array, can get it",
  source: () => {"a": [1, 2, 3]},
  get: i => i->Object.get("a")->Option.map(i => i->Array.concat([4, 5]))->Option.getWithDefault([]),
  expected: [1, 2, 3, 4, 5],
}->runGetTest

// This throws an exception
// {
//   title: "prop exists but casted wrong on get",
//   source: () => {"a": 34},
//   get: i => i->Object.get("a")->Option.map(i => i->Array.concat([4, 5]))->Option.getWithDefault([]),
//   expected: [],
// }->runGetTest

// ===== getSymbol =====

let getSymbolTestWhenExists = () => {
  let obj = Object.empty()
  let fruit = Symbol.make("fruit")
  obj->Object.setSymbol(fruit, "banana")
  let retrieved = obj->Object.getSymbol(fruit)
  Test.run(
    __POS_OF__(`Object.getSymbol when exists return it as Some`),
    retrieved,
    eq,
    Some("banana"),
  )
}
getSymbolTestWhenExists()

Test.run(
  __POS_OF__(`Object.getSymbol when not exists return it as None`),
  Object.empty()->Object.getSymbol(Symbol.make("fruit")),
  eq,
  None,
)
