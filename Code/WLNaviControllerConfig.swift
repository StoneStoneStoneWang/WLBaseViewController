//
//  WLNaviControllerConfig.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2019/3/4.
//  Copyright © 2019年 three stone 王. All rights reserved.
//

import Foundation
import UIKit
public protocol WLNaviControllerConfig {
    
    var Back_Image: String { get }
    //  标题字体
    var Title_FontSize: CGFloat { get }
    // 标题颜色
    var Title_HEXColor: String { get }
    // root vc 背景色
    var Background_HEXColor: String { get }
    // 导航背景色
    var NaviBackground_HEXColor: String { get }
}

extension WLNaviController {
    
    public static func wl_setNaviConfig(_ config: WLNaviControllerConfig) {
        
        WLNaviConfig.shared.Back_Image = config.Back_Image
        
        WLNaviConfig.shared.Title_FontSize = config.Title_FontSize
        
        WLNaviConfig.shared.Title_HEXColor = config.Title_HEXColor
        
        WLNaviConfig.shared.Background_HEXColor = config.Background_HEXColor
        
        WLNaviConfig.shared.NaviBackground_HEXColor = config.NaviBackground_HEXColor
    }
}
