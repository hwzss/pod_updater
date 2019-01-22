require 'pod_updater/ui'

module PodUpdater

	# 提供路径，然后将项目打包上git,标记tag
	def git_tag_flow(path,msg,tag_version)

		cmd = []

		cmd << %(cd #{path})
		cmd << 'git add .'
		cmd << %(git commit -m  "#{msg}")
		cmd << 'git push'

		UI.log_cmd(cmd)
		IO.popen(cmd.join(" && ")) do |io|
			io.each do |line|
				UI.msg line
			end
			io.close
		end

		tag_cmd = []
		tag_cmd << %(git tag -f #{tag_version} -m "#{msg}")
		tag_cmd << 'git push --tags -f'

		UI.log_cmd(tag_cmd)
		IO.popen(tag_cmd.join(" && ")) do |io|
			io.each do |line|
				UI.msg line
			end
			io.close
		end

	end

	module_function :git_tag_flow
end