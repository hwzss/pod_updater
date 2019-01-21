# lib = File.expand_path("../../lib", __FILE__)
# $LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "pod_updater/version"
require "pod_updater/pod_push"

module PodUpdater
	
	def self.run(version, cp_path)
		path = File.expand_path(Dir.pwd)
		path = "/Users/kaifa/Desktop/Working/GitLab/WZ_HelloKit/WZ_HelloKit.podspec"
		pushPodToSevice(path, version, cp_path)
	end

	puts "开始"
	PodUpdater.run('5.5.3', '')
	puts "结束"

end
