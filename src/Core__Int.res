module Constants = {
  @inline let minValue = -2147483648
  @inline let maxValue = 2147483647
}
@val external isNaN: int => bool = "isNaN"
@send external toExponential: int => string = "toExponential"
@send external toExponentialWithPrecision: (int, ~digits: int) => string = "toExponential"

@send external toFixed: int => string = "toFixed"
@send external toFixedWithPrecision: (int, ~digits: int) => string = "toFixed"

@send external toPrecision: int => string = "toPrecision"
@send external toPrecisionWithPrecision: (int, ~digits: int) => string = "toPrecision"

@send external toString: int => string = "toString"
@send external toStringWithRadix: (int, ~radix: int) => string = "toString"
@send external toLocaleString: int => string = "toLocaleString"

external toFloat: int => float = "%identity"
external fromFloat: float => int = "%intoffloat"

@val external parseInt: 'a => int = "parseInt"
@val external parseIntWithRadix: ('a, ~radix: int) => int = "parseInt"

let fromString = (~radix=?, x) => {
  let maybeInt = switch radix {
  | Some(radix) => parseIntWithRadix(x, ~radix)
  | None => parseInt(x)
  }
  if isNaN(maybeInt) {
    None
  } else if maybeInt > Constants.maxValue || maybeInt < Constants.minValue {
    None
  } else {
    Some(maybeInt)
  }
}

external mod: (int, int) => int = "%modint"
