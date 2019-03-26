//
//  WLNaviControllerConfig.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2019/3/4.
//  Copyright © 2019年 three stone 王. All rights reserved.
//

import Foundation
import UIKit
@objc public protocol WLNaviControllerConfig {
    
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

extension WLNaviController {
    
    @objc public static func wl_setNaviConfig(_ config: WLNaviControllerConfig) { WLNaviConfig.shared.config = config }
}
