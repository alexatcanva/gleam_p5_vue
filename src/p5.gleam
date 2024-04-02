pub type P5

pub type Config(model) {
  Config(
    start: fn(P5, model) -> model,
    update: fn(P5, model) -> model,
    state: model,
  )
}

@external(javascript, "./ffi.mjs", "background")
pub fn background(sketch: P5, colour: Int) -> P5

@external(javascript, "./ffi.mjs", "createCanvas")
pub fn create_canvas(sketch: P5, width: Int, height: Int) -> P5

@external(javascript, "./ffi.mjs", "deltaTime")
pub fn delta_time(sketch: P5) -> Float

@external(javascript, "./ffi.mjs", "ellipse")
pub fn ellipse(sketch: P5, x: Int, y: Int, width: Int, height: Int) -> P5

@external(javascript, "./ffi.mjs", "frameRate")
pub fn framerate(sketch: P5, fps: Float) -> P5

@external(javascript, "./ffi.mjs", "mouseX")
pub fn mouse_x(sketch: P5) -> Float

@external(javascript, "./ffi.mjs", "mouseY")
pub fn mouse_y(sketch: P5) -> Float

@external(javascript, "./ffi.mjs", "strokeWeight")
pub fn stroke_weight(sketch: P5, weight: Int) -> P5

@external(javascript, "./ffi.mjs", "stroke")
pub fn stroke(sketch: P5, r: Int, g: Int, b: Int) -> P5

//   p5.push()
//   p5.translate(x, y)
//   p5.rotate(a)
//   p5.line(0, 0, seg_length, 0)
//   p5.pop()

@external(javascript, "./ffi.mjs", "push")
pub fn push(sketch: P5) -> P5

@external(javascript, "./ffi.mjs", "pop")
pub fn pop(sketch: P5) -> P5

@external(javascript, "./ffi.mjs", "translate")
pub fn translate(sketch: P5, x: Float, y: Float) -> P5

@external(javascript, "./ffi.mjs", "rotate")
pub fn rotate(sketch: P5, angle: Float) -> P5

@external(javascript, "./ffi.mjs", "line")
pub fn line(sketch: P5, x1: Int, y1: Int, x2: Int, y2: Int) -> P5

@external(javascript, "./ffi.mjs", "sketchFactory")
fn sketch_factory(
  sketch: P5,
  start: fn(P5, model) -> model,
  update: fn(P5, model) -> model,
  state: model,
) -> P5

pub fn new(sketch: P5, config: Config(model)) -> P5 {
  sketch_factory(sketch, config.start, config.update, config.state)
}
