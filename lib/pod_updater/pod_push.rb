require 'pod_updater/git_tag_flow'
require 'pod_updater/modify_podspec'
require 'pod_updater/ui'
require 'pod_updater/cp_podspec'
require 'pod_updater/pod_updater_file'

module PodUpdater

		# 给定pod库项目的路径，以及新版pod库的版本，将自己的pod提交到git,然后打上tag，再push trunk到pod服务器去,如果cp_path存在则将最后的podspec文件拷贝到cp_path下
	def pushPodToSevice(path,version,cp_path)

		podFilePath = pathWithPodspecSuffix(path)

		unless podFilePath 		
			return  # 未找到相应的podspec文件
		end

		#  pod lib lint 检查
		lib_cmd = %(pod lib lint #{podFilePath} --allow-warnings)
		output = ""
		UI.log_cmd(lib_cmd)
		IO.popen(lib_cmd) do |io|
			io.each do |line|
				UI.msg(line)
				output += line.to_s
			end
		end

		if output =~ %r(ERROR|error)
			UI.err("pod lib lint 发生错误")
			return
		end

		msg = "for pod version:#{version}"

		modifyPodspec(path:podFilePath,version:version) #将podspec文件的版本号进行修改

		if cp_path
			copy_podspec(podFilePath, cp_path,version)
		end

		pod_updater_file = PodUpdaterFile.new(File.dirname(podFilePath))
		if pod_updater_file.paths
			pod_updater_file.paths.each_with_index do |elem, index|
				copy_podspec(podFilePath,elem.to_s, version)
			end
		end

		git_tag_flow(path,msg,version)

		# 添加错误报告，成功后，弹出通知，点击通知进入 rubygems 上打开 gem
		cmd = []
		cmd << %(pod trunk push #{podFilePath} --allow-warnings)
		push_cmd_output = ""
		UI.log_cmd(cmd)
		IO.popen(cmd.join('')) do |io|
			io.each do |line|
				UI.msg(line)
				push_cmd_output += line.to_s
			end
		end

		if push_cmd_output =~ %r(ERROR|error)
			UI.err("pod lib lint 发生错误")								
		else
			UI.notification(title: "上传完成✅")
		end

	end

	module_function :pushPodToSevice
	
end