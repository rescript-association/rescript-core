type t = Core__TypedArray.t<int>

module Constants = {
  @val external bytesPerElement: int = "Uint8ClampedArray.BYTES_PER_ELEMENT"
}

@new external make: array<int> => t = "Uint8ClampedArray"
@new external fromBuffer: Core__ArrayBuffer.t => t = "Uint8ClampedArray"
@new
external fromBufferToEnd: (Core__ArrayBuffer.t, ~byteOffset: int) => t = "Uint8ClampedArray"
@new
external fromBufferWithRange: (Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Uint8ClampedArray"
@new external fromLength: int => t = "Uint8ClampedArray"
@val external from: 'a => t = "Uint8ClampedArray.from"
