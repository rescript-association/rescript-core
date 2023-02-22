type t

external fromBool: bool => t = "%identity"
external fromString: [#always | #auto | #min2] => t = "%identity"
// TODO: unwrap this for consumption coming back in resolvedOptions
