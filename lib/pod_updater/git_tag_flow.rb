require 'pod_updater/ui'

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

		UI.log_cmd(cmd)
		IO.popen(cmd.join(" && ")) do |io|
			io.each do |line|
				UI.msg line
			end
			io.close
		end

	end

	module_function :git_tag_flow
end