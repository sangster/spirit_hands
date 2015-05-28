require 'spirit_hands/plugin'

# awesome_print is autoloaded by Hirb::View patch and/or SpiritHands::Print
# pry was loaded earlier
SpiritHands.plugin 'pry-coolline'
SpiritHands.plugin 'pry-doc'
SpiritHands.plugin 'pry-git'
# pry-rails was loaded earlier (if needed)
SpiritHands.plugin 'pry-remote'
# hirb is autoloaded by SpiritHands.hirb = true
