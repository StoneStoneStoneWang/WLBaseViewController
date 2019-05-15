

Pod::Spec.new do |spec|
  
  spec.name         = "WLBaseViewController"
  spec.version      = "1.2.0"
  spec.summary      = "A Lib For vc."
  spec.description  = <<-DESC
  A Lib For vc.
  DESC
  
  spec.homepage     = "https://github.com/StoneStoneStoneWang/WLBaseViewController"
  spec.license      = { :type => "MIT", :file => "LICENSE.md" }
  spec.author             = { "StoneStoneStoneWang" => "yuanxingfu1314@163.com" }
  spec.platform     = :ios, "9.0"
  spec.ios.deployment_target = "9.0"
  
  spec.swift_version = '5.0'
  
  spec.frameworks = 'UIKit', 'Foundation'
  
  spec.source = { :git => "https://github.com/StoneStoneStoneWang/WLBaseViewController.git", :tag => "#{spec.version}" }
  
  spec.subspec 'Orientation' do |orientation|
    
    orientation.source_files = "Code/Orientation/*.{swift}"
  end
  spec.subspec 'Config' do |config|
    
    config.source_files = "Code/Config/*.{swift}"
  end
  
  spec.subspec 'Navi' do |config|
    
    config.subspec 'NaviItem' do |item|
      
      item.source_files = "Code/BarButtonItem/*.{swift}"
      item.dependency 'WLToolsKit/Then'
    end
    config.subspec 'NaviConfig' do |naviConfig|
      
      naviConfig.source_files = "Code/Navi/Config/*.{swift}"
    end
    config.subspec 'NaviController' do |vc|
      
      vc.source_files = "Code/Navi/VC/*.{swift}"
      vc.dependency 'WLBaseViewController/Navi/NaviConfig'
      vc.dependency 'WLBaseViewController/Navi/NaviItem'
      vc.dependency 'WLBaseViewController/Orientation'
      vc.dependency 'WLToolsKit/Color'
      vc.dependency 'WLToolsKit/NaviBar'
    end
  end
  
  spec.subspec 'Tab' do |tab|
    
    tab.source_files = "Code/Tab/*.{swift}"
    tab.dependency 'WLToolsKit/Color'
    tab.dependency 'WLBaseViewController/Config'
    tab.dependency 'WLBaseViewController/Orientation'
    tab.dependency 'WLBaseViewController/Navi/NaviController'
  end
  spec.subspec 'BaseViewController' do |base|
    base.source_files = "Code/Base/*.{swift}"
    base.dependency 'WLBaseViewController/Navi/NaviController'
    base.dependency 'WLBaseViewController/Config'
  end
  spec.subspec 'Loading' do |loading|
    loading.source_files = "Code/Loading/*.{swift}"
    loading.dependency 'WLToolsKit/Common'
    loading.dependency 'WLToolsKit/Then'
    loading.dependency 'WLToolsKit/Color'
    loading.dependency 'WLBaseViewController/Config'
    loading.dependency 'WLBaseViewController/BaseViewController'
  end
  
  spec.subspec 'Inner' do |inner|
    inner.source_files = "Code/Inner/*.{swift}"
    inner.dependency 'WLToolsKit/Common'
    inner.dependency 'WLToolsKit/Then'
    inner.dependency 'WLBaseViewController/Loading'
  end
  
end


