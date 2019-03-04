//
//  WLNaviController.swift
//  TSBaseViewController_Swift
//
//  Created by three stone 王 on 2018/11/20.
//  Copyright © 2018年 three stone 王. All rights reserved.
//

import UIKit
import WLToolsKit
class WLNaviConfig: NSObject {
    
    static let shared = WLNaviConfig()
    
    private override init() {
        
    }
    // 返回按钮
    var Back_Image: String = ""
    //  标题字体
    var Title_FontSize: CGFloat = 0
    // 标题颜色
    var Title_HEXColor: String = ""
    // root vc 背景色
    var Background_HEXColor: String = ""
    // 导航背景色
    var NaviBackground_HEXColor: String = ""
}

public enum TSNaviTransionType {
    case push
    
    case present
    
    case drawerPush // 抽屉式的push
    
    case drawer // 抽屉
}

open class WLNaviController: UINavigationController {
    
    open var transitionType: TSNaviTransionType = .push
    
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
        
        let shared = WLNaviConfig.shared
        
        if !shared.NaviBackground_HEXColor.isEmpty {
            
            navigationBar.barTintColor = WLHEXCOLOR(hexColor: shared.NaviBackground_HEXColor)
        }
        
        if !shared.Title_HEXColor.isEmpty {
            
            navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: UIFont.boldSystemFont(ofSize: shared.Title_FontSize),
                NSAttributedString.Key.foregroundColor: WLHEXCOLOR(hexColor: shared.Title_HEXColor)
            ]
        }
    }
    
    open override func pushViewController(_ viewController: UIViewController, animated: Bool) {
        
        if children.count > 0 {
            
            viewController.hidesBottomBarWhenPushed = true
            
            let shared = WLNaviConfig.shared
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem.barButtonItem(imageName: shared.Back_Image, target: self, action: #selector(pop))
        } 
        super.pushViewController(viewController, animated: animated)
    }
}
extension WLNaviController {
    
    @objc func pop() {
        
        popViewController(animated: true)
    }
}

