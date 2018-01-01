require 'colorize'

module PodUpdater

  class UI
    def self.err(msg)
      puts msg.colorize(:red)
    end

    def self.success(msg)
      puts msg.colorize(:green)
    end

    def self.msg(msg)
      puts msg.colorize(:green)
    end

    def self.warning(msg)
      puts msg.colorize(:yellow)
    end

    def self.log_cmd(msg)
      if msg.kind_of?(Array)
        msg = msg.join(' && ')
      end
      puts msg.to_s.colorize(:blue)
    end
  end


end

include PodUpdater
cmd = []
cmd << %(pod trunk push  --allow-warnings)
UI.log_cmd(cmd)
UI.err('哈哈')