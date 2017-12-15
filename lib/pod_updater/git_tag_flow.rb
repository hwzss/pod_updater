
module PodUpdater

	# 提供路径，然后将项目打包上git,标记tag
	def git_tag_flow(path,msg,tag_version)

		cmd = []

		cmd << %(cd #{path})
		cmd << 'git add .'
		cmd << %(git commit -m  "#{msg}")
		cmd << 'git push'
		cmd << %(git tag -a #{tag_version} -m "#{msg}")
		cmd << 'git push --tags'

		# TODO: 尝试在每次即将执行该命令时，打印出这次的命令
		IO.popen(cmd.join(" && ")) do |io|
			io.each do |line|
				puts line
			end
			io.close
		end

	end

	module_function :git_tag_flow
end