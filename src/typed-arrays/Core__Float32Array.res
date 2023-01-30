type t = Core__TypedArray.t<float>

module Constants = {
  @val external bytesPerElement: int = "Float32Array.BYTES_PER_ELEMENT"
}

@new external make: array<float> => t = "Float32Array"
@new external fromBuffer: Core__ArrayBuffer.t => t = "Float32Array"
@new external fromBufferToEnd: (Core__ArrayBuffer.t, ~byteOffset: int) => t = "Float32Array"
@new
external fromBufferWithRange: (Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Float32Array"
@new external fromLength: int => t = "Float32Array"
@val external from: 'a => t = "Float32Array.from"
