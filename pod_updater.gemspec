
lib = File.expand_path("../lib", __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "pod_updater/version"

Gem::Specification.new do |spec|
  spec.name          = "pod_updater"
  spec.version       = PodUpdater::VERSION
  spec.authors       = ["hwzss"]
  spec.email         = ["1833361588@qq.com"]

  spec.summary       = %q{iOS开发中帮助您快速的将自己的开发的pod库代码上传到git，并帮你push到podspec repo库去}
  spec.description   = %q{iOS开发中帮助您快速的将自己的开发的pod库代码上传到git，并帮你push到podspec repo库去\n 使用方式：cd到你的pod库代码目录，然后执行'pod_updater -v [new_version]',然后就可以去喝杯茶了}
  spec.homepage      = "https://github.com/hwzss/pod_updater"
  spec.license       = "MIT"

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    # spec.metadata["allowed_push_host"] = "TODO: Set to 'http://mygemserver.com'"
  else
    raise "RubyGems 2.0 or newer is required to protect against " \
      "public gem pushes."
  end

  spec.files         = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir        = "bin"
  # spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.executables   = ['pod_updater']
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "colorize"

  spec.add_development_dependency "bundler", "~> 1.16"
  spec.add_development_dependency "rake", "~> 10.0"
  
end
