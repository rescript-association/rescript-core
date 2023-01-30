type t = Core__TypedArray.t<Core__BigInt.t>

module Constants = {
  @val external bytesPerElement: int = "BigUint64Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "BigUint64Array"
@new external fromBuffer: Core__ArrayBuffer.t => t = "BigUint64Array"
@new external fromBufferToEnd: (Core__ArrayBuffer.t, ~byteOffset: int) => t = "BigUint64Array"
@new
external fromBufferWithRange: (Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "BigUint64Array"
@new external fromLength: int => t = "BigUint64Array"
@val external from: 'a => t = "BigUint64Array.from"
