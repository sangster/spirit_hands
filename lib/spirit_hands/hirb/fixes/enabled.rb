# Adds Hirb.enabled?
require 'hirb'
require 'pry'

module Hirb
  class << self
    @enabled = false
    def enabled?
      !!@enabled
    end

    protected

    def set_enabled
      @enabled = true
    end

    def set_disabled
      @enabled = false
    end
  end
end

class << Hirb::View
  alias_method :enable_output_method_existing, :enable_output_method
  alias_method :disable_output_method_existing, :disable_output_method

  def enable_output_method
    @output_method = true
    ::Hirb.send :set_enabled
    enable_output_method_existing
  end

  def disable_output_method
    ::Hirb.send :set_disabled
    disable_output_method_existing
  end
end
