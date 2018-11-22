

Pod::Spec.new do |s|

s.name         = "TSBaseViewController_Swift"
s.version      = "1.0.1"
s.summary      = "A Lib For vc."
s.description  = <<-DESC
A Lib For vc.
DESC

s.homepage     = "https://github.com/StoneStoneStoneWang/TSBaseViewController_Swift"
s.license      = { :type => "MIT", :file => "LICENSE.md" }
s.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
s.platform     = :ios, "9.0"
s.ios.deployment_target = "9.0"

s.swift_version = '4.2'

s.frameworks = 'UIKit', 'Foundation'

s.source = { :git => "https://github.com/StoneStoneStoneWang/TSBaseViewController_Swift.git", :tag => "#{s.version}" }

s.source_files = "Code/**/*.{swift}"

s.dependency 'TSToolKit_Swift'

end


