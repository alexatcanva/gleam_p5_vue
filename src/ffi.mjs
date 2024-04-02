export const sketchFactory = function (p5, start, update, state) {
  return new p5(function (p) {
    p.setup = function () {
      start(p, state);
    };
    p.draw = function () {
      state = update(p, state);
    };
  });
};

export function frameRate(s, fps) {
  return s.frameRate(fps);
}

export function createCanvas(s, width, height) {
  return s.createCanvas(width, height);
}

export function ellipse(s, x, y, width, height) {
  return s.ellipse(x, y, width, height);
}

export function rect(s, x, y, width, height) {
  return s.rect(x, y, width, height);
}

export function background(s, c) {
  return s.background(c);
}

export function deltaTime(s) {
  return s.deltaTime;
}

export function mouseX(s) {
  return s.mouseX;
}

export function mouseY(s) {
  return s.mouseY;
}

export function push(s) {
  s.push();
}

export function pop(s) {
  s.pop();
}

export function line(s, x1, x2, y1, y2) {
  return s.line(x1, x2, y1, y2);
}

export function rotate(s, angle) {
  s.rotate(angle);
}

export function translate(s, x, y) {
  s.translate(x, y);
}

export function strokeWeight(s, w) {
  return s.strokeWeight(w);
}

export function stroke(s, r, g, b) {
  return s.stroke(c, r, g, b);
}
