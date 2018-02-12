require 'pod_updater/ui'

module PodUpdater

		# 修改podspec的s.verison的值
	def modifyPodspec(path:"",version:"0.0.0")

		if version == "0.0.0"
			UI.msg "请指定版本好的值，如 modifyPodspec version:#{version}"
			return
		end
		unless version =~ /^\d{1,}.\d.\d$|^\d{1,}.\d$|^\d{1,}$/
			UI.msg "version:#{version}的格式不对"
			return 
		end
		unless File.exist?path
			UI.err "路径不存在"
			return
		end

		UI.msg "***修改podspec文件***"
		File.open(path, "r+") do |f|
			s = ""
			f.each_line do |line|
				# puts "#{line}"
				if line.to_s =~ /s\.version\s*=\s*"(\d{1,}.\d.\d|\d{1,}.\d|\d{1,})"/
					line = line.sub(/\d{1,}.\d.\d|\d{1,}.\d|\d{1,}/) do |match| 
						version.to_s
					end
				end
				s += line
			end
			UI.msg "#{s}"
			File.open(path, "w+") do |f| f.write(s) end
		end	
		
	end

		# 找到指定路径下的podspec文件名
	def pathWithPodspecSuffix(path)

		path = File.expand_path(path)
		return nil unless File.exist?(path)

		unless path =~ /.podspec$/

			if File.directory?(path)
				podfiles = Dir.glob("#{path}/*.podspec")
			
				if podfiles.length == 0
					UI.err %(#{path} 路径下无法找到'.podspec'文件)
					return nil
				elsif podfiles.length == 1
					path = podfiles.first
				else
					UI.msg "目录下找到多个podspec文件！"
					podfiles.each_with_index do |elem, index|
						basename = File.basename(elem)
						puts %(#{index}.#{basename} )
					end
					UI.msg "请指定您当前需要的操作的文件,输入它的序号:"
					i = gets.to_i

					case i
					when 0 .. (podfiles.length-1)
						path = podfiles[i.to_i]	
					else
						UI.err "输入错误❌"
						path = nil
					end
					
				end
			end
		end

		path

	end

	module_function :pathWithPodspecSuffix
	module_function :modifyPodspec

end