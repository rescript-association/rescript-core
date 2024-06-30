open RescriptCore

let panicTest = () => {
  let caught = try panic("uh oh") catch {
  | Error.Error(err) => Error.message(err)
  }

  Test.run(__POS_OF__("Should resolve test"), caught, \"==", Some("Panic! uh oh"))
}

panicTest()
