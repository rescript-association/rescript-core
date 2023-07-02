type t = float

let less = -1.
let equal = 0.
let greater = 1.

let isLess = ord => ord < equal
let isEqual = ord => ord == equal
let isGreater = ord => ord > equal

let invert = ord => -.ord

let fromInt = n => n < 0 ? less : n > 0 ? greater : equal
