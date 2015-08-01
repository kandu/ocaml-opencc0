type t
type conversion = Fast | SegmentOnly | ListCandidates
val create : string -> t
val convert_utf8 : t -> string -> string
val set_conversion_mode : t -> conversion -> unit
