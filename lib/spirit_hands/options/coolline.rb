module SpiritHands
  class << self
    # Is cooline enabled?
    def coolline
      @coolline = DEFAULT_COOLLINE if @coolline.nil?
      @coolline
    end

    # Set whether hirb is enabled (default: true)
    def coolline=(c)
      c = DEFAULT_COOLLINE if c.nil?
      @coolline = !!c
    end

  protected

    def install_coolline!
      return if coolline_installed?
      @orig_input ||= Pry.input
      @orig_completer ||= Pry.config.completer
      require 'pry-coolline'
      Pry.plugins['coolline'].activate!
      begin
        require 'pry-bond'
        Pry.plugins['bond'].activate!
      rescue LoadError
      end
      @coolline_input ||= Pry.input
      @coolline_completer ||= Pry.config.completer
      Pry.config.completer = @coolline_completer
      Pry.input = @coolline_input
    end

    def uninstall_coolline!
      return unless coolline_installed?
      Pry.plugins['coolline'].disable!
      if !Pry.plugins['bond'].is_a? Pry::PluginManager::NoPlugin
        Pry.plugins['bond'].disable!
      end
      Pry.config.completer = @orig_completer
      Pry.input = @orig_input
    end

    def coolline_installed?
      !@orig_input.nil? && @orig_input != Pry.input
    end

    def setup_coolline!
      if SpiritHands.coolline
        SpiritHands.install_coolline!
      else
        SpiritHands.uninstall_coolline!
      end
    end

    def setup_coolline
      Pry.hooks.add_hook(:after_read, "setup_coolline0") do |code, pry|
        setup_coolline!
      end
      Pry.hooks.add_hook(:before_session, "setup_coolline1") do |output, binding, pry|
        setup_coolline!
      end
    end
  end

  DEFAULT_COOLLINE = false # TODO: fix pry-coolline and/or integration
end
