open RescriptCore

module Node = {
  module Path = {
    @module("path") external join2: (string, string) => string = "join"
    @module("path") @variadic external join: array<string> => string = "join"
    @module("path") external dirname: string => string = "dirname"
  }

  module URL = {
    @module("url") external fileURLToPath: string => string = "fileURLToPath"
  }

  module Process = {
    @scope("process") external exit: int => unit = "exit"
    @scope(("process", "stderr"))
    external stderrWrite: string => unit = "write"
  }

  module Fs = {
    @module("fs") external readFileSync: string => string = "readFileSync"
    @module("fs") external writeFileSync: (string, string) => unit = "writeFileSync"
    @module("fs") external mkdirSync: string => option<string> = "mkdirSync"
    @module("fs") external existsSync: string => bool = "existsSync"
    @module("node:fs/promises") external writeFile: (string, string) => promise<unit> = "writeFile"
    @module("node:fs/promises") external unlink: string => promise<unit> = "unlink"
    @module("node:fs/promises") external lstat: string => promise<'a> = "lstat"
  }

  module Buffer = {
    type t
    @send external toString: t => string = "toString"
  }

  module ChildProcess = {
    type execSyncOpts = {stdio?: string, cwd?: string}
    @module("child_process")
    external execFileSync: (string, array<string>, execSyncOpts) => Buffer.t = "execFileSync"

    type spawnSyncReturns = {stdout: Buffer.t}
    @module("child_process")
    external spawnSync: (string, array<string>) => spawnSyncReturns = "spawnSync"

    type readable
    type spawnReturns = {stderr: readable, stdout: readable}
    type options = {cwd?: string, env?: Dict.t<string>, timeout?: int}
    @module("child_process")
    external spawn: (string, array<string>, ~options: options=?) => spawnReturns = "spawn"

    @send external on: (readable, string, Buffer.t => unit) => unit = "on"
    @send
    external once: (spawnReturns, string, (Null.t<float>, Null.t<string>) => unit) => unit = "once"
  }

  module OS = {
    @module("os")
    external tmpdir: unit => string = "tmpdir"
  }
}

open Node

module Docgen = RescriptTools.Docgen

@val @scope(("import", "meta")) external url: string = "url"

let dirname =
  url
  ->URL.fileURLToPath
  ->Path.dirname

let compilerDir = Path.join([dirname, "..", ".examples-tests"])

let rescriptBin = Path.join([compilerDir, "node_modules", ".bin", "rescript"])

let bscBin = Path.join([compilerDir, "node_modules", ".bin", "bsc"])

let rescriptCoreCompiled = Path.join([
  compilerDir,
  "node_modules",
  "@rescript",
  "core",
  "lib",
  "ocaml",
])

let makePackageJson = coreVersion =>
  `{
  "name": "test-compiler-examples",
  "version": "1.0.0",
  "dependencies": {
    "@rescript/core": "file:rescript-core-${coreVersion}.tgz",
    "rescript": "11.1.0-rc.7"
  }
}
`

let rescriptJson = `{
  "name": "dummy",
  "sources": {
    "dir": "dummy",
    "subdirs": true
  },
  "bs-dependencies": [
    "@rescript/core"
  ],
  "bsc-flags": [
    "-open RescriptCore"
  ]
}`

let prepareCompiler = () => {
  let corePath = Path.join([compilerDir, ".."])

  if !Fs.existsSync(compilerDir) {
    Fs.mkdirSync(compilerDir)->ignore
  }

  ChildProcess.execFileSync("npm", ["pack", corePath], {cwd: compilerDir, stdio: "ignore"})->ignore

  let currentCoreVersion = switch Path.join2(corePath, "package.json")
  ->Fs.readFileSync
  ->JSON.parseExn {
  | Object(dict) =>
    switch dict->Dict.getUnsafe("version") {
    | String(s) => s
    | _ => assert(false)
    }
  | _ => assert(false)
  }

  Path.join2(compilerDir, "package.json")->Fs.writeFileSync(makePackageJson(currentCoreVersion))
  Path.join2(compilerDir, "rescript.json")->Fs.writeFileSync(rescriptJson)

  let dummyFolder = Path.join2(compilerDir, "dummy")

  if !Fs.existsSync(dummyFolder) {
    Fs.mkdirSync(dummyFolder)->ignore
  }

  ChildProcess.execFileSync("npm", ["install"], {cwd: compilerDir})->ignore

  ChildProcess.execFileSync(rescriptBin, ["build"], {cwd: compilerDir})->ignore
}

