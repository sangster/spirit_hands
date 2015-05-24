# Do this to use SpiritFingers outside Rails
#
#      # .pryrc
#      # ...
#      SpiritFingers.melody!
#
#
module SpiritFingers
  autoload :VERSION, 'spirit_fingers/version'
end
require 'spirit_fingers/options'
require 'spirit_fingers/melody'
require 'spirit_fingers/railtie' if defined? ::Rails
