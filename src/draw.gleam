import p5
import gleam/io
import gleam/float

fn update_x(old_x: Float, delta_time: Float, speed: Float) -> Float {
  let delta_x = speed *. delta_time
  old_x +. delta_x
}

pub fn gleam_draw(sketch: p5.P5) -> p5.P5 {
  let speed = 0.5
  let x = 0.0
  let y = 205

  let setup_sketch = fn(sketch: p5.P5) -> p5.P5 {
    p5.create_canvas(sketch, 700, 410)
    p5.framerate(sketch, 10.0)
  }

  let draw_sketch = fn(sketch: p5.P5) -> p5.P5 {
    let x = update_x(0.0, p5.delta_time(sketch), speed)
    io.println("new_x: " <> float.to_string(x))
    sketch
    |> p5.background(150)
    |> p5.ellipse(float.round(x), y, 50, 50)
  }

  sketch
  |> p5.setup(setup_sketch)
  |> p5.draw(draw_sketch)
}