prepareCompiler()

type example = {
  id: string,
  kind: string,
  name: string,
  docstrings: array<string>,
}

module SpawnAsync = {
  type t = {
    stdout: array<Buffer.t>,
    stderr: array<Buffer.t>,
    code: Null.t<float>,
  }
  let run = async (~command, ~args, ~options=?) => {
    await Promise.make((resolve, _reject) => {
      let spawn = ChildProcess.spawn(command, args, ~options?)
      let stdout = []
      let stderr = []
      spawn.stdout->ChildProcess.on("data", data => {
        Array.push(stdout, data)
      })
      spawn.stderr->ChildProcess.on("data", data => {
        Array.push(stderr, data)
      })
      spawn->ChildProcess.once("close", (code, _signal) => {
        resolve({stdout, stderr, code})
      })
    })
  }
}

let createFileInTempDir = id => Path.join2(OS.tmpdir(), id)

let compileTest = async (~id, ~code) => {
  let tempFileName = createFileInTempDir(id)

  let () = await Fs.writeFile(tempFileName ++ ".res", code)

  let args = [
    tempFileName ++ ".res",
    "-I",
    rescriptCoreCompiled,
    "-w",
    "-3-109",
    "-uncurried",
    "-open",
    "RescriptCore",
  ]

  let {stderr, stdout} = await SpawnAsync.run(~command=bscBin, ~args)

  switch Array.length(stderr) > 0 {
  | true =>
    stderr
    ->Array.map(e => e->Buffer.toString)
    ->Array.join("")
    ->Error
  | false =>
    stdout
    ->Array.map(e => e->Buffer.toString)
    ->Array.join("")
    ->Ok
  }
}

let extractDocFromFile = file => {
  let toolsBin = Path.join([Path.dirname(dirname), "node_modules", ".bin", "rescript-tools"])
  let spawn = ChildProcess.spawnSync(toolsBin, ["doc", file])

  spawn.stdout
  ->Buffer.toString
  ->JSON.parseExn
  ->Docgen.decodeFromJson
}

let getExamples = ({items}: Docgen.doc) => {
  let rec loop = (items: list<Docgen.item>, acc: list<example>) => {
    switch items {
    | list{Value({docstrings, id, name}), ...rest} =>
      loop(rest, list{{id, name, docstrings, kind: "value"}, ...acc})
    | list{Type({docstrings, id, name}), ...rest} =>
      loop(rest, list{{id, name, docstrings, kind: "type"}, ...acc})
    | list{Module({id, name, docstrings, items}), ...rest} =>
      loop(
        list{...rest, ...List.fromArray(items)},
        list{{id, name, docstrings, kind: "module"}, ...acc},
      )
    | list{ModuleAlias({id, name, docstrings, items}), ...rest} =>
      loop(
        list{...rest, ...List.fromArray(items)},
        list{{id, name, docstrings, kind: "moduleAlias"}, ...acc},
      )
    | list{} => acc
    }
  }

  items
  ->List.fromArray
  ->loop(list{})
  ->List.toArray
  ->Array.filter(({docstrings}) => Array.length(docstrings) > 0)
}

let getCodeBlocks = example => {
  let rec loopEndCodeBlock = (lines, acc) => {
    switch lines {
    | list{hd, ...rest} =>
      if (
        hd
        ->String.trim
        ->String.endsWith("```")
      ) {
        acc
      } else {
        loopEndCodeBlock(rest, list{hd, ...acc})
      }
    | list{} => panic(`Failed to find end of code block for ${example.kind}: ${example.id}`)
    }
  }

  let rec loop = (lines: list<string>, acc: list<string>) => {
    switch lines {
    | list{hd, ...rest} =>
      switch hd
      ->String.trim
      ->String.startsWith("```res") {
      | true =>
        let code = loopEndCodeBlock(rest, list{})
        loop(
          rest,
          list{
            code
            ->List.reverse
            ->List.toArray
            ->Array.join("\n"),
            ...acc,
          },
        )
      | false => loop(rest, acc)
      }
    | list{} => acc
    }
  }

  example.docstrings
  ->Array.reduce([], (acc, docstring) => acc->Array.concat(docstring->String.split("\n")))
  ->List.fromArray
  ->loop(list{})
  ->List.toArray
}

