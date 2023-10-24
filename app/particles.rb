def process_emitters(emitters, particles, args)

  tc = args.tick_count

  num_emitters = emitters.length
  index = 0
  while index < num_emitters
    emitter = emitters[index]

    next_spawn = emitter.fetch(:next_spawn, 0)
    if next_spawn.elapsed?

      emitter.num.times do
        particles << emitter.copy().merge!( {
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

def process_particles(particles, args)
  # quick hack to both update particles, and reject/remove the dead ones
  particles.reject! do |p|
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

def render_particles(particles, args)
  args.outputs.sprites << particles
end
