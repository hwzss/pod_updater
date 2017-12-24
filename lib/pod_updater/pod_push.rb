require "pod_updater/git_tag_flow"
require "pod_updater/modify_podspec"
require 'pod_updater/ui'

module PodUpdater

		# 给定pod库项目的路径，以及新版pod库的版本，将自己的pod提交到git,然后打上tag，再push trunk到pod服务器去
	def pushPodToSevice(path,version)

		podFilePath = pathWithPodspecSuffix(path)

		unless podFilePath 
		
			return  # 未找到相应的podspec文件
		end

		msg = "for pod version:#{version}"

		modifyPodspec(path:podFilePath,version:version)

		git_tag_flow(path,msg,version)

		cmd = []
		cmd << %(pod trunk push #{podFilePath} --allow-warnings)

		IO.popen(cmd.join('')) do |io|
			io.each do |line|
				UI.msg(line)
			end
		end
		
	end

	module_function :pushPodToSevice
	
end