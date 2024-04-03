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

fn segment(sketch: p5.P5, seg: Segment) -> Segment {
  p5.push(sketch)
  p5.translate(sketch, seg.x, seg.y)
  p5.rotate(sketch, seg.angle)
  p5.line(sketch, 0, 0, float.round(seg_length), 0)
  p5.pop(sketch)

  seg
}

fn drag_segments(
  first: List(Segment),
  second: List(Segment),
  x: Float,
  y: Float,
) -> List(Segment) {
  case first {
    [] -> second
    [item] -> drag_segments([], list.append(second, [drag(item, x, y)]), x, y)
    [item, next] ->
      drag_segments(
        [next],
        list.append(second, [drag(item, next.x, next.y)]),
        x +. 1.0,
        y +. 1.0,
      )
    [item, next, ..rest] ->
      drag_segments(
        [next, ..rest],
        list.append(second, [drag(item, next.x, next.y)]),
        x,
        y,
      )
  }
}

fn drag(seg: Segment, x: Float, y: Float) -> Segment {
  let dx = x -. seg.x
  let dy = y -. seg.y
  let angle = elementary.atan2(dy, dx)
  let new_x = elementary.cos(angle) *. seg_length
  let new_y = elementary.sin(angle) *. seg_length
  Segment(new_x, new_y, angle)
}

pub fn gleam_draw(sketch: p5.P5) -> p5.P5 {
  let segments = list.repeat(Segment(0.0, 0.0, 0.0), times: 10)
  let state = State(segments)

  let start = fn(sketch: p5.P5, _state: State) -> State {
    p5.create_canvas(sketch, 700, 410)
    p5.framerate(sketch, 30.0)
    p5.stroke_weight(sketch, 9)
    state
  }

  let update = fn(sketch: p5.P5, state: State) -> State {
    let next_state =
      State(drag_segments(
        state.segments,
        [],
        p5.mouse_x(sketch),
        p5.mouse_y(sketch),
      ))
    // io.debug(#(p5.mouse_x(sketch), p5.mouse_y(sketch)))
    io.debug(next_state)
    sketch
    |> p5.background(100)

    {
      use seg <- list.map(next_state.segments)
      segment(sketch, seg)
    }
    next_state
  }

  p5.new(sketch, p5.Config(start, update, state))
}
