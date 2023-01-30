type t = Core__TypedArray.t<Core__BigInt.t>

module Constants = {
  @val external bytesPerElement: int = "BigInt64Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "BigInt64Array"
@new external fromBuffer: Core__ArrayBuffer.t => t = "BigInt64Array"
@new external fromBufferToEnd: (Core__ArrayBuffer.t, ~byteOffset: int) => t = "BigInt64Array"
@new
external fromBufferWithRange: (Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "BigInt64Array"
@new external fromLength: int => t = "BigInt64Array"
@val external from: 'a => t = "BigInt64Array.from"
