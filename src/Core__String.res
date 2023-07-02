@val external make: 'a => string = "String"

@val external fromCharCode: int => string = "String.fromCharCode"
@variadic @val external fromCharCodeMany: array<int> => string = "String.fromCharCode"

@val external fromCodePoint: int => string = "String.fromCodePoint"
@variadic @val external fromCodePointMany: array<int> => string = "String.fromCodePoint"

let equal = (a: string, b: string) => a === b

let compare = (a: string, b: string) =>
  a < b ? Core__Ordering.less : a > b ? Core__Ordering.greater : Core__Ordering.equal

@get external length: string => int = "length"
@get_index external get: (string, int) => option<string> = ""
@send external charAt: (string, int) => string = "charAt"

@send external charCodeAt: (string, int) => float = "charCodeAt"
@send external codePointAt: (string, int) => option<int> = "codePointAt"

@send external concat: (string, string) => string = "concat"
@variadic @send external concatMany: (string, array<string>) => string = "concat"

@send external endsWith: (string, string) => bool = "endsWith"
@send external endsWithFrom: (string, string, int) => bool = "endsWith"

@send external includes: (string, string) => bool = "includes"
@send external includesFrom: (string, string, int) => bool = "includes"

@send external indexOf: (string, string) => int = "indexOf"
let indexOfOpt = (s, search) =>
  switch indexOf(s, search) {
  | -1 => None
  | index => Some(index)
  }
@send external indexOfFrom: (string, string, int) => int = "indexOf"

@send external lastIndexOf: (string, string) => int = "lastIndexOf"
let lastIndexOfOpt = (s, search) =>
  switch lastIndexOf(s, search) {
  | -1 => None
  | index => Some(index)
  }
@send external lastIndexOfFrom: (string, string, int) => int = "lastIndexOf"

@return(nullable) @send
external match: (string, Core__RegExp.t) => option<Core__RegExp.Result.t> = "match"

type normalizeForm = [#NFC | #NFD | #NFKC | #NFKD]
@send external normalize: string => string = "normalize"
@send external normalizeByForm: (string, normalizeForm) => string = "normalize"

@send external repeat: (string, int) => string = "repeat"

@send external replace: (string, string, string) => string = "replace"
@send external replaceRegExp: (string, Core__RegExp.t, string) => string = "replace"

@send
external unsafeReplaceRegExpBy0: (
  string,
  Core__RegExp.t,
  (@uncurry ~match: string, ~offset: int, ~input: string) => string,
) => string = "replace"

@send
external unsafeReplaceRegExpBy1: (
  string,
  Core__RegExp.t,
  (@uncurry ~match: string, ~group1: string, ~offset: int, ~input: string) => string,
) => string = "replace"

@send
external unsafeReplaceRegExpBy2: (
  string,
  Core__RegExp.t,
  (
    @uncurry ~match: string,
    ~group1: string,
    ~group2: string,
    ~offset: int,
    ~input: string,
  ) => string,
) => string = "replace"

@send
external unsafeReplaceRegExpBy3: (
  string,
  Core__RegExp.t,
  (
    @uncurry ~match: string,
    ~group1: string,
    ~group2: string,
    ~group3: string,
    ~offset: int,
    ~input: string,
  ) => string,
) => string = "replace"

@send external search: (string, Core__RegExp.t) => int = "search"
let searchOpt = (s, re) =>
  switch search(s, re) {
  | -1 => None
  | index => Some(index)
  }

@send external slice: (string, ~start: int, ~end: int) => string = "slice"
@send external sliceToEnd: (string, ~start: int) => string = "slice"

@send external split: (string, string) => array<string> = "split"
@send external splitAtMost: (string, string, ~limit: int) => array<string> = "split"
@send external splitByRegExp: (string, Core__RegExp.t) => array<option<string>> = "split"
@send
external splitByRegExpAtMost: (string, Core__RegExp.t, ~limit: int) => array<option<string>> =
  "split"

@send external startsWith: (string, string) => bool = "startsWith"
@send external startsWithFrom: (string, string, int) => bool = "startsWith"

@send external substring: (string, ~start: int, ~end: int) => string = "substring"
@send external substringToEnd: (string, ~start: int) => string = "substring"

@send external toLowerCase: string => string = "toLowerCase"
@send external toLocaleLowerCase: string => string = "toLocaleLowerCase"
@send external toUpperCase: string => string = "toUpperCase"
@send external toLocaleUpperCase: string => string = "toLocaleUpperCase"

@send external trim: string => string = "trim"
@send external trimStart: string => string = "trimStart"
@send external trimEnd: string => string = "trimEnd"

@send external padStart: (string, int, string) => string = "padStart"
@send external padEnd: (string, int, string) => string = "padEnd"

@get_index external getSymbol: (string, Core__Symbol.t) => option<'a> = ""
@get_index external getSymbolUnsafe: (string, Core__Symbol.t) => 'a = ""
@set_index external setSymbol: (string, Core__Symbol.t, 'a) => unit = ""

@send external localeCompare: (string, string) => float = "localeCompare"
