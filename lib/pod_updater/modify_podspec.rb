
module PodUpdater

		# 修改podspec的s.verison的值
	def modifyPodspec(path:"",version:"0.0.0")

		if version == "0.0.0"
			puts "请指定版本好的值，如 modifyPodspec version:#{version}"
			return
		end
		unless version =~ /^\d{1,}.\d.\d$|^\d{1,}.\d$|^\d{1,}$/
			puts "version:#{version}的格式不对"
			return 
		end

		# DEBUG：这里写死了路径是为了方便调试，正式用的话需去掉
		# path = "/Users/qwkj/Documents/WZ_GitHub/Ruby_Learning/day_7/QW_Http.podspec"
		# END

		unless File.exist?path
			puts "路径不存在"
			return
		end

		puts "***修改podspec文件***"
		File.open(path, "r+") do |f|
			s = ""
			f.each_line do |line|
				# puts "#{line}"
				if line.to_s =~ /s\.version\s*=\s*"(\d{1,}.\d.\d|\d{1,}.\d|\d{1,})"/
					# puts "匹配到了"
					temp = $1.to_s
					line = line.sub(/\d{1,}.\d.\d|\d{1,}.\d|\d{1,}/) do |match| 
						version.to_s
					end
				end
				s += line
			end
			puts "#{s}"
			File.open(path, "w+") do |f| f.write(s) end
		end	
		
	end

		# 找到指定路径下的podspec文件名
	def pathWithPodspecSuffix(path)

		# path = "/Users/qwkj/Desktop/IOS_Pod_Spec_Repo/千网PodRepo/QWCrashReporter/1.0.8/"
		path = File.expand_path(path)
		return nil unless File.exist?(path)

		unless path =~ /.podspec$/

			if File.directory?(path)
				podfiles = Dir.glob("#{path}/*.podspec")
				puts "#{podfiles}"
				if podfiles.length == 0
					puts %('#{path}'下无法找到'.podspec'文件)
					return nil
				elsif podfiles.length == 1
					path = podfiles.first
				else
					puts "目录下找到多个podspec文件！"
					podfiles.each_with_index do |elem, index|
						basename = File.basename(elem)
						puts %(#{index}.#{basename} )
					end
					puts "请指定您当前需要的操作的文件,输入它的序号:"
					i = gets.to_i

					case i
					when 0 .. (podfiles.length-1)
						path = podfiles[i.to_i]	
					else
						puts "输入错误❌"
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