open RescriptCore

let main = async () => {
  let eq = await import(IntTests.eq)
  Test.run(__POS_OF__("import - range - positive, increasing"), 1, eq, 1)
}

main->ignore
