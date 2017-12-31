require "fileutils"
require 'pod_updater/ui'

module PodUpdater
	
	module_function
	# 将podspec文件拷贝到备份的文件目录
	def copy_podspec(podspec_path:from, copy_path:to, version:pod_version)

		return unless to

		unless File.exist?(to)
			UI.msg('cp_path错误,请提供正确的路径')
			to = gets
		end
		unless File.directory?(to)
			UI.msg('cp_path错误,请提供正确的路径')
			to = gets
		end

		pod_name = File.basename(from)
		destination_path = destination_path_from(to, basename, pod_version)

		FileUtils.cp(from, destination_path)
	end

	# desc:负责对cp路径进行检查修正，保证目的路径是包含了以库名为名称的目录,并且在下面新建一个对应版本的文件夹
	def destination_path_from(to_path, pod_name, pod_version)
		destination_path = ''
		#检查给定的path是否存在pod_name的路径
		unless to_path =~ "#{pod_name}"
			destination_path = File.join(to_path,pod_version)
		else
			destination_path = File.join(to_path, pod_name, pod_version)
		end

		FileUtils.mkdir_p(destination_path) unless File.exist?(destination_path)

		destination_path
	end

end