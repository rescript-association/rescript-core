@val external asIntN: (~width: int, bigint) => bigint = "BigInt.asIntN"
@val external asUintN: (~width: int, bigint) => bigint = "BigInt.asUintN"

@val external fromString: string => bigint = "BigInt"
@val external fromInt: int => bigint = "BigInt"
@val external fromFloat: float => bigint = "BigInt"

@send external toString: bigint => string = "toString"
@send external toStringWithRadix: (bigint, ~radix: int) => string = "toString"
@send external toLocaleString: bigint => string = "toLocaleString"

@val external toFloat: bigint => float = "Number"

let toInt = t => t->toFloat->Core__Int.fromFloat

external \"+": (bigint, bigint) => bigint = "%addfloat"
external \"-": (bigint, bigint) => bigint = "%subfloat"
external \"*": (bigint, bigint) => bigint = "%mulfloat"
external \"/": (bigint, bigint) => bigint = "%divfloat"

external add: (bigint, bigint) => bigint = "%addfloat"
external sub: (bigint, bigint) => bigint = "%subfloat"
external mul: (bigint, bigint) => bigint = "%mulfloat"
external div: (bigint, bigint) => bigint = "%divfloat"

@noalloc external mod: (bigint, bigint) => bigint = "?fmod_float"

external land: (bigint, bigint) => bigint = "%andint"
external lor: (bigint, bigint) => bigint = "%orint"
external lxor: (bigint, bigint) => bigint = "%xorint"

external lsl: (bigint, bigint) => bigint = "%lslint"
external asr: (bigint, bigint) => bigint = "%asrint"

let exp = (x: bigint, y: bigint) => {
  let _ = x
  let _ = y
  %raw(`x ** y`)
}
