require 'colorize'

module PodUpdater

  class UI
    def self.err(msg)
      puts msg.colorize(:red)
      self.notification(title: 'pod_updater get error', message: msg)
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

    def self.notification(title: "", message: "", **args)
        `terminal-notifier -title '#{title}r' -message '#{message}' -activate 'com.apple.Terminal'`
    end

    def self.notification_openurl(title: "", message: "", url: "", **args) 
      `terminal-notifier -title '#{title}r' -message '#{message}' -open '#{url}'`
    end
    
  end


end

