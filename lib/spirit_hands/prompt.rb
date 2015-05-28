require 'spirit_hands/prompt/main'
require 'spirit_hands/prompt/multiline'

module SpiritHands
  module Prompt
    class << self
      def install!(app = nil)
        ::Pry.config.prompt = [ main, multiline ].freeze
      end
    end
  end
end
