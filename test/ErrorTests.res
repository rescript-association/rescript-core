open RescriptCore

let panicTest = () => {
  let caught = try panic("uh oh") catch {
  | Exn.Error(err) => Error.message(err)
  }

  Test.run(__POS_OF__("Should resolve test"), caught, \"==", Some("Panic! uh oh"))
}

panicTest()

// This test case is based on catching authentication errors from the Firebase
// SDK. Errors are subclassed from the Error object and contain custom
// properties like "code".
let catchCustomError = () => {
  let authenticationError = Error.make("authentication error")
  let codeCaught = ref(None)
  Object.set(authenticationError->Obj.magic, "code", "invalid-password")
  try {
    authenticationError->Error.raise
  } catch {
  | _ as exn =>
    switch exn->Error.fromException {
    | None => raise(exn)
    | Some(err) =>
      switch err->Error.getUnsafe("code") {
      | None => ()
      | Some(code) => codeCaught := Some(code)
      }
    }
  }
  Test.run(
    __POS_OF__("Can access custom code"),
    codeCaught.contents,
    \"==",
    Some("invalid-password"),
  )
}

catchCustomError()
