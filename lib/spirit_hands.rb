# Do this to use SpiritHands outside Rails
#
#      # .pryrc
#      require 'spirit_hands'
#      # ...
#
#
module SpiritHands
  autoload :VERSION,  'spirit_hands/version'
  autoload :Print,    'spirit_hands/print'
  autoload :Prompt,   'spirit_hands/prompt'
  autoload :Terminal, 'spirit_hands/terminal' 
end

require 'spirit_hands/options'
require 'spirit_hands/melody'
if defined? ::Rails
  require 'pry-rails'
  require 'spirit_hands/railtie'
  Pry.plugin['rails'].activate!
else
  SpiritHands.melody!
end
