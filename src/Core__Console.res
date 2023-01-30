@val external log: 'a => unit = "console.log"
@val external log2: ('a, 'b) => unit = "console.log"
@val external log3: ('a, 'b, 'c) => unit = "console.log"
@val external log4: ('a, 'b, 'c, 'd) => unit = "console.log"
@val external log5: ('a, 'b, 'c, 'd, 'e) => unit = "console.log"

@val external info: 'a => unit = "console.info"
@val external info2: ('a, 'b) => unit = "console.info"
@val external info3: ('a, 'b, 'c) => unit = "console.info"
@val external info4: ('a, 'b, 'c, 'd) => unit = "console.info"
@val external info5: ('a, 'b, 'c, 'd, 'e) => unit = "console.info"

@val external warn: 'a => unit = "console.warn"
@val external warn2: ('a, 'b) => unit = "console.warn"
@val external warn3: ('a, 'b, 'c) => unit = "console.warn"
@val external warn4: ('a, 'b, 'c, 'd) => unit = "console.warn"
@val external warn5: ('a, 'b, 'c, 'd, 'e) => unit = "console.warn"

@val external error: 'a => unit = "console.error"
@val external error2: ('a, 'b) => unit = "console.error"
@val external error3: ('a, 'b, 'c) => unit = "console.error"
@val external error4: ('a, 'b, 'c, 'd) => unit = "console.error"
@val external error5: ('a, 'b, 'c, 'd, 'e) => unit = "console.error"

@val external trace: unit => unit = "console.trace"

@val external timeStart: string => unit = "console.timeStart"
@val external timeEnd: string => unit = "console.timeEnd"
