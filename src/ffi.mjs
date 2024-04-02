export function addSetup(s, fn) {
  s.setup = function () {
    fn(s);
  };
  return s;
}

export function addDraw(s, fn) {
  s.draw = function () {
    fn(s);
  };
  return s;
}

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
