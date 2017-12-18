require 'colorize'

module PodUpdate

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
  end

end