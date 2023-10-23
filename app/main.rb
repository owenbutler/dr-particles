EMITTERS = [
  # rgb with blend add
  {
    num: 1, freq: 1,
    x: 100, y: 600, w: 32, h: 32,
    grow_factor: 1.019,
    path: 'sprites/particle.png',
    xv_min: 2, xv_max: 5.0,
    yv_min: -1.0, yv_max: 1.0,
    time: 60,
    r: 255, g: 0, b: 0,
    a: 130, blendmode_enum: 2,
    fade: true, fade_start: 130, fade_end: 0, fade_ease: :quad,
  },
  {
    num: 1, freq: 1,
    x: 400, y: 600, w: 32, h: 32,
    grow_factor: 1.019,
    path: 'sprites/particle.png',
    xv_min: 2, xv_max: 5.0,
    yv_min: -1.0, yv_max: 1.0,
    time: 60,
    r: 0, g: 255, b: 0,
    a: 130, blendmode_enum: 2,
    fade: true, fade_start: 130, fade_end: 0, fade_ease: :quad,
  },
  {
    num: 1, freq: 1,
    x: 700, y: 600, w: 32, h: 32,
    grow_factor: 1.019,
    path: 'sprites/particle.png',
    xv_min: 2, xv_max: 5.0,
    yv_min: -1.0, yv_max: 1.0,
    time: 60,
    r: 0, g: 0, b: 255,
    a: 130, blendmode_enum: 2,
    fade: true, fade_start: 130, fade_end: 0, fade_ease: :quad,
  },

  # rgb with blend default
  {
    num: 1, freq: 1,
    x: 100, y: 500, w: 32, h: 32,
    grow_factor: 1.019,
    path: 'sprites/particle.png',
    xv_min: 2, xv_max: 5.0,
    yv_min: -1.0, yv_max: 1.0,
    time: 60,
    r: 255, g: 0, b: 0,
    a: 130, blendmode_enum: 1,
    fade: true, fade_start: 130, fade_end: 0, fade_ease: :quad,
  },
  {
    num: 1, freq: 1,
    x: 400, y: 500, w: 32, h: 32,
    grow_factor: 1.019,
    path: 'sprites/particle.png',
    xv_min: 2, xv_max: 5.0,
    yv_min: -1.0, yv_max: 1.0,
    time: 60,
    r: 0, g: 255, b: 0,
    a: 130, blendmode_enum: 1,
    fade: true, fade_start: 130, fade_end: 0, fade_ease: :quad,
  },
  {
    num: 1, freq: 1,
    x: 700, y: 500, w: 32, h: 32,
    grow_factor: 1.019,
    path: 'sprites/particle.png',
    xv_min: 2, xv_max: 5.0,
    yv_min: -1.0, yv_max: 1.0,
    time: 60,
    r: 0, g: 0, b: 255,
    a: 130, blendmode_enum: 1,
    fade: true, fade_start: 130, fade_end: 0, fade_ease: :quad,
  },

  # water bubble?
  {
    num: 5, freq: 2,
    x: 100, y: 120, w: 16, h: 16,
    grow_factor: 1.009,
    path: 'sprites/kenny-particles/circle_03.png',
    xv_min: -0.2, xv_max: 0.2,
    yv_min: 0.5, yv_max: 1.0,
    time: 60,
    r: 0, g: 0, b: 255,
    a: 130, blendmode_enum: 1,
    fade: true, fade_start: 130, fade_end: 0, fade_ease: :quad,
  },

  # smoke
  {
    num: 1, freq: 2,
    x: 200, y: 120, w: 16, h: 16,
    grow_factor: 1.011,
    path: 'sprites/kenny-particles/smoke_01.png',
    xv_min: -0.1, xv_max: 0.1,
    yv_min: 0.3, yv_max: 0.9,
    time: 180,
    r: 200, g: 200, b: 200,
    a: 130, blendmode_enum: 1,
    fade: true, fade_start: 255, fade_end: 0, fade_ease: :quad,
    angle: -1,
  },

  # Fire!
  {
    num: 1, freq: 2,
    x: 400, y: 120, w: 64, h: 64,
    grow_factor: 1.011,
    path: 'sprites/kenny-particles/smoke_01.png',
    xv_min: -0.2, xv_max: 0.2,
    yv_min: 0.6, yv_max: 1.8,
    time: 120,
    r: 200, g: 200, b: 200,
    a: 130, blendmode_enum: 1,
    fade: true, fade_start: 255, fade_end: 0, fade_ease: :quad,
    angle: -1,
  },
  {
    num: 1, freq: 2,
    x: 400, y: 120, w: 32, h: 32,
    grow_factor: 1.011,
    path: 'sprites/kenny-particles/flame_01.png',
    xv_min: -0.2, xv_max: 0.2,
    yv_min: 0.6, yv_max: 1.8,
    time: 60,
    r: 255, g: 100, b: 0,
    a: 130, blendmode_enum: 2,
    fade: true, fade_start: 255, fade_end: 0, fade_ease: :quad,
    angle: -1,
  },

  # wave
  {
    num: 1, freq: 2,
    x: 600, y: 720, w: 1000, h: 64,
    grow_factor: 1.033,
    path: 'sprites/kenny-particles/spark_07.png',
    xv_min: 0, xv_max: 0.0,
    yv_min: -0.7, yv_max: 0,
    time: 60,
    r: 0, g: 200, b: 255,
    a: 20, blendmode_enum: 1,
    fade: true, fade_start: 200, fade_end: 0, fade_ease: :quart,
  },

  # firework 1
  {
    num: 2, freq: 1,
    x: 650, y: 120, w: 16, h: 16,
    grow_factor: 1.00,
    path: 'sprites/particle.png',
    xv_min: -0.7, xv_max: 0.7,
    yv_min: 5, yv_max: 9.0,
    grav: true, grav_x: 0.0, grav_y: -0.201,
    time: 100,
    r: 255, g: 50, b: 100,
    a: 130, blendmode_enum: 2,
    fade: true, fade_start: 130, fade_end: 0, fade_ease: :quad,
  },
  # firework 2
  {
    num: 2, freq: 1,
    x: 750, y: 250, w: 16, h: 16,
    grow_factor: 1.00,
    path: 'sprites/particle.png',
    xv_min: -0.7, xv_max: 0.7,
    yv_min: -8, yv_max: -5.0,
    grav: true, grav_x: 0.0, grav_y: 0.201,
    time: 60,
    r: 50, g: 0, b: 200,
    a: 130, blendmode_enum: 2,
    fade: true, fade_start: 255, fade_end: 0, fade_ease: :quad,
  },

  # explosion
  {
    num: 3, freq: 120,
    x: 1000, y: 300, w: 32, h: 32,
    grow_factor: 1.033,
    path: 'sprites/kenny-particles/scratch_01.png',
    xv_min: 0, xv_max: 0.0,
    yv_min: 0, yv_max: 0,
    time: 20,
    r: 200, g: 200, b: 200,
    a: 20, blendmode_enum: 2,
    fade: true, fade_start: 200, fade_end: 0, fade_ease: :quart,
    angle: -1,
  },
  {
    num: 1, freq: 120,
    x: 1000, y: 300, w: 64, h: 64,
    grow_factor: 1.093,
    path: 'sprites/kenny-particles/scorch_02.png',
    xv_min: 0, xv_max: 0.0,
    yv_min: 0, yv_max: 0,
    time: 15,
    r: 255, g: 100, b: 000,
    a: 20, blendmode_enum: 2,
    fade: true, fade_start: 255, fade_end: 0, fade_ease: :quart,
    angle: -1,
  },
  {
    num: 2, freq: 120,
    x: 1000, y: 300, w: 64, h: 64,
    grow_factor: 1.013,
    path: 'sprites/kenny-particles/smoke_01.png',
    xv_min: 0, xv_max: 0.0,
    yv_min: 0, yv_max: 0,
    time: 100,
    r: 255, g: 255, b: 255,
    a: 20, blendmode_enum: 2,
    fade: true, fade_start: 100, fade_end: 0, fade_ease: :quart,
    angle: -1,
  },
]

