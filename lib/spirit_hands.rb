# Do this to use SpiritHands outside Rails
#
#      # .pryrc
#      # ...
#      SpiritHands.melody!
#
#
module SpiritHands
  autoload :VERSION, 'spirit_hands/version'
end
require 'spirit_hands/options'
require 'spirit_hands/melody'
require 'spirit_hands/railtie' if defined? ::Rails
