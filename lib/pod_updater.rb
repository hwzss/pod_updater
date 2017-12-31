
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require "pod_updater/version"
require "pod_updater/pod_push"

module PodUpdater
	
	def self.run(version, cp_path)
		path = File.expand_path(Dir.pwd)		
		pushPodToSevice(path, version, cp_path)
	end

end

require 'optparse'

options = {}
option_parser = OptionParser.new do |opts|

  opts.banner = 'here is help messages of the command line tool for pod_updater'
  options[:version] = nil
  opts.on('-v', '--version [version]', String, 'the podspec\'s new version') do |version|
   	options[:version] = version
  end

	options[:verbose] = false
  opts.on( '-v', '--verbose', 'Output more information' ) do
    options[:verbose] = true
  end

  options[:path] = nil
  opts.on('-c', '--cpath [path]', String, 'the path where the podspec file need to copy') do |path|
   	options[:path] = path
  end

end.parse!

# unless options[:version]
#
#   abort("ABORTED! You forgot pass a version value with command \'-v [version]\'")
#   exit
# end

# PodUpdater.run(options[:version], options[:path])
PodUpdater.run('3.0.2', 'Users/qwkj/Desktop/IOS_Pod_Spec_Repo/千网PodRepo/')

