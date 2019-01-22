# lib = File.expand_path("../../lib", __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "pod_updater/version"
# require "pod_updater/pod_push"
load "/Users/kaifa/Desktop/Working/GitLab/pod_updater/lib/pod_updater/pod_push.rb"

module PodUpdater
	
	def self.run(version, cp_path)
		path = File.expand_path(Dir.pwd)
		pushPodToSevice(path, version, cp_path)
	end

	
	puts "开始"
	PodUpdater.run('5.5.5', nil)
	puts "结束"

end
