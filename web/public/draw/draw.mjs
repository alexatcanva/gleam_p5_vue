import * as $p5 from "./external/p5.mjs";

function setup() {
  return $p5.create_canvas(800, 600);
}

function draw() {
  $p5.ellipse(400, 300, 50, 50);
  return $p5.background(220);
}
