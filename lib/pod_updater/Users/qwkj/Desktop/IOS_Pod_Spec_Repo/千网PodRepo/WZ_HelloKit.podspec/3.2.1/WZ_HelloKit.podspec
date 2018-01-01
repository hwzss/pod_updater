Pod::Spec.new do |s|
  s.name         = "WZ_HelloKit"
  s.version      = "3.0.2"
  s.summary      = "The package of useful tools, include categories and classes"
  s.homepage     = "https://github.com/hwzss/WZ_HelloKit"
  s.license      = { :type => "MIT", :file => "LICENSE" }
  s.authors      = { 'hwzss' => '1833361588@qq.com'}
  s.platform     = :ios, "7.0"
  s.source       = { :git => "https://github.com/hwzss/WZ_HelloKit.git", :tag => s.version }
  # s.source       = { :git => "/Users/qwkj/Documents/WZ_GitHub/WZ_HelloKit"}
  s.source_files = 'WZ_HelloKit', 'WZ_HelloKit/**/*.{h,m}'
  s.requires_arc = true
end