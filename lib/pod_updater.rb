require "pod_updater/version"
require "pod_updater/pod_push"


module PodUpdater

	def self.run(version)
		path = File.expand_path(Dir.pwd)		
		pushPodToSevice(path,version)
	end

end

