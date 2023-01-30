type t = Core__TypedArray.t<float>

module Constants = {
  @val external bytesPerElement: int = "Float64Array.BYTES_PER_ELEMENT"
}

@new external make: array<float> => t = "Float64Array"
@new external fromBuffer: Core__ArrayBuffer.t => t = "Float64Array"
@new external fromBufferToEnd: (Core__ArrayBuffer.t, ~byteOffset: int) => t = "Float64Array"
@new
external fromBufferWithRange: (Core__ArrayBuffer.t, ~byteOffset: int, ~length: int) => t =
  "Float64Array"
@new external fromLength: int => t = "Float64Array"
@val external from: 'a => t = "Float64Array.from"
