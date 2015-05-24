# encoding: UTF-8
require 'readline'
require 'spirit_fingers/mattr_accessor_with_default'
require 'spirit_fingers/options/color'
require 'spirit_fingers/options/less'
require 'spirit_fingers/options/hirb'

module SpiritFingers
  autoload :Terminal, 'spirit_fingers/terminal'

  ### Options ###

  # When printing values, start with this (default: '=> ')
  mattr_accessor_with_default :value_prompt, '=> '

  # Spaces to indent value (default: 2 spaces)
  mattr_accessor_with_default :value_indent, 2

  # Name of the app, which can be displayed to <app/> tag in prompt
  mattr_accessor_with_default :app, -> {
    # Trumpet emoji or pry
    (Terminal.unicode?) ? "\u{1F3BA}" : 'pry'
  }

  # <color>...</color>
  # <bold>...</color>
  # <cmd/>  command number
  # <app/>  SpiritFingers.app, which can be String or a Rails Applicatino object
  # <sep/>  SpiritFingers.prompt_separator
  #
  # Use \ to escape literal <, so in a Ruby string constant, "\\<"
  #
  mattr_accessor_with_default :prompt,
    '<b>[<cmd/>]</b> <blue><app/></blue><tgt/>  <red><sep/></red>  '

  # Color the prompt?
  #
  # A different setting than Pry.color since some may like colored output, but a
  # plain prompt.
  #
  # Default: 'true' for GNU readline or rb-readline which correctly count line
  # widths with color codes when using \001 and \002 hints. 'false' for
  # libedit-based wrapper (standard on OS X unless ruby is explicitly compiled
  # otherwise).
  mattr_accessor_with_default :colored_prompt, -> { ::Readline::VERSION !~ /EditLine/ }

  # Separator between application name and input in the prompt.
  #
  # Default: right angle quote (chevron) or >
  #
  mattr_accessor_with_default :prompt_separator, -> {
    (Terminal.unicode?) ? "\u{BB}" : '>'
  }

  # Enable or disable AwesomePrint (default: true)
  mattr_accessor_with_default :awesome_print, true
end
