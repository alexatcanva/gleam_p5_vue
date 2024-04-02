import p5
import gleam/io
import gleam/float

type State {
  State(x: Int)
}

/// state_next performs any required state changes to the world state
/// it is executed once per frame loop (as per the draw method)
fn state_next(state: State) -> State {
  case state.x {
    _ if state.x < 0 -> State(700)
    _ -> State(state.x - 1)
  }
}

pub fn gleam_draw(sketch: p5.P5) -> p5.P5 {
  let x = 700

  let setup_sketch = fn(sketch: p5.P5) -> p5.P5 {
    p5.create_canvas(sketch, 700, 410)
    p5.framerate(sketch, 10.0)
  }

  let draw_sketch = fn(sketch: p5.P5) -> p5.P5 {
    let state = state_next(State(x))

    sketch
    |> p5.background(150)
    |> p5.ellipse(500, x, 50, 50)
  }

  sketch
  |> p5.setup(setup_sketch)
  |> p5.draw(draw_sketch)
}
