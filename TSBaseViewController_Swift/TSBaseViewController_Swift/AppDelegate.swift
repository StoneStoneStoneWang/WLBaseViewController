//
//  AppDelegate.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/13.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
class WLAAAAAAA: WLNaviControllerConfig {
    var Back_Image: String { return "Back_Image" }
    
    var Title_FontSize: CGFloat { return 20 }
    
    var Title_HEXColor: String { return "#333333" }
    
    var Background_HEXColor: String { return "#f1f1f1" }
    
    var NaviBackground_HEXColor: String { return "#1d1c21" }
}

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    var window: UIWindow?
    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        WLNaviController.wl_setNaviConfig(WLAAAAAAA())
        
        window = UIWindow(frame: UIScreen.main.bounds)
        
        window?.rootViewController = MainViewController()
        
        window?.makeKeyAndVisible()
        
        return true
    }
}

