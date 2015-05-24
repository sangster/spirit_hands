require 'spirit_fingers/plugin'

# awesome_print is autoloaded by Hirb::View patch and/or SpiritFingers::Print
# pry was loaded earlier
SpiritFingers.plugin 'pry-coolline'
SpiritFingers.plugin 'pry-doc'
SpiritFingers.plugin 'pry-git'
# pry-rails was loaded earlier (if needed)
SpiritFingers.plugin 'pry-remote'
# hirb is autoloaded by SpiritFingers.hirb = true
