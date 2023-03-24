open RescriptCore

let panicTest = () => {
  let caught = try panic("uh oh") catch {
  | Exn.Error(err) => Error.message(err)
  }

  Test.run(__POS_OF__("Should resolve test"), caught, \"==", Some("Panic! uh oh"))
}

panicTest()

// ===== RaiseAny =====

let raiseAnyCanThrowAgain = {
  let received = ref(false)
  let err = Error.make("something went wrong")
  try {
    Error.raise(err)
  } catch {
  | _ as exn =>
    Console.log("An exception happened!")
    Error.raiseAny(exn) // throw it again
    try {
      Error.raiseAny(exn) // rethrow it
    } catch {
    | _ as exn =>
      switch exn->Error.fromException {
      | None => ()
      | Some(e) => received := e === err
      }
    }
  }
  Test.run(__POS_OF__("Can throw again"), received.contents, \"==", true)
}
