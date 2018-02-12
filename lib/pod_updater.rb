lib = File.expand_path("../../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "pod_updater/version"
require "pod_updater/pod_push"

module PodUpdater
	
	def self.run(version, cp_path)
		path = File.expand_path(Dir.pwd)
		pushPodToSevice(path, version, cp_path)
	end

end

PodUpdater.run('4.3.3', nil)