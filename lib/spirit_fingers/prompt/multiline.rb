require 'spirit_fingers/prompt/base'

module SpiritFingers
  module Prompt
    class << self
      private

      # Wait pry prompt in multiline input
      def multiline
        ->(object, level, pry) {
          s = State.new(object, level, pry, ::SpiritFingers.app, true)
          render(s, ::SpiritFingers.prompt, ::SpiritFingers.color && ::SpiritFingers.colored_prompt)
        }
      end
    end
  end
end
