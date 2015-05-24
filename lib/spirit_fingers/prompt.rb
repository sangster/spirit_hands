require 'spirit_fingers/prompt/main'
require 'spirit_fingers/prompt/multiline'

module SpiritFingers
  module Prompt
    class << self
      def install!(app = nil)
        ::SpiritFingers.app ||= app
        ::Pry.config.prompt = [ main, multiline ].freeze
      end
    end
  end
end
