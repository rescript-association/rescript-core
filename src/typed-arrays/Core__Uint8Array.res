type t = Core__TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "Uint8Array.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "Uint8Array"
@new external fromBuffer: Core__ArrayBuffer.t => t = "Uint8Array"
@new external fromBufferToEnd: (Core__ArrayBuffer.t, ~byteOffset: int) => t = "Uint8Array"
@new
external fromBufferWithRange: (Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Uint8Array"
@new external fromLength: int => t = "Uint8Array"
@val external from: 'a => t = "Uint8Array.from"
