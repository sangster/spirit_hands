require 'spirit_fingers/prompt/base'

module SpiritFingers
  module Prompt
    class << self
      private

      # Normal, main pry prompt
      def main
        ->(object, level, pry) do
          s = State.new(object, level, pry, ::SpiritFingers.app, false)
          color = ::SpiritFingers.color && ::SpiritFingers.colored_prompt
          render(s, ::SpiritFingers.prompt, color)
        end
      end
    end
  end
end
