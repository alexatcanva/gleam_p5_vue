// pub type P5 {
//   Canvas(width: Int, height: Int)
// }

pub type P5

pub type Sketch(model) {
  Config(start: fn(P5) -> model, draw: fn(P5) -> model, next: fn(P5) -> model)
}

pub type HtmlElement

@external(javascript, "./ffi.mjs", "addSetup")
pub fn setup(sketch: P5, setup_function: fn(P5) -> P5) -> P5

@external(javascript, "./ffi.mjs", "addDraw")
pub fn draw(sketch: P5, draw_function: fn(P5) -> P5) -> P5

@external(javascript, "./ffi.mjs", "frameRate")
pub fn framerate(sketch: P5, fps: Float) -> P5

@external(javascript, "./ffi.mjs", "createCanvas")
pub fn create_canvas(sketch: P5, width: Int, height: Int) -> P5

@external(javascript, "./ffi.mjs", "background")
pub fn background(sketch: P5, colour: Int) -> P5

@external(javascript, "./ffi.mjs", "ellipse")
pub fn ellipse(sketch: P5, x: Int, y: Int, width: Int, height: Int) -> P5

@external(javascript, "./ffi.mjs", "deltaTime")
pub fn delta_time(sketch: P5) -> Float
