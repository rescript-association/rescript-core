type t = Core__TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "Uint32Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "Uint32Array"
@new external fromBuffer: array<Core__ArrayBuffer.t> => t = "Uint32Array"
@new external fromBufferToEnd: (array<Core__ArrayBuffer.t>, ~start: int) => t = "Uint32Array"
@new
external fromBufferWithRange: (array<Core__ArrayBuffer.t>, ~start: int, ~end: int) => t =
  "Uint32Array"
@new external fromLength: int => t = "Uint32Array"
@val external from: 'a => t = "Uint32Array.from"
