
def particles_tick(emitters, particles, args)
  process_emitters(emitters, particles, args)
  process_particles(particles, args)
  render_particles(particles, args)
end

$palettes = [
  [[0.5,0.5,0.5],[0.5,0.5,0.5],[1.0,1.0,1.0],[0,0.3333,0.6666]],
  [[0.5,0.5,0.5],[0.666,0.666,0.666],[1.0,1.0,1.0],[0,0.3333,0.6666]],
  [[0.5,0.5,0.5],[0.75,0.75,0.75],[1.0,1.0,1.0],[0,0.3333,0.6666]],
  [[0.5,0.5,0.5],[1,1,1],[1.0,1.0,1.0],[0,0.3333,0.6666]],
  [[1,0.5,0.5],[0.5,0.5,0.5],[0.75,1.0,0.6666],[0.8,1.0,0.3333]],
  [[0.5,0.5,0.5],[0.5,0.5,0.5],[0.8,0.8,0.5],[0,0.2,0.5]],
  [[0.6666,0.5,0.5],[0.5,0.6666,0.5],[0.6666,0.666,0.5],[0.2,0.0,0.5]],
  [[0.5,0.5,0],[0.5,0.5,0],[0.5,0.5,0],[0.5,0.0,0]],
  [[0.0,0.5,0.5],[0,0.5,0.5],[0.0,0.3333,0.5],[0.0,0.6666,0.5]],
  [[0.5,0.5,0],[0.5,0.5,0],[0.1,0.5,0],[0.0,0.0,0]],
  [[0.0,0.5,0.5],[0,0.5,0.5],[0.0,0.5,0.3333],[0.0,0.5,0.6666]],
  [[0.5,0,0.5],[0.5,0,0.5],[0.5,0,0.5],[0,0,0.5]],
  [[0.650,0.5,0.310],[-0.650,0.5,0.6],[0.333,0.278,0.278],[0.660,0.0,0.667]],
  [[0.660,0.56,0.680],[0.718,0.438,0.720],[0.520,0.8,0.520],[-0.430,-0.397,-0.083]],
  [[0.610,0.498,0.650],[0.388,0.498,0.350],[0.530,0.498,0.620],[3.438,3.012,4.025]],
  [[0.731,1.098,0.192],[0.358,1.090,0.657],[1.077,0.360,0.328],[0.965,2.265,0.837]],
  [[0.892,0.725,0.000],[0.878,0.278,0.725],[0.332,0.518,0.545],[2.440,5.043,0.732]],
  [[0.821,0.328,0.242],[0.659,0.481,0.896],[0.612,0.340,0.296],[2.820,3.026,-0.273]],
  [[0.938,0.328,0.718],[0.659,0.438,0.328],[0.388,0.388,0.296],[2.538,2.478,0.168]],
  [[0.590,0.811,0.120],[0.410,0.392,0.590],[0.940,0.548,0.278],[-4.242,-6.611,-4.045]],
]

# Ruby implementation (without vectors) of the cosine based palette generator from here:
#  https://iquilezles.org/articles/palettes/
# Example palettes (and create your own) here:
#  http://dev.thi.ng/gradients/
def colors t, p_index
  p = $palettes[p_index]
  {
    r: (p[0][0] + p[1][0] * (Math.cos(6.28318*(p[2][0]+t+p[3][0])))) * 255,
    g: (p[0][1] + p[1][1] * (Math.cos(6.28318*(p[2][1]+t+p[3][1])))) * 255,
    b: (p[0][2] + p[1][2] * (Math.cos(6.28318*(p[2][2]+t+p[3][2])))) * 255,
  }
end

def process_emitters(emitters, particles, args)

  tc = args.tick_count
  color_time = tc * 2000

  num_emitters = emitters.length
  index = 0
  while index < num_emitters
    emitter = emitters[index]

    if emitter.key?(:etime)
      emitter.etime -= 1
      putz "emitter etime is #{emitter.etime}"
    end

    next_spawn = emitter.fetch(:next_spawn, 0)
    if next_spawn.elapsed?

      emitter.num.times do
        particle = emitter.copy().merge!( {
          anchor_x: 0.5, anchor_y: 0.5,
          x: maybe_range(emitter, :x),
          y: maybe_range(emitter, :y),
          w: maybe_range(emitter, :w),
          h: maybe_range(emitter, :h),
          xvel: rand().remap(0, 1, emitter.xv_min, emitter.xv_max),
          yvel: rand().remap(0, 1, emitter.yv_min, emitter.yv_max),
          time: tc + maybe_range(emitter, :time),
          angle: emitter.angle == -1 ? rand(360) : emitter.angle,
          spawn_time: tc,
        })

        if emitter.palette
          colors_hash = colors(color_time, emitter.palette)
          particle.merge!(colors_hash)
        end
        particles << particle
      end
      emitter[:next_spawn] = tc + emitter[:freq]
    end

    index += 1
  end

  emitters.reject! do |em|
    should_remove = false
    if em.key?(:etime)
      putz "should remove this emitter"
      if em.etime <= 0
        should_remove = true
      end
    end

    should_remove
  end
end

def maybe_range(emitter, key)
  min_key = :"min_#{key}"
  max_key = :"max_#{key}"

  if emitter[min_key] && emitter[max_key]
    rand().remap(0, 1, emitter[min_key], emitter[max_key])
  else 
    emitter[key]
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
