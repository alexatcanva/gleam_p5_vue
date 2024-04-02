@external(javascript, "./ffi.mjs", "createCanvas")
pub fn create_canvas(width: i32, height: i32) -> Nil

@external(javascript, "./ffi.mjs", "background")
pub fn background(colour: int) -> Nil

@external(javascript, "./ffi.mjs", "ellipse")
pub fn ellipse(x: f64, y: f64, width: f64, height: f64) -> Nil