let runtimeTests = async code => {
  let {stdout, stderr} = await SpawnAsync.run(
    ~command="node",
    ~args=["-e", code],
    ~options={
      cwd: compilerDir,
      timeout: 2000,
    },
  )

  switch Array.length(stderr) > 0 {
  | true =>
    stderr
    ->Array.map(e => e->Buffer.toString)
    ->Array.join("")
    ->Error
  | false =>
    stdout
    ->Array.map(e => e->Buffer.toString)
    ->Array.join("")
    ->Ok
  }
}

let indentOutputCode = code => {
  let indent = String.repeat(" ", 2)

  code
  ->String.split("\n")
  ->Array.map(s => `${indent}${s}`)
  ->Array.join("\n")
}

type error =
  | ReScript({error: string})
  | Runtime({rescript: string, js: string, error: string})

let compilerResults = async () => {
  let results =
    await extractDocFromFile("src/RescriptCore.res")
    ->getExamples
    ->Array.map(async example => {
      let id = example.id->String.replaceAll(".", "_")
      let codes = example->getCodeBlocks
      let results =
        await codes
        ->Array.mapWithIndex(async (code, int) => {
          let id = `${id}_${Int.toString(int)}`
          (code, await compileTest(~id, ~code))
        })
        ->Promise.all
      (example, results)
    })
    ->Promise.all

  let examples = results->Array.map(((example, results)) => {
    let (compiled, errors) = results->Array.reduce(([], []), (acc, (resCode, result)) => {
      let (oks, errors) = acc
      switch result {
      | Ok(jsCode) => ([...oks, (resCode, jsCode)], errors)
      | Error(output) => (oks, [...errors, ReScript({error: output})])
      }
    })

    (example, (compiled, errors))
  })

  let errors =
    await examples
    ->Array.map(async ((example, (compiled, errors))) => {
      let nodeTests =
        await compiled
        ->Array.map(async ((res, js)) => (res, js, await runtimeTests(js)))
        ->Promise.all

      let runtimeErrors = nodeTests->Belt.Array.keepMap(((res, js, output)) =>
        switch output {
        | Ok(_) => None
        | Error(error) => Some(Runtime({rescript: res, js, error}))
        }
      )

      (example, Array.concat(runtimeErrors, errors))
    })
    ->Promise.all

  // Print Errors
  let () = errors->Array.forEach(((example, errors)) => {
    let red = s => `\x1B[1;31m${s}\x1B[0m`
    let cyan = s => `\x1b[36m${s}\x1b[0m`
    let kind = switch example.kind {
    | "moduleAlias" => "module alias"
    | other => other
    }

    let errorMessage = errors->Array.map(err =>
      switch err {
      | ReScript({error}) =>
        let err =
          error
          ->String.split("\n")
          ->Array.filterWithIndex((_, i) => i !== 2)
          ->Array.join("\n")

        `${"error"->red}: failed to compile examples from ${kind} ${example.id->cyan}
${err}`
      | Runtime({rescript, js, error}) =>
        let indent = String.repeat(" ", 2)

        `${"runtime error"->red}: failed to run examples from ${kind} ${example.id->cyan}

${indent}${"ReScript"->cyan}

${rescript->indentOutputCode}

${indent}${"Compiled Js"->cyan}

${js->indentOutputCode}

${indent}${"stacktrace"->red}

${error->indentOutputCode}
`
      }
    )

    errorMessage->Array.forEach(e => Process.stderrWrite(e))
  })

  errors->Array.length == 0 ? 0 : 1
}

let exitCode = await compilerResults()

Process.exit(exitCode)
