

Pod::Spec.new do |s|

s.name         = "WLBaseViewController"
s.version      = "1.1.1"
s.summary      = "A Lib For vc."
s.description  = <<-DESC
A Lib For vc.
DESC

s.homepage     = "https://github.com/StoneStoneStoneWang/WLBaseViewController"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"

s.swift_version = '4.2'

s.frameworks = 'UIKit', 'Foundation'

s.source = { :git => "https://github.com/StoneStoneStoneWang/WLBaseViewController.git", :tag => "#{s.version}" }

s.source_files = "Code/**/*.{swift}"

s.dependency 'WLToolsKit'

end