$particles = []

def process_emitters emitters, args

  tc = args.tick_count

  num_emitters = emitters.length
  index = 0
  while index < num_emitters
    emitter = emitters[index]

    next_spawn = emitter.fetch(:next_spawn, 0)
    if next_spawn.elapsed?

      emitter.num.times do
        $particles << emitter.copy().merge!( {
          anchor_x: 0.5, anchor_y: 0.5,
          xvel: rand().remap(0, 1, emitter.xv_min, emitter.xv_max),
          yvel: rand().remap(0, 1, emitter.yv_min, emitter.yv_max),
          time: tc + emitter.time,
          angle: emitter.angle == -1 ? rand(360) : emitter.angle,
          spawn_time: tc,
        })
      end
      emitter[:next_spawn] = args.tick_count + emitter[:freq]
    end

    index += 1
  end
end

def process_particles args
  # quick hack to both update particles, and reject/remove the dead ones
  $particles.reject! do |p|
    p.x += p.xvel
    p.y += p.yvel
    p.merge!(p.scale_rect(p.grow_factor, 0.0, 0.0))

    if p.fade
      p.a = args.easing.ease(p.spawn_time, args.tick_count, p.time - p.spawn_time, p.fade_ease).remap(0, 1, p.fade_start, p.fade_end)
    end

    if p.grav
      p.xvel += p.grav_x
      p.yvel += p.grav_y
    end

    p.time.elapsed?
  end
end

def render_particles args
  args.outputs.sprites << $particles
end

def tick args

  args.outputs.background_color = [0, 0, 0]

  process_emitters EMITTERS, args
  process_particles args
  render_particles args

  if args.inputs.keyboard.key_held.backspace
    args.outputs.primitives << args.gtk.framerate_diagnostics_primitives
    args.outputs.labels << {y: 715, x: 550, text: "p: #{$particles.length}", r: 255, g: 255, b: 255, size_enum: -1}
  end
end
