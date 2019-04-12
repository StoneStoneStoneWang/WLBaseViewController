

Pod::Spec.new do |spec|
  
  spec.name         = "WLBaseViewController"
  spec.version      = "1.1.8"
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
  
  spec.subspec 'WLOrientation' do |orientation|
    
    orientation.source_files = "Code/Orientation/*.{swift}"
  end
  spec.subspec 'WLConfig' do |config|
    
    config.source_files = "Code/Config/*.{swift}"
  end
  
  spec.subspec 'WLNavi' do |config|
    
    config.subspec 'WLNaviItem' do |item|
      
      item.source_files = "Code/BarButtonItem/*.{swift}"
      item.dependency 'WLToolsKit/WLThen'
    end
    config.subspec 'WLNaviConfig' do |naviConfig|
      
      naviConfig.source_files = "Code/Navi/Config/*.{swift}"
    end
    config.subspec 'WLNaviVC' do |vc|
      
      vc.source_files = "Code/Navi/VC/*.{swift}"
      vc.dependency 'WLBaseViewController/WLNavi/WLNaviConfig'
      vc.dependency 'WLBaseViewController/WLNavi/WLNaviItem'
      vc.dependency 'WLToolsKit/WLColor'
      vc.dependency 'WLToolsKit/WLNaviBar'
    end
  end
  spec.subspec 'WLTab' do |tab|
    
    tab.source_files = "Code/Tab/*.{swift}"
    tab.dependency 'WLToolsKit/WLColor'
    tab.dependency 'WLBaseViewController/WLConfig'
    tab.dependency 'WLBaseViewController/WLOrientation'
    tab.dependency 'WLBaseViewController/WLNavi/WLNaviVC'
  end
  spec.subspec 'WLBaseVC' do |base|
    base.source_files = "Code/Base/*.{swift}"
    base.dependency 'WLBaseViewController/WLNavi/WLNaviVC'
    base.dependency 'WLBaseViewController/WLConfig'
  end
  spec.subspec 'WLLoading' do |loading|
    loading.source_files = "Code/Loading/*.{swift}"
    loading.dependency 'WLToolsKit/WLCommon'
    loading.dependency 'WLToolsKit/WLThen'
    loading.dependency 'WLToolsKit/WLColor'
    loading.dependency 'WLBaseViewController/WLConfig'
    loading.dependency 'WLBaseViewController/WLBaseVC'
  end
  
  spec.subspec 'WLInner' do |inner|
    inner.source_files = "Code/Inner/*.{swift}"
    inner.dependency 'WLToolsKit/WLCommon'
    inner.dependency 'WLToolsKit/WLThen'
    inner.dependency 'WLBaseViewController/WLLoading'
  end
  
end


