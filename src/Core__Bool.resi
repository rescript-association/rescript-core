external compare: (bool, bool) => Core__Ordering.t = "%compare"

external equal: (bool, bool) => bool = "%equal"

@send external toString: bool => string = "toString"

let fromStringExn: string => bool

let fromString: string => option<bool>

external and_: (bool, bool) => bool = "%sequand"

external or: (bool, bool) => bool = "%sequor"

external not: bool => bool = "%boolnot"

let xnor: (bool, bool) => bool

let xor: (bool, bool) => bool

let nand: (bool, bool) => bool

let nor: (bool, bool) => bool
