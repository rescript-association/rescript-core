module Constants = {
  @val external nan: float = "NaN"
  @val external epsilon: float = "Number.EPSILON"
  @val external positiveInfinity: float = "Number.POSITIVE_INFINITY"
  @val external negativeInfinity: float = "Number.NEGATIVE_INFINITY"
  @val external minValue: float = "Number.MIN_VALUE"
  @val external maxValue: float = "Number.MAX_VALUE"
}

let equal = (a: float, b: float) => a === b

let compare = (a: float, b: float) =>
  if a === b {
    0
  } else if a > b {
    1
  } else {
    -1
  }

@val external isNaN: float => bool = "isNaN"
@val external isFinite: float => bool = "isFinite"
@val external parseFloat: 'a => float = "parseFloat"
// parseInt's return type is a float because it can be NaN
@val external parseInt: 'a => float = "parseInt"
@val external parseIntWithRadix: ('a, ~radix: int) => float = "parseInt"

@send external toExponential: float => string = "toExponential"
@send external toExponentialWithPrecision: (float, ~digits: int) => string = "toExponential"

@send external toFixed: float => string = "toFixed"
@send external toFixedWithPrecision: (float, ~digits: int) => string = "toFixed"

@send external toPrecision: float => string = "toPrecision"
@send external toPrecisionWithPrecision: (float, ~digits: int) => string = "toPrecision"

@send external toString: float => string = "toString"
@send external toStringWithRadix: (float, ~radix: int) => string = "toString"
@send external toLocaleString: float => string = "toLocaleString"

let fromString = i =>
  switch parseFloat(i) {
  | i if isNaN(i) => None
  | i => Some(i)
  }

external toInt: float => int = "%intoffloat"
external fromInt: int => float = "%identity"

@unboxed @noalloc external mod: (float, float) => float = "?fmod_float"
