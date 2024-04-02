import external/p5

fn setup() {
  p5.create_canvas(800, 600)
}

fn draw() {
  p5.ellipse(400, 300, 50, 50)
  p5.background(220)
}
