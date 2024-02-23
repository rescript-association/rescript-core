open RescriptCore

let eq = (a, b) => a == b

let iterator: Iterator.t<string> = %raw(`
  (() => {
    var array1 = ['a', 'b', 'c'];
    var iterator1 = array1[Symbol.iterator]();
    return iterator1
  })()
`)

let syncResult = ref(None)

iterator->Iterator.forEach(v => {
  if v === Some("b") {
    syncResult.contents = Some("b")
  }
})

Test.run(__POS_OF__("Sync forEach"), syncResult.contents, eq, Some("b"))

let asyncIterator: AsyncIterator.t<(string, string)> = %raw(`
  (() => {
    var map1 = new Map();

    map1.set('first', '1');
    map1.set('second', '2');

    var iterator1 = map1[Symbol.iterator]();
    return iterator1;
  })()
`)

let asyncResult = ref(None)

await asyncIterator->AsyncIterator.forEach(v => {
  switch v {
  | Some(("second", _value)) => asyncResult.contents = Some("second")
  | _ => ()
  }
})

Test.run(__POS_OF__("Async forEach"), asyncResult.contents, eq, Some("second"))
