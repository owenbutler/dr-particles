require 'app/particles.rb'
require 'app/example_emitters.rb'

$particles = []

def tick args

  args.outputs.background_color = [0, 0, 0]

  particles_tick(EMITTERS, $particles, args)

  if args.inputs.keyboard.key_held.backspace
    args.outputs.debug << args.gtk.framerate_diagnostics_primitives
    args.outputs.labels << {y: 715, x: 550, text: "p: #{$particles.length}", r: 255, g: 255, b: 255, size_enum: -1}
  end
end
