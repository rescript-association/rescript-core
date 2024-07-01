module Constants = {
  @inline let minValue = -2147483648
  @inline let maxValue = 2147483647
}

external equal: (int, int) => bool = "%equal"

external compare: (int, int) => Core__Ordering.t = "%compare"

@send external toExponential: (int, ~digits: int=?) => string = "toExponential"
@deprecated("Use `toExponential` instead") @send
external toExponentialWithPrecision: (int, ~digits: int) => string = "toExponential"

@send external toFixed: (int, ~digits: int=?) => string = "toFixed"
@deprecated("Use `toFixed` instead") @send
external toFixedWithPrecision: (int, ~digits: int) => string = "toFixed"

@send external toPrecision: (int, ~digits: int=?) => string = "toPrecision"
@deprecated("Use `toPrecision` instead") @send
external toPrecisionWithPrecision: (int, ~digits: int) => string = "toPrecision"

@send external toString: (int, ~radix: int=?) => string = "toString"
@deprecated("Use `toString` instead") @send
external toStringWithRadix: (int, ~radix: int) => string = "toString"
@send external toLocaleString: int => string = "toLocaleString"

external toFloat: int => float = "%identity"
external fromFloat: float => int = "%intoffloat"

let fromString = (x, ~radix=?) => {
  let maybeInt = switch radix {
  | Some(radix) => Core__Float.parseInt(x, ~radix)
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

type rangeOptions = {step?: int, inclusive?: bool}

let abs = x =>
  if x >= 0 {
    x
  } else {
    -x
  }

let range = (start, end, ~options: rangeOptions={}) => {
  let isInverted = start > end

  let step = switch options.step {
  | None => isInverted ? -1 : 1
  | Some(0) if start !== end =>
    Core__Error.raise(Core__Error.RangeError.make("Incorrect range arguments"))
  | Some(n) => n
  }

  let length = if isInverted === (step >= 0) {
    0 // infinite because step goes in opposite direction of end
  } else if step == 0 {
    options.inclusive === Some(true) ? 1 : 0
  } else {
    let range = isInverted ? start - end : end - start
    let range = options.inclusive === Some(true) ? range + 1 : range
    ceil(float(range) /. float(abs(step)))->Core__Float.toInt
  }

  Core__Array.fromInitializer(~length, i => start + i * step)
}

@deprecated("Use `range` instead") @send
let rangeWithOptions = (start, end, options) => range(start, end, ~options)

let clamp = (~min=?, ~max=?, value): int => {
  let value = switch max {
  | Some(max) if max < value => max
  | _ => value
  }
  switch min {
  | Some(min) if min > value => min
  | _ => value
  }
}
