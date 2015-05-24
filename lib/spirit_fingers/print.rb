module SpiritFingers
  module Print
    class << self
      def install!
        ::Pry.config.print = PRINT_FUNCTION
      end

      def pretty(value)
        if ::SpiritFingers.awesome_print
          require 'awesome_print' unless defined?(AwesomePrint)
#          opts = { :indent => ::SpiritFingers.value_indent }
#          opts[:plain] = true if !SpiritFingers.color
          value.ai#(opts)
        else
          value.inspect
        end
      end

      def hirb_unicode_enabled?
        ::Hirb::Formatter.dynamic_config.keys.any? do |key|
          if opts = ::Hirb::Formatter.dynamic_config[key][:options]
            opts && opts[:unicode]
          end
        end
      end

      def print(_output, value, _pry_)
        if ::Hirb.enabled?
          setup_hirb_unicode
          return if ::Hirb::View.view_or_page_output(value)
        end
        _pry_.pager.page("#{::SpiritFingers.value_prompt}#{pretty(value)}")
      end

      private

      PRINT_FUNCTION = ->(_output, value, _pry_) do
        ::SpiritFingers::Print.print(_output, value, _pry_)
      end

      def hirb_unicode_enable
        return false unless ::SpiritFingers::Terminal.unicode?
        require 'hirb/unicode'

        ::Hirb::Formatter.dynamic_config.keys.each do |key|
          ::Hirb::Formatter.dynamic_config[key][:options] ||= {}
          ::Hirb::Formatter.dynamic_config[key][:options][:unicode] = true
        end
        true
      end

      def hirb_unicode_disable
        ::Hirb::Formatter.dynamic_config.keys.each do |key|
          ::Hirb::Formatter.dynamic_config[key][:options] ||= {}
          ::Hirb::Formatter.dynamic_config[key][:options][:unicode] = false
        end
        false
      end

      def setup_hirb_unicode
        if hirb_unicode_enabled? != SpiritFingers.hirb_unicode
          if SpiritFingers.hirb_unicode
            hirb_unicode_enable
          else
            hirb_unicode_disable
          end
        end
        nil
      end
    end
  end
end
