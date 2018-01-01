require "fileutils"
require 'pod_updater/ui'

module PodUpdater
	
	module_function
	# 将podspec文件拷贝到备份的文件目录
	def copy_podspec(from_path, distination, pod_version)

		return unless distination

		unless File.exist?(distination)
			UI.msg("cp_path:#{distination}不存在,请提供正确的路径:")
			distination = gets.to_s.chomp
			copy_podspec(from_path, distination, pod_version)
			return
		end
		unless File.directory?(distination)
			UI.msg("cp_path:#{distination}不是目录,请提供正确的路径")
			distination = gets.to_s.chomp
			copy_podspec(from_path, distination, pod_version)
			return
		end

		pod_name = File.basename(from_path, '.podspec')
		destination_path = destination_path_from(distination, pod_name, pod_version)

		unless destination_path
			UI.err('无法计算出正确的copy路径，podspec文件复制失败')
		else
			FileUtils.cp(from_path, destination_path)
		end

	end

	# desc:负责对cp路径进行检查修正，保证目的路径是包含了以库名为名称的目录,并且在下面新建一个对应版本的文件夹
	def destination_path_from(to_path, pod_name, pod_version)
		destination_path = ''
		#检查给定的path是否存在pod_name的路径
		if to_path =~ %r(#{pod_name})
			destination_path = File.join(to_path,pod_version)
		else
			destination_path = File.join(to_path, pod_name, pod_version)
		end

		FileUtils.mkdir_p(destination_path) unless File.exist?(destination_path)

		destination_path = nil unless File.exist?(destination_path)

		destination_path
	end

end

