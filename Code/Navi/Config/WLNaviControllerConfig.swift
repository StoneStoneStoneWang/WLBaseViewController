//
//  WLNaviControllerConfig.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2019/3/4.
//  Copyright © 2019年 three stone 王. All rights reserved.
//

import Foundation
import UIKit
@objc (WLNaviControllerConfig)
public protocol WLNaviControllerConfig {
    
    @objc var Back_Image: String { get }
    //  标题字体
    @objc var Title_FontSize: CGFloat { get }
    // 标题颜色
    @objc var Title_HEXColor: String { get }
    // root vc 背景色
    @objc var Background_HEXColor: String { get }
    // 导航背景色
    @objc var NaviBackground_HEXColor: String { get }
}

@objc (WLNaviConfig)
public final class WLNaviConfig: NSObject {
    
    @objc public static let shared = WLNaviConfig()
    
    private override init() { }
    
    public var config: WLNaviControllerConfig!
}

extension UINavigationController {
    @objc (wl_setNaviConfigWithConfig:)
    public static func wl_setNaviConfig(_ config: WLNaviControllerConfig) { WLNaviConfig.shared.config = config }
}
