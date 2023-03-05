module Constants = {
  @inline let minValue = -2147483648
  @inline let maxValue = 2147483647
}

let equal = (a: int, b: int) => a === b

let compare = (a, b) => a - b

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

let fromString = (~radix=?, x) => {
  let maybeInt = switch radix {
  | Some(radix) => Core__Float.parseIntWithRadix(x, ~radix)
  | None => Core__Float.parseInt(x)
  }
  if Core__Float.isNaN(maybeInt) {
    None
  } else if maybeInt > Constants.maxValue->toFloat || maybeInt < Constants.minValue->toFloat {
    None
  } else {
    let asInt = fromFloat(maybeInt)
    Some(asInt)
  }
}

external mod: (int, int) => int = "%modint"
