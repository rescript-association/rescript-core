open RescriptCore

let eq = (a, b) => a == b

// ====== assign ======

Test.run(
  __POS_OF__("assign copies from source to target"),
  Object.assign({"a": 1, "b": 2}, {"b": 3, "c": 0}),
  eq,
  {"a": 1, "b": 3, "c": 0},
)

let assignOverwritesTarget = (~title, ~source) => {
  let sourceObj = {"a": source}
  Test.run(__POS_OF__(`assign ${title}`), Object.assign({"a": 1}, sourceObj), eq, sourceObj)
  Test.run(__POS_OF__(`assign ${title}`), Object.assign({"a": undefined}, sourceObj), eq, sourceObj)
  Test.run(__POS_OF__(`assign ${title}`), Object.assign({"a": null}, sourceObj), eq, sourceObj)
}

assignOverwritesTarget(~title="when source is undefined", ~source=undefined)
assignOverwritesTarget(~title="when source is null", ~source=null)
assignOverwritesTarget(~title="when source is a number", ~source=1)
assignOverwritesTarget(~title="when source is a string", ~source="abc")
