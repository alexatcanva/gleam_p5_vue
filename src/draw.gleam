import p5
import gleam/io
import gleam/list
import gleam/float
import gleam_community/maths/elementary

type Segment {
  Segment(x: Float, y: Float, angle: Float)
}

type State {
  State(segments: List(Segment))
}

const seg_length = 18.0

fn segment(sketch: p5.P5, x: Float, y: Float, angle: Float) -> Nil {
  p5.push(sketch)
  p5.translate(sketch, x, y)
  p5.rotate(sketch, angle)
  p5.line(sketch, 0, 0, float.round(seg_length), 0)
  p5.pop(sketch)
  Nil
}

fn drag_segment(state: State, xin: Float, yin: Float) -> State {
  State(list.map(state.segments, fn(seg: Segment) { drag(seg, xin, yin) }))
}

fn drag(seg: Segment, x: Float, y: Float) -> Segment {
  let dx = x -. seg.x
  let dy = y -. seg.y
  let angle = elementary.atan2(dy, dx)
  let x = elementary.cos(angle) *. seg_length
  let y = elementary.sin(angle) *. seg_length
  Segment(x, y, angle)
}

pub fn gleam_draw(sketch: p5.P5) -> p5.P5 {
  let segments = list.repeat(Segment(0.0, 0.0, 0.0), times: 20)
  let state = State(segments)

  let start = fn(sketch: p5.P5, _state: State) -> State {
    p5.create_canvas(sketch, 700, 410)
    p5.framerate(sketch, 60.0)
    p5.stroke_weight(sketch, 9)
    state
  }

  let update = fn(sketch: p5.P5, state: State) -> State {
    let next_state = drag_segment(state, p5.mouse_x(sketch), p5.mouse_y(sketch))
    io.debug(next_state)
    sketch
    |> p5.background(150)
    {
      list.map(next_state.segments, fn(seg: Segment) {
        segment(sketch, seg.x, seg.y, seg.angle)
      })
    }
    next_state
  }

  p5.new(sketch, p5.Config(start, update, state))
}
