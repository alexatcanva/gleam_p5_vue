import p5
import gleam/list
import gleam/float
import gleam/int

const window_width = 480

const window_height = 360

type Vector {
  Vector(x: Float, y: Float)
}

type Particle {
  Particle(position: Vector, velocity: Vector, lifespan: Float)
}

type ParticleSystem {
  ParticleSystem(location: Vector, particles: List(Particle))
}

fn vector_add(a: Vector, b: Vector) -> Vector {
  Vector(x: a.x +. b.x, y: a.y +. b.y)
}

fn new_particle(position: Vector) -> Particle {
  Particle(
    position: position,
    velocity: Vector(x: float.random(), y: float.random()),
    lifespan: 200.0,
  )
}

fn run_particle(
  sketch: p5.P5,
  particle: Particle,
  acceleration: Vector,
) -> Particle {
  let updated_particle = update_particle(particle, acceleration)
  draw_particle(sketch, updated_particle)
  updated_particle
}

fn update_particle(particle: Particle, acceleration: Vector) -> Particle {
  let delta = vector_add(particle.velocity, acceleration)
  Particle(
    velocity: delta,
    position: vector_add(particle.position, delta),
    lifespan: particle.lifespan -. 2.0,
  )
}

fn draw_particle(sketch: p5.P5, particle: Particle) {
  sketch
  |> p5.stroke2(200, particle.lifespan)
  |> p5.stroke_weight(2)
  |> p5.fill(127, particle.lifespan)
  |> p5.ellipse(particle.position.x, particle.position.y, 12, 12)
}

fn run_particle_system(
  sketch: p5.P5,
  acceleration: Vector,
  system: ParticleSystem,
) -> ParticleSystem {
  let particles = {
    let parts = list.filter(system.particles, fn(p) { p.lifespan >. 0.0 })
    use par <- list.map(parts)
    run_particle(sketch, par, acceleration)
  }
  ParticleSystem(location: system.location, particles: particles)
}

fn add_particle(system: ParticleSystem) -> ParticleSystem {
  ParticleSystem(location: system.location, particles: [
    new_particle(system.location),
    ..system.particles
  ])
}

pub fn gleam_draw(sketch: p5.P5) -> p5.P5 {
  let system_state =
    ParticleSystem(
      Vector(
        int.to_float(window_width) /. 2.0,
        int.to_float(window_height) /. 2.0,
      ),
      [],
    )

  let start = fn(sketch: p5.P5, _state: ParticleSystem) -> ParticleSystem {
    p5.create_canvas(sketch, window_width, window_height)
    p5.framerate(sketch, 60.0)
    system_state
  }

  let update = fn(sketch: p5.P5, state: ParticleSystem) -> ParticleSystem {
    sketch
    |> p5.background(51)
    let new_state = add_particle(state)
    run_particle_system(sketch, Vector(float.random() /. 10.0, 0.05), new_state)
  }

  p5.new(sketch, p5.Config(start, update, system_state))
}
