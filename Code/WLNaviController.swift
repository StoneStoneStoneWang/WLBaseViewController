//
//  WLNaviController.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import WLToolsKit
@objc public final class WLNaviConfig: NSObject {
    
    @objc public static let shared = WLNaviConfig()
    
    private override init() { }
    
    var config: WLNaviControllerConfig!
}

@objc open class WLNaviController: UINavigationController {
    
    public override init(rootViewController: UIViewController) {
        super.init(rootViewController: rootViewController)
        
    }
    
    required public init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    public override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    open override func viewDidLoad() {
        super.viewDidLoad()
        
        if let config = WLNaviConfig.shared.config {
            
            navigationBar.wl_setBackgroundColor(WLHEXCOLOR(hexColor: config.NaviBackground_HEXColor))
            
            navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: config.Title_FontSize),
                NSAttributedString.Key.foregroundColor: WLHEXCOLOR(hexColor: config.Title_HEXColor)
            ]
        }
        
        interactivePopGestureRecognizer?.delegate = self
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            if let config = WLNaviConfig.shared.config {
                
                viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItem(imageName: config.Back_Image, target: self, action: #selector(pop))
            }
        } 
        super.pushViewController(viewController, animated: animated)
    }
}
extension WLNaviController: UIGestureRecognizerDelegate {
    
    public func gestureRecognizerShouldBegin(_ gestureRecognizer: UIGestureRecognizer) -> Bool { return viewControllers.count > 1 }
}
extension WLNaviController {
    
    @objc func pop() { popViewController(animated: true) }
}
