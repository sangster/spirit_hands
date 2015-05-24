module SpiritFingers
  class << self
    # A thin wrapper around require for troubleshooting
    def plugin(*requires)
      cond = requires.pop if requires.last.respond_to? :call
      requires.each do |r|
        begin
          if cond && !cond.()
            plugin_debug "JF require #{r} (skipped)"
            next
          end
          res = require r
        rescue LoadError
          plugin_debug "JF require #{r} FAILED"
        else
          plugin_debug "JF require #{r} -> #{res}"
        end
      end
    end

    private

    def plugin_debug(*args)
      return if !ENV['SPIRIT_FINGERS_PLUGIN_DEBUG']
      STDERR.puts(*args)
    end
  end
end
