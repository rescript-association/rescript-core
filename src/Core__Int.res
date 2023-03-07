module Constants = {
  @inline let minValue = -2147483648
  @inline let maxValue = 2147483647
}

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

let fromString = str => {
  switch Core__Float.fromString(str) {
  | Some(num) => num === %raw("num | 0") && Core__Float.isFinite(num) ? Obj.magic(num) : None
  | None => None
  }
}

external mod: (int, int) => int = "%modint"

type rangeOptions = {step?: int, inclusive?: bool}
let rangeWithOptions = (start, end, options) => {
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

let range = (start, end) => rangeWithOptions(start, end, {})
